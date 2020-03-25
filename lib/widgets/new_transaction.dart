import 'package:flutter/material.dart';

class NewTrasaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function addTransaction;
  NewTrasaction(this.addTransaction);
  void submitData() {
    final enteredText = titleController.text;
    final enteredAmout = double.parse(amountController.text);
    if (enteredText.isEmpty || enteredAmout <= 0) {
      return;
    }
    addTransaction(
      enteredText,
      enteredAmout,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () => addTransaction(
                titleController.text,
                double.parse(amountController.text),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
