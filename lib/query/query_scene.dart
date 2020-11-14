import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:have_you_ordered_app/api/api.dart';
import 'package:have_you_ordered_app/model/ordered.dart';
import 'package:have_you_ordered_app/model/ordered_list.dart';
import 'package:have_you_ordered_app/query/ordered_item_view.dart';

class QueryScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuerySceneState();
}

class _QuerySceneState extends State<QueryScene> {
  DateTime selectedDate;
  OrderedList orderedList;

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    _fetchData();
  }

  Future<void> _fetchData() async {
    String date = '${selectedDate.year.toString()}'
        '${selectedDate.month.toString().padLeft(2, '0')}'
        '${selectedDate.day.toString().padLeft(2, '0')}';
    OrderedApi.getOrderedList(date).then((result) {
      orderedList = result;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    List<OrderedItemView> children = [];
    if (null != orderedList) {
      List<Ordered> list = orderedList.data;
      for (int i = 0; i < list.length; i++) {
        children.add(OrderedItemView(i + 1, list[i]));
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('吃饭了吗'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDatePicker(
                  context: context,
                  initialDate: selectedDate ?? DateTime.now(),
                  firstDate: DateTime.fromMicrosecondsSinceEpoch(0),
                  lastDate: DateTime.utc(2100))
              .then((selected) {
            if (null == selected) {
              return;
            }
            selectedDate = selected;
            _fetchData();
          });
        },
        tooltip: 'Pick Date',
        child: Icon(Icons.date_range),
      ),
      body: RefreshIndicator(
          child: ListView(
            children: children,
          ),
          onRefresh: _fetchData),
    );
  }
}
