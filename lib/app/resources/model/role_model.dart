import 'package:werewolf_client/app/utils/utils.dart';

enum RoleType { classic, modern }

class RoleModel {
  String name;
  String description;
  String smallIcon;
  String icon;
  String actionIcon;
  int languageId;
  List<int> sectarians;
  RoleType type;
  int id;

  RoleModel(
      {this.name,
      this.description,
      this.smallIcon,
      this.icon,
      this.actionIcon,
      this.languageId,
      this.sectarians,
      this.type,
      this.id});

  static List<RoleModel> listFromJson(dynamic json) {
    List<RoleModel> data = [];
    if (!(json is List) || json == null) return data;
    json.forEach((e) {
      data.add(RoleModel.fromJson(e));
    });
    return data;
  }

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
        id: json['id'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        icon: json['icon'] as String,
        smallIcon: json['smallIcon'] as String,
        actionIcon: json['actionIcon'] as String,
        languageId: json['languageId'] as int,
        sectarians: (json['sectarians'] as List)?.map<int>((e) => e)?.toList(),
        type: AppConverter.stringToEnum<RoleType>(
            json['type'] as String, RoleType.values));
  }

  @override
  List<Object> get props => throw UnimplementedError();

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "icon": icon,
      "smallIcon": smallIcon,
      "actionIcon": actionIcon,
      "languageId": languageId,
      "sectarians": sectarians,
      "type": AppConverter.enumToString(type)
    };
  }
}
