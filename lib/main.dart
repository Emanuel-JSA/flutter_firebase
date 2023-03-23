import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: StreamBuilder<User?>( // build the UI based on a stream of data that listens the authStateChanges()
          stream: FirebaseAuth.instance.authStateChanges(),
          // the builder is called every time a new event is received on the stream
          builder: (BuildContext context, AsyncSnapshot<User?> snapshot) { // AsyncSnapshot<User?> contains the latest data from the stream
            if (snapshot.hasData) return HomePage();
            if (snapshot.hasError) Text('Error: ${snapshot.error}');
            if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: CupertinoActivityIndicator());
            return LoginPage();
          }
      ),
    );
  }
}