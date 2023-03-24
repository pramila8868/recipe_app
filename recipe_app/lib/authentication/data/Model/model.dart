// class UserDetail {
//   String? phoneNumber;
//   String? email;
//   String? fullname;
//   String? password;
//   String? invitationCode;

//   UserDetail(
//       {this.phoneNumber,
//       this.email,
//       this.fullname,
//       this.password,
//       this.invitationCode});

//   UserDetail.fromJson(Map<String, dynamic> json) {
//     phoneNumber = json['phone_number'];
//     email = json['email'];
//     fullname = json['fullname'];
//     password = json['password'];
//     invitationCode = json['invitation_code'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['phone_number'] = this.phoneNumber;
//     data['email'] = this.email;
//     data['fullname'] = this.fullname;
//     data['password'] = this.password;
//     data['invitation_code'] = this.invitationCode;
//     return data;
//   }
// }

class UserDetail {
  String? phoneNumber;
  String? email;
  String? fullname;
  String? password;
  String? invitationCode;

  UserDetail(
      {this.phoneNumber,
      this.email,
      this.fullname,
      this.password,
      this.invitationCode});

  UserDetail.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    email = json['email'];
    fullname = json['fullname'];
    password = json['password'];
    invitationCode = json['invitation_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['fullname'] = fullname;
    data['password'] = password;
    data['invitation_code'] = invitationCode;
    return data;
  }
}
