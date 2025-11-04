import 'package:flutter/material.dart';

void main(){
  runApp(MyFourthApp());
}

class MyFourthApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Unit 4 App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget{
  final String message = 'Hello from Home Screen';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text('This is the first screen',style:TextStyle(fontSize:18)),
            SizedBox(height:25),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>DetailScreen(text: message),
                  ),
                );
              },
              child: Text('Go to Details'),
            )
          ],
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget{
  final String text;
  DetailScreen({required this.text});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(text,style:TextStyle(fontSize:20,fontWeight:FontWeight.bold)),
            SizedBox(height:30),

          ],
        ),
      ),
    );
  }
}
