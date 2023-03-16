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
    title: 'Doctor List',
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
              child: Image.network(doctor.imageUrl, fit: BoxFit.cover),
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



