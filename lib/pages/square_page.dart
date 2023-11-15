import 'package:flutter/material.dart';
import 'package:tye1/components/entry_card.dart';
import 'package:tye1/database/database_helper.dart';
import 'package:tye1/database/entry_model.dart';

class SquarePage extends StatefulWidget {
  const SquarePage({super.key});

  @override
  State<SquarePage> createState() => _SquarePageState();
}

class _SquarePageState extends State<SquarePage> {
void updateState()
{
  setState(() {});
}

  @override
  Widget build(BuildContext context) {
    print("im in square");
    return Scaffold(
      body: FutureBuilder<List<Entry>?>(
          future: DatabaseHelper.getAllEntries(),
          builder: (BuildContext context, AsyncSnapshot<List<Entry>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.hasError.toString()));
            } else if (snapshot.hasData) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) => EntryCard(entry: snapshot.data![index], onDelete: updateState)
                );
              }
            }
            return Text("db empty");
          }),
    );
  }
}

/*class _SquarePageState extends State<SquarePage> {
  @override
  Widget build(BuildContext context) {
    print("im in square");
    return Scaffold(
      body: FutureBuilder<List<Entry>?>(
          future: DatabaseHelper.getAllEntries(),
          builder: (context, AsyncSnapshot<List<Entry>?> snapshot) {
            print("im in square");
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.hasError.toString()));
            } else if (snapshot.hasData) {
              if (snapshot.data != null) {
                return ListView.builder(
                  itemBuilder: (context, index) => Container(
                    child: Text("KURWA"),
                  ),
                );
              }
            }
            return Container();
          }),
    );
  }
}
*/