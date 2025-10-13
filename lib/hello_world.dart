import 'package:flutter/material.dart';
import 'dart:math';

class HelloWorldPage extends StatefulWidget {
  const HelloWorldPage({super.key});

  @override
  _HelloWorldPageState createState() => _HelloWorldPageState();
}

class _HelloWorldPageState extends State<HelloWorldPage> {
  Color _textColor = Colors.black;
  final Random _random = Random();

  void _changeColor() {
    setState(() {
      _textColor = Color.fromARGB(
        255,
        _random.nextInt(256),
        _random.nextInt(256),
        _random.nextInt(256),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, World!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: _textColor,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeColor,
              child: Text('Change Color'),
            ),
          ],
        ),
      ),
    );
  }
}
