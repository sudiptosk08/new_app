import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:new_app/style/kColors.dart';
import 'api.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class Network {
  static String noInternetMessage = "Check your connection!";

  static getRequest(String endPoint,
      {bool requireToken = true, bool noBaseUrl = false}) async {
    Response response;
    var headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    print('\nURL: ${API.base}$endPoint');

    response =
        await get(Uri.parse(noBaseUrl ? endPoint : '${API.base}$endPoint'));

    return response;
  }

  static handleResponse(Response response) async {
    if (response.statusCode >= 200 && response.statusCode <= 210) {
      print('\nSuccessCode: ${response.statusCode}');
      print('SuccessResponse: ${response.body}\n');
      if (response.body.isNotEmpty) {
        return json.decode(response.body);
      } else {
        return response.body;
      }
    } else {
      print('\nErrorCode: ${response.statusCode}');
      print("ErrorResponse: ${response.body}\n");

      if (response.statusCode == 403) {
        /// Session expired
        print("Error:$response");
      } else if (response.statusCode == 422) {
        /// Custom validation message
        print("Error:$response");
      } else if (response.statusCode == 429) {
        /// Too many attempts message
        print("Error:$response");
      } else if (response.statusCode == 402) {
        /// Custom validation message
        print("Error:$response");
      } else if (response.statusCode == 401 || response.statusCode == 404) {
        /// Custom message
        if (jsonDecode(response.body)['message'] == "Unauthenticated.") {
          print("Error:$response");
          // setValue(LOGGED_IN, false);
          // NavigationService.navigateToReplacement(CupertinoPageRoute(builder: (_) => LoginScreen()));
        } else {
          print("Error:$response");
        }
        if (jsonDecode(response.body)['unverified'] != null) {
          if (jsonDecode(response.body)['unverified']) {
            if (response.body.isNotEmpty) return json.decode(response.body);
          }
        }
      } else {
        print("Error:$response");
      }
    }
  }
}
