import 'package:flutter/material.dart';
import './transaction.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'New shoes', amount: 4300.44, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Grocery', amount: 250.41, date: DateTime.now()),
  ];

  final titleController = new TextEditingController();
  final amountController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                elevation: 10,
                child: Text('CHART'),
              ),
            ),
            Card(
                child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(decoration: InputDecoration(labelText: 'Title'), controller: titleController,),
                  TextField(decoration: InputDecoration(labelText: 'Amount'), controller: amountController,),
                  FlatButton(child: Text('Add transaction'), onPressed: (){ }, color: Colors.purple,)
                ],
              ),
            )),
            Column(
                children: transactions.map((tx) {
              return Card(
                  child: Row(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.purple, width: 2),
                      ),
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Text(
                        '₹${tx.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        tx.title,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat().add_yMMMd().format(tx.date),
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ));
            }).toList()),
          ],
        ));
  }
}
