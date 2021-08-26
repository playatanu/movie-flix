import 'package:flutter/material.dart';
import 'package:movieflix/pages/fulllist.dart';

class HeaderText extends StatefulWidget {
  const HeaderText({required this.section, required this.db});

  final String section;
  final String db;

  @override
  _HeaderTextState createState() => _HeaderTextState();
}

class _HeaderTextState extends State<HeaderText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.section,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w100),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FullList(
                            name: widget.db,
                          )));
            },
            child: Text(
              'View All',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w100),
            ),
          ),
        ],
      ),
    );
  }
}
