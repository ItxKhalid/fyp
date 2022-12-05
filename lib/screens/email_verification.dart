import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class EmailVerification extends StatelessWidget {
  const EmailVerification({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
