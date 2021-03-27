class AppEndpoint {
  AppEndpoint._();

  static const String BASE_URL = "http://104.155.210.98:5555";

  static const int connectionTimeout = 3000;
  static const int receiveTimeout = 3000;
  static const String keyAuthorization = "Authorization";

  static const String GET_CONFIG = "/api/getConfig";

  static const String POST_SIGN_UP = "/api/post/signUp";

  static const String POST_SIGN_IN = "/api/post/signIn";

  static const String POST_SIGN_IN_WITH_GOOGLE = "/api/post/signInWithGoogle";

  static const String POST_SIGN_IN_WITH_FACEBOOK = "/api/post/signInWithFacebook";

  static const String POST_SIGN_IN_WITH_APPLE = "/api/post/signInWithApple";

  static const String GET_PROFILE = "/api/getProfile";
}
