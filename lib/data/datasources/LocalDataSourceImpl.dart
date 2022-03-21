import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:untitled/data/datasources/LocalDataSource.dart';
import 'package:untitled/data/models/UserModel.dart';

class LocalDataSourceImpl extends LocalDataSource {
  @override
  Future<UserModel> getUser(String id, String pwd) async {
    var response = await rootBundle.loadString('jsons/user.json');
    return compute(parseUser, response);
  }
}

UserModel parseUser(String responseBody) {
  final parsed = json.decode(responseBody);
  return UserModel.fromJson(parsed);
}
