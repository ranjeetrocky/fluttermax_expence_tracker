import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  NewTransaction({Key? key, required this.addTx}) : super(key: key);

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
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            decoration: InputDecoration(labelText: "Title"),
            controller: _titleController,
            onSubmitted: (_) => FocusScope.of(context).requestFocus(focus),

            // onChanged: (value) {
            //   // print(value);
            //   titleInput = value;
            // },
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
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
              TextButton(
                onPressed: _showDatePicker,
                child: const Text(
                  'Choose Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          ElevatedButton(
            child: Text('Add Transaction'),
            onPressed: _submitData,
          )
        ],
      ),
    );
  }
}
