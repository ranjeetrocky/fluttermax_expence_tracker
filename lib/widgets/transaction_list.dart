import 'package:flutter/material.dart';
import 'transaction_list_item.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactionList;
  final Function deleteTransactionFunction;
  const TransactionList(this._transactionList,
      {Key? key, required this.deleteTransactionFunction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print("build() TransactionList");
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
                return TransactionListItem(
                    transaction: _transactionList[index],
                    mq: mq,
                    deleteTransactionFunction: () =>
                        deleteTransactionFunction(index));
              },
            ),
    );
  }
}
