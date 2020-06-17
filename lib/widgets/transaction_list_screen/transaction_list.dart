import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transactions_test_task/screens/transaction_details.dart';
import 'package:transactions_test_task/stores/transactions.dart';
import 'package:transactions_test_task/widgets/transaction_list_screen/transaction_list_tile.dart';

class TransactionList extends StatelessWidget {
  String _formatTxType(String type) {
    switch (type) {
      case 'replenishment':
        return 'Пополнение';
      case 'transfer':
        return 'Перевод';
      case 'withdrawal':
        return 'Снятие';
      default:
        return 'Неизвестно';
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<Transactions>();

    if (store.transactions.length <= 0)
      return Center(child: const Text('Вы еще не провели ни одной транзакции'));
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: store.transactions.length,
      separatorBuilder: (ctx, i) => Divider(),
      itemBuilder: (ctx, i) => OpenContainer(
        closedBuilder: (ctx, openContainer) => TransactionListTile(
          key: ValueKey(store.transactions[i].id),
          index: i,
          txModel: store.transactions[i],
          onTap: openContainer,
          formatType: _formatTxType,
        ),
        openBuilder: (ctx, closeContainer) => TransactionDetails(
          id: store.transactions[i].id,
          index: i,
          formatType: _formatTxType,
        ),
      ),
    );
  }
}
