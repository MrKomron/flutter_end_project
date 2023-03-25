import 'package:flutter/material.dart';
import 'video.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VideoWidget(),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Our Services',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 1,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    children: [
                      _buildServiceItem(
                        context,
                        Icons.healing,
                        'Orthopedics',
                        'Our orthopedic specialists are experts in the treatment of bone and joint disorders, from sports injuries to arthritis.',
                      ),
                      _buildServiceItem(
                        context,
                        Icons.favorite,
                        'Cardiology',
                        'Our cardiology department is staffed by highly trained professionals who provide expert care for a range of heart conditions, from arrhythmia to heart attack.',
                      ),
                      _buildServiceItem(
                        context,
                        Icons.content_paste,
                        'Laboratory',
                        'We provide a full range of laboratory services, from routine blood tests to complex genetic testing.',
                      ),
                      _buildServiceItem(
                        context,
                        Icons.local_hospital,
                        'Emergency',
                        'Our emergency department is open 24/7 to provide immediate care for life-threatening injuries and illnesses.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceItem(BuildContext context, IconData icon, String title, String description) {
    return  Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Icon(
              icon,
              size: 48.0,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 10.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      );

  }
}
