// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'AppDatabase.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
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

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

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
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
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
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UsuarioDao? _usuarioDaoInstance;

  ProdutoDao? _produtoDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `UsuarioBD` (`nome` TEXT PRIMARY KEY AUTOINCREMENT NOT NULL, `cpf` INTEGER NOT NULL, `login` TEXT NOT NULL, `isAdm` INTEGER NOT NULL, `senha` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ProdutoBD` (`codigo` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `descricao` TEXT NOT NULL, `preco` REAL NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UsuarioDao get usuarioDao {
    return _usuarioDaoInstance ??= _$UsuarioDao(database, changeListener);
  }

  @override
  ProdutoDao get produtoDao {
    return _produtoDaoInstance ??= _$ProdutoDao(database, changeListener);
  }
}

class _$UsuarioDao extends UsuarioDao {
  _$UsuarioDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _usuarioBDInsertionAdapter = InsertionAdapter(
            database,
            'UsuarioBD',
            (UsuarioBD item) => <String, Object?>{
                  'nome': item.nome,
                  'cpf': item.cpf,
                  'login': item.login,
                  'isAdm': item.isAdm ? 1 : 0,
                  'senha': item.senha
                }),
        _usuarioBDUpdateAdapter = UpdateAdapter(
            database,
            'UsuarioBD',
            ['nome'],
            (UsuarioBD item) => <String, Object?>{
                  'nome': item.nome,
                  'cpf': item.cpf,
                  'login': item.login,
                  'isAdm': item.isAdm ? 1 : 0,
                  'senha': item.senha
                }),
        _usuarioBDDeletionAdapter = DeletionAdapter(
            database,
            'UsuarioBD',
            ['nome'],
            (UsuarioBD item) => <String, Object?>{
                  'nome': item.nome,
                  'cpf': item.cpf,
                  'login': item.login,
                  'isAdm': item.isAdm ? 1 : 0,
                  'senha': item.senha
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UsuarioBD> _usuarioBDInsertionAdapter;

  final UpdateAdapter<UsuarioBD> _usuarioBDUpdateAdapter;

  final DeletionAdapter<UsuarioBD> _usuarioBDDeletionAdapter;

  @override
  Future<List<UsuarioBD>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM UsuarioBD',
        mapper: (Map<String, Object?> row) => UsuarioBD(
            row['nome'] as String,
            row['cpf'] as int,
            row['login'] as String,
            (row['isAdm'] as int) != 0,
            row['senha'] as int));
  }

  @override
  Future<int> insertUsuario(UsuarioBD usuario) {
    return _usuarioBDInsertionAdapter.insertAndReturnId(
        usuario, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUsuario(UsuarioBD usuario) async {
    await _usuarioBDUpdateAdapter.update(usuario, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteUsuario(UsuarioBD usuario) async {
    await _usuarioBDDeletionAdapter.delete(usuario);
  }
}

class _$ProdutoDao extends ProdutoDao {
  _$ProdutoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _produtoBDInsertionAdapter = InsertionAdapter(
            database,
            'ProdutoBD',
            (ProdutoBD item) => <String, Object?>{
                  'codigo': item.codigo,
                  'descricao': item.descricao,
                  'preco': item.preco
                }),
        _produtoBDUpdateAdapter = UpdateAdapter(
            database,
            'ProdutoBD',
            ['codigo'],
            (ProdutoBD item) => <String, Object?>{
                  'codigo': item.codigo,
                  'descricao': item.descricao,
                  'preco': item.preco
                }),
        _produtoBDDeletionAdapter = DeletionAdapter(
            database,
            'ProdutoBD',
            ['codigo'],
            (ProdutoBD item) => <String, Object?>{
                  'codigo': item.codigo,
                  'descricao': item.descricao,
                  'preco': item.preco
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ProdutoBD> _produtoBDInsertionAdapter;

  final UpdateAdapter<ProdutoBD> _produtoBDUpdateAdapter;

  final DeletionAdapter<ProdutoBD> _produtoBDDeletionAdapter;

  @override
  Future<List<ProdutoBD>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM Produto',
        mapper: (Map<String, Object?> row) => ProdutoBD(row['codigo'] as int,
            row['descricao'] as String, row['preco'] as double));
  }

  @override
  Future<int> insertProduto(ProdutoBD produto) {
    return _produtoBDInsertionAdapter.insertAndReturnId(
        produto, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateProduto(ProdutoBD produto) async {
    await _produtoBDUpdateAdapter.update(produto, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteProduto(ProdutoBD produto) async {
    await _produtoBDDeletionAdapter.delete(produto);
  }
}
