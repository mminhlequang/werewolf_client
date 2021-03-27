import 'package:dio/dio.dart';

import '../../constants/constants.dart';
import 'api.dart';
import '../model/model.dart';
import '../service/wifi_service.dart';
import 'client.dart';

class AppApiImp extends AppApi {
  @override
  Future<NetworkResponse<ConfigModel>> getConfig<ConfigModel>() async {
    bool isDisconnect = await WifiService.isDisconnect();
    if (isDisconnect) return NetworkResponse.withDisconnect();
    try {
      Response response = await AppClients().get(AppEndpoint.GET_CONFIG);
      return NetworkResponse.fromResponse(response);
    } on DioError catch (e) {
      return NetworkResponse.withError(e);
    }
  }
}
