import 'package:flutter/material.dart';
import 'home.dart';
import 'team.dart';
import 'settings.dart';
import 'login.dart';
import 'contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QuizApp(),
    );
  }
}



class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(

              title: Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    scale: 4,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Medical Center'),
                ],
              ),


            ),
            bottomNavigationBar: TabBar(
                indicatorColor: Colors.blueAccent,
                labelColor: Colors.blueAccent,
                tabs: [

                  Tab(icon:Icon(Icons.people, size: 35,)),
                  Tab(icon:Icon(Icons.phone, size: 35,)),
                  Tab(icon:Icon(Icons.logout, size: 35,)),
                  Tab(icon:Icon(Icons.settings, size: 35,)),

                ]
            ),
            body: TabBarView(
              children: [

                Team(),
                Contact(),
                Login(),
                Settings(),

              ],
            )
        )
    );
  }
}

