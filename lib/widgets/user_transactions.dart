// import 'package:flutter/material.dart';
// import '../models/transaction.dart';
// import 'transaction_list.dart';

// import 'new_transaction.dart';

// class UserTransactions extends StatefulWidget {
//   const UserTransactions({Key? key}) : super(key: key);

//   @override
//   _UserTransactionsState createState() => _UserTransactionsState();
// }

// class _UserTransactionsState extends State<UserTransactions> {
//   final List<Transaction> _transactionList = [
//     Transaction(
//       id: "t1",
//       title: "Soup",
//       amount: 200,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: "t1",
//       title: "Soup",
//       amount: 200,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: "t1",
//       title: "Soup",
//       amount: 200,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: "t1",
//       title: "Soup",
//       amount: 200,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: "t1",
//       title: "Soup",
//       amount: 200,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: "t1",
//       title: "Soup",
//       amount: 200,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: "t1",
//       title: "Soup",
//       amount: 200,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: "t1",
//       title: "Soup",
//       amount: 200,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: "t1",
//       title: "Soup",
//       amount: 200,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: "t1",
//       title: "Soup",
//       amount: 200,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: "t1",
//       title: "Soup",
//       amount: 200,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: "t1",
//       title: "Soup",
//       amount: 200,
//       date: DateTime.now(),
//     ),
//     Transaction(
//       id: "t1",
//       title: "Soup",
//       amount: 200,
//       date: DateTime.now(),
//     )
//   ];

//   void _addNewTransaction({required String title, required double amount}) {
//     final newTx = Transaction(
//         id: DateTime.now().toString(),
//         title: title,
//         amount: amount,
//         date: DateTime.now());
//     setState(() {
//       _transactionList.add(newTx);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         NewTransaction(addTx: _addNewTransaction),
//         TransactionList(_transactionList),
//       ],
//     );
//   }
// }
