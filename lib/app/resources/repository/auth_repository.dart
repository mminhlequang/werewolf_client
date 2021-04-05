import 'package:flutter/foundation.dart';

import '../provider/api_imp.dart';
import '../model/model.dart';
import '../provider/api.dart';

enum SignInType { normal, google, facebook }

class AuthRepository {
  AuthRepository._(this._api);

  static AuthRepository _instance;

  factory AuthRepository({AppApi api}) {
    if (_instance == null)
      _instance = AuthRepository._(api ?? AppApiImp());
    else if (api != null) _instance._api = api;
    return _instance;
  }

  AppApiImp _api;

  Future<NetworkResponse<SignInResponseModel>> postSignIn(
      {String username, String password, SignInType type}) async {
    return await _api.postSignIn({
      'username': username,
      'password': password,
      'type': describeEnum(type)
    }, (data) => SignInResponseModel.fromJson(data));
  }

  Future<NetworkResponse<SignInResponseModel>> postSignUp(
      {String username, String password, String email}) async {
    return await _api.postSignUp(
        {'username': username, 'password': password, 'email': email},
        (data) => SignInResponseModel.fromJson(data));
  }
}
