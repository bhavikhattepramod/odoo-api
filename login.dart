import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:odoo/homepage.dart';

import 'createuser.dart';
// import 'package:odoo/CreateUser.dart';
// import 'package:odoo/UserDetails.dart';
// import 'package:odoo/homepage.dart';

class Login_Page extends StatefulWidget {
  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  var login = TextEditingController();
  var password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Odoo',
              style: TextStyle(fontSize: 100, color: Colors.white),
            ),
            SizedBox(height: 25),
            Text(
              'LOGIN PAGE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 50),
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        width: 500,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          //borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Center(
                            child: TextFormField(
                              controller: login,
                              decoration: InputDecoration(labelText: 'Email'),
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                //Validator
                              },
                              // validator: (value) {
                              //   if (value!.isEmpty ||
                              //       !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              //           .hasMatch(value)) {
                              //     return 'Enter a valid email!';
                              //   }
                              //   return null;
                              // },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        width: 500,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          //borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Center(
                            child: TextFormField(
                              controller: password,
                              decoration:
                                  InputDecoration(labelText: 'Password'),
                              keyboardType: TextInputType.emailAddress,
                              onFieldSubmitted: (value) {
                                //Validator
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter a valid Password!';
                                } else if (value.length < 5) {
                                  return 'Password must be min 5 ';
                                }
                                return null;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: InkWell(
                          onTap: () async {
                            snackbar();
                            // if (_formKey.currentState!.validate()) {
                            //   print("hello");

                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => HomePage()),
                            //   );
                            // }
                            print("hello");
                            Map<String, dynamic> jsonMap = {
                              "login": login.text,
                              "password": password.text,
                            };
                            print(login.text);
                            print(password.text);
                            final response = await http.post(
                                Uri.parse(
                                    'http://206.189.135.140:8040/session/auth/login'),
                                body: jsonEncode(jsonMap),
                                headers: {
                                  "Content-type": "application/json",
                                  'Accept': '*/*'
                                });
                            if (_formKey.currentState!.validate()) {
                              if (response.statusCode.toString() == "200") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home_Page()),
                                );
                              }

                              print("Hi" + response.statusCode.toString());
                              print(jsonDecode(response.body));
                              //login();
                            }
                          },
                          child: Container(
                            //width: 500,
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void snackbar() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'Logged In Succesfully',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      // backgroundColor: Colors.grey,
      behavior: SnackBarBehavior.floating,
    ));
  }
}
