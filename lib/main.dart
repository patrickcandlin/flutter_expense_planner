import 'package:flutter/material.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        errorColor: Colors.red,
        fontFamily: 'NotoSans',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'PublicSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              button: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: "PublicSans",
                ),
              ),
        ),
      ),
      home: ExpenseAppHome(),
    );
  }
}

class ExpenseAppHome extends StatefulWidget {
  @override
  _ExpenseAppHomeState createState() => _ExpenseAppHomeState();
}

class _ExpenseAppHomeState extends State<ExpenseAppHome> {
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
    Transaction(
      id: 't1',
      title: 'apple',
      amount: 2.00,
      date: DateTime.now(),
    ),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addTransction(String newTxTitle, double newTxAmount, DateTime selectedDate) {
    final newTx = Transaction(
      title: newTxTitle,
      amount: newTxAmount,
      id: DateTime.now().toString(),
      date: selectedDate,
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTrasaction(_addTransction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

void _deleteTrasaction(String id){
  setState(() {
    _userTransactions.removeWhere((trx) => trx.id == id);
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions, _deleteTrasaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
