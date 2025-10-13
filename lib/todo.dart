import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> _tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  /// Загружаем сохранённые задачи
  Future<void> _loadTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tasksJson = prefs.getString("tasks");
    if (tasksJson != null) {
      setState(() {
        _tasks = List<Map<String, dynamic>>.from(json.decode(tasksJson));
      });
    }
  }

  /// Сохраняем задачи
  Future<void> _saveTasks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("tasks", json.encode(_tasks));
  }

  void _addTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _tasks.add({"title": _controller.text, "done": false});
        _controller.clear();
      });
      _saveTasks();
    }
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index]["done"] = !_tasks[index]["done"];
    });
    _saveTasks();
  }

  void _deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
    _saveTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To-Do List")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Enter a task",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(onPressed: _addTask, child: Text("Add")),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: _tasks[index]["done"],
                    onChanged: (_) => _toggleTask(index),
                  ),
                  title: Text(
                    _tasks[index]["title"],
                    style: TextStyle(
                      decoration: _tasks[index]["done"]
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTask(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
