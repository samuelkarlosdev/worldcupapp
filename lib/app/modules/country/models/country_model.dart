class Country {
  int? id;
  String name;
  String flag;
  int titles;
  String titlesforyears;
  String vicesyears;
  String thirdplaceyears;
  String fourthplaceyear;

  Country({
    this.id,
    required this.name,
    required this.flag,
    required this.titles,
    required this.titlesforyears,
    required this.vicesyears,
    required this.thirdplaceyears,
    required this.fourthplaceyear,
  });

  /*Country(
    this.id,
    this.name,
    this.flag,
    this.titles,
    this.titlesforyears,
    this.vicesyears,
    this.thirdplaceyears,
    this.fourthplaceyear,
  );*/

  /*factory Country.fromJson(Map json) {
    return Country(
      json['id'],
      json['name'],
      json['flag'],
      json['titles'],
      json['titlesforyears'],
      json['vicesyears'],
      json['thirdplaceyears'],
      json['fourthplaceyear'],
    );
  }*/

  factory Country.fromMap(Map<String, dynamic> json) => Country(
        id: json['id'],
        name: json['name'],
        flag: json['flag'],
        titles: json['titles'],
        titlesforyears: json['titlesforyears'],
        vicesyears: json['vicesyears'],
        thirdplaceyears: json['thirdplaceyears'],
        fourthplaceyear: json['fourthplaceyear'],
      );

  @override
  String toString() {
    return 'Country{id: $id, name: $name, flag: $flag, titles: $titles, titlesforyears: $titlesforyears, vicesyears: $vicesyears, thirdplaceyears: $thirdplaceyears, fourthplaceyear: $fourthplaceyear,}';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'flag': flag,
      'titles': titles,
      'titlesforyears': titlesforyears,
      'vicesyears': vicesyears,
      'thirdplaceyears': thirdplaceyears,
      'fourthplaceyear': fourthplaceyear,
    };
  }
}
