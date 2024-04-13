// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataBase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DataBaseBuilder databaseBuilder(String name) =>
      _$DataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DataBaseBuilder inMemoryDatabaseBuilder() => _$DataBaseBuilder(null);
}

class _$DataBaseBuilder {
  _$DataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DataBase extends DataBase {
  _$DataBase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _usuarioDaoInstance;

  ProductDao? _productDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `UserDB` (`name` TEXT NOT NULL, `cpf` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `login` TEXT NOT NULL, `isAdm` INTEGER NOT NULL, `password` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ProductDB` (`code` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `description` TEXT NOT NULL, `price` REAL NOT NULL, `imagePath` TEXT NOT NULL, `category` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get usuarioDao {
    return _usuarioDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  ProductDao get productDao {
    return _productDaoInstance ??= _$ProductDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userDBInsertionAdapter = InsertionAdapter(
            database,
            'UserDB',
            (UserDB item) => <String, Object?>{
                  'name': item.name,
                  'cpf': item.cpf,
                  'login': item.login,
                  'isAdm': item.isAdm ? 1 : 0,
                  'password': item.password
                }),
        _userDBUpdateAdapter = UpdateAdapter(
            database,
            'UserDB',
            ['cpf'],
            (UserDB item) => <String, Object?>{
                  'name': item.name,
                  'cpf': item.cpf,
                  'login': item.login,
                  'isAdm': item.isAdm ? 1 : 0,
                  'password': item.password
                }),
        _userDBDeletionAdapter = DeletionAdapter(
            database,
            'UserDB',
            ['cpf'],
            (UserDB item) => <String, Object?>{
                  'name': item.name,
                  'cpf': item.cpf,
                  'login': item.login,
                  'isAdm': item.isAdm ? 1 : 0,
                  'password': item.password
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserDB> _userDBInsertionAdapter;

  final UpdateAdapter<UserDB> _userDBUpdateAdapter;

  final DeletionAdapter<UserDB> _userDBDeletionAdapter;

  @override
  Future<List<UserDB>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM UserDB',
        mapper: (Map<String, Object?> row) => UserDB(
            row['name'] as String,
            row['cpf'] as int,
            row['login'] as String,
            (row['isAdm'] as int) != 0,
            row['password'] as int));
  }

  @override
  Future<int> insertUser(UserDB user) {
    return _userDBInsertionAdapter.insertAndReturnId(
        user, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUser(UserDB user) async {
    await _userDBUpdateAdapter.update(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteUser(UserDB user) async {
    await _userDBDeletionAdapter.delete(user);
  }
}

class _$ProductDao extends ProductDao {
  _$ProductDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _productDBInsertionAdapter = InsertionAdapter(
            database,
            'ProductDB',
            (ProductDB item) => <String, Object?>{
                  'code': item.code,
                  'description': item.description,
                  'price': item.price,
                  'imagePath': item.imagePath,
                  'category': item.category
                }),
        _productDBUpdateAdapter = UpdateAdapter(
            database,
            'ProductDB',
            ['code'],
            (ProductDB item) => <String, Object?>{
                  'code': item.code,
                  'description': item.description,
                  'price': item.price,
                  'imagePath': item.imagePath,
                  'category': item.category
                }),
        _productDBDeletionAdapter = DeletionAdapter(
            database,
            'ProductDB',
            ['code'],
            (ProductDB item) => <String, Object?>{
                  'code': item.code,
                  'description': item.description,
                  'price': item.price,
                  'imagePath': item.imagePath,
                  'category': item.category
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProductDB> _productDBInsertionAdapter;

  final UpdateAdapter<ProductDB> _productDBUpdateAdapter;

  final DeletionAdapter<ProductDB> _productDBDeletionAdapter;

  @override
  Future<List<ProductDB>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM ProductDB',
        mapper: (Map<String, Object?> row) => ProductDB(
            row['code'] as int,
            row['description'] as String,
            row['price'] as double,
            row['imagePath'] as String,
            row['category'] as String));
  }

  @override
  Future<int> insertProduct(ProductDB product) {
    return _productDBInsertionAdapter.insertAndReturnId(
        product, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateProduct(ProductDB product) async {
    await _productDBUpdateAdapter.update(product, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteProduct(ProductDB product) async {
    await _productDBDeletionAdapter.delete(product);
  }
}
