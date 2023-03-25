import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String specialty;
  final String imageUrl;
  final String bio;

  Doctor({
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.bio,
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
              Image(image: NetworkImage(doctor.imageUrl), fit: BoxFit.cover),
            ),
            SizedBox(height: 16.0),
            Text(
              doctor.name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              doctor.specialty,
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
  late CollectionReference _doctorsRef;
  List<Doctor> _doctors = [];

  @override
  void initState() {
    super.initState();
    _doctorsRef = FirebaseFirestore.instance.collection('doctors');

  }

  Future<void> uploadingData(String _name) async {
    await FirebaseFirestore .instance.collection("doctors").add({
      'name': _name,

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Doctors')),
      ),
      body: ListView.builder(
        itemCount: _doctors.length,
        itemBuilder: (BuildContext context, int index) {
          final doctor = _doctors[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(doctor.imageUrl),
              ),
              title: Text(doctor.name),
              subtitle: Text(doctor.specialty),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DoctorDetailPage(doctor: doctor),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
