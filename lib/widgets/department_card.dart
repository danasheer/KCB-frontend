import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:kcb/models/department.dart';
import 'package:kcb/providers/department_provider.dart';

import '../pages/department_datail.dart';

class DepartmentCard extends StatefulWidget {
  DepartmentCard({super.key, required this.deparment});
  Department deparment;

  @override
  State<DepartmentCard> createState() => _DepartmentCardState();
}

class _DepartmentCardState extends State<DepartmentCard> {
  var counter = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("going to ${widget.deparment.id}");
        context.push('/depatment/detail/${widget.deparment.id}/');
        print("going to ${widget.deparment.id} ---- ");
      },
      child: Container(
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
                child: Text(widget.deparment.name,
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
