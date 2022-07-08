import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _SubmitData() {
    if (_amountController.text.isEmpty) {
      return;
    }
    final enterTitle = titleController.text;
    final enterAmount = double.parse(_amountController.text);

    if (enterTitle.isEmpty || enterAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      enterTitle,
      enterAmount,
      _selectedDate,
    );

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Color.fromRGBO(9, 12, 155, 100), // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: Color.fromRGBO(9, 12, 155, 50), // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Color.fromRGBO(48, 102, 190, 50), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then(
      (pickedDate) {
        if (pickedDate == null) {
          return;
        }
        setState(() {
          _selectedDate = pickedDate;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: Color.fromRGBO(245, 255, 241, 25),
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(9, 12, 155, 100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(9, 12, 155, 100), width: 2.0),
                  ),
                ),
                controller: titleController,
                onSubmitted: (_) => _SubmitData(),
                // onChanged: (value) {
                //   titleInput = value;
                // },
              ),
              SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                  labelStyle: TextStyle(
                    color: Color.fromRGBO(9, 12, 155, 100),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(9, 12, 155, 100), width: 2.0),
                  ),
                ),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _SubmitData(),
                // onChanged: (value) => amountInput = value,
              ),
              Container(
                height: 80,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No date chosen!'
                            : 'Date:  ${DateFormat.yMMMd().format(_selectedDate!)}',
                      ),
                    ),
                    TextButton(
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(
                          color: Color.fromRGBO(9, 12, 155, 100),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => _SubmitData,
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(9, 12, 155, 100),
                  shadowColor: Color.fromRGBO(48, 102, 190, 12),
                  onPrimary: Colors.white,
                  onSurface: Colors.grey,
                  elevation: 4,
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  'Add Transaction',
                  style:
                      TextStyle(fontSize: 16, fontFamily: 'Quicksand-Regular'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
