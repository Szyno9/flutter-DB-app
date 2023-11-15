import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tye1/database/category_model.dart';
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
          final Entry model = Entry(amount: 15.51, category: 'test1', createdAt: DateFormat("dd-MM-yyyy hh:mm:ss").format(DateTime.now()).toString());
          final CategoryModel categoryModel = CategoryModel(name: 'Spożywcze', iconData: 0xefc9, color: 0x0099cc);
          DatabaseHelper.addEntry(model);
          DatabaseHelper.addCategory(categoryModel);
        }),
    );
  }

}