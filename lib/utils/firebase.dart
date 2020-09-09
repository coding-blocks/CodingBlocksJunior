import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coding_blocks_junior/models/index.dart';
import 'package:coding_blocks_junior/utils/streams.dart';

class FirebaseReferenceArray<ModelClass extends BaseModel> {
  String collectionName;
  List<dynamic> array;
  Function builder;

  FirebaseReferenceArray({this.collectionName, this.array, this.builder});

  Stream<ModelClass> get dataStream => TransformedStreamForList(
      list: this.array,
      batchTransform: (batch) =>
          Firestore.instance
              .collection(this.collectionName)
              .where(FieldPath.documentId, whereIn: batch)
              .getDocuments()
              .then((qs) => qs.documents)
              .then((documents) {
                final List<ModelClass> records = documents.map<ModelClass>(builder).toList();
                return batch.map((id) => records.firstWhere((record) => record.id == id)).toList();
              })
  );
}