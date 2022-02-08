import 'dart:convert';

import 'package:flutter/material.dart';
import 'main.dart';

class OutputScreen extends StatelessWidget {
  final data;
  OutputScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    double temp = data['main']['temp'] - 273;
    double windSpeed = data['wind']['speed'];
    int humidity = data['main']['humidity'];
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://content.presentermedia.com/content/animsp/00016000/16584/cloudyday_flatcolor_image_300_wht.gif',
            ),
            Text(
              data["name"],
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              temp.toStringAsFixed(0) + "°",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Wind Speed : " + windSpeed.toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Humidity : " + humidity.toStringAsFixed(1),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.teal,
                size: 40,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InputScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
