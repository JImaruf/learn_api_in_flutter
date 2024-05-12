import 'package:flutter/material.dart';
import 'package:learnapi/pages/SignUpPage.dart';
import 'package:learnapi/pages/logInPage.dart';
import 'package:learnapi/pages/uploadimagewithapi.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hey User, Welcome"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpPage(),
                      ));
                },
                child: Text("Sign UP")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogInPage(),
                      ));
                },
                child: Text("Log In")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UploadImage(),
                      ));
                },
                child: Text("upload a image")),
          ],
        ),
      ),
    );
  }
}
