import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit 8 — Compose & Views',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const NativeViewScreen(),
    );
  }
}

class NativeViewScreen extends StatefulWidget {
  const NativeViewScreen({super.key});

  @override
  State<NativeViewScreen> createState() => _NativeViewScreenState();
}

class _NativeViewScreenState extends State<NativeViewScreen> {
  static const String viewType = 'native-text-view';
  static const platform = MethodChannel('native_channel');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unit 8 — Flutter + Android View')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Flutter area above 👇",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 10),

          // Вот тут мы встраиваем Android TextView
          SizedBox(
            height: 100,
            child: AndroidView(
              viewType: viewType,
              onPlatformViewCreated: (id) {
                print("✅ Native Android View attached");
              },
            ),
          ),

          const SizedBox(height: 10),
          const Text(
            "Flutter continues below 👆",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
