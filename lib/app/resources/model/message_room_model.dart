import 'package:werewolf_client/app/constants/app_type.dart';
import 'package:werewolf_client/app/constants/constants.dart';

class MessageRoomModel {
  String msg;
  String time;

  MessageRoomType type;

  MessageRoomModel({this.msg, this.time, this.type});

  MessageRoomModel.fromJson(dynamic json,
      {MessageRoomType messageType = MessageRoomType.room}) {
    msg = json["msg"];
    time = json["time"];
    type = messageType;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["msg"] = msg;
    map["time"] = time;
    return map;
  }
}
