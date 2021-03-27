import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart' as Dio;
import 'package:get/get.dart';

const int _SUCCESS = 200;
const int _ERROR_TOKEN = 401;
const int _ERROR_VALIDATE = 422;
const int _ERROR_SERVER = 500;
const int _ERROR_DISCONNECT = -1;

class NetworkResponse<T> {
  int code;
  bool success;
  String msg;
  T data;

  bool get isSuccess => code == _SUCCESS && (success ?? false);

  bool get isError => code != _SUCCESS || (success ?? false);

  NetworkResponse({this.success, this.msg, this.data, this.code});

  factory NetworkResponse.fromResponse(Dio.Response response, {converter}) {
    return NetworkResponse._fromJson(jsonDecode(response.data),
        converter: converter)
      ..code = response.statusCode;
  }

  NetworkResponse._fromJson(dynamic json, {converter}) {
    success = json["success"];
    msg = json["msg"];
    data = converter != null && json["data"] != null
        ? converter(json["data"])
        : json["data"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["success"] = success;
    map["msg"] = msg;
    map["data"] = data;
    return map;
  }

  NetworkResponse.withError(Dio.DioError error) {
    try {
      print("${error.type}");
      Dio.Response response = error.response;
      this.code = response.statusCode;
      this.msg = 'msg_disconnect'.tr;
      this.success = false;
      this.data = null;
    } catch (e) {
      log("Error NetworkResponse.withError: $e");
    }
  }

  NetworkResponse.withDisconnect() {
    this.msg = 'msg_disconnect'.tr;
    this.success = false;
    this.data = null;
  }
}
