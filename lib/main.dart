import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './Widgets/user_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlanBook',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  // String? titleInput;
  // String? amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(9, 12, 155, 100),
        title: Text('Plan Book'),
        actions: <Widget>[
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.add,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.teal[200],
                child: Container(
                  width: double.infinity,
                  child: Text('Chart'),
                ),
                elevation: 5,
              ),
            ),
            UserTransactions()
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(9, 12, 155, 100),
        child: Icon(
          Icons.add_circle,
        ),
        onPressed: () {},
      ),
    );
  }
}
