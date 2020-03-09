import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'fish',
      amount: 200.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'apple',
      amount: 2.00,
      date: DateTime.now(),
    ),
  ];
class _UserTransactionsState extends State<UserTransactions> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTrasaction(),
        TransactionList(_userTransactions),
      ],
    );
  }
}
