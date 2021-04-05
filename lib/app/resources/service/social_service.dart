import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

enum SocialType { facebook, google, apple }

class LoginResult {
  bool success;
  dynamic id;
  String accessToken;
  SocialType type;
  String fullName;
  String email;
  String avatar;

  bool get isSuccess => success ?? false;

  LoginResult(
      {this.accessToken,
      this.success,
      this.email,
      this.type,
      this.id,
      this.avatar,
      this.fullName});
}

class SocialService {
  SocialService._();

  static SocialService _instance;

  factory SocialService() {
    if (_instance == null) _instance = SocialService._();
    return _instance;
  }

  // Username: test_jbijwbw_user@tfbnw.net
  // pass: Werewolf@
  Future<LoginResult> signInFacebook() async {
    LoginResult result = LoginResult(type: SocialType.facebook);
    try {
      AccessToken accessToken = await FacebookAuth.instance.isLogged;
      if (accessToken != null) await FacebookAuth.instance.logOut();
      accessToken = await FacebookAuth.instance.login();
      if (accessToken == null) return result;
      final Map<String, dynamic> user =
          await FacebookAuth.instance.getUserData();
      result.id = accessToken.userId;
      result.accessToken = accessToken.token;
      result.fullName = user['name'];
      result.email = user['email'];
      result.avatar = user['picture']['data']['url'];
      result.success = true;
    } catch (error) {
      print(error);
    }
    return result;
  }

  signInGoogle() async {
    LoginResult result = LoginResult(type: SocialType.google);
    try {
      if (await GoogleSignIn().isSignedIn()) await GoogleSignIn().signOut();
      final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
      if (await GoogleSignIn().isSignedIn()) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        result.id = googleUser.id;
        result.fullName = googleUser.displayName;
        result.email = googleUser.email;
        result.avatar = googleUser.photoUrl;
        result.accessToken = googleAuth.accessToken;
        result.success = true;
      }
    } catch (error) {
      print(error);
    }
    return result;
  }
}
