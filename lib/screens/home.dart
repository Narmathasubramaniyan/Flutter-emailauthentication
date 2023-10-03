import 'package:demo/screens/signin.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hi, Welcome to the Home Screen!', // Updated greeting message
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the RegistrationScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AppSignInScreen(), // Use RegistrationScreen here
                  ),
                );
              },
              child: Text('Go to Registration'),
            ),
          ],
        ),
      ),
    );
  }
}
