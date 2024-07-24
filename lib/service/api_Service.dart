import 'dart:convert';
import 'dart:developer';

import 'package:api_task/api/api.dart';
import 'package:api_task/api/responce_handler.dart';
import 'package:api_task/model/api_model.dart';
import 'package:api_task/utils/appconstants.dart';

class AuthService {
  static final Api _api = Api();

  static Future<List<UserDataModel>> getApiDataService() async {
    var response = await _api.post(
      AppConstans.users,
      // headers: {
      // "Signature":
      // "QyEA01cGVLyzMpncNRqiH++m8Tf/ivtHwlbLrPGdXx/o7TsgU4ZGoFR4JvZYZ6M4a3zFyw5RM/ES64ZABweN8uXZxK8=",
      //   "User-Agent": "livefootballscore",
      // "Ts": "1713934795021",
      //   "Deviceid": "95be88d7-3907-467b-81e5-1e74f8c409e5",
      // },
      queryData: {
        "matchId": "4193892",
        "aId": "8650",
        "hId": "10252",
      },
    );
    // print("response.statusCode : ${response.statusCode} ");
    log("response :-- ${response.body} ");
    print("response.body : ${UserDataModel.fromJson(jsonDecode(response.body))} ");
    await ResponseHandler.checkResponseError(response);
    var res = jsonDecode(response.body)['md']['k'];
    return (res as List).map((e) => UserDataModel.fromJson(e)).toList();
  }
}
