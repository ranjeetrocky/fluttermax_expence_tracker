import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  const NewTransaction({Key? key, required this.addTx}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // String? titleInput, amountInput;
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitData() {
    if (_titleController.text.isEmpty ||
        double.parse(_amountController.text) <= 0 ||
        _selectedDate == null) {
      return;
    }
    widget.addTx(
        title: _titleController.text,
        amount: double.parse(_amountController.text),
        chosenDate: _selectedDate);
    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      } else {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
  }

  final focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    var isIOS = Platform.isIOS;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: "Title"),
              controller: _titleController,
              onSubmitted: (_) => FocusScope.of(context).requestFocus(focus),

              // onChanged: (value) {
              //   // print(value);
              //   titleInput = value;
              // },
            ),
            TextField(
              decoration: const InputDecoration(labelText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
              focusNode: focus,
              // onChanged: (value) {
              //   // print(value);
              //   amountInput = value;
              // },
            ),
            Row(
              children: [
                Expanded(
                  child: Text(_selectedDate == null
                      ? 'No Date Chosen!'
                      : 'Picked Date : ${DateFormat('dd/MM/yyyy').format(_selectedDate as DateTime)}'),
                ),
                isIOS
                    ? CupertinoButton(
                        onPressed: _showDatePicker,
                        child: const Text(
                          'Choose Date',
                        ),
                      )
                    : TextButton(
                        onPressed: _showDatePicker,
                        child: const Text(
                          'Choose Date',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
              ],
            ),
            ElevatedButton(
              child: const Text('Add Transaction'),
              onPressed: _submitData,
            )
          ],
        ),
      ),
    );
  }
}
