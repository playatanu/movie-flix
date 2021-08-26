import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movieflix/pages/moviemenu.dart';
import 'package:movieflix/pages/setting.dart';
import 'package:movieflix/screens/home.dart';
//import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static const color = Color(0xFF151026);
  static const primaryColor = const Color(0xFF151026);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    MovieMenu(),
    Setting(),
    Setting(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          accentColor: Color(0xFF151026),
          scaffoldBackgroundColor: Color(0xFF151026),
          primaryColor: MyApp.primaryColor,
          primarySwatch: Colors.blue,
          canvasColor: Color(0xFF151026),
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('MovieFlix'),
            centerTitle: true,
          ),
          //drawer: Drawer(),
          body: _widgetOptions.elementAt(_selectedIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                //backgroundColor: Colors.green
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                title: Text('Movies'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.video_stable),
                title: Text('Web Series'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile'),
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            // elevation: 5
          ),
        ));
  }
}
