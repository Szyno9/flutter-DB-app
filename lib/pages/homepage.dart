import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tye1/database/database_helper.dart';
import 'package:tye1/database/entry_model.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.red,
      alignment:Alignment.center,
      child: ElevatedButton(
        child: const Text("Test Bazy"),
        onPressed: () {
          final Entry model = Entry(amount: 15.51, category: 'test1');
          DatabaseHelper.addEntry(model);
        }),
    );
  }

}