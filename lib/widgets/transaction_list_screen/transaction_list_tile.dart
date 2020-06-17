import 'package:flutter/material.dart';
import 'package:transactions_test_task/models/transaction.dart';

class TransactionListTile extends StatelessWidget {
  final Transaction txModel;
  final int index;
  final VoidCallback onTap;
  final String Function(String) formatType;

  const TransactionListTile({Key key, this.index, this.txModel, this.onTap, this.formatType})
      : super(key: key);

  IconData _getListItemIcon(String type) {
    switch (type) {
      case 'replenishment':
        return Icons.input;
      case 'transfer':
        return Icons.swap_horiz;
      case 'withdrawal':
        return Icons.archive;
      default:
        return Icons.error_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(child: Text('#$index')),
      title: Text(formatType(txModel.txType)),
      subtitle: Text(txModel.amount.toString() + ' ₽'),
      trailing: Icon(_getListItemIcon(txModel.txType),
          color: Theme.of(context).accentColor),
    );
  }
}
