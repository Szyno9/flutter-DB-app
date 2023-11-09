import 'package:flutter/material.dart';
import 'package:tye1/database/database_helper.dart';
import 'package:tye1/database/entry_model.dart';
import 'package:tye1/pages/square_page.dart';
import 'pages/homepage.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        primaryColor: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal.shade600,
        ),
        useMaterial3: true,
      ),
      home: const PageWrapper(title: 'Flutter Demo Home Page'),
    );
  }
}

class PageWrapper extends StatefulWidget {
  const PageWrapper({super.key, required this.title});

  final String title;

  @override
  State<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  int navBarIndex=0;

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikacja1'),
        toolbarHeight: deviceSize.height*0.12,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: navBarIndex,
        onDestinationSelected: (int index){
          setState(() {
            navBarIndex=index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home), 
            label: 'HomePage'),
            NavigationDestination
            (icon: Icon(Icons.square), 
            label: 'Square'),
        ]
        ),
        body: <Widget>[
          HomePage(),
          SquarePage()
        ][navBarIndex],
    );
  }
}
