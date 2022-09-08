import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class ServiceDB {
  String nametable = 'tbl_cepData';
  String id = 'id';
  String status = 'status';
  String code = 'code';
  String state = 'state';
  String city = 'city';
  String district = 'district';
  String address = 'address';

  Database? _database;

  Future<Database?> get database async {
    _database ??= await initialBase();
    return _database;
  }

  Future<Database> initialBase() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = '${dir.path}dbCep.db';
    var base = await openDatabase(path, version: 1, onCreate: _createTable);
    return base;
  }

  _createTable(Database db, int versao) async {
    await db.execute('CREATE TABLE $nametable('
        '$id INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$status INTEGER,'
        '$code TEXT,'
        '$state TEXT,'
        '$city TEXT,'
        '$district TEXT,'
        '$address TEXT)');
  }
}
