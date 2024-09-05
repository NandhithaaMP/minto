import 'package:flutter/material.dart';
import 'package:minto/tableSelection.dart';
import 'homePage.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          // Apply the gradient background here
          decoration: BoxDecoration(
            color: Colors.amber

          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height / 10),
                  Image.asset("asset/mintologo- 1.png",scale: 3,),
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Adjust text color for visibility
                    ),
                  ),
                  SizedBox(height: height / 15),
                  // Username field with enabled and focused border
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(color: Colors.black), // Label color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    style: TextStyle(color: Colors.black), // Text color
                  ),
                  SizedBox(height: 16),
                  // Password field with enabled and focused border
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.black), // Label color
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    obscureText: true,
                    style: TextStyle(color: Colors.black), // Text color
                  ),
                  SizedBox(height: 24),
                  // Register button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.black,
                      ),
                      height: 60,
                      width: 250,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
