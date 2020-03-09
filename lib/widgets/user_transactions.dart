import 'package:flutter/material.dart';
import './new_transaction.dart';
import './user_transactions.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      NewTrasaction(),
      TransactionList(),
    );
  }
}
