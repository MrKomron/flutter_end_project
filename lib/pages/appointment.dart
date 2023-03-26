// import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data from Firebase',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Fetch Data from Firebase"),
//       ),
//    floatingActionButton: FloatingActionButton(
//      onPressed: ()=>FirebaseFirestore.instance.collection('users').add({'timestamp':Timestamp.fromDate(DateTime.now())}),
//      child: Icon(Icons.add),
//    ),
//   body: StreamBuilder(
//     stream: FirebaseFirestore.instance.collection('users').snapshots(),
//   ),
//     )
//
//   }
// }
