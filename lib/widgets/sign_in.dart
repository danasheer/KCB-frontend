import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class SignIn extends StatelessWidget {
  SignIn({
    super.key,
    required this.usernameController,
    required this.passwordController,
  });

  String usernameController = "";
  String passwordController = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset('assets/images/logo.png', width: 700),
          const Text("User Login",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29)),
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (newValue) => usernameController = newValue!,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: "Username",
                  ),
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onSaved: (newValue) => passwordController = newValue!,
                  obscureText: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.lock),
                    labelText: "Password",
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                await context.read<AuthProvider>().signin(
                    username: usernameController, password: passwordController);

                context.read<AuthProvider>().isAuth
                    ? GoRouter.of(context).push('/home')
                    : null;
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please enter a valid username and password'),
                  ),
                );
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            child: const Text(
              "Log In",
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              "Not a member? ",
              style: TextStyle(fontSize: 16.0),
            ),
            InkWell(
              onTap: () => {context.push("/sign_up")},
              child: Text(
                "Sign up!",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Color.fromARGB(255, 127, 112, 175),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(29)),
    );
  }
}
