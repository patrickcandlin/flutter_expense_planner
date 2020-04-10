import 'package:flutter/material.dart';

class NewTrasaction extends StatefulWidget {
  final Function addTransaction;
  
  NewTrasaction(this.addTransaction);

  @override
  _NewTrasactionState createState() => _NewTrasactionState();
}

class _NewTrasactionState extends State<NewTrasaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredText = titleController.text;
    final enteredAmout = double.parse(amountController.text);
    if (enteredText.isEmpty || enteredAmout <= 0) {
      return;
    }
    
    widget.addTransaction(
      enteredText,
      enteredAmout,
    );
    Navigator.of(context).pop();
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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
              ),
          ],
        ),
      ),
    );
  }
}
