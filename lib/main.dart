import 'package:flutter/cupertino.dart';
import 'login_page.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: LoginPage(),
    );
  }
}