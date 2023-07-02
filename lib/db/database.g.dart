// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorUserDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$UserDatabaseBuilder databaseBuilder(String name) =>
      _$UserDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$UserDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$UserDatabaseBuilder(null);
}

class _$UserDatabaseBuilder {
  _$UserDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$UserDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$UserDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<UserDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$UserDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$UserDatabase extends UserDatabase {
  _$UserDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  DataDAO? _dataDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
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
            'CREATE TABLE IF NOT EXISTS `Data_t` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `from_string` TEXT NOT NULL, `to_string` TEXT NOT NULL, `date` TEXT NOT NULL, `from_to` TEXT)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  DataDAO get dataDAO {
    return _dataDAOInstance ??= _$DataDAO(database, changeListener);
  }
}

class _$DataDAO extends DataDAO {
  _$DataDAO(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _data_tInsertionAdapter = InsertionAdapter(
            database,
            'Data_t',
            (Data_t item) => <String, Object?>{
                  'id': item.id,
                  'from_string': item.from_string,
                  'to_string': item.to_string,
                  'date': item.date,
                  'from_to': item.from_to
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Data_t> _data_tInsertionAdapter;

  @override
  Future<List<Data_t>> retrieveData() async {
    return _queryAdapter.queryList('SELECT * FROM Data_t',
        mapper: (Map<String, Object?> row) => Data_t(
            id: row['id'] as int?,
            from_string: row['from_string'] as String,
            to_string: row['to_string'] as String,
            date: row['date'] as String,
            from_to: row['from_to'] as String?));
  }

  @override
  Future<Data_t?> deleteUser(int id) async {
    return _queryAdapter.query('DELETE FROM Data_t WHERE id = :id',
        mapper: (Map<String, Object?> row) => Data_t(
            id: row['id'] as int?,
            from_string: row['from_string'] as String,
            to_string: row['to_string'] as String,
            date: row['date'] as String,
            from_to: row['from_to'] as String?),
        arguments: [id]);
  }

  @override
  Future<List<int>> insertUser(List<Data_t> data) {
    return _data_tInsertionAdapter.insertListAndReturnIds(
        data, OnConflictStrategy.abort);
  }

}
