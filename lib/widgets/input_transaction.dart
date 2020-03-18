import 'package:flutter/material.dart';

class InputTransaction extends StatefulWidget {
  final Function addTx;

  InputTransaction(this.addTx);

  @override
  _InputTransactionState createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0)
    {
      return;
    }
      widget.addTx(
        enteredTitle,
        enteredAmount,
      );

      Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) {
              //   titleInput = val;
              // },
            ),
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Theme.of(context).primaryColorDark,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
