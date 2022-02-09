import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'output.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingData extends StatefulWidget {
  final String city;
  LoadingData({required this.city});

  @override
  _LoadingDataState createState() => _LoadingDataState();
}

class _LoadingDataState extends State<LoadingData> {
  void getData() async {
    String cityName = widget.city;
    String apiKey = "PUT YOUR API KEY HERE"; // Api Key
    String urlString =
        "http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey";
    Uri url = Uri.parse(urlString);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      //print(response.body);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OutputScreen(
            data: jsonDecode(response.body),
          ),
        ),
      );
    } else {
      //print(response.statusCode);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.network(
          'https://cdn.dribbble.com/users/908372/screenshots/4812323/loading2.gif',
        ),
      ),
    );
  }
}
