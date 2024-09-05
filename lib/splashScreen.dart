import 'package:flutter/material.dart';

import 'getStarted.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to the login screen after 2 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => GetStartedScreen(),));
    });

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Image.asset("asset/mintologo- 1.png",scale: 4,),

          ],
        ),
      ),
    );
  }
}
