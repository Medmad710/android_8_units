import 'package:flutter/material.dart';

void main() {
  runApp(MyFirstApp());
}

class MyFirstApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Unit 1 App'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('My first Android app with Flutter',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black87)
              ),
              SizedBox(height:20),
              Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                width:200,
                height:200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
