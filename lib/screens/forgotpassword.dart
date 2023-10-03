import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication package

class AppForgotPassword extends StatefulWidget {
  const AppForgotPassword({Key? key});

  @override
  State<AppForgotPassword> createState() => _AppForgotPasswordState();
}

class _AppForgotPasswordState extends State<AppForgotPassword> {
  TextEditingController resetPassword = TextEditingController();
  final resetPasswordKey = GlobalKey<FormState>();

  // Function to send a password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      // Password reset email sent successfully
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password reset email sent to $email"),
      ));
    } catch (e) {
      // An error occurred while sending the password reset email
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Error sending password reset email: $e"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: resetPasswordKey,
          child: ListView(
            children: [
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 250,
                child: Image.asset("assets/png_images/forgot.png"),
              ),
              Text(
                "Receive an email to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.purple, fontSize: 25.0),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: resetPassword,
                  validator: (username) {
                    if (username != null && username.isEmpty) {
                      return "Enter your Email Address";
                    }
                    return null; // Return null if validation passes
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.purple,
                    ),
                    hintText: "Username",
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.purple),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {
                      if (resetPasswordKey.currentState!.validate()) {
                        // Call the function to send the password reset email
                        sendPasswordResetEmail(resetPassword.text);
                      }
                    },
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
