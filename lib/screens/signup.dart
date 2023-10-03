import 'package:flutter/material.dart';
import 'package:demo/authmanagement/authmanage.dart'; // Import your AuthManage class
import 'package:demo/screens/signin.dart';

class AppSignup extends StatefulWidget {
  const AppSignup({Key? key}) : super(key: key);

  @override
  State<AppSignup> createState() => _AppSignupState();
}

class _AppSignupState extends State<AppSignup> {
  TextEditingController userName = TextEditingController();
  TextEditingController userMobile = TextEditingController();
  TextEditingController userPass = TextEditingController();
  TextEditingController userConfirm = TextEditingController();
  final _appSignupFormKey = GlobalKey<FormState>();
  bool hidePassword = true;

  void _handleSignUp() async {
    if (_appSignupFormKey.currentState!.validate()) {
      // Perform the signup here
      final email = userName.text.trim();
      final password = userPass.text.trim();

      try {
        // Call the signUp method from your AuthManage class
        await AuthManage().signUp(email, password);

        // Navigate to the next screen upon successful signup
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AppSignInScreen()), // Replace 'NextScreen' with your desired screen
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Registration failed: $e'),
          ),
        );
      }
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
          key: _appSignupFormKey,
          child: ListView(
            children: [
              SizedBox(
                height: 190,
                child: Image.asset("assets/png_images/signup.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: userName,
                  validator: (username) {
                    if (username != null && username.isEmpty) {
                      return "Enter your Name";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
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
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  controller: userMobile,
                  validator: (usermobile) {
                    if (usermobile != null && usermobile.isEmpty) {
                      return "Enter your 10 Digit Mobile Number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.phone_android,
                      color: Colors.purple,
                    ),
                    hintText: "Mobile Number",
                    labelText: "MobileNumber",
                    labelStyle: TextStyle(color: Colors.purple),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 10.0),
                child: TextFormField(
                  obscureText: hidePassword,
                  keyboardType: TextInputType.text,
                  maxLength: 8,
                  controller: userPass,
                  validator: (userpassword) {
                    if (userpassword != null && userpassword.isEmpty) {
                      return "Enter Your Eight Digit Password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: hidePassword
                          ? Icon(
                              Icons.visibility_off,
                              color: Colors.purple,
                            )
                          : Icon(Icons.visibility),
                    ),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.purple,
                    ),
                    hintText: "Password",
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.purple),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 10.0),
                child: TextFormField(
                  obscureText: hidePassword,
                  keyboardType: TextInputType.text,
                  maxLength: 8,
                  controller: userConfirm,
                  validator: (userconfirm) {
                    if (userconfirm != null && userconfirm.isEmpty) {
                      return "Enter Your Eight Digit Password";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: hidePassword
                          ? Icon(
                              Icons.visibility_off,
                              color: Colors.purple,
                            )
                          : Icon(Icons.visibility),
                    ),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Colors.purple,
                    ),
                    hintText: "Confirm Password",
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(color: Colors.purple),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
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
                    onPressed: _handleSignUp,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return AppSignInScreen();
                      }));
                    },
                    child: Text(
                      "Sign in",
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
