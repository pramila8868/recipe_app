class GoogleModel {
  String? refresh;
  String? access;
  User? user;

  GoogleModel({this.refresh, this.access, this.user});

  GoogleModel.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    access = json['access'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.access;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? fullname;
  String? email;
  String? avatar;
  bool? isFirstLogin;

  User({this.id, this.fullname, this.email, this.avatar, this.isFirstLogin});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    email = json['email'];
    avatar = json['avatar'];
    isFirstLogin = json['is_first_login'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['is_first_login'] = this.isFirstLogin;
    return data;
  }
}
