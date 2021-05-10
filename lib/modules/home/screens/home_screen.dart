import 'package:amplify_codelab/modules/home/screens/sign_in_form.dart';
import 'package:amplify_codelab/modules/home/screens/sign_up_form.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final bool amplifyConfigured;
  HomeScreen(this.amplifyConfigured);
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
                const Padding(padding: EdgeInsets.all(5.0)),
                Text(
                    widget.amplifyConfigured ? 'configured' : 'not configured'),
                ElevatedButton(
                  onPressed: () {
                    print('object');
                  },
                  child: const Text('record event'),
                ),
                SignInForm(),
                SignUpForm(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
