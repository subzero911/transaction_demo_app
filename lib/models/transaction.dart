import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final double amount;
  final double commission;
  final double total;
  final DateTime date;
  final String txType;

  Transaction({@required this.id, this.amount, this.commission = 5, this.date, this.txType})
      : total = amount - (amount * commission * 0.01);  

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['_id'] as String,
      amount: json['amount'] as double,
      date: DateTime.parse(json['date']),   
      txType: json['transaction_type'] as String,
    );    
  }  
}
