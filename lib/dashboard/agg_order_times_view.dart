import 'package:charts_flutter/flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:have_you_ordered_app/api/api.dart';
import 'package:have_you_ordered_app/model/key_value_pair.dart';

class OrderTimesView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OrderTimesViewState();
}

class _OrderTimesViewState extends State<OrderTimesView> {
  List<KeyValuePair> data = [];

  Future<void> _fetchData() async {
    DashboardApi.getOrderedTimes().then((times) {
      data = times;
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BarChart(
      [
        Series<KeyValuePair, String>(
          id: 'orderedTimes',
          data: data,
          domainFn: (each, _) => each.key,
          measureFn: (each, _) => each.value,
          labelAccessorFn: (KeyValuePair each, index) =>
              '$index ${each.key} ${each.value}',
        )
      ],
      vertical: false,
      animate: true,
      domainAxis: OrdinalAxisSpec(renderSpec: NoneRenderSpec()),
      animationDuration: Duration(seconds: 1),
      barRendererDecorator: new BarLabelDecorator<String>(),
    );
  }
}
