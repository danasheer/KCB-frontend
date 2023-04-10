import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:kcb/providers/floors_provider.dart';
import 'package:kcb/models/floor.dart';
import '../widgets/floor_card.dart';

class FloorPage extends StatelessWidget {
  const FloorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 250, 251),
        title: const Text('Floors',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            child: FutureBuilder(
              future: Provider.of<FloorsProvider>(context, listen: false)
                  .getFloors(),
              builder: (context, dataSnapshot) {
                if (dataSnapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (dataSnapshot.error != null) {
                    print(dataSnapshot.error);
                    print(FloorsProvider().floors);
                    return const Center(
                      child: Text('An error occurred'),
                    );
                  } else {
                    return Consumer<FloorsProvider>(
                      builder: (context, floor, child) => SingleChildScrollView(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: floor.floors.length,
                            itemBuilder: (context, index) =>
                                FloorCard(number: floor.floors[index].number)),
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
