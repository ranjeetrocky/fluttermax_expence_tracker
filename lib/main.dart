import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/chart.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'models/transaction.dart';
import 'package:animations/animations.dart';

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
        platform: TargetPlatform.iOS,
        cardTheme: const CardTheme().copyWith(elevation: 20),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline5: const TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
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
  bool _showChart = false;
  final List<Transaction> _transactionList = List.generate(
    5,
    (index) {
      return Transaction(
        id: index.toString(),
        title: "Soup",
        amount: 200,
        date: DateTime.now(),
      );
    },
  );
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

  void _deleteTransaction(int index) {
    setState(() {
      _transactionList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build() Homepage");
    var isIOS = Platform.isIOS;
    final mq = MediaQuery.of(context);
    final isLandscape = mq.orientation == Orientation.landscape;
    final appBar = AppBar(
      title: const Text(
        "Personal Expenses",
        // style: TextStyle(fontFamily: "OpenSans"),
      ),
      actions: [
        IconButton(
            onPressed: () => _showAddModal(context),
            icon: const Icon(Icons.add))
      ],
    );
    final txListWidget = SizedBox(
      height: (mq.size.height - mq.padding.top - appBar.preferredSize.height) *
          (isLandscape ? 0.8 : 0.7),
      child: TransactionList(
        _transactionList,
        deleteTransactionFunction: _deleteTransaction,
      ),
    );
    final chartWidget = SizedBox(
      height: (mq.size.height - mq.padding.top - appBar.preferredSize.height) *
          (isLandscape ? 0.8 : 0.3),
      child: Chart(
        recentTransactions: _recentTxs,
      ),
    );
    final body = SingleChildScrollView(
      child: Column(
        children: [
          if (isLandscape)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Show Chart",
                  style: CupertinoThemeData().textTheme.textStyle,
                ),
                Switch.adaptive(
                    value: _showChart,
                    onChanged: (newVal) {
                      setState(() {
                        _showChart = newVal;
                      });
                    }),
              ],
            ),
          if (!isLandscape) ...[chartWidget, txListWidget],
          if (isLandscape)
            PageTransitionSwitcher(
                reverse: !_showChart,
                transitionBuilder:
                    (child, primaryAnimation, secondaryAnimation) {
                  return SharedAxisTransition(
                    animation: primaryAnimation,
                    secondaryAnimation: secondaryAnimation,
                    transitionType: SharedAxisTransitionType.horizontal,
                    child: child,
                  );
                },
                child: _showChart ? chartWidget : txListWidget),
        ],
      ),
    );
    return isIOS
        ? CupertinoPageScaffold(
            child: SafeArea(child: body),
            navigationBar: CupertinoNavigationBar(
              middle: const Text("Personal Expenses"),
              trailing: GestureDetector(
                child: const Icon(Icons.add),
                onTap: () => _showAddModal(context),
              ),
            ),
          )
        : Scaffold(
            appBar: appBar,
            floatingActionButton: isIOS
                ? null
                : FloatingActionButton(
                    onPressed: () => _showAddModal(context),
                    child: const Icon(Icons.add),
                  ),
            body:
                body, // This trailing comma makes auto-formatting nicer for build methods.
          );
  }
}
