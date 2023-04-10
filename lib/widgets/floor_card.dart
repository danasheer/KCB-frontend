import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kcb/models/floor.dart';
import 'package:kcb/providers/floors_provider.dart';

class FloorCard extends StatefulWidget {
  FloorCard({super.key, required this.number});
  int number;

  @override
  State<FloorCard> createState() => _FloorCardState();
}

class _FloorCardState extends State<FloorCard> {
  var counter = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
              child: Text(widget.number.toString(),
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
