import 'package:amplify_codelab/utils/debug_auth.dart';
import 'package:flutter/material.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  // Create GlobalKey to uniquely identify this form.
  // Note that this is GlobalKey<FormState>() not this Form State.
  final _formKey = GlobalKey<FormState>();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  void dispose() {
    _usernameTextController.dispose();
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
                  bool loginSuccess = await debugSignIn(
                      _usernameTextController.text,
                      _passwordTextController.text);
                  if (loginSuccess) {
                    // if form is valid, display a snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Username: " +
                            _usernameTextController.text +
                            " --- Password: " +
                            _passwordTextController.text),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("LOGIN FAILED"),
                      ),
                    );
                    print('LOOOOOOOOOOOOOOOOOOOOOGIN FAILLLLLLLLLLLLLLLLLLED');
                  }
                }
              },
              child: Text('Sign In'),
            ),
          ],
        ));
  }
}
