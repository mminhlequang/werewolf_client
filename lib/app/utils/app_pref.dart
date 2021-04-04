import 'package:get_storage/get_storage.dart';
import 'package:werewolf_client/app/resources/resources.dart';

class AppPref {
  AppPref._();

  static final GetStorage _box = GetStorage('AppPref');

  static set accessToken(String token) => _box.write('accessToken', token);

  static String get accessToken => _box.read('accessToken');

  static set user(UserModel _user) => _box.write('user', _user);

  static UserModel get user => _box.read('user');

  static set config(ConfigModel _config) => _box.write('config', _config);

  static ConfigModel get config => _box.read('config');
}
