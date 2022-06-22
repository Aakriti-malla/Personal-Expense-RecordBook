import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

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
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Book',
      amount: 300,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Skincare',
      amount: 500,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(9, 12, 155, 100),
        title: Text('Plan Book'),
      ),
      body: Column(
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
          Container(
            margin: EdgeInsets.all(10),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
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
                              color: Color.fromRGBO(9, 12, 155, 100),
                              width: 2.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Desciption',
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(9, 12, 155, 100),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(9, 12, 155, 100),
                              width: 2.0),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
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
          ),
          Column(
            children: transactions.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(48, 102, 190, 100),
                            Color.fromRGBO(180, 197, 228, 100),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 9,
                            offset: const Offset(0, 7),
                          )
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.all(20),
                      child: Text(
                        '\u{20B9} ${tx.amount}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat.yMMMMEEEEd().format(tx.date),
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
