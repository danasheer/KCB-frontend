import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kcb/widgets/employee_card.dart';
import 'package:provider/provider.dart';

import '../providers/department_provider.dart';

class DepartmentDetailPage extends StatelessWidget {
  final String id;
  const DepartmentDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 251),
        title: const Text('Department Detail',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        // child: Text('Department Detail Page with the id $id'),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: FutureBuilder(
              future: Provider.of<DepartmentProvider>(context, listen: false)
                  .getDepartmentsDetails(id),
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
                    return Consumer<DepartmentProvider>(
                      builder: (context, department, child) =>
                          SingleChildScrollView(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: department.department.employees!.length,
                            itemBuilder: (context, index) => InkWell(
                                  onTap: () => context.push(
                                      '/department/employee/${department.department.employees![index].id}'),
                                  child: EmployeeCard(
                                    name: department
                                        .department.employees![index].name,
                                  ),
                                )),
                      ),
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
