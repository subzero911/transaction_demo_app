import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transactions_test_task/screens/transactions_list_screen.dart';
import 'package:transactions_test_task/stores/transactions.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Transactions(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.deepOrangeAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TransactionsListScreen(),
      ),
    );
  }
}