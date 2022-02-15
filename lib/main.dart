import 'package:flutter/material.dart';
import 'package:max2_expence_tracker/transaction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<Transaction> transactions = Transaction.getList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter App"),
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              child: Text("Chart"),
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
          // ),
          Column(
            children: transactions.map((transaction) {
              return Card(
                child: Text(transaction.title as String),
              );
            }).toList(),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
