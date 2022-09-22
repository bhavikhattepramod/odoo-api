import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:odoo/login.dart';
import 'package:odoo/userDetails.dart';

import 'createuser.dart';

class Home_Page extends StatefulWidget {
  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login_Page()),
              );
            },
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Menu'),
              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Logout'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              GridView.extent(
                primary: true,
                padding: const EdgeInsets.all(100),
                crossAxisSpacing: 100,
                mainAxisSpacing: 10,
                maxCrossAxisExtent: 200.0,
                shrinkWrap: true,
                children: <Widget>[
                  Material(
                    color: Colors.blueAccent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Create_User()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "Create User",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                  // Material(
                  //   color: Colors.green,
                  //   child: InkWell(
                  //     onTap: () {
                  //       Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => Create_User()),
                  //       );
                  //     },
                  //     child: Container(
                  //       padding: const EdgeInsets.all(8),
                  //       child: Text(
                  //         'User Details',
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //             color: Colors.black,
                  //             fontWeight: FontWeight.bold,
                  //             fontSize: 30),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
