import 'package:demo/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:demo/screens/signup.dart';
import 'package:demo/screens/forgotpassword.dart';

class AppSignInScreen extends StatefulWidget {
  const AppSignInScreen({Key? key}) : super(key: key);

  @override
  _AppSignInScreenState createState() => _AppSignInScreenState();
}

class _AppSignInScreenState extends State<AppSignInScreen> {
  bool _isPasswordVisible = true;
  final _signInFormKey = GlobalKey<FormState>();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _userPassController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _signInFormKey,
          child: ListView(
            children: [
              SizedBox(
                height: 250,
                child: Image.asset("assets/png_images/signin.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 25.0, color: Colors.purple),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: _userNameController,
                  validator: (username) {
                    if (username != null && username.isEmpty) {
                      return "Enter Your UserName";
                    }
                    return null; // Return null for valid input
                  },
                  cursorColor: Color.fromARGB(255, 135, 46, 194),
                  decoration: InputDecoration(
                    labelText: "UserName",
                    labelStyle: TextStyle(color: Colors.purple),
                    hintText: "Enter Your Email ID",
                    prefixIcon: Icon(
                      Icons.person_outline,
                      color: Colors.purple,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  validator: (userpass) {
                    if (userpass != null && userpass.isEmpty) {
                      return "Enter Your Password";
                    }
                    return null; // Return null for valid input
                  },
                  controller: _userPassController,
                  obscureText: _isPasswordVisible,
                  cursorColor: Color.fromARGB(255, 135, 46, 194),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.purple),
                    hintText: "Enter Your Password",
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: Colors.purple,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: _isPasswordVisible
                          ? Icon(
                              Icons.visibility_off,
                              color: Colors.purple,
                            )
                          : Icon(
                              Icons.visibility,
                              color: Colors.purple,
                            ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.purple),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () async {
                    if (_signInFormKey.currentState!.validate()) {
                      try {
                        final email = _userNameController.text.trim();
                        final password = _userPassController.text.trim();

                        // Sign in with Firebase Authentication
                        await _auth.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        );

                        // Authentication successful, navigate to HomeScreen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      } catch (e) {
                        // Handle authentication errors here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Authentication failed: $e'),
                          ),
                        );
                      }
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return AppForgotPassword();
                          }),
                        );
                      },
                      child: Text("Forgot Password?"),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New User?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return AppSignup();
                        }),
                      );
                    },
                    child: Text(
                      "Sign Up Now",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
