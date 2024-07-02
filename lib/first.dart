import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final String? name;
  const FirstPage({super.key, this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("First $name")),
      body: TextButton(child: const Text('Pop'), onPressed: () {Navigator.of(context).pop();},),
    );
  }
}