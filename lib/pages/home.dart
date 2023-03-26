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
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
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
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://mediglobus.com/wp-content/uploads/2017/08/kos-hospital7.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 300.0,
                    height: 300.0,
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://1.bp.blogspot.com/-nSny_N8FBb4/Xp6NKdbHrQI/AAAAAAAALgw/ohIQtGLmwq0qZ4WC-espdQ6G3oOyZm9mQCLcBGAsYHQ/s1600/CAH_1.3-min.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 300.0,
                    height: 300.0,
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://myhomeopat.ru/wp-content/uploads/2016/11/Depositphotos_10642817_original-1.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 300.0,
                    height: 300.0,
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://i.pinimg.com/originals/79/46/55/79465580fbc67476f1b6aee1ad6e4bd7.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 300.0,
                    height: 300.0,
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://kartinkin.net/uploads/posts/2022-03/1646709544_74-kartinkin-net-p-kartinki-poliklinika-80.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 300.0,
                    height: 300.0,
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://image.winudf.com/v2/image1/Y29tLmFrc2hhci5ob3NwaXRhbF9zY3JlZW5fMTRfMTU2NzEwMjE4OF8wMTM/screen-14.jpg?fakeurl=1&type=.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 300.0,
                    height: 300.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildServiceItem(
      BuildContext context, IconData icon, String title, String description) {
    return Container(
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
