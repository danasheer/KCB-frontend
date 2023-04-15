import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:kcb/providers/branch_provider.dart';
import 'package:kcb/models/branch.dart';
import 'package:kcb/widgets/branch_card.dart';

class BranchPage extends StatelessWidget {
  BranchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: const Text('My Branches',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: FutureBuilder(
              future: Provider.of<BranchProvider>(context, listen: false)
                  .getBranchesDetail(),
              builder: (context, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (dataSnapshot.error != null) {
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
                                itemCount: branch.branches.length,
                                itemBuilder: (context, index) => BranchCard(
                                    branch: branch.branches[index],
                                    name: branch.branches[index].name),
                              ),
                            ));
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
                  children: [
                    // FloatingActionButton(
                    //   onPressed: () {
                    //     // GoRouter.of(context).push('/add_branch');
                    //   },
                    //   child: const Icon(
                    //     Icons.add,
                    //   ),
                    //   backgroundColor: Colors.black,
                    // ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
