import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatelessWidget {
  TextEditingController emailEditingCtrl = TextEditingController();
  TextEditingController passEditingCtrl = TextEditingController();

  SignUpPage({super.key});

  Future<void> signUp(String email, String pass) async {
    try {
      final response =
          await http.post(Uri.parse("https://reqres.in/api/register"), body: {
        "email": email,
        "password": pass,
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
        print("created Successfully");
      } else {
        print("failed to create account");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Hey User, Welcome"),
            SizedBox(height: 50),
            TextFormField(
              controller: emailEditingCtrl,
              decoration: InputDecoration(hintText: "Enter Your Email"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passEditingCtrl,
              decoration: InputDecoration(hintText: "Enter Your Password"),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.5,
              child: ElevatedButton(
                  onPressed: () {
                    signUp(emailEditingCtrl.text.toString(),
                        passEditingCtrl.text.toString());
                  },
                  child: Text('Sign Up')),
            ),
          ],
        ),
      ),
    );
  }
}
