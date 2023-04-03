// ignore: depend_on_referenced_packages
// ignore_for_file: avoid_print

// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    print(options.path);
    print(options.data);
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    print(err.response!.statusMessage);
    print(err.response!.statusCode);
    //String errorMsg = err.response?.data["message"];
    // //['message'];
    // ignore: avoid_print
    print("error");
    //print(errorMsg);
    //String errorMessage = err.response!.data['message'];

    print(err.message);
    print(err.response);

    switch (err.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        super.onError(DeadlineExceededException(err.requestOptions), handler);
        break;
      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            super.onError(BadRequestException(err.requestOptions, err.response),
                handler); // response pass garni ani return garni message
            //   throw BadRequestException(err.requestOptions);
            break;
          case 401:
            super.onError(
                UnauthorizedException(err.requestOptions, err.response),
                handler);
            break;
          case 404:
            super.onError(NotFoundException(err.requestOptions), handler);
            break;
          case 409:
            super.onError(ConflictException(err.requestOptions), handler);
            break;
          case 500:
            super.onError(
                InternalServerErrorException(err.requestOptions), handler);
            break;
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.unknown:
        throw NoInternetConnectionException(err.requestOptions);
      case DioErrorType.badCertificate:
        break;
      case DioErrorType.connectionError:
        break;
    }

    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r, Response? res)
      : super(requestOptions: r, response: res);

  @override
  String toString() {
    //for(var error in errors)
    print(response!.data.toString());
    print(response!.data["errors"].toString());
    //print(response!.data["errors"][0]['message']["phone_number"].toString());
   // print(response!.data["errors"][0]['message']["field"].toString());
    //["message"].toString());
    print("backend error");
    // final errors = response!.data["errors"];
    // for (var error in errors) {
    //   final field = error["field"];
    //   final messages = error["message"][field];
    //   print(messages);
    // }

    // String errors;
    // for (var error in errors) {
    //   print("Field: ${error["field"]}");
    //   print("Message: ${error["message"][error["field"]]}");
    // }
    // String errorMsg = err.response?.data["message"];
    // return response!.data //['errors']
    //     ["errors"][0]["message"]
    //     // ['message']
    //     .toString(); //['message'].toString(); // "invalid response" ;

    final errors = response!.data["errors"];
    String phoneNumberErrorMessage = "";
    String emailErrorMessage = "";
    for (var error in errors) {
      final field = error["field"];
      final messages = error["message"][field];
      if (field == "phone_number") {
        phoneNumberErrorMessage = messages.toString();
      } else if (field == "email") {
        emailErrorMessage = messages.toString();
      }
    }

    return " $phoneNumberErrorMessage,  $emailErrorMessage";

    //"Phone Number Error: $phoneNumberErrorMessage, Email Error: $emailErrorMessage";
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r, Response? res)
      : super(requestOptions: r, response: res);

  @override
  String toString() {
    //  print(response!.data["errors"]);
    print(response!.data.toString());
    // print(response!.data.toString());
    print(response!.data["errors"].toString());
    print(response!.data["errors"][0]["message"].toString());
    // print(response!.data["errors"][0]['message']["phone_number"].toString());
    // String errormessage = response!.data["errors"][0]['message'].toString();
    //["message"].toString());
    print("backend error");
    //print(re)
    // return 'Access denied';

    // final errors = response!.data["errors"];
    // String phoneNumberErrorMessage = "";
    // String emailErrorMessage = "";
    // for (var error in errors) {
    //   final field = error["field"];
    //   final messages = error["message"][field];
    //   if (field == "phone_number") {
    //     phoneNumberErrorMessage = messages.toString();
    //   } else if (field == "email") {
    //     emailErrorMessage = messages.toString();
    //   }
    // }

    return response!.data["errors"][0]["message"]
        .toString(); //errormessage; //" $phoneNumberErrorMessage,  $emailErrorMessage";
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}
