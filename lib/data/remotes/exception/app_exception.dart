import 'package:get/get_connect/connect.dart';

class AppException implements Exception {
  static String errorMessage(Response response) {
    switch (response.statusCode) {
      case 401:
        return "Unauthorized";
      case 403:
        return "Forbidden! Need Permission";
      case 404:
        return "Not Found";
      case 500:
        return "Internal Server Error";
      case 408:
        return "Connection Timed Out";
      default:
        return "Unknown Error!. Please Contact Support";
    }
  }
}
