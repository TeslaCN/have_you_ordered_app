import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:have_you_ordered_app/dashboard/dashboard_scene.dart';
import 'package:have_you_ordered_app/ordering/ordering_scene.dart';
import 'package:have_you_ordered_app/query/query_scene.dart';

class RootWidget extends StatefulWidget {

  @override
  _RootWidgetState createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  int _tabIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: [
          DashboardScene(),
          QueryScene(),
          OrderingScene(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        // backgroundColor: Colors.green,
        activeColor: Colors.blue,
        onTap: (index) {
          log('Table index -> $index');
          setState(() {
            _tabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: '统计'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '点餐了吗'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: '现在点'),
        ],
        currentIndex: _tabIndex,
      ),
    );
  }
}
