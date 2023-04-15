import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kcb/models/computer.dart';
import 'package:kcb/providers/computer_provider.dart';

class ComputerCard extends StatefulWidget {
  ComputerCard({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  State<ComputerCard> createState() => _ComputerCardState();
}

class _ComputerCardState extends State<ComputerCard> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromARGB(200, 175, 136, 100),
      width: 200,
      height: 70,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          // backgroundColor: Color.fromARGB(200, 175, 136, 100),
        ),
        child: Row(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      shadows: List.empty(growable: true)),
                ),
              ),
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
