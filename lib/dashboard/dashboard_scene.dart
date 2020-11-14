import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:have_you_ordered_app/dashboard/agg_order_person_view.dart';
import 'package:have_you_ordered_app/dashboard/agg_order_times_view.dart';

class DashboardScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashboardSceneState();
}

class _DashboardSceneState extends State<DashboardScene> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            child: TabBar(
              tabs: [
                Tab(text: '吃饭人数'),
                Tab(text: '吃饭大王'),
              ],
            ),
          ),
          elevation: 0,
        ),
        body: TabBarView(
          children: [
            OrderTimesView(),
            OrderPersonView(),
          ],
        ),
      ),
    );
  }
}
