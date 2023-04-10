import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kcb/models/computer.dart';
import 'package:kcb/providers/computer_provider.dart';

class ComputerCard extends StatefulWidget {
  ComputerCard({super.key, required this.name});
  String name;

  @override
  State<ComputerCard> createState() => _ComputerCardState();
}

class _ComputerCardState extends State<ComputerCard> {
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
              child: Text(widget.name,
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
