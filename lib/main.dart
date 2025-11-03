import 'package:flutter/material.dart';

void main(){
  runApp(MySecondApp());
}

class MySecondApp extends StatefulWidget{
  @override
  _MySecondAppState createState()=>_MySecondAppState();
}

class _MySecondAppState extends State<MySecondApp>{
  int counter=0;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title:Text('Unit 2 App')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text('Button pressed $counter times',
                style: TextStyle(fontSize:20,fontWeight:FontWeight.w600)
              ),
              SizedBox(height:25),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    counter++;
                  });
                },
                child:Text('Press me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
