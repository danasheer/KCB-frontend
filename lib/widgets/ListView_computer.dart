import 'package:flutter/material.dart';
import 'package:kcb/models/computer.dart';
import 'package:provider/provider.dart';

import '../providers/computer_provider.dart';
import 'computer_card.dart';
import 'mySearchBar.dart';

class MYLISTVIEW extends StatefulWidget {
  @override
  State<MYLISTVIEW> createState() => _MYLISTVIEWState();
}

class _MYLISTVIEWState extends State<MYLISTVIEW> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    print(_searchQuery + " =================00");
    List<Computer> items_ = context.read<ComputerProvider>().computers;
    items_ = items_.where((element) {
      print(element.computername);
      return element.computername
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
    }).toList();

    return Column(
      children: [
        MySearchBar(
            hintText: "Search Computer Name",
            onSearch: (value) {
              setState(() {
                _searchQuery = value;
              });
            }),
        SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: items_.length,
              itemBuilder: (context, index) =>
                  ComputerCard(name: items_[index].computername)),
        )
      ],
    );
  }
}
