import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;

  TransactionList(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: _transactions.isEmpty ? Column(
        children: <Widget>[
          Text('No transactions added yet', style: Theme.of(context).textTheme.title),
          SizedBox(height: 15,),
          Container(
            height: 150,    // This height is set accordingly or else app fails 
            child: 
            Image.asset('assets/images/waiting.png',
            fit: BoxFit.cover))
        ],
      ) : 
      ListView.builder(
        itemCount: _transactions.length,
        itemBuilder: (ctx, index) {
          print(index);
          return Card(
              child: Row(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor, width: 2),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(
                    '₹${_transactions[index].amount.toStringAsFixed(2)}',
                    style: TextStyle(color: Theme.of(context).primaryColor, fontFamily: 'Quicksand', fontSize: 18, fontWeight: FontWeight.bold)
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _transactions[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  Text(
                    DateFormat().add_yMMMd().format(_transactions[index].date),
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ],
          ));
        },
      ),
    );
  }
}
