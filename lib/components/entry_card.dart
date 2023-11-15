import 'package:flutter/material.dart';
import 'package:tye1/database/database_helper.dart';
import 'package:tye1/database/entry_model.dart';
import 'package:path/path.dart';

class EntryCard extends StatelessWidget{
  final Entry entry;
  final Function onDelete;
EntryCard({required this.entry, required this.onDelete});

  final test = 0xefc9;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(entry.amount.toString()),
      subtitle: Text(entry.category.toString()+'   '+entry.createdAt.toString()),
      leading: Icon(Icons.ad_units),//TODO: leading:icon category
      trailing: IconButton(
        icon: Icon(IconData(test, fontFamily: 'MaterialIcons')),
        onPressed: () {
          DatabaseHelper.deleteEntry(entry);
          onDelete();
        },)
    );
  }
}