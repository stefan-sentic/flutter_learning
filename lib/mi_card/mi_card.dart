import 'package:flutter/material.dart';

class MiCardScreen extends StatelessWidget {
  const MiCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('lib/mi_card/image/john_doe.jpg'),
            ),
            const Text(
              'John Doe',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Account manager'.toUpperCase(),
              style: TextStyle(
                fontFamily: 'Source Sans Pro',
                fontSize: 20,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
                color: Colors.teal.shade100,
              ),
            ),
                Divider(
                  thickness: 1,
                  indent: 60,
                  endIndent: 60,
                  height: 20,
                  color: Colors.teal.shade100,
                ),
            const Card(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.phone, color: Colors.teal),
                title: Text(
                  '+381 61 234 23 23',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Source Sans Pro',
                      color: Colors.teal),
                ),
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: ListTile(
                leading: Icon(Icons.email, color: Colors.teal),
                title: Text(
                  'john.doe@gmail.com',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Source Sans Pro',
                      color: Colors.teal),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
