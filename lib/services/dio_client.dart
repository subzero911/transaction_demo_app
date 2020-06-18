import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@sealed
class DioClient {
  static final DioClient _singleton = DioClient._internal();
  final Dio dio = Dio();

  DioClient._internal() {
    dio.options.baseUrl = "http://www.json-generator.com/api/json";
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;
  }

  static Dio get instance => _singleton.dio;
}

_parseAndDecode(String response) {
  return jsonDecode(response);
}

_parseJson(String text) {
  return compute(_parseAndDecode, text);
}
