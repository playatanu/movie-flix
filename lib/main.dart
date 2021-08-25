import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/screens/home.dart';
//import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const color = Color(0xFF151026);
  static const primaryColor = const Color(0xFF151026);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Color(0xFF151026),
        scaffoldBackgroundColor: Color(0xFF151026),
        primaryColor: primaryColor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
      },
    );
  }
}
