import '../provider/api_imp.dart';
import '../model/model.dart';
import '../provider/api.dart';

class RoleRepository {
  RoleRepository._(this._api);

  static RoleRepository _instance;

  factory RoleRepository({AppApi api}) {
    if (_instance == null)
      _instance = RoleRepository._(api ?? AppApiImp());
    else if (api != null) _instance._api = api;
    return _instance;
  }

  AppApiImp _api;

  Future<NetworkResponse<List<RoleModel>>> getRoleClassic() async {
    return await _api.getRoleClassic((data) => RoleModel.listFromJson(data));
  }

  Future<NetworkResponse<List<RoleModel>>> getRoleAll() async {
    return await _api.getRoleAll((data) => RoleModel.listFromJson(data));
  }
}
