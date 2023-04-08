import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:kcb/models/branch.dart';
import 'package:kcb/providers/branch_provider.dart';

class BranchCard extends StatefulWidget {
  BranchCard({super.key, required this.name});
  String name;

  @override
  State<BranchCard> createState() => _BranchCardState();
}

class _BranchCardState extends State<BranchCard> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
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
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      counter += 1;
                    });
                  },
                  icon: const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 132, 128, 100),
                    size: 30,
                  ),
                ),
                Text(
                  counter.toString(),
                  style: TextStyle(color: Color.fromARGB(255, 94, 93, 93)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
