import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:package_info/package_info.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: new Image.asset(
              'images/logo.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.android,
              color: Colors.white54,
            ),
            hoverColor: Colors.black,
            subtitle: Text(
              _packageInfo.version,
              style: TextStyle(
                color: Colors.white54,
                fontSize: 10,
              ),
            ),
            title: Text(
              _packageInfo.appName,
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.ios_share,
              color: Colors.white54,
            ),
            hoverColor: Colors.black,
            onTap: () {
              Share.share('Download MovieFlix https://playflix.netlify.app/');
            },
            subtitle: Text(
              'Share movieflix with your friends.',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 10,
              ),
            ),
            title: Text(
              'Share',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.mail,
              color: Colors.white54,
            ),
            hoverColor: Colors.black,
            subtitle: Text(
              'playflix@gmail.com',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 10,
              ),
            ),
            title: Text(
              'Contact',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.update,
              color: Colors.white54,
            ),
            hoverColor: Colors.black,
            subtitle: Text(
              'Chake for updates',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 10,
              ),
            ),
            title: Text(
              'Update',
              style: TextStyle(
                color: Colors.white54,
              ),
            ),
          ),
        ],
      ),
    );

    /*Center(
      child: GestureDetector(
          onTap: () {
            Share.share('check out my website https://example.com');
          },
          child: Text('Click Me')),
    );*/
  }
}
