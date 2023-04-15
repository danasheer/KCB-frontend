import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kcb/pages/branches.dart';
import 'package:kcb/pages/departments.dart';
import 'package:kcb/pages/employees.dart';
import 'package:kcb/pages/floors.dart';
import 'package:kcb/pages/Qrcode.dart';
import 'package:kcb/pages/monitor.dart';
import 'package:kcb/pages/printers.dart';
import 'package:kcb/pages/scanner.dart';
import 'package:kcb/providers/auth_provider.dart';
import 'package:kcb/providers/branch_provider.dart';
import 'package:kcb/widgets/sign_in.dart';
import 'package:kcb/pages/computer.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 247, 243, 243),
        appBar: AppBar(
          title: Center(
            child: Image.asset(
              'assets/images/logo.png',
              height: 100,
              width: 100,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 238, 236, 236),
          iconTheme: IconThemeData(
              color: Colors
                  .black), // Add this line to change the color of the icon on the app bar
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(213, 213, 213, 100),
                ),
                child: Container(
                  child: Center(),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context); // Close the drawer
                },
              ),
              ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    context.push('/setting123');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => QrCode(),
                    //   ),
                    // );
                  }),
              ListTile(
                leading: Icon(Icons.linear_scale),
                title: Text('Floors'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FloorPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.linear_scale),
                title: Text('Departments'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DepartmentPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.linear_scale),
                title: Text('Monitor list'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MonitorPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.linear_scale),
                title: Text('Scanners'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScannerPage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Sign Out'),
                onTap: () {
                  // Perform sign out action
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(255, 255, 255, 255),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmployeePage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.assignment_ind,
                  color: Color.fromARGB(255, 132, 128, 100),
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ComputerPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.desktop_windows,
                  color: Color.fromARGB(255, 132, 128, 100),
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BranchPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.apartment,
                  color: Color.fromARGB(255, 132, 128, 100),
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrinterPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.print,
                  color: Color.fromARGB(255, 132, 128, 100),
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        body: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            const BASEURL = 'http://10.0.2.2:8000/';
            print(provider.user?.profile!.image);
            return FutureBuilder(
                future: context.read<BranchProvider>().getBranches(),
                builder: (context, snapshot) {
                  return Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 20),
                          child: Text(
                            'Hi ${provider.user?.username ?? ''},\nGood morning',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 90,
                        ),
                        Column(
                          children: [
                            Text(""),
                            Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          "${BASEURL}${provider.user?.profile!.image}"),
                                    )))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        context.push('/branches');
                      },
                      child: Row(
                        children: [
                          Text(
                            '    All Braches',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Consumer<BranchProvider>(builder: (context, branch, child) {
                      return Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: branch.branches.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Row(
                                  children: [
                                    Text("    "),
                                    InkWell(
                                      onTap: () {
                                        context.push(
                                            '/branche/detail/${branch.branches[index].id}');
                                      },
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                                width: 100.0,
                                                // height full
                                                height: 300.0,
                                                decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                      "${branch.branches[index].image}"),
                                                ))),
                                            Center(
                                                child: Text(
                                                    "${branch.branches[index].name}")),
                                          ]),
                                    )
                                  ],
                                )),
                      );
                    }),
                  ]);
                });
          },
        ));
  }
}
            
            
            

       

            // FutureBuilder(
            //   future: context.read<BranchProvider>().getBranches(),
            //   builder: (context, snapshot) {
            //     return Consumer<BranchProvider>(
            //         builder: (context, branch, child) => SingleChildScrollView(
            //                 child: Expanded(
            //               child: ListView.builder(
            //                 shrinkWrap: true,
            //                 scrollDirection: Axis.horizontal,
            //                 itemCount: 15,
            //                 itemBuilder: (BuildContext context, int index) =>
            //                     Card(
            //                   child: Center(child: Text('Dummy Card Text')),
            //                 ),
            //               ),
            //             )));

            //     //     ListView.builder(
            //     //   shrinkWrap: true,
            //     //   scrollDirection: Axis.vertical,
            //     //   itemCount: branch.branches.length,
            //     //   itemBuilder: (context, index) {
            //     //     print(branch.branches[index].name);
            //     //     return 
            //     //   },
            //     // )));
            //   },
            // ),

//             Column(
//               children: [
//                 InkWell(
//                   onTap: () {
//                     context.push('/branches');
//                   },
//                   child: Container(
//                       margin: EdgeInsets.only(top: 20, left: 20),
//                       child:),
//                 ),

// // HERE ALL BRANCHES
//                 SizedBox(
//                   height: 20,
//                 ),

//
// ],
//             ),
      



