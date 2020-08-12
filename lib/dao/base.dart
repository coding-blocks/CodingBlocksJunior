import 'package:floor/floor.dart';

abstract class BaseDao<T> {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insert(T obj);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertNew(T obj);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertAll(List<T> list);

  @Update()
  Future<void> update(T obj);

  @delete
  Future<void> remove(T obj);
}