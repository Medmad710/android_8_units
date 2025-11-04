import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MySixthApp());
}

class MySixthApp extends StatefulWidget{
  @override
  _MySixthAppState createState()=>_MySixthAppState();
}

class _MySixthAppState extends State<MySixthApp>{
  int counter = 0;
  late SharedPreferences prefs;
  bool loading = true;

  @override
  void initState(){
    super.initState();
    loadCounter();
  }

  Future<void> loadCounter() async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('counter') ?? 0;
      loading = false;
    });
  }

  Future<void> increment() async{
    setState(() {
      counter++;
    });
    await prefs.setInt('counter', counter);
  }

  Future<void> reset() async{
    setState(() {
      counter = 0;
    });
    await prefs.setInt('counter', counter);
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(title: Text('Unit 6 - Data Persistence')),
        body: loading
          ? Center(child:CircularProgressIndicator())
          : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text('Saved counter value:',
                    style:TextStyle(fontSize:18,fontWeight:FontWeight.w500)),
                SizedBox(height:10),
                Text('$counter',
                    style:TextStyle(fontSize:36,fontWeight:FontWeight.bold)),
                SizedBox(height:30),
                ElevatedButton(
                  onPressed: increment,
                  child: Text('Add +1'),
                ),
                SizedBox(height:10),
                ElevatedButton(
                  onPressed: reset,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Reset'),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
