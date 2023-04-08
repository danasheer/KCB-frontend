import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/text.dart';
import 'package:kcb/pages/branches.dart';
import 'package:kcb/widgets/sign_in.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/logo.png'),
      )),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Center(
              child: Image.asset('assets/images/logo.png',
                  height: 100, width: 100)),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color.fromARGB(255, 255, 255, 255),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 132, 128, 100),
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.assignment_ind,
                  color: Color.fromARGB(255, 132, 128, 100),
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.desktop_windows,
                  color: Color.fromARGB(255, 132, 128, 100),
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BranchPage()));
                },
                icon: const Icon(
                  Icons.apartment,
                  color: Color.fromARGB(255, 132, 128, 100),
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.adf_scanner,
                  color: Color.fromARGB(255, 132, 128, 100),
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
