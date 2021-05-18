import 'package:amplify_codelab/modules/home/screens/sign_in_form.dart';
import 'package:amplify_codelab/modules/home/screens/sign_up_confirm_form.dart';
import 'package:amplify_codelab/modules/home/screens/sign_up_form.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amplify Core example app'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: <Widget>[
          Center(
            child: Column(
              children: [
                SignInForm(),
                SignUpForm(),
                SignUpConfirmForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
