import 'package:flutter/cupertino.dart';
import 'package:sqflite/sql.dart';
import 'package:validacep/data/db_service.dart';
import 'package:validacep/data/http_service.dart';
import 'package:validacep/models/model_cep.dart';
import 'package:validacep/repository/repository_interface.dart';

class Repository implements IRepository {
  final ServiceDB _serviceDb;
  final ServiceWeb _serviceWeb;
  Repository(this._serviceDb, this._serviceWeb);

  @override
  Future deleteCep(id) {
    throw UnimplementedError();
  }

  @override
  Future fetchCep(cep) async {
    var resulFetch = '';
    var response = await _serviceWeb.getHttp(cep);
    
    if (response == null) {
      return resulFetch = 'Sem conexão, serviço indisponível!';
    }
    if (response['status'] == 400 || response['status'] == 404) {
      return resulFetch = response['message'] as String;
    }
    if (response['status'] == 200) {
     
      CepData cepData = CepData.fromjson(response);
      resulFetch = 'CEP Válido!';

    await insertCep(cepData);
    }
    return resulFetch;
  }

  @override
  Future getCeps(code) async {
    final db = await _serviceDb.database;
    String sql = "SELECT * FROM ${_serviceDb.nametable} WHERE ${_serviceDb.code} == $code ";
    List<Map<String, Object?>> cepData = await db!.rawQuery(sql);

    return cepData;
  }

  @override
  Future insertCep(cep) async {
    final db = await _serviceDb.database;
    var result = await db!.insert(_serviceDb.nametable, cep.toMap());
    ConflictAlgorithm.replace;

    return result;
  }
}
