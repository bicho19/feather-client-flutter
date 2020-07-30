import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'feather_credential.dart';
import 'feather_user.dart';
import 'feather_error.dart';

class FeatherClient {
  String _apiKey;
  static const String BASE_URL = "https://api.feather.id/v1/";
  static const String CREDENTIALS_PATH = "credentials/";
  static const String USER_PATH = "users/";

  FeatherClient({String apiKey}) {
    this._apiKey = base64.encode(utf8.encode(apiKey + ":"));
  }

  Future<FeatherCredential> newCurrentCredential(
      {@required String email, @required String password}) async {
    FeatherCredential featherCredential;
    final authstr = 'Basic ' + this._apiKey;
    var url = BASE_URL + CREDENTIALS_PATH;
    Map<String, String> headers = {"Authorization": authstr};
    var body = {'email': email, 'password': password};
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    //todo: remove this later
    print("============== newCurrentCredential - Response Body ==============");
    print(response.body);

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      //Response Code success
      featherCredential =
          FeatherCredential.fromJson(json.decode(response.body));
    } else if (response.statusCode >= 400 && response.statusCode <= 500) {
      //Malformed request
      throw FeatherException.fromJson(json.decode(response.body));
    }
    return featherCredential;
  }

  Future<FeatherUser> newCurrentUser({
    @required String token,
  }) async {
    FeatherUser featherUser;
    final authstr = 'Basic ' + this._apiKey;
    var url = BASE_URL + USER_PATH;
    Map<String, String> headers = {"Authorization": authstr};
    var body = {
      'credential_token': token,
    };
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    //todo: remove this later
    print("=============== newCurrentUser - Response Body ===============");
    print(response.body);

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      //Response Code success
      featherUser = FeatherUser.fromJson(json.decode(response.body));
    } else if (response.statusCode >= 400 && response.statusCode <= 500) {
      //Malformed request
      throw FeatherException.fromJson(json.decode(response.body));
    }
    return featherUser;
  }
}
