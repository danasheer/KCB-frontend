import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kcb/models/monitor.dart';
import 'package:kcb/providers/monitor_provider.dart';

class MonitorCard extends StatefulWidget {
  MonitorCard({super.key, required this.serialnumber});
  String serialnumber;

  @override
  State<MonitorCard> createState() => _MonitorCardState();
}

class _MonitorCardState extends State<MonitorCard> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Card(
        elevation: 4,
        child: Row(
          children: [
            // CircleAvatar(
            //   backgroundImage: NetworkImage(widget.image),
            //   radius: 45,
            // ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(widget.serialnumber,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
