import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_bus_user/screens/profile_screen.dart';
import 'package:smart_bus_user/screens/schedule.dart';
import 'package:smart_bus_user/screens/signin.dart';

import 'home.dart';
import 'notification.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _myIndex = 0;
  List<Widget> _pages = [
    Home(),
    ScheduleScreen(),
    NotificationScreen(),
    ProfilePage(),
  ];

  void onItemTap(int index) {
    setState(() {
      _myIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _myIndex,
            selectedIconTheme: IconThemeData(size: 30),
            unselectedItemColor: Colors.black26,
            selectedItemColor: Colors.black,
            onTap: onItemTap,
            iconSize: 20,
            type: BottomNavigationBarType.shifting,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                 ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: 'Schedule',),
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                 label: 'Notification'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                 label: 'Profile'),
            ],
          ),
          drawer: Drawer(
            child: Container(
              width: MediaQuery.of(context).size.width * .3,
              // color: Colors.red,
              child: Column(
                children: [
                  Image.asset(
                    'assets/Kustlogo.jpg',
                    width: 300,
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.add_location_rounded),
                    title: Text('Bannu Road, near Jarma Bridge, Kohat, Khyber Pakhtunkhwa'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('0922-5291501'),
                    onTap: () {Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));},
                  ),
                  ListTile(
                    leading: Icon(Icons.print),
                    title: Text('0922-554556'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.email_outlined),
                    title: Text('webmaster@kust.edu.pk'),
                    onTap: (){},
                  ),
                  ListTile(
                    leading: Icon(Icons.link),
                    title: Text('http://kust.edu.pk'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: (MediaQuery.of(context).size.width * .25)),
                  child: Image.asset('assets/download.jpg',
                      fit: BoxFit.cover, width: 40),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Kohat University \nof Science & Technology',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            backgroundColor: Colors.white,
          ),
          body: Center(
            child: _pages[_myIndex],
          ),
        ),
      ),
    );
  }
}
