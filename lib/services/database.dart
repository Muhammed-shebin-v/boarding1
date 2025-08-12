import 'package:boarding1/models/datas.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDatabase();
    return _db!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'shop.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE datas(
            id TEXT PRIMARY KEY,
            type TEXT,
            title TEXT,
            imageUrl TEXT
          )
        ''');

        await db.execute('''
          CREATE TABLE contents(
            sku TEXT PRIMARY KEY,
            title TEXT,
            imageUrl TEXT,
            productName TEXT,
            productImage TEXT,
            productRating INTEGER,
            actualPrice TEXT,
            offerPrice TEXT,
            discount TEXT,
            dataId TEXT,
            FOREIGN KEY(dataId) REFERENCES datas(id)
          )
        ''');
      },
    );
  }

  /// Insert Datas + Contents
  Future<void> insertDatas(Datas data) async {
    final dbClient = await database;

    await dbClient.insert(
      'datas',
      {
        'id': data.id,
        'type': data.type,
        'title': data.title,
        'imageUrl': data.imageUrl,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    for (var content in data.contents) {
      await dbClient.insert(
        'contents',
        {
          'sku': content.sku,
          'title': content.title,
          'imageUrl': content.imageUrl,
          'productName': content.productName,
          'productImage': content.productImage,
          'productRating': content.productRating,
          'actualPrice': content.actualPrice,
          'offerPrice': content.offerPrice,
          'discount': content.discount,
          'dataId': data.id,
        },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }

  Future<List<Datas>> getAllDatas() async {
    final dbClient = await database;

    final datasList = await dbClient.query('datas');

    List<Datas> results = [];

    for (var dataRow in datasList) {
      final contentsList = await dbClient.query(
        'contents',
        where: 'dataId = ?',
        whereArgs: [dataRow['id']],
      );

      List<Content> contents = contentsList.map((c) => Content(
        title: c['title'] as String?,
        imageUrl: c['imageUrl'] as String?,
        sku: c['sku'] as String?,
        productName: c['productName'] as String?,
        productImage: c['productImage'] as String?,
        productRating: c['productRating'] as int?,
        actualPrice: c['actualPrice'] as String?,
        offerPrice: c['offerPrice'] as String?,
        discount: c['discount'] as String?,
      )).toList();

      results.add(Datas(
        type: dataRow['type'] as String?,
        title: dataRow['title'] as String?,
        contents: contents,
        id: dataRow['id'] as String?,
        imageUrl: dataRow['imageUrl'] as String?,
      ));
    }

    return results;
  }
}
