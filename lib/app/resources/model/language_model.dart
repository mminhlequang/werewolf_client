class LanguageModel {
  String name;
  String code;
  int id;

  LanguageModel({this.name, this.code, this.id});

  static List<LanguageModel> listFromJson(dynamic json) {
    List<LanguageModel> data = [];
    if (!(json is List) || json == null) return data;
    json.forEach((e) {
      data.add(LanguageModel.fromJson(e));
    });
    return data;
  }

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
        id: json['id'], name: json['name'], code: json['code']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "code": code};
  }
}
