import 'package:flutter/material.dart';
import 'package:max2_expence_tracker/widgets/new_transaction.dart';
import 'package:max2_expence_tracker/widgets/transaction_list.dart';
import './widgets/user_transactions.dart';
import 'models/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactionList = [
    Transaction(
      id: "t1",
      title: "Soup",
      amount: 200,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t1",
      title: "Soup",
      amount: 200,
      date: DateTime.now(),
    ),
    // Transaction(
    //   id: "t1",
    //   title: "Soup",
    //   amount: 200,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t1",
    //   title: "Soup",
    //   amount: 200,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t1",
    //   title: "Soup",
    //   amount: 200,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t1",
    //   title: "Soup",
    //   amount: 200,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t1",
    //   title: "Soup",
    //   amount: 200,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t1",
    //   title: "Soup",
    //   amount: 200,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t1",
    //   title: "Soup",
    //   amount: 200,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t1",
    //   title: "Soup",
    //   amount: 200,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t1",
    //   title: "Soup",
    //   amount: 200,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t1",
    //   title: "Soup",
    //   amount: 200,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: "t1",
    //   title: "Soup",
    //   amount: 200,
    //   date: DateTime.now(),
    // )
  ];

  void _addNewTransaction({required String title, required double amount}) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());
    setState(() {
      _transactionList.add(newTx);
    });
  }

  void _showAddModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return NewTransaction(addTx: _addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Personal Expenses"),
        actions: [
          IconButton(
              onPressed: () => _showAddModal(context), icon: Icon(Icons.add))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddModal(context),
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(
                child: Text("Chart!"),
                width: double.infinity,
              ),
              elevation: 5,
            ),
            // Container(
            //   width: double.infinity,
            //   child: Card(
            //     elevation: 5,
            //     child: Text('List of Tx'),
            //   ),
            // ),'
            // UserTransactions()
            TransactionList(_transactionList)
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
