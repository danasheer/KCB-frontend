import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kcb/widgets/employee_card.dart';
import 'package:provider/provider.dart';

import '../providers/department_provider.dart';

class DepartmentEmployeePage extends StatelessWidget {
  final String id;
  const DepartmentEmployeePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 251),
        title: const Text('Department Employee',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        // child: Text('Department Detail Page with the id $id'),
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: FutureBuilder(
              future: Provider.of<DepartmentProvider>(context, listen: false)
                  .getDepartmentEmployee(id),
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
                      builder: (context, employee, child) =>
                          SingleChildScrollView(
                              child: Column(
                        children: [
                          Text(employee.employee.name),
                          Text(employee.employee.position),
                          employee.employee.scanners?.length == 0
                              ? Text('No Scanner')
                              : Column(
                                  children: [
                                    Text(employee.employee.scanners![0].id
                                        .toString()),
                                    Text(employee
                                        .employee.scanners![0].invontorynumber
                                        .toString()),
                                    Text(employee
                                        .employee.scanners![0].serialnumber
                                        .toString()),
                                  ],
                                ),
                          employee.employee.computers?.length == 0
                              ? Text('No Computer')
                              : Column(
                                  children: [
                                    Text(employee.employee.computers![0].id
                                        .toString()),
                                    Text(employee.employee.computers![0].ip
                                        .toString()),
                                    Text(employee.employee.computers![0].model
                                        .toString()),
                                    Text(employee
                                        .employee.computers![0].computername
                                        .toString()),
                                    Text(employee
                                        .employee.computers![0].serialnumber
                                        .toString()),
                                    Text(employee
                                        .employee.computers![0].macaddress
                                        .toString()),
                                    Text(employee
                                        .employee.computers![0].invontorynumber
                                        .toString()),
                                  ],
                                ),
                          employee.employee.monitors?.length == 0
                              ? Text('No Monitors')
                              : Column(
                                  children: [
                                    Text(employee.employee.monitors![0].id
                                        .toString()),
                                    Text(employee.employee.monitors![0].model
                                        .toString()),
                                    Text(employee
                                        .employee.monitors![0].serialnumber
                                        .toString()),
                                    Text(employee
                                        .employee.monitors![0].invontorynumber
                                        .toString()),
                                  ],
                                ),
                        ],
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
