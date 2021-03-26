class AppEndpoint {
  AppEndpoint._();

  static const String BASE_URL = "http://104.155.210.98:5555";

  static const int connectionTimeout = 3000;
  static const int receiveTimeout = 3000;
  static const String keyAuthorization = "Authorization";

  static const int SUCCESS = 200;
  static const int ERROR_TOKEN = 401;
  static const int ERROR_VALIDATE = 422;
  static const int ERROR_SERVER = 500;
  static const int ERROR_DISCONNECT = -1;

}
