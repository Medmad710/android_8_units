import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController _controller = TextEditingController();
  String _city = "Almaty"; 
  String _temperature = "";
  String _description = "";
  String _apiKey = "53bbcd378d3c2ebe1c9dfe92fb58482d"; 

  @override
  void initState() {
    super.initState();
    _loadCity();
  }

  Future<void> _loadCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedCity = prefs.getString("city");
    if (savedCity != null) {
      _city = savedCity;
    }
    _fetchWeather();
  }

  Future<void> _saveCity(String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("city", city);
  }

  Future<void> _fetchWeather() async {
    try {
      final url =
          "https://api.openweathermap.org/data/2.5/weather?q=$_city&appid=$_apiKey&units=metric&lang=ru";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _temperature = "${data['main']['temp'].toString()} °C";
          _description = data['weather'][0]['description'];
        });
      } else {
        setState(() {
          _temperature = "";
          _description = "Ошибка: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        _temperature = "";
        _description = "Не удалось загрузить данные";
      });
    }
  }

  void _updateCity() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _city = _controller.text;
      });
      _saveCity(_city);
      _fetchWeather();
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Введите город",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _updateCity,
                ),
              ),
              onSubmitted: (_) => _updateCity(),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      _city,
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _temperature,
                      style: TextStyle(fontSize: 40, color: Colors.blue),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _description,
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
