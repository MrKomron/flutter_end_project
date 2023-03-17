import 'package:flutter/material.dart';
import './pages/home.dart';
import './pages/team.dart';
import './pages/meditaion.dart';
import './pages/login.dart';
import './pages/contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MedicalCenter(),
    );
  }
}

class MedicalCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
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
                  Tab(
                      icon: Icon(
                    Icons.home,
                    size: 35,
                  )),
                  Tab(
                      icon: Icon(
                    Icons.people,
                    size: 35,
                  )),
                  Tab(
                      icon: Icon(
                    Icons.logout,
                    size: 35,
                  )),
                  Tab(
                      icon: Icon(
                    Icons.phone,
                    size: 35,
                  )),
                  Tab(
                      icon: Icon(
                    Icons.more_horiz,
                    size: 35,
                  )),
                ]),
            body: TabBarView(
              children: [
                HomePage(),
                Team(),
                Login(),
                ContactPage(),
                Meditaion(),
              ],
            )
        )
    );
  }
}
