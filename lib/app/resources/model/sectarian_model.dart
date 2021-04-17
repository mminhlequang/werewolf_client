enum SectarianType { farmer, wolf, solo }

class SectarianModel {
  String name;
  String description;
  String icon;
  int languageId;
  int id;

  SectarianModel(
      {this.name, this.description, this.icon, this.languageId, this.id});

  static List<SectarianModel> listFromJson(dynamic json) {
    List<SectarianModel> data = [];
    if (!(json is List) || json == null) return data;
    json.forEach((e) {
      data.add(SectarianModel.fromJson(e));
    });
    return data;
  }

  factory SectarianModel.fromJson(Map<String, dynamic> json) {
    return SectarianModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        icon: json['icon'],
        languageId: json['languageId']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "icon": icon,
      "languageId": languageId
    };
  }
}
