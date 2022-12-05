import 'package:flutter/material.dart';
import 'package:smart_bus_user/screens/signin.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key key}) : super(key: key);

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
            const SizedBox(
              width: 8,
            ),
            Container(
                padding: const EdgeInsets.only(top: 1),
                child: const Text(
                  'Kohat University \n of Science & Technology',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ))
          ],
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 180,
            ),
            Center(
              child: CircleAvatar(
                child: Image.asset(
                  'assets/buus.jpg',
                  fit: BoxFit.cover,
                ),
                radius: 100,
                backgroundColor: Colors.transparent,
              ),
            ),
            const Center(
                child: Text(
              'Kohat University \nbus tracking app',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            )),
            const SizedBox(
              height: 25,
            ),
            const Center(
                child: Text(
              'Getting your day to day bus tracking update!',
              style: TextStyle(color: Colors.black45, fontSize: 14),
            )),
            Container(
              height: 60,
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
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
                    constraints: const BoxConstraints(maxWidth: 300, minHeight: 150),
                    alignment: Alignment.center,
                    child: const Text('Get Started',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignIn()));
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
