import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioClient {
  static final DioClient _singleton = DioClient._internal();
  final Dio dio = Dio();

  DioClient._internal() {
    dio.options.baseUrl = "http://www.json-generator.com/api/json";
    (dio.transformer as DefaultTransformer).jsonDecodeCallback = _parseJson;
  }

  factory DioClient.instance() {
    return _singleton;
  }
}

_parseAndDecode(String response) {
  return jsonDecode(response);
}

_parseJson(String text) {
  return compute(_parseAndDecode, text);
}

// public API:

getData() async {
  final dio = DioClient.instance().dio;
  try {
    final Response response =
        await dio.get("/get/ceUmaqsbIi?indent=2");
    return response;
  } catch (e) {
    print('Dio request error:' + e.toString());
  }
}
