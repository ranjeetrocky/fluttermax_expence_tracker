import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  String? titleInput, amountInput;
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
          Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: "Title"),
                    onChanged: (value) {
                      // print(value);
                      titleInput = value;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Amount"),
                    onChanged: (value) {
                      // print(value);
                      amountInput = value;
                    },
                  ),
                  TextButton(
                    style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.purple),
                        shadowColor: MaterialStateProperty.all(Colors.purple)),
                    child: Text('Add Transaction'),
                    onPressed: () {
                      print(titleInput);
                      print(amountInput);
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: transactions.map((transaction) {
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: Text(
                        "₹ " + transaction.amount.toString(),
                      ),
                      title: Text(transaction.title as String),
                      subtitle: Text(DateFormat('dd MMM, yyyy')
                          .format(transaction.date as DateTime)),
                      // subtitle: Text(transaction.date.toString().split(" ")[0]),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
