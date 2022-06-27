import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  NewTransaction(this.addTx);

  void SubmitData() {
    final enterTitle = titleController.text;
    final enterAmount = double.parse(amountController.text);

    if (enterTitle.isEmpty || enterAmount <= 0) {
      return;
    }
    addTx(
      enterTitle,
      enterAmount,
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
                onSubmitted: (_) => SubmitData(),
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
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => SubmitData(),
                // onChanged: (value) => amountInput = value,
              ),
              TextButton(
                onPressed: () => SubmitData,
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  // Text Color
                ),
                child: Text(
                  'Add transaction',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
