import 'package:dio/dio.dart';
import 'dio_client.dart';

getData() async {
  final dio = DioClient.instance;
  try {
    final Response response =
        await dio.get("/get/ceUmaqsbIi?indent=2");
    return response;
  } catch (e) {
    print('Dio request error:' + e.toString());
  }
}