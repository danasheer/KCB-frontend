import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/text.dart';
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

          // title: Text(
          //   'KCB',
          //   style:
          //       TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          // ),

          backgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
