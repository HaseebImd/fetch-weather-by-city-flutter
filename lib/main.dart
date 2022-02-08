import 'package:flutter/material.dart';

import 'loading_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputScreen(),
    ),
  );
}

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  String cityName = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Weather Updates",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),
        ),
        centerTitle:true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://1.bp.blogspot.com/-w4d1duH6q0M/XkMLYF_tHcI/AAAAAAAAD6w/ULaDna0fH88Ndmuy10fTegI33D2l50EfwCNcBGAsYHQ/s1600/cloudy%2Bday.gif',
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    cityName = value;
                  });
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hintText: "Enter City Name",
                  labelText: 'City You want to Search',
                  border: OutlineInputBorder(),
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            IconButton(
                onPressed: () {
                  if (cityName.length == 0) {
                    print("Enter a City Name");
                  } else
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoadingData(city: cityName),
                      ),
                    );
                },
                color: Colors.blue,
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.teal,
                  size: 40,
                ),
                )
          ],
        ),
      ),
    );
  }
}

