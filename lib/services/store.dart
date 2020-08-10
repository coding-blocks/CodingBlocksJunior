import 'package:coding_blocks_junior/database.dart';

class StoreService {
  AppDatabase _database;
  AppDatabase get database => _database;

  Future<void> initDatabase() async {
    _database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  }

  StoreService() {
    initDatabase();
  }
}
