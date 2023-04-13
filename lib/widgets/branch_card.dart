import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:kcb/models/branch.dart';
import 'package:kcb/providers/branch_provider.dart';

class BranchCard extends StatefulWidget {
  BranchCard({super.key, required this.name, required this.branch});
  String name;
  Branch branch;

  @override
  State<BranchCard> createState() => _BranchCardState();
}

class _BranchCardState extends State<BranchCard> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("going to ${widget.branch.id}");
        context.push('/branche/detail/${widget.branch.id}/');
        print("going to ${widget.branch.id} ---- ");
      },
      child: Container(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10),
        //   color: Colors.red,
        // ),
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
                child: Text(widget.name,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
              ),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
