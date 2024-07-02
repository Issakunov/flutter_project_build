import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final name = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Second $name')),
      body: TextButton(child: const Text('Pop'), onPressed: () {Navigator.of(context).pop('This is from the second page hehe');},),
    );
  }
}