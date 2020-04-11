import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:flutter_expense_planner/models/transaction.dart';
import './chart_bar.dart';

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
      double totalSum = 0;

      for (var i = 0; i < resentTransactions.length; i++) {
        if (resentTransactions[i].date.day == weekDay.day &&
            resentTransactions[i].date.month == weekDay.month &&
            resentTransactions[i].date.year == weekDay.year) {
          totalSum += resentTransactions[i].amount;
        }
      }
      return {
        'DAY': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTrasactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTrasactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: groupedTrasactionValues.map((Map<String, Object> data) {
          return Flexible(
            fit: FlexFit.tight,
                      child: ChartBar(
              data['DAY'],
              data['amount'],
              totalSpending == 0.0 ? 0 : (data['amount'] as double) / totalSpending,
            ),
          );
        }).toList(),
      ),
    );
  }
}
