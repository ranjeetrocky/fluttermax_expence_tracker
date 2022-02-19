import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({
    Key? key,
    required this.lable,
    required this.spendingAmount,
    required this.spendingPctOfTotal,
  }) : super(key: key);
  final String lable;
  final double spendingAmount, spendingPctOfTotal;

  @override
  Widget build(BuildContext context) {
    print("build() ChartBar");
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            SizedBox(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                    child: Text('\$ ${spendingAmount.toStringAsFixed(0)}'))),
            // Text('₹ ${spendingAmount.toStringAsFixed(0)}'),
            SizedBox(height: constraints.maxHeight * 0.05),
            SizedBox(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      color: const Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            SizedBox(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(child: Text(lable)))
          ],
        );
      },
    );
  }
}
