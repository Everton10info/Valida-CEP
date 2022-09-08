import 'package:flutter/material.dart';
import 'package:validacep/repository/repository_interface.dart';

class ViewModelSearch extends ChangeNotifier {
  final IRepository _repository;
  ViewModelSearch(this._repository);
  String result = '';
  TextEditingController inputCep = TextEditingController();
  var formKey = GlobalKey<FormFieldState>();
  bool loader = false;
  List dataCep = [];

  Future<String> getDataCep(String cep) async {
    loader = true;
    notifyListeners();
    dataCep = await _repository.getCeps(cep.replaceAll('-',''));
    result = dataCep.toString();

    if (dataCep.isEmpty) {
      result = await _repository.fetchCep(cep);
   
    } else {
      result = 'CEP Válido!';
    }
    loader = false;
    notifyListeners();
    return result;
  }

  Future<bool> validationInicialCEP() async {
    String? validResult;

    if (formKey.currentState!.validate()) {
      validResult = await getDataCep(inputCep.text.replaceAll('-', ''));
      if (validResult == 'CEP Válido!') {
        return true;
      }
    } else {
      return false;
    }
    return false;
  }
}
