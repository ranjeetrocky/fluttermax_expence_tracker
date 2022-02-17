import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactionList;
  TransactionList(this._transactionList);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: _transactionList.length,
        itemBuilder: (context, index) {
          print(index);
          return Card(
            elevation: 5,
            child: ListTile(
              leading: Text(
                '₹ ${_transactionList[index].amount?.toStringAsFixed(2)}',
              ),
              title: Text(_transactionList[index].title as String),
              subtitle: Text(DateFormat('dd MMM, yyyy')
                  .format(_transactionList[index].date as DateTime)),
              // subtitle: Text(transaction.date.toString().split(" ")[0]),
            ),
          );
        },
        // children: _transactionList.map((transaction) {
        //   return Card(
        //     elevation: 5,
        //     child: ListTile(
        //       leading: Text(
        //         "₹ " + transaction.amount.toString(),
        //       ),
        //       title: Text(transaction.title as String),
        //       subtitle: Text(DateFormat('dd MMM, yyyy')
        //           .format(transaction.date as DateTime)),
        //       // subtitle: Text(transaction.date.toString().split(" ")[0]),
        //     ),
        //   );
        // }).toList(),
      ),
    );
  }
}
