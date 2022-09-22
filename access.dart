import 'dart:convert';
import 'package:odoo/aaaModel.dart';
import 'package:odoo/homepage.dart';
import 'package:odoo/listModel.dart';
import 'package:odoo/splash.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model.dart';

class Access extends StatefulWidget {
  @override
  // AccessState createState() => AccessState();
  _AccessState createState() => _AccessState();
}

class _AccessState extends State<Access> {
  // AaaModel aaaModel = AaaModel();
  ListModel listModel = ListModel();

  // List products = [];
  // var item;
  bool circular = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var res = await http.get(
        Uri.parse(
            "http://206.189.135.140:8040/my_services_api/partner/fetch_groups"),
        headers: {
          "Cookie": "session_id=04dd7398452933788ca08ec145c1f41c6c3a6a18",
          'Accept': '*/*'
        });
    if (res.statusCode == 200) {
      var r = json.decode(res.body);
      setState(() {
        listModel = ListModel.fromJson(r);
        circular = false;
        // ApiModel.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Access Rights"),
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
        // endDrawer: Drawer(
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: [
        //       const DrawerHeader(
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //         ),
        //         child: Text('Menu'),
        //       ),
        //       ListTile(
        //         title: const Text('Settings'),
        //         onTap: () {},
        //       ),
        //       ListTile(
        //         title: const Text('Logout'),
        //         onTap: () {},
        //       ),
        //     ],
        //   ),
        // ),
        body: Center(
            child: circular
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: listModel.groups_list!.length,
                    itemBuilder: (BuildContext context, int index) =>
                        dataShow(listModel.groups_list![index]))),
      ),
    );
  }

  Widget dataShow(var obj) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              "Name :${obj.name}",
              textAlign: TextAlign.start,
            )
          ],
        ),
      ),
    );
  }
}
