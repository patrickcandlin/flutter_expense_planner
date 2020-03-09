import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
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
  void _addTransction(String newTxTitle, double newTxAmount) {
    final newTx = Transaction(
      title: newTxTitle,
      amount: newTxAmount,
      id: DateTime.now().toString(),
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTrasaction(_addTransction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
