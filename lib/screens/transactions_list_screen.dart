import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transactions_test_task/stores/transactions.dart';
import 'package:transactions_test_task/widgets/transaction_list_screen/transaction_list.dart';

class TransactionsListScreen extends StatefulWidget {
  @override
  _TransactionsListScreenState createState() => _TransactionsListScreenState();
}

class _TransactionsListScreenState extends State<TransactionsListScreen> {
  Future<void> fetchTxCall;

  @override
  void initState() {
    super.initState();
    fetchTxCall = context.read<Transactions>().fetchTransactions();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Consumer<Transactions>(
          builder: (ctx, store, child) => Text(
              '${store.transactions.length} транзакций'),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: fetchTxCall,
          builder: (ctx, snapshot) {            
            if (snapshot.connectionState == ConnectionState.waiting)
              return Center(child: CircularProgressIndicator());
            if (snapshot.hasError) return Center(child: Text('Что-то пошло не так...'));
            return TransactionList();            
          }),
    );
  }
}
