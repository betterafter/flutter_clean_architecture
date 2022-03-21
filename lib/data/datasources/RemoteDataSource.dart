import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class RemoteDatasource {
  var dio = Dio();

  Future<String> getUser();
}