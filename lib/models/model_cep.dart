class CepData {
  int? id;
  int status;
  String code;
  String state;
  String city;
  String district;
  String address;
 /*  String statusText; */
  CepData({ 
    required this.status,
    required this.code,
    required this.state,
    required this.city,
    required this.district,
    required this.address,
   /*  required this.statusText */
  });

  Map<String, dynamic> toMap() => {
        "status": status,
        "code": code,
        "state": state,
        "city": city,
        "district": district,
        "address": address,
       /*  "statusText": statusText */
      };

  factory CepData.fromjson(Map<String, dynamic> map) {
    return CepData(
      status: map['status'],
      code: map['code'],
      state: map['state'],
      city: map['city'] ?? 'Não encontrado',
      district: map['district'] ?? 'Não encontrado',
      address: map['address']?? 'Não encontrado'
      /* statusText:map['statusText'] ?? 'Não encontrado' */
    );
  }
}
