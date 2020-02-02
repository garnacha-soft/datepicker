import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('DatePicker'),),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(_dateTime != null ? DateFormat.yMd().format(_dateTime) : 'No has seleccionado fecha'),
            RaisedButton(
              child: Text('Seleccionar'),
              onPressed: () => (
                showDatePicker(
                  context: context,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2021),
                  initialDate: (_dateTime != null) ? _dateTime : DateTime.now()
                ).then((date) {
                  setState(() {
                    _dateTime = date;
                  });
                })
              ),
            ),
          ],
        ),
      ),
    );
  }
}