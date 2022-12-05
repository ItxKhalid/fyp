import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';

class TurnOnLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: 20,
        centerTitle: false,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35),
              child: Image.asset('assets/download.jpg',
                  fit: BoxFit.cover, width: 50),
            ),
            SizedBox(
              width: 8,
            ),
            Container(
                padding: const EdgeInsets.only(top: 1),
                child: Text(
                  'Kohat University \nof Science & Technology',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 180,
            ),
            Center(
              child: CircleAvatar(
                child: Image.asset(
                  'assets/location.png',
                  fit: BoxFit.cover,
                ),
                radius: 100,
                backgroundColor: Colors.transparent,
              ),
            ),
            Center(
                child: Text(
              'Please Turnon Your Location',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            )),
            SizedBox(
              height: 25,
            ),
            Center(
                child: Text(
              '     If you do not on your location, you will be not able to see how far your bus from you.',
              style: TextStyle(color: Colors.black45, fontSize: 14),
            )),
            Container(
              height: 60,
              margin: EdgeInsets.all(30),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.blue, Colors.black],
                    begin: Alignment.topRight,
                    end: Alignment.centerLeft,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(

                child: Ink(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300, minHeight: 150),
                    alignment: Alignment.center,
                    child: Text('Turn On',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DashboardScreen()));
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
