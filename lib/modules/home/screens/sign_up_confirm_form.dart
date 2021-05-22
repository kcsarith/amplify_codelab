import 'package:amplify_codelab/utils/debug_auth.dart';
import 'package:flutter/material.dart';

class SignUpConfirmForm extends StatefulWidget {
  @override
  _SignUpConfirmFormState createState() => _SignUpConfirmFormState();
}

class _SignUpConfirmFormState extends State<SignUpConfirmForm> {
  // Create GlobalKey to uniquely identify this form.
  // Note that this is GlobalKey<FormState>() not this Form State.
  final _formKey = GlobalKey<FormState>();
  final _usernameTextController = TextEditingController();
  final _confirmationKeyTextController = TextEditingController();

  @override
  void dispose() {
    _usernameTextController.dispose();
    _confirmationKeyTextController.dispose();
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
                labelText: 'Enter confirmation key',
              ),
              controller: _confirmationKeyTextController,
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
                  bool signUpSuccess = debugConfirmSignUp(
                      _usernameTextController.text.toString(),
                      _confirmationKeyTextController.text.toString());
                  if (signUpSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Confirmed email for " +
                            _usernameTextController.text),
                      ),
                    );
                  }
                }
              },
              child: Text('Confirm Username'),
            ),
          ],
        ));
  }
}
