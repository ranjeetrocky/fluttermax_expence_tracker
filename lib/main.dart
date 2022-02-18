import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max2_expence_tracker/widgets/chart.dart';
import 'package:max2_expence_tracker/widgets/new_transaction.dart';
import 'package:max2_expence_tracker/widgets/transaction_list.dart';
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
        fontFamily: 'QuickSand',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: Colors.transparent),
          titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20.0,
              fontWeight: FontWeight.bold),
        ),
        // fontFamily: 'OpenSans',
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

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
  ];
  List<Transaction> get _recentTxs {
    return _transactionList.where((tx) {
      return tx.date?.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      ) as bool;
    }).toList();
  }

  void _addNewTransaction(
      {required String title,
      required double amount,
      required DateTime chosenDate}) {
    final newTx = Transaction(
        id: chosenDate.toString(),
        title: title,
        amount: amount,
        date: chosenDate);
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
        title: const Text(
          "Personal Expenses",
          // style: TextStyle(fontFamily: "OpenSans"),
        ),
        actions: [
          IconButton(
              onPressed: () => _showAddModal(context),
              icon: const Icon(Icons.add))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddModal(context),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Card(
            //   child: Container(
            //     child: const Text("Chart!"),
            //     width: double.infinity,
            //   ),
            //   elevation: 5,
            // ),
            Chart(
              recentTransactions: _recentTxs,
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
