import 'package:expense_tracker_app/widgets/chart.dart';
import 'package:expense_tracker_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import './widgets/input_transaction.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(fontFamily: 'Quicksand', fontSize: 18, fontWeight: FontWeight.bold),
          ),
        appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(fontFamily: 'OpenSans', fontSize: 20, fontWeight: FontWeight.bold),
        ) ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _addNewTransaction(String txTitle, double txAmount)
  {
    final newTx = Transaction(title: txTitle, amount: txAmount, date: DateTime.now(), id: DateTime.now().toString());
  
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  final List<Transaction> _userTransactions = [];

  List<Transaction> get _recentTransactions
  {
    return _userTransactions.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }


  void _startAddNewTransaction(BuildContext ctx)
  {
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(
        onTap: () {},
        child: InputTransaction(_addNewTransaction),
        // behavior: HitTestBehavior.opaque,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions),
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
