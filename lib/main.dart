import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_end_project/firebase_options.dart';
import './pages/home.dart';
import './pages/team.dart';
import './pages/meditaion.dart';
import './pages/contact.dart';
import 'authentication/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
          body: WillPopScope(
            onWillPop: () async => !Navigator.of(context).userGestureInProgress,
            child: TabBarView(
              children: [
                HomePage(),
                Team(),
                LoginPage(),
                ContactPage(),
                Meditaion(),
              ],
            ),
          ),
        ));
  }
}
