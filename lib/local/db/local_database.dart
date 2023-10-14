import 'package:default_project/data/models/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDatabase {
  static final LocalDatabase getInstance = LocalDatabase._init();

  LocalDatabase._init();

  factory LocalDatabase() {
    return getInstance;
  }

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDB("todos.db");
      return _database!;
    }
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = "INTEGER PRIMARY KEY AUTOINCREMENT";
    const textType = "TEXT NOT NULL";
    // const intType = "INTEGER DEFAULT 0";

    await db.execute('''
    CREATE TABLE ${ShopModelFields.modelTable} (
    ${ShopModelFields.id} $idType,
    ${ShopModelFields.name} $textType,
    ${ShopModelFields.count} $textType,
    ${ShopModelFields.qrCode} $textType
    )
    ''');

    debugPrint("-------DB----------CREATED---------");
  }

  static Future<ShopModel> insertProducts(ShopModel shopModel) async {
    final db = await getInstance.database;
    final int id =
        await db.insert(ShopModelFields.modelTable, shopModel.toJson());
    return shopModel.copyWith(id: id);
  }

  static Future<List<ShopModel>> getAllProducts() async {
    final db = await getInstance.database;
    List<ShopModel> allToDos = (await db.query(ShopModelFields.modelTable))
        .map((e) => ShopModel.fromJson(e))
        .toList();
    return allToDos;
  }

  static updateProducts({required ShopModel shopModel}) async {
    final db = await getInstance.database;
    db.update(
      ShopModelFields.modelTable,
      shopModel.toJson(),
      where: "${ShopModelFields.id} = ?",
      whereArgs: [shopModel.id],
    );
  }

  static Future<int> deleteProducts(int id) async {
    final db = await getInstance.database;
    int count = await db.delete(
      ShopModelFields.modelTable,
      where: "${ShopModelFields.id} = ?",
      whereArgs: [id],
    );
    return count;
  }

  static Future<ShopModel?> getSingleProduct(String barCode) async {
    List<ShopModel> contacts = [];
    final db = await getInstance.database;
    contacts = (await db.query(
      ShopModelFields.qrCode,
      where: "${ShopModelFields.qrCode} = ?",
      whereArgs: [barCode],
    ))
        .map((e) => ShopModel.fromJson(e))
        .toList();

    if (contacts.isNotEmpty) {
      return contacts.first;
    }
    return null;
  }
}
