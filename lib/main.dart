import 'package:flutter/material.dart';
import 'hello_world.dart';
import 'calculator.dart';
// import 'todo.dart';
// import 'weather.dart';
// import 'photo_viewer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HelloWorldPage(),
    CalculatorPage(),
    // TodoPage(),
    // WeatherPage(),
    // PhotoViewerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.code), label: 'Hello'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Calc'),
          BottomNavigationBarItem(icon: Icon(Icons.check_box), label: 'ToDo'),
          BottomNavigationBarItem(icon: Icon(Icons.cloud), label: 'Weather'),
          BottomNavigationBarItem(icon: Icon(Icons.photo), label: 'Photos'),
        ],
      ),
    );
  }
}
