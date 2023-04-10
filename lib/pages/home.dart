import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kcb/pages/branches.dart';
import 'package:kcb/pages/departments.dart';
import 'package:kcb/pages/employees.dart';
import 'package:kcb/pages/floors.dart';
import 'package:kcb/pages/monitor.dart';
import 'package:kcb/pages/printers.dart';
import 'package:kcb/pages/scanner.dart';
import 'package:kcb/widgets/sign_in.dart';
import 'package:kcb/pages/computer.dart';

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
              child: Center(
                  // child: Text(
                  //   'Drawer Header',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 24,
                  //   ),
                  // ),
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
                // Navigate to the Settings page
              },
            ),
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
      body: Center(
        child: Text('Homepage'),
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
    );
  }
}
