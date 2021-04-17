import 'package:werewolf_client/app/resources/model/model.dart';

class RoomModel {
  String id;
  String type;
  String state;
  List<UserModel> members;
  String languageCode;

  RoomModel({this.id, this.type, this.state, this.members, this.languageCode});

  RoomModel.fromJson(dynamic json) {
    id = json["id"];
    type = json["type"];
    state = json["state"];
    if (json["members"] != null) {
      members = [];
      json["members"].forEach((v) {
        members.add(UserModel.fromJson(v));
      });
    }
    languageCode = json["languageCode"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["type"] = type;
    map["state"] = state;
    if (members != null) {
      map["members"] = members.map((v) => v.toJson()).toList();
    }
    map["languageCode"] = languageCode;
    return map;
  }
}
