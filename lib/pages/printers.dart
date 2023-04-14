import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:kcb/providers/printer_provider.dart';
import 'package:kcb/models/printer.dart';
import '../widgets/listview_printer.dart';
import '../widgets/printer_card.dart';

class PrinterPage extends StatelessWidget {
  const PrinterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 251),
        title: const Text('Printers List',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: FutureBuilder(
              future: Provider.of<PrinterProvider>(context, listen: false)
                  .getPrinters(),
              builder: (context, dataSnapshot) {
                print(PrinterProvider().printers);
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
                    return PrinterListView();
                    // print("THIS IS ELSE");
                    // return Consumer<PrinterProvider>(
                    //   builder: (context, printer, child) =>
                    //       SingleChildScrollView(
                    //     child: ListView.builder(
                    //         shrinkWrap: true,
                    //         scrollDirection: Axis.vertical,
                    //         physics: AlwaysScrollableScrollPhysics(),
                    //         itemCount: printer.printers.length,
                    //         itemBuilder: (context, index) =>
                    //             PrinterCard(name: printer.printers[index].ip)),
                    //   ),
                    // );
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
