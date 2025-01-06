import 'package:flutter/material.dart';

class Bottom extends StatelessWidget { // 상태를 갖지않는 위젯

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        height: 80,
        child: TabBar(tabs: <Widget>[
          Tab(
            icon: Icon(
              Icons.search,
              size: 18,
            ),
            child: Text(
              'Search',
              style: TextStyle(fontSize: 9),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.home,
              size: 18,
            ),
            child: Text(
              'home',
              style: TextStyle(fontSize: 9),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.list,
              size: 18,
            ),
            child: Text(
              'list',
              style: TextStyle(fontSize: 9),
            ),
          ),
          Tab(
            icon: Icon(
              Icons.contact_support,
              size: 18,
            ),
            child: Text(
              'CS',
              style: TextStyle(fontSize: 9),
            ),
          ),
        ],
        ),
      ),
    );
  }

}