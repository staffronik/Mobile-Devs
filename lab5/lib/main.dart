import 'package:flutter/material.dart';
import 'SimpleList.dart';
import 'InfinityMathList.dart';
import 'InfinityList.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lists'),
        ),
        body: Row(children: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SimpleList()));
              },
              icon: const Icon(Icons.looks_one)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfinityList()));
              },
              icon: const Icon(Icons.looks_two)),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InfinityMathList()));
              },
              icon: const Icon(Icons.looks_3))
        ]),
      ),
    );
  }
}
