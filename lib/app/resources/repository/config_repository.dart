import '../provider/api_imp.dart';
import '../model/model.dart';
import '../provider/api.dart';

class ConfigRepository {
  ConfigRepository._(this._api);

  static ConfigRepository _instance;

  factory ConfigRepository({AppApi api}) {
    if (_instance == null)
      _instance = ConfigRepository._(api);
    else if (api != null) _instance._api = api;
    return _instance;
  }

  AppApiImp _api;

  Future<NetworkResponse<ConfigModel>> getConfig() async {
    return await _api.getConfig();
  }
}
