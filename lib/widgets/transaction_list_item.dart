import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionListItem extends StatefulWidget {
  const TransactionListItem({
    Key? key,
    required Transaction transaction,
    required this.mq,
    required this.deleteTransactionFunction,
  })  : _transaction = transaction,
        super(key: key);

  final Transaction _transaction;
  final MediaQueryData mq;
  final Function deleteTransactionFunction;

  @override
  State<TransactionListItem> createState() => _TransactionListItemState();
}

class _TransactionListItemState extends State<TransactionListItem> {
  Color? _bgColor;
  @override
  void initState() {
    super.initState();
    const availableColors = [
      Colors.blue,
      Colors.purple,
      Colors.orange,
      Colors.pink,
      Colors.black,
    ];
    _bgColor = availableColors[Random().nextInt(5)];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: ListTile(
          title: Text(widget._transaction.title?.toUpperCase() as String),
          subtitle: Text(DateFormat('dd MMM, yyyy')
              .format(widget._transaction.date as DateTime)),
          leading: CircleAvatar(
            backgroundColor: _bgColor,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                child: Text(
                  '\$ ${widget._transaction.amount?.toStringAsFixed(2)}',
                  // '₹ ${_transactionList.amount?.toStringAsFixed(2)}',
                  // style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ),
          ),
          trailing: widget.mq.size.width > 440
              ? TextButton.icon(
                  onPressed: () => widget.deleteTransactionFunction(),
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                          Theme.of(context).errorColor.withAlpha(100)),
                      foregroundColor: MaterialStateProperty.all(
                          Theme.of(context).errorColor)),
                  icon: const Icon(Icons.delete_outline_rounded),
                  label: const Text("Delete"))
              : IconButton(
                  onPressed: () => widget.deleteTransactionFunction(),
                  icon: const Icon(Icons.delete_outline_rounded),
                  color: Theme.of(context).errorColor,
                ),
          // subtitle: Text(transaction.date.toString().split(" ")[0]),
        ),
      ),
    );
  }
}
