import 'package:flutter/material.dart';

class SimpleList extends StatelessWidget {
  const SimpleList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Simple List")),
        body: ListView(
          children: const [
            Text("Item 1"),
            Divider(),
            Text("Item 2"),
            Divider(),
            Text("Item 3"),
          ],
        ));
  }
}
