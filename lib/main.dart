//import 'package:amplify_codelab/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';

import 'models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'amplifyconfiguration.dart';
import 'modules/blog/screens/blog.dart';
import 'modules/home/screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  runApp(MyApp());
}

Future<void> _configureAmplify() async {
  // if (!mounted) return;

  // Add Pinpoint and Cognito Plugins
  AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
  AmplifyDataStore datastorePlugin =
      AmplifyDataStore(modelProvider: ModelProvider.instance);
  Amplify.addPlugin(datastorePlugin);
  Amplify.addPlugins([authPlugin, datastorePlugin, AmplifyAPI()]);

  // Once Plugins are added, configure Amplify
  // Note: Amplify can only be configured once.
  try {
    print('Configuring amplify...');
    await Amplify.configure(amplifyconfig);
    // amplifyConfigured = true;
    print('Finished configuring amplify');
  } on AmplifyAlreadyConfiguredException {
    print("Amplify was already configured. Was the app restarted?");
  } catch (e) {
    print(e);
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool amplifyConfigured = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amplify TEST',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        primaryColor: Colors.purple,
      ),
      // home: HomeScreen(),
      home: BlogScreen(),
    );
  }
}
