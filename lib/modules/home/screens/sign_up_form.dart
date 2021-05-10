import 'package:amplify_codelab/utils/debug_auth.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  // Create GlobalKey to uniquely identify this form.
  // Note that this is GlobalKey<FormState>() not this Form State.
  final _formKey = GlobalKey<FormState>();
  final _usernameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _usernameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  // Build a form widget with the form key above.
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your username',
              ),
              controller: _usernameTextController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please return some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your email',
              ),
              controller: _emailTextController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please return some text';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your password',
              ),
              controller: _passwordTextController,
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please return some text';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () async {
                //will return true if form is valid.
                if (_formKey.currentState.validate()) {
                  // if form is valid, display a snackbar
                  debugSignUp(
                      _emailTextController.text.toString(),
                      _usernameTextController.text.toString(),
                      _passwordTextController.text.toString());
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Username: " +
                          _usernameTextController.text +
                          "Email: " +
                          _emailTextController.text +
                          " --- Password: " +
                          _passwordTextController.text),
                    ),
                  );
                }
              },
              child: Text('Sign Up'),
            ),
          ],
        ));
  }
}
