import 'package:flutter/material.dart';
import 'package:movieflix/pages/fulllist.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({required this.section});

  final String section;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            section,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w100),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => (section == 'New Movie')
                        ? FullList(
                            name: 'movies',
                          )
                        : FullList(
                            name: 'webseries',
                          ),
                  ));
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
