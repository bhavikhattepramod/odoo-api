// import 'dart:convert';
// import 'package:odoo/aaaModel.dart';
// import 'package:odoo/listModel.dart';
// import 'package:odoo/splash.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'model.dart';

// class User_Details extends StatefulWidget {
//   @override
//   // AccessState createState() => AccessState();
//   _User_DetailsState createState() => _User_DetailsState();
// }

// class _User_DetailsState extends State<User_Details> {
//   bool circular = true;
//   @override
//   void initState() {
//     super.initState();
//     getData();
//   }

//   void getData() async {
//     var res = await http.get(
//       Uri.parse(
//           "http://206.189.135.140:8040/web#cids=1&menu_id=4&action=72&active_id=7&model=res.users&view_type=list"),
//       // headers: {
//       //   "Cookie": "session_id=04dd7398452933788ca08ec145c1f41c6c3a6a18",
//       //   'Accept': '*/*'
//       // }
//     );
//     if (res.statusCode == 200) {
//       var r = json.decode(res.body);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(
//         title: const Text("User Details"),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.settings),
//             tooltip: 'Setting Icon',
//             onPressed: () {},
//           ), //IconButton
//         ],
//         leading: IconButton(
//           icon: const Icon(Icons.menu),
//           tooltip: 'Menu Icon',
//           onPressed: () {},
//         ), //IconButton
//       ),
//     ));
//   }

//   Widget dataShow(var obj) {
//     return Container(
//       height: 50,
//       width: MediaQuery.of(context).size.width,
//       child: Card(
//         color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               "Name :${obj.name}",
//               textAlign: TextAlign.start,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
