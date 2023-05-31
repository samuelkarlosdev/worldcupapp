class Country {
  String name;
  String flag;
  int titles;
  String titlesforyears;
  String vicesyears;
  String thirdplaceyears;
  String fourthplaceyear;

  /*Country({
    required this.name,
    required this.flag,
    required this.titles,
    required this.titlesforyears,
    required this.vicesyears,
    required this.thirdplaceyears,
    required this.fourthplaceyear,
  });*/

  Country(
    this.name,
    this.flag,
    this.titles,
    this.titlesforyears,
    this.vicesyears,
    this.thirdplaceyears,
    this.fourthplaceyear,
  );

  factory Country.fromJson(Map json) {
    return Country(
      json['name'],
      json['flag'],
      json['titles'],
      json['titlesforyears'],
      json['vicesyears'],
      json['thirdplaceyears'],
      json['fourthplaceyear'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'name: $name';
  }
}
