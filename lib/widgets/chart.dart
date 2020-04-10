import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:flutter_expense_planner/models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> resentTransactions;

  Chart(this.resentTransactions);

  List<Map<String, Object>> get groupedTrasactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(
          days: index,
        ),
      );
      double totalSum;

      for (var i = 0; i < resentTransactions.length; i++) {
        if (resentTransactions[i].date.day == weekDay.day && resentTransactions[i].date.month == weekDay.month && resentTransactions[i].date.year == weekDay.year){
          totalSum += resentTransactions[i].amount;
        }
      }
      return {'DAY': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[],
      ),
    );
  }
}
