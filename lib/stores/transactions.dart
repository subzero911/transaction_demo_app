import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:transactions_test_task/services/dio_client.dart' as dio;
import 'package:transactions_test_task/models/transaction.dart';

class Transactions with ChangeNotifier {
  List<Transaction> _transactions = [];

  List<Transaction> get transactions => List.of(_transactions);

  Transaction findById(String id) {
    return _transactions.firstWhere((tr) => tr.id == id);
  }

  Future<void> fetchTransactions() async {
    final Response response = await dio.getData();
    final data = response.data;
    if (data == null) {
      print('null response');
      return;
    }
    _transactions = data
        .map<Transaction>((jsonObject) => Transaction.fromJson(jsonObject))
        .toList();

    notifyListeners();
  }
}
