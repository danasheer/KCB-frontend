import 'package:flutter/material.dart';
import 'package:kcb/models/employee.dart';
import 'package:provider/provider.dart';

import '../providers/employee_provider.dart';
import 'employee_card.dart';
import 'mySearchBar.dart';

class EmployeeListView extends StatefulWidget {
  @override
  State<EmployeeListView> createState() => _EmployeeListViewState();
}

class _EmployeeListViewState extends State<EmployeeListView> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    print(_searchQuery + "");
    List<Employee> items_ = context.read<EmployeeProvider>().employees;
    items_ = items_.where((element) {
      print(element.name);
      return element.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Column(
      children: [
        MySearchBar(
            hintText: "Search Employee Name",
            onSearch: (value) {
              setState(() {
                _searchQuery = value;
              });
            }),
        SingleChildScrollView(
          // THIS ONE SHOULD BE SCROLLABLE
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: items_.length,
              itemBuilder: (context, index) =>
                  EmployeeCard(name: items_[index].name)),
        )
      ],
    );
  }
}
