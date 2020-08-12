// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NoteDao _noteDaoInstance;

  BookmarkDao _bookmarkDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 2,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Note` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `content` TEXT, `contentId` TEXT, `courseId` TEXT)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Bookmark` (`id` INTEGER, `contentId` TEXT, `courseId` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NoteDao get noteDao {
    return _noteDaoInstance ??= _$NoteDao(database, changeListener);
  }

  @override
  BookmarkDao get bookmarkDao {
    return _bookmarkDaoInstance ??= _$BookmarkDao(database, changeListener);
  }
}

class _$NoteDao extends NoteDao {
  _$NoteDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _noteInsertionAdapter = InsertionAdapter(
            database,
            'Note',
            (Note item) => <String, dynamic>{
                  'id': item.id,
                  'content': item.content,
                  'contentId': item.contentId,
                  'courseId': item.courseId
                }),
        _noteUpdateAdapter = UpdateAdapter(
            database,
            'Note',
            ['id'],
            (Note item) => <String, dynamic>{
                  'id': item.id,
                  'content': item.content,
                  'contentId': item.contentId,
                  'courseId': item.courseId
                }),
        _noteDeletionAdapter = DeletionAdapter(
            database,
            'Note',
            ['id'],
            (Note item) => <String, dynamic>{
                  'id': item.id,
                  'content': item.content,
                  'contentId': item.contentId,
                  'courseId': item.courseId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _noteMapper = (Map<String, dynamic> row) => Note(
      id: row['id'] as int,
      content: row['content'] as String,
      contentId: row['contentId'] as String,
      courseId: row['courseId'] as String);

  final InsertionAdapter<Note> _noteInsertionAdapter;

  final UpdateAdapter<Note> _noteUpdateAdapter;

  final DeletionAdapter<Note> _noteDeletionAdapter;

  @override
  Future<List<Note>> findAllNotes() async {
    return _queryAdapter.queryList('SELECT * FROM Note', mapper: _noteMapper);
  }

  @override
  Future<void> insert(Note obj) async {
    await _noteInsertionAdapter.insert(obj, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertNew(Note obj) async {
    await _noteInsertionAdapter.insert(obj, OnConflictStrategy.ignore);
  }

  @override
  Future<List<int>> insertAll(List<Note> list) {
    return _noteInsertionAdapter.insertListAndReturnIds(
        list, OnConflictStrategy.replace);
  }

  @override
  Future<void> update(Note obj) async {
    await _noteUpdateAdapter.update(obj, OnConflictStrategy.abort);
  }

  @override
  Future<void> remove(Note obj) async {
    await _noteDeletionAdapter.delete(obj);
  }
}

class _$BookmarkDao extends BookmarkDao {
  _$BookmarkDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _bookmarkInsertionAdapter = InsertionAdapter(
            database,
            'Bookmark',
            (Bookmark item) => <String, dynamic>{
                  'id': item.id,
                  'contentId': item.contentId,
                  'courseId': item.courseId
                }),
        _bookmarkUpdateAdapter = UpdateAdapter(
            database,
            'Bookmark',
            ['id'],
            (Bookmark item) => <String, dynamic>{
                  'id': item.id,
                  'contentId': item.contentId,
                  'courseId': item.courseId
                }),
        _bookmarkDeletionAdapter = DeletionAdapter(
            database,
            'Bookmark',
            ['id'],
            (Bookmark item) => <String, dynamic>{
                  'id': item.id,
                  'contentId': item.contentId,
                  'courseId': item.courseId
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  static final _bookmarkMapper = (Map<String, dynamic> row) => Bookmark(
      id: row['id'] as int,
      contentId: row['contentId'] as String,
      courseId: row['courseId'] as String);

  final InsertionAdapter<Bookmark> _bookmarkInsertionAdapter;

  final UpdateAdapter<Bookmark> _bookmarkUpdateAdapter;

  final DeletionAdapter<Bookmark> _bookmarkDeletionAdapter;

  @override
  Future<List<Bookmark>> findAllBookmarks() async {
    return _queryAdapter.queryList('SELECT * FROM Bookmark',
        mapper: _bookmarkMapper);
  }

  @override
  Future<void> insert(Bookmark obj) async {
    await _bookmarkInsertionAdapter.insert(obj, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertNew(Bookmark obj) async {
    await _bookmarkInsertionAdapter.insert(obj, OnConflictStrategy.ignore);
  }

  @override
  Future<List<int>> insertAll(List<Bookmark> list) {
    return _bookmarkInsertionAdapter.insertListAndReturnIds(
        list, OnConflictStrategy.replace);
  }

  @override
  Future<void> update(Bookmark obj) async {
    await _bookmarkUpdateAdapter.update(obj, OnConflictStrategy.abort);
  }

  @override
  Future<void> remove(Bookmark obj) async {
    await _bookmarkDeletionAdapter.delete(obj);
  }
}
