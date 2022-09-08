class CepData {
  int status;
  String code;
  String state;
  String city;
  String district;
  String address;

  CepData({
    required this.status,
    required this.code,
    required this.state,
    required this.city,
    required this.district,
    required this.address,
  });

  Map<String, dynamic> toMap() => {
        "status": status,
        "code": code.replaceAll('-', ''),
        "state": state,
        "city": city,
        "district": district,
        "address": address
      };

  factory CepData.fromjson(Map<String, dynamic> map) {
    return CepData(
        status: map['status'],
        code: map['code'].replaceAll('-', '') as String,
        state: map['state'],
        city: map['city'] ?? 'Não encontrado',
        district: map['district'] ?? 'Não encontrado',
        address: map['address'] ?? 'Não encontrado');
  } // caso CEP seja valido e api mandar campos vazios aparecerá como não encontrado
}
