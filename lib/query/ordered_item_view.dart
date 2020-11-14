import 'package:flutter/cupertino.dart';
import 'package:have_you_ordered_app/model/ordered.dart';

class OrderedItemView extends StatelessWidget {
  final int index;
  final Ordered ordered;

  OrderedItemView(this.index, this.ordered);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(index.toString()),
            ],
          ),
          Column(
            children: [
              Text(
                ordered.name,
                textScaleFactor: 1.88, // m
              ),
            ],
          ),
          Column(
            children: [
              Text(
                ordered.orderType,
                textAlign: TextAlign.right,
              ),
              Text(
                ordered.time,
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
