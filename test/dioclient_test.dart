import 'package:flutter_test/flutter_test.dart';
import 'package:transactions_test_task/services/dio_client.dart';

void main() {
  test ('Dio instance should not be null', () {
    final dio = DioClient.instance;
    expect(dio, isNotNull);
  });
}