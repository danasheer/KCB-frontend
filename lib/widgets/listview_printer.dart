import 'package:flutter/material.dart';
import 'package:kcb/models/printer.dart';
import 'package:provider/provider.dart';

import '../providers/printer_provider.dart';
import 'printer_card.dart';
import 'mySearchBar.dart';

class PrinterListView extends StatefulWidget {
  @override
  State<PrinterListView> createState() => _PrinterListViewState();
}

class _PrinterListViewState extends State<PrinterListView> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    print(_searchQuery + "");
    List<Printer> items_ = context.read<PrinterProvider>().printers;
    items_ = items_.where((element) {
      print(element.ip);
      return element.ip.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Column(
      children: [
        MySearchBar(
            hintText: "Search Printer IP",
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
                  PrinterCard(name: items_[index].ip)),
        )
      ],
    );
  }
}
