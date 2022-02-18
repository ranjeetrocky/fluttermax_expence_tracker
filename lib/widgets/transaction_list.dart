import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactionList;
  final Function deleteTransactionFunction;
  const TransactionList(this._transactionList,
      {Key? key, required this.deleteTransactionFunction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    // print(MediaQuery.of(context).size.width);
    return SizedBox(
      height: mq.size.height * 0.6,
      child: _transactionList.isEmpty
          ? Column(
              children: [
                Text("No Transactions added yet!",
                    style: Theme.of(context).textTheme.headline5),
                const SizedBox(height: 30),
                Expanded(child: Image.asset("assets/images/waiting.png"))
              ],
            )
          : ListView.builder(
              itemCount: _transactionList.length,
              itemBuilder: (context, index) {
                // print(index);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Card(
                    child: ListTile(
                      title: Text(_transactionList[index].title?.toUpperCase()
                          as String),
                      subtitle: Text(DateFormat('dd MMM, yyyy')
                          .format(_transactionList[index].date as DateTime)),
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              '\$ ${_transactionList[index].amount?.toStringAsFixed(2)}',
                              // '₹ ${_transactionList[index].amount?.toStringAsFixed(2)}',
                              // style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                      ),
                      trailing: mq.size.width > 440
                          ? TextButton.icon(
                              onPressed: () => deleteTransactionFunction(index),
                              style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(
                                      Theme.of(context)
                                          .errorColor
                                          .withAlpha(100)),
                                  foregroundColor: MaterialStateProperty.all(
                                      Theme.of(context).errorColor)),
                              icon: const Icon(Icons.delete_outline_rounded),
                              label: const Text("Delete"))
                          : IconButton(
                              onPressed: () => deleteTransactionFunction(index),
                              icon: const Icon(Icons.delete_outline_rounded),
                              color: Theme.of(context).errorColor,
                            ),
                      // subtitle: Text(transaction.date.toString().split(" ")[0]),
                    ),
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
