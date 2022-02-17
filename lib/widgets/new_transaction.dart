import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction({Key? key, required this.addTx}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // String? titleInput, amountInput;
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    if (titleController.text.isEmpty ||
        double.parse(amountController.text) <= 0) {
      return;
    }
    widget.addTx(
      title: titleController.text,
      amount: double.parse(amountController.text),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              autofocus: true,
              onSubmitted: (_) => submitData(),
              // onChanged: (value) {
              //   // print(value);
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
              // onChanged: (value) {
              //   // print(value);
              //   amountInput = value;
              // },
            ),
            TextButton(
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.purple),
                  shadowColor: MaterialStateProperty.all(Colors.purple)),
              child: Text('Add Transaction'),
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
