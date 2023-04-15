import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kcb/pages/branch_detail.dart';
import 'package:kcb/pages/computer.dart';
import 'package:kcb/pages/department_datail.dart';
import 'package:kcb/pages/departments.dart';
import 'package:kcb/pages/depatment_employee.dart';
import 'package:kcb/pages/employees.dart';
import 'package:kcb/pages/floors.dart';
import 'package:kcb/pages/home.dart';
import 'package:kcb/pages/Qrcode.dart';
import 'package:kcb/pages/landing.dart';
import 'package:kcb/pages/login.dart';
import 'package:kcb/pages/branches.dart';
import 'package:kcb/pages/monitor.dart';
import 'package:kcb/pages/printers.dart';
import 'package:kcb/pages/scanner.dart';
import 'package:kcb/providers/auth_provider.dart';
import 'package:kcb/providers/branch_provider.dart';
import 'package:kcb/providers/computer_provider.dart';
import 'package:kcb/providers/department_provider.dart';
import 'package:kcb/providers/employee_provider.dart';
import 'package:kcb/providers/floors_provider.dart';
import 'package:kcb/providers/monitor_provider.dart';
import 'package:kcb/providers/printer_provider.dart';
import 'package:kcb/providers/scanner_provider.dart';
import 'package:provider/provider.dart';

//ComputerProvider
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => AuthProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => BranchProvider(),
      ),
      ChangeNotifierProvider(create: (_) => ComputerProvider()),
      ChangeNotifierProvider(create: (_) => PrinterProvider()),
      ChangeNotifierProvider(create: (_) => EmployeeProvider()),
      ChangeNotifierProvider(create: (_) => FloorsProvider()),
      ChangeNotifierProvider(create: (_) => DepartmentProvider()),
      ChangeNotifierProvider(create: (_) => MonitorProvider()),
      ChangeNotifierProvider(create: (_) => ScannerProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }

  final _router = GoRouter(
    // initialLocation: '/setting123',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LandingPage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LogIn(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => Homepage(),
      ),
      GoRoute(
        path: '/branches',
        builder: (context, state) => BranchPage(),
      ),
      GoRoute(
        path: '/computers',
        builder: (context, state) => ComputerPage(),
      ),
      GoRoute(
        path: '/printers',
        builder: (context, state) => PrinterPage(),
      ),
      GoRoute(
        path: '/employees',
        builder: (context, state) => EmployeePage(),
      ),
      GoRoute(
        path: '/floors',
        builder: (context, state) => FloorPage(),
      ),
      GoRoute(
        path: '/floors',
        builder: (context, state) => DepartmentPage(),
      ),
      GoRoute(
        path: '/monitor',
        builder: (context, state) => MonitorPage(),
      ),
      GoRoute(
        path: '/scanner',
        builder: (context, state) => ScannerPage(),
      ),
      GoRoute(
        path: '/setting123',
        builder: (context, state) => QrCode(),
      ),
      GoRoute(
        path: '/depatment/detail/:id',
        builder: (context, state) => DepartmentDetailPage(
          id: state.params['id']!,
        ),
      ),
      GoRoute(
        path: '/department/employee/:id',
        builder: (context, state) => DepartmentEmployeePage(
          id: state.params['id']!,
        ),
      ),
      GoRoute(
        path: '/branch/department/:id',
        builder: (context, state) => BranchDetailPage(
          id: state.params['id']!,
        ),
      ),
      GoRoute(
        path: '/branche/detail/:id',
        builder: (context, state) => BranchDetailPage(
          id: state.params['id']!,
        ),
      ),
    ],
  );
}
