import 'package:dio/dio.dart';

class ServiceWeb {
  Future getHttp(String cep) async {
  String url = 'https://ws.apicep.com/cep.json?code=$cep';
    try {
      Response? response;
      response = await Dio().get(url);
       return response.data;
    } catch (e) {
      e.toString();
    }
  }
}
