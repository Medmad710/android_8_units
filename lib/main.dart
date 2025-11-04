import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(){
  runApp(MyFifthApp());
}

class MyFifthApp extends StatefulWidget{
  @override
  _MyFifthAppState createState()=>_MyFifthAppState();
}

class _MyFifthAppState extends State<MyFifthApp>{
  List photos = [];
  bool loading = true;

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async{
    final url = Uri.parse('https://picsum.photos/v2/list?limit=10');
    try{
      final response = await http.get(url);
      if(response.statusCode==200){
        setState(() {
          photos = json.decode(response.body);
          loading = false;
        });
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch(e){
      print('Failed to fetch data: $e');
    }
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      home: Scaffold(
        appBar: AppBar(title:Text('Unit 5 - API and Internet')),
        body: loading
          ? Center(child:CircularProgressIndicator())
          : ListView.builder(
              itemCount: photos.length,
              itemBuilder:(context,index){
                final p = photos[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical:8,horizontal:12),
                  child: ListTile(
                    leading: Image.network(
                      p['download_url'],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.broken_image, color: Colors.grey),
                    ),
                    title: Text(p['author'] ?? 'Unknown'),
                    subtitle: Text('Photo #${index+1}'),
                  ),
                );
              },
            ),
      ),
    );
  }
}
