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

void main() {
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
                  Image(image: AssetImage(doctor.imageUrl), fit: BoxFit.cover),
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

class Team extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. Michael Davis',
      specialty: 'Cardiologist',
      imageUrl: 'assets/images/doctor1.png',
      bio:
          'Dr. Michael Davis is a highly experienced cardiologist with over 20 years of experience. He received his medical degree from Harvard Medical School and completed his residency at Johns Hopkins Hospital.',
    ),
    Doctor(
      name: 'Dr. Sander Thompson',
      specialty: 'Dermatologist',
      imageUrl: 'assets/images/doctor2.png',
      bio:
          'Dr. Sarah Thompson is a board-certified dermatologist with a passion for helping her patients achieve healthy, beautiful skin. She received her medical degree from Stanford University School of Medicine and completed her residency at the University of California, San Francisco.',
    ),
    Doctor(
      name: 'Dr. Oliver Taylor',
      specialty: 'Pediatrician',
      imageUrl: 'assets/images/doctor3.png',
      bio:
          'Dr. Oliver Taylor is a pediatrician with a special interest in child development and behavior. He received his medical degree from the University of California, Los Angeles and completed his residency at Children\'s Hospital Los Angeles.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Doctors')),
      ),
      body: ListView.builder(
        itemCount: doctors.length,
        itemBuilder: (BuildContext context, int index) {
          final doctor = doctors[index];
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(doctor.imageUrl),
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
