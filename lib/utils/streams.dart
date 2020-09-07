import 'package:quiver/iterables.dart';
/*
  Generates transformed stream out of an array.

  @required
  list = [ x1, x2, .... ] List<X>

  transform: A unit transform  Y = transform(X)
  batchTransform: A function to transform a batch at once List<Y> = batchTransform(List<X>)
  batchSize: default = 10
 */
Stream<Y> TransformedStreamForList<T, Y>
    ({
      List<T> list = const [],
      Future<Y> transform(T),
      Future<List<Y>> batchTransform(List T),
      int batchsize = 10 }) async* {
  // [ 1,2,3,4,5 ] -> [ [1,2], [3,4], [5] ] (batchSize = 2)
  final batches = partition(list, batchsize);

  for (var batch in batches) {
    // for each value in the batch, call the transform function to get return value for it
    final transformed = batchTransform != null ? await batchTransform(batch) : batch.map(transform);
    for (var value in transformed) {
      yield await value;
    }
  }
}
