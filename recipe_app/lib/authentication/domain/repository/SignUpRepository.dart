
import 'package:recipe_app/authentication/data/Model/model.dart';
import 'package:recipe_app/authentication/data/api/api.dart';

import '../../../common/Dio/url.dart';

import '../../../common/interceptor/customInterceptor.dart';

class PostRepository {
  Api api = Api();
  String apiurl = Globals().signUpUrl;
  Future<UserDetail> createUser(String name, String phnumber, String email,
      String password, String invitationCode) async {
    Map<String, dynamic> map = {
      "fullname": name,
      "phone_number": phnumber,
      "email": email,
      "password": password,
      "invitation_code": ''
    };
    //const apiUrl = url;
    //  "https://api-dev.revelarena.com/v1/auth/normal-user-register";

    final response = await api.dio.post(
      apiurl,
      data: map,
    );
    print(response);
    print(response.statusCode);

    final Map<String, dynamic> body = response.data;

    return UserDetail.fromJson(body);
    //  return UserDetail.fromJson(response.data);
    // } else {
    //   throw NoInternetConnectionException(response.requestOptions);
  }
}
