import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    // Запускаем фоновую задачу: каждую секунду увеличиваем счётчик
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() => counter++);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: Scaffold(
        appBar: AppBar(title: const Text("Unit 7 – Background Timer")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Background task simulation",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Text(
                "Seconds passed: $counter",
                style: const TextStyle(fontSize: 26, color: Colors.blueAccent),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  setState(() => counter = 0);
                },
                child: const Text("🔁 Reset"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
