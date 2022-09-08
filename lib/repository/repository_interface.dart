import '../models/model_cep.dart';

abstract class IRepository {
  Future fetchCep(String cep);
  Future getCeps(String cep);
  Future insertCep(CepData cep);
  Future deleteCep(id);
}
