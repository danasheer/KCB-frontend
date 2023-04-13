import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kcb/widgets/department_card.dart';
import 'package:kcb/widgets/employee_card.dart';
import 'package:provider/provider.dart';

import '../providers/branch_provider.dart';

class BranchDetailPage extends StatelessWidget {
  final String id;
  const BranchDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 251),
        title: const Text(' Branch Detail',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        // child: Text('Department Detail Page with the id $id'),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: FutureBuilder(
              future: Provider.of<BranchProvider>(context, listen: false)
                  .getBranchDepartment(id),
              builder: (context, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (dataSnapshot.error != null) {
                    print(dataSnapshot.error);

                    return const Center(
                      child: Text('An error occurred'),
                    );
                  } else {
                    return Consumer<BranchProvider>(
                      builder: (context, branch, child) =>
                          SingleChildScrollView(
                              child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemCount: branch.branch.departments!.length,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () => context.push(
                              '/branch/department/${branch.branch.departments![index].id}'),
                          child: DepartmentCard(
                            deparment: branch.branch.departments![index],
                          ),
                        ),
                      )),
                    );
                  }
                }
              },
            ),
          ),
          // Spacer(),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
