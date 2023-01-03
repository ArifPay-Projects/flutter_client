import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Successfully Paid redirect",
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Redirect'),
          ),
          body: const Center(
            child: Text('Successfully Redirected'),
          ),
        ));
  }
}

