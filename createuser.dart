import 'dart:convert';
import 'package:odoo/access.dart';
import 'package:odoo/homepage.dart';
import 'package:odoo/splash.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Create_User extends StatefulWidget {
  @override
  State<Create_User> createState() => _Create_UserState();
}

class _Create_UserState extends State<Create_User> {
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create User"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home_Page()),
            );
          },
        ),
      ),
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
              'CREATE USER PAGE',
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
                              controller: name,
                              decoration: InputDecoration(labelText: 'Name'),
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
                              controller: email,
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
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return 'Enter a valid Password!';
                              //   } else if (value.length < 5) {
                              //     return 'Password must be min 5 ';
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
                      child: InkWell(
                          onTap: () async {
                            snack();

                            // if (_formKey.currentState!.validate()) {
                            //   print("hello");

                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => Splash()),
                            //   );
                            // }
                            print("hello");
                            Map<String, dynamic> jsonMap = {
                              "name": name.text,
                              "email": email.text,
                              "password": password.text,
                            };
                            print(name.text);
                            print(email.text);
                            print(password.text);
                            final response = await http.post(
                                Uri.parse(
                                    'http://206.189.135.140:8040/my_services_api/partner/create_user'),
                                body: jsonEncode(jsonMap),
                                headers: {
                                  "Content-type": "application/json",
                                  "Cookie":
                                      "session_id=04dd7398452933788ca08ec145c1f41c6c3a6a18",
                                  'Accept': '*/*'
                                });
                            if (_formKey.currentState!.validate()) {
                              if (response.statusCode.toString() == "200") {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Access()),
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
                                'Create ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          )),
                    ),
                  ],
                )),
          ],
        ),
      ),
      //   ],
      // ),
      // ),
    );
  }

  void snack() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        'User Created Succesfully',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 2),
      // backgroundColor: Colors.grey,
      behavior: SnackBarBehavior.floating,
    ));
  }
}
