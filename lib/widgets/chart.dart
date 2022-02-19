import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:max2_expence_tracker/models/transaction.dart';
import 'package:max2_expence_tracker/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  Chart({Key? key, required this.recentTransactions}) : super(key: key) {
    print("Constructor Chart");
  }
  final List<Transaction> recentTransactions;
  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(Duration(days: index));
        double totalSum = 0.0;
        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date?.day == weekDay.day &&
              recentTransactions[i].date?.month == weekDay.month &&
              recentTransactions[i].date?.year == weekDay.year) {
            totalSum += recentTransactions[i].amount as double;
          }
        }
        // print(DateFormat.E().format(weekDay));
        // print(totalSum);
        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          "amount": totalSum
        };
      },
    ).reversed.toList();
  }

  double get maxSpending {
    return groupedTransactionValues.fold(0.0,
        (previousValue, data) => previousValue += data['amount'] as double);
  }

  @override
  Widget build(BuildContext context) {
    // print(groupedTransactionValues);
    print("build() Chart");
    return Padding(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Card(
        // margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: groupedTransactionValues.map((data) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                    lable: data['day'] as String,
                    spendingAmount: data['amount'] as double,
                    spendingPctOfTotal: maxSpending == 0.0
                        ? 0.0
                        : (data['amount'] as double) / maxSpending),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
