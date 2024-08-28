// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataBaseFinal2.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $DataBaseBuilderContract {
  /// Adds migrations to the builder.
  $DataBaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $DataBaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<DataBase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $DataBaseBuilderContract databaseBuilder(String name) =>
      _$DataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $DataBaseBuilderContract inMemoryDatabaseBuilder() =>
      _$DataBaseBuilder(null);
}

class _$DataBaseBuilder implements $DataBaseBuilderContract {
  _$DataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $DataBaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $DataBaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
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

  ProductSaleDao? _productSaleDaoInstance;

  SaleDao? _saleDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `UserDB` (`name` TEXT NOT NULL, `cpf` INTEGER NOT NULL, `login` TEXT NOT NULL, `isAdm` INTEGER NOT NULL, `password` INTEGER NOT NULL, PRIMARY KEY (`cpf`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ProductDB` (`name` TEXT NOT NULL, `code` INTEGER NOT NULL, `description` TEXT NOT NULL, `price` REAL NOT NULL, `imagePath` TEXT NOT NULL, `category` TEXT NOT NULL, PRIMARY KEY (`code`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ProductSaleDB` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `quantity` INTEGER NOT NULL, `subTotal` INTEGER NOT NULL, `product_id` INTEGER NOT NULL, `sale_id` INTEGER NOT NULL, FOREIGN KEY (`product_id`) REFERENCES `ProductDB` (`code`) ON UPDATE NO ACTION ON DELETE NO ACTION, FOREIGN KEY (`sale_id`) REFERENCES `SaleDB` (`numero`) ON UPDATE NO ACTION ON DELETE NO ACTION)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SaleDB` (`numero` INTEGER PRIMARY KEY AUTOINCREMENT, `dataVenda` TEXT NOT NULL, `user` INTEGER NOT NULL, FOREIGN KEY (`user`) REFERENCES `UserDB` (`cpf`) ON UPDATE NO ACTION ON DELETE NO ACTION)');

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

  @override
  ProductSaleDao get productSaleDao {
    return _productSaleDaoInstance ??=
        _$ProductSaleDao(database, changeListener);
  }

  @override
  SaleDao get saleDao {
    return _saleDaoInstance ??= _$SaleDao(database, changeListener);
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
                  'name': item.name,
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
                  'name': item.name,
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
                  'name': item.name,
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
            row['name'] as String,
            row['code'] as int,
            row['description'] as String,
            row['price'] as double,
            row['imagePath'] as String,
            row['category'] as String));
  }

  @override
  Future<List<ProductDB>> findProductsByName(String searchQuery) async {
    return _queryAdapter.queryList('SELECT * FROM ProductDB WHERE name LIKE ?1',
        mapper: (Map<String, Object?> row) => ProductDB(
            row['name'] as String,
            row['code'] as int,
            row['description'] as String,
            row['price'] as double,
            row['imagePath'] as String,
            row['category'] as String),
        arguments: [searchQuery]);
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

class _$ProductSaleDao extends ProductSaleDao {
  _$ProductSaleDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _productSaleDBInsertionAdapter = InsertionAdapter(
            database,
            'ProductSaleDB',
            (ProductSaleDB item) => <String, Object?>{
                  'id': item.id,
                  'quantity': item.quantity,
                  'subTotal': item.subTotal,
                  'product_id': item.product_id,
                  'sale_id': item.sale_id
                }),
        _productSaleDBUpdateAdapter = UpdateAdapter(
            database,
            'ProductSaleDB',
            ['id'],
            (ProductSaleDB item) => <String, Object?>{
                  'id': item.id,
                  'quantity': item.quantity,
                  'subTotal': item.subTotal,
                  'product_id': item.product_id,
                  'sale_id': item.sale_id
                }),
        _productSaleDBDeletionAdapter = DeletionAdapter(
            database,
            'ProductSaleDB',
            ['id'],
            (ProductSaleDB item) => <String, Object?>{
                  'id': item.id,
                  'quantity': item.quantity,
                  'subTotal': item.subTotal,
                  'product_id': item.product_id,
                  'sale_id': item.sale_id
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProductSaleDB> _productSaleDBInsertionAdapter;

  final UpdateAdapter<ProductSaleDB> _productSaleDBUpdateAdapter;

  final DeletionAdapter<ProductSaleDB> _productSaleDBDeletionAdapter;

  @override
  Future<List<ProductSaleDB>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM ProductSaleDB',
        mapper: (Map<String, Object?> row) => ProductSaleDB(
            row['id'] as int?,
            row['quantity'] as int,
            row['subTotal'] as int,
            row['product_id'] as int,
            row['sale_id'] as int));
  }

  @override
  Future<int> insertProductSale(ProductSaleDB productsaleDB) {
    return _productSaleDBInsertionAdapter.insertAndReturnId(
        productsaleDB, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateProductSale(ProductSaleDB productsaleDB) async {
    await _productSaleDBUpdateAdapter.update(
        productsaleDB, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteProductSale(ProductSaleDB productsaleDB) async {
    await _productSaleDBDeletionAdapter.delete(productsaleDB);
  }
}

class _$SaleDao extends SaleDao {
  _$SaleDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _saleDBInsertionAdapter = InsertionAdapter(
            database,
            'SaleDB',
            (SaleDB item) => <String, Object?>{
                  'numero': item.numero,
                  'dataVenda': item.dataVenda,
                  'user': item.user
                }),
        _saleDBUpdateAdapter = UpdateAdapter(
            database,
            'SaleDB',
            ['numero'],
            (SaleDB item) => <String, Object?>{
                  'numero': item.numero,
                  'dataVenda': item.dataVenda,
                  'user': item.user
                }),
        _saleDBDeletionAdapter = DeletionAdapter(
            database,
            'SaleDB',
            ['numero'],
            (SaleDB item) => <String, Object?>{
                  'numero': item.numero,
                  'dataVenda': item.dataVenda,
                  'user': item.user
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SaleDB> _saleDBInsertionAdapter;

  final UpdateAdapter<SaleDB> _saleDBUpdateAdapter;

  final DeletionAdapter<SaleDB> _saleDBDeletionAdapter;

  @override
  Future<List<SaleDB>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM SaleDB',
        mapper: (Map<String, Object?> row) => SaleDB(row['numero'] as int?,
            row['dataVenda'] as String, row['user'] as int));
  }

  @override
  Future<int> insertSale(SaleDB sale) {
    return _saleDBInsertionAdapter.insertAndReturnId(
        sale, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSale(SaleDB sale) async {
    await _saleDBUpdateAdapter.update(sale, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSale(SaleDB sale) async {
    await _saleDBDeletionAdapter.delete(sale);
  }
}
