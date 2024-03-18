import 'package:flutter/material.dart';
import 'dart:math';

class InfinityMathList extends StatelessWidget {
  const InfinityMathList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Infinity Math List")),
        body: ListView.separated(
          itemCount: 1000,
          itemBuilder: (context, index) {
            return Text('2 to the power of $index = ${pow(2, index)}');
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ));
  }
}