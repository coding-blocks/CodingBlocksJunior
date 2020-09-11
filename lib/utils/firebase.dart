import 'dart:collection';

import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/content.dart';
import 'package:coding_blocks_junior/models/index.dart';
import 'package:coding_blocks_junior/utils/crypto.dart';
import 'package:coding_blocks_junior/utils/streams.dart';

class FirebaseReferenceArray<ModelClass extends BaseModel> {
  final String collectionName;
  final List<dynamic> array;
  final Function builder;
  final caches = HashMap<String, AsyncCache<List<ModelClass>>>();

  FirebaseReferenceArray({this.collectionName, this.array, this.builder});

  Stream<ModelClass> get dataStream => TransformedStreamForList(
      list: this.array,
      batchTransform: (batch) {
        final hash = textToHash(batch.join(','));
        if(caches[hash] == null) {
          caches[hash] = AsyncCache<List<ModelClass>>(const Duration(hours: 1));
        }

        return caches[hash].fetch(() {
          return Firestore.instance
              .collection(this.collectionName)
              .where(FieldPath.documentId, whereIn: batch)
              .getDocuments()
              .then((qs) => qs.documents)
              .then((documents) {
            final List<ModelClass> records = documents.map<ModelClass>(builder)
                .toList();
            return batch.map((id) =>
                records.firstWhere((record) => record.id == id)).toList();
          });
        });

      }
  );
}