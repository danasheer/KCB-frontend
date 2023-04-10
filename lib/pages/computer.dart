import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:kcb/providers/computer_provider.dart';
import 'package:kcb/models/computer.dart';
import '../widgets/computer_card.dart';

class ComputerPage extends StatelessWidget {
  const ComputerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 251),
        title: const Text('Computer List',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: FutureBuilder(
              future: Provider.of<ComputerProvider>(context, listen: false)
                  .getComputers(),
              builder: (context, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (dataSnapshot.error != null) {
                    print(dataSnapshot.error);
                    print(ComputerProvider().computers);
                    return const Center(
                      child: Text('An error occurred'),
                    );
                  } else {
                    return Consumer<ComputerProvider>(
                      builder: (context, computer, child) =>
                          SingleChildScrollView(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: computer.computers.length,
                            itemBuilder: (context, index) => ComputerCard(
                                name: computer.computers[index].computername)),
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

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';
// import 'package:kcb/providers/computer_provider.dart';
// import 'package:kcb/models/computer.dart';
// import '../widgets/computer_card.dart';

// class ComputerPage extends StatefulWidget {
//   const ComputerPage({super.key});

//   @override
//   _ComputerPageState createState() => _ComputerPageState();
// }

// class _ComputerPageState extends State<ComputerPage> {
//   String _searchQuery = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 250, 250, 251),
//         title: const Text('Computer List',
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 16.0),
//             child: TextField(
//               onChanged: (value) {
//                 setState(() {
//                   _searchQuery = value;
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search by computer name',
//                 border: InputBorder.none,
//                 fillColor: Colors.grey[100],
//                 filled: true,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.symmetric(vertical: 10.0),
//             child: FutureBuilder(
//               future: Provider.of<ComputerProvider>(context, listen: false)
//                   .getComputers(),
//               builder: (context, dataSnapshot) {
//                 if (dataSnapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 } else {
//                   if (dataSnapshot.error != null) {
//                     print(dataSnapshot.error);
//                     print(ComputerProvider().computers);
//                     return const Center(
//                       child: Text('An error occurred'),
//                     );
//                   } else {
//                     final filteredComputers =
//                         Provider.of<ComputerProvider>(context, listen: false)
//                             .computers
//                             .where((computer) => computer.computername
//                                 .toLowerCase()
//                                 .contains(_searchQuery.toLowerCase()))
//                             .toList();

//                     return Consumer<ComputerProvider>(
//                       builder: (context, computer, child) =>
//                           SingleChildScrollView(
//                         child: ListView.builder(
//                             shrinkWrap: true,
//                             scrollDirection: Axis.vertical,
//                             physics: AlwaysScrollableScrollPhysics(),
//                             itemCount: filteredComputers.length,
//                             itemBuilder: (context, index) => ComputerCard(
//                                 name: filteredComputers[index].computername)),
//                       ),
//                     );
//                   }
//                 }
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(30.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [],
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
