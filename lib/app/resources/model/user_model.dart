class UserModel {
  String username;
  String password;
  String fullName;
  String email;
  String avatar;
  int score;
  int coin;
  String languageCode;
  bool isOnline;
  String lastOnline;
  int id;

  UserModel(
      {this.username,
      this.avatar,
      this.email,
      this.coin = 0,
      this.score = 0,
      this.fullName,
      this.languageCode,
      this.isOnline,
      this.lastOnline,
      String password,
      this.id});

  static List<UserModel> listFromJson(dynamic json) {
    List<UserModel> data = [];
    if (!(json is List) || json == null) return data;
    json.forEach((e) {
      data.add(UserModel.fromJson(e));
    });
    return data;
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      score: json['score'] as int,
      coin: json['coin'] as int,
      languageCode: json['languageCode'] as String,
      isOnline: json['isOnline'] as bool,
      lastOnline: json['lastOnline'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "fullName": fullName,
      "email": email,
      "avatar": avatar,
      "username": username,
      "password": password,
      "score": score,
      "coin": coin,
      "lastOnline": lastOnline,
      "isOnline": isOnline,
      "languageCode": languageCode
    };
  }
}
