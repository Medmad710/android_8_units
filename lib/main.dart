import 'package:flutter/material.dart';

void main(){
  runApp(MyThirdApp());
}

class MyThirdApp extends StatelessWidget{

  final List<String> planets = [
    'Mercury','Venus','Earth','Mars','Jupiter','Saturn','Uranus','Neptune'
  ];

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize:18,color:Colors.black87)
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title:Text('Unit 3 - Planets List')),
        body: ListView.builder(
          itemCount: planets.length,
          itemBuilder: (context,index){
            return Card(
              margin: EdgeInsets.symmetric(vertical:8,horizontal:16),
              child: ListTile(
                leading: Icon(Icons.public,color:Colors.deepPurple),
                title: Text(planets[index]),
                subtitle: Text('Planet number ${index+1}'),
              ),
            );
          },
        ),
      ),
    );
  }
}
