import 'package:flutter/material.dart';
import 'package:todo_application/layout/home_layout.dart';
import 'package:todo_application/shared/network/firebase/firebase_manager.dart';

import '../sign_up/sign_up.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "login";

  var _formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Registeration"),
          bottom: TabBar(tabs: [
            Tab(
              text: "Login",
            ),
            Tab(
              text: "Sign Up",
            ),
          ]),
        ),
        body: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (!emailValid) {
                        return "Please enter valid email";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FirebaseManager.loginAccount(emailController.text,
                            passwordController.text, () {
                          Navigator.pushNamedAndRemoveUntil(context, HomeLayout.routeName, (route) => false);
                            }, (message) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => AlertDialog(
                                    title: Text("Error"),
                                    content: Text(message.toString()),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          }, child: Text("OK"))
                                    ],
                                  ));
                            });
                      }
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Sign_Up.routeName);
                    },
                    child: const Text('Don\'t have an account? Sign up'),
                  ),
                ],
              ),
            ),
          ),
          Sign_Up()
        ]),
      ),
    );
  }
}
