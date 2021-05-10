import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

void debugSignUp(String email, String username, String password) async {
  try {
    await Amplify.Auth.signUp(
        username: username,
        password: password,
        options: CognitoSignUpOptions(userAttributes: {"email": email}));
  } on AuthException catch (error) {
    print('EEEEEEEEEEEEEEEEEEEEEEEEEEEEE' + error.message);
  }
}

debugConfirmSignUp(String username, String confirmationCode) async {
  try {
    SignUpResult res = await Amplify.Auth.confirmSignUp(
        username: username, confirmationCode: confirmationCode);
    return res.isSignUpComplete;
  } on AuthException catch (error) {
    return print(error.message);
  }
}

debugSignIn(String username, String password) async {
  try {
    SignInResult res =
        await Amplify.Auth.signIn(username: username, password: password);
    return res.isSignedIn;
  } on AuthException catch (error) {
    return print('EEEEEEEEEEEEEEEEEEEEEEEEEEEEE' + error.message);
  }
}
