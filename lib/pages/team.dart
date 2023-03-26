import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  final String name;
  final String surname;
  final String profession;
  final String bio;
  final int age;
  final String photo;

  Doctor({
    required this.name,
    required this.surname,
    required this.profession,
    required this.bio,
    required this.age,
    required this.photo,
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: Team(),
  ));
}

class DoctorDetailPage extends StatelessWidget {
  final Doctor doctor;

  DoctorDetailPage({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(doctor.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child:
                  Image(image: NetworkImage(doctor.photo), fit: BoxFit.cover),
            ),
            SizedBox(height: 16.0),
            Text(
              doctor.name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              doctor.profession,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              doctor.bio,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class Team extends StatefulWidget {
  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  late Stream<QuerySnapshot<Map<String, dynamic>>> _doctorsStream;

  @override
  void initState() {
    super.initState();
    _doctorsStream =
        FirebaseFirestore.instance.collection('doctors').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Doctors')),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: _doctorsStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Doctor> doctors = [];
            snapshot.data!.docs.forEach((document) {
              doctors.add(Doctor(
                name: document['name'],
                surname: document['surname'],
                profession: document['profession'],
                age: document['age'],
                photo: document['photo'],
                bio: document['bio'],
              ));
            });
            return ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (BuildContext context, int index) {
                final doctor = doctors[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(doctor.photo),
                    ),
                    title: Text('${doctor.name}, ${doctor.surname}'),
                    subtitle:
                        Text('${doctor.profession}, ${doctor.age} years old'),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DoctorDetailPage(doctor: doctor),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
