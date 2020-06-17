import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transactions_test_task/stores/transactions.dart';
import 'package:intl/intl.dart' as intl;

class TransactionDetails extends StatelessWidget {
  final String id;
  final int index;
  final String Function(String) formatType;

  const TransactionDetails({this.id, this.index, this.formatType});

  @override
  Widget build(BuildContext context) {
    final tx = Provider.of<Transactions>(context, listen: false).findById(id);    
    final date = intl.DateFormat.yMMMd().format(tx.date);

    return Scaffold(
      appBar: AppBar(
        title: Text('Транзакция №$index'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,        
          children: <Widget>[
            Text('Дата: $date', style: Theme.of(context).textTheme.headline6,),
            Text('Сумма: ${tx.amount} ₽', style: Theme.of(context).textTheme.headline6,),
            Text('Комиссия: ${tx.commission} %', style: Theme.of(context).textTheme.headline6,),
            Text('Итого: ${tx.total.toStringAsFixed(2)} ₽', style: Theme.of(context).textTheme.headline6,),
            Text('Тип операции: ${formatType(tx.txType)}', style: Theme.of(context).textTheme.headline6,),            
          ],        
        ),
      ),
    );
  }
}