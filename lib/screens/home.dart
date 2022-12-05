import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_bus_user/screens/schedule.dart';

import 'google_map.dart';

class Route {
  Route(this.name);

   String name;
  Icon icon = Icon(
    Icons.directions_bus,
    color: const Color(0xFF167F67),
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Route> routes = [
    Route('Rout no.1'),
    Route('Rout no.2'),
    Route('Rout no.3'),
    Route('Rout no.4'),
  ];

  Route value = Route('Select A Route');
  String newValue = 'selectValue';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 30, 15, 15),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * .30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.teal.shade300,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.directions_bus_rounded),
                          ),
                          hint: Text('Select A Route'),
                          items: <String>[
                            'Route no.1',
                            'Route no.2',
                            'Route no.3',
                            'Route no.4'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(12)),
                          child: Text(
                            'Bus Timing',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black26),
                          )),
                      SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('KDA to Campus'),
                          Text(
                            '07:45AM ',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 22),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Campus to KDA'),
                          Text(
                            '01:30PM',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                InkWell(
                  onTap: () {
                    // Get.to(ScheduleScreen());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * .08,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(
                        'View Bus Schedule',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 22,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  height: MediaQuery.of(context).size.height * 0.50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/map.PNG'),
                          fit: BoxFit.fill),
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(12)),
                  child: Align(
                    alignment: Alignment.topRight,
                    heightFactor: 0.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(MapSample());
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        padding: EdgeInsets.all(15),
                        elevation: 6,
                      ),
                      child: Text('Tap to Track',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
