import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:kcb/providers/department_provider.dart';
import 'package:kcb/models/department.dart';
import '../widgets/department_card.dart';

class DepartmentPage extends StatelessWidget {
  const DepartmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 251),
        title: const Text('Departments',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: FutureBuilder(
              future: Provider.of<DepartmentProvider>(context, listen: false)
                  .getDepartments(),
              builder: (context, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (dataSnapshot.error != null) {
                    print(dataSnapshot.error);
                    print(DepartmentProvider().departments);
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
                            itemCount: department.departments.length,
                            itemBuilder: (context, index) => DepartmentCard(
                                number: department.departments[index].number)),
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
