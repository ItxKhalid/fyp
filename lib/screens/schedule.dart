import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smart_bus_user/models/schedule_model.dart';
import 'package:smart_bus_user/services/shedcule_services.dart';

class ScheduleScreen extends StatelessWidget {
  DateTime now = DateTime.now();
  ScheduleServices _scheduleServices = ScheduleServices();

  @override
  Widget build(BuildContext context) {
    String _formattedDate = DateFormat.yMMMEd().format(now);
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(18), topLeft: Radius.circular(18))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _formattedDate.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    DateFormat("hh:mm a").format(DateTime.now()).toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(18),
                      topLeft: Radius.circular(18))),
              child: StreamProvider.value(
                value: _scheduleServices.streamSchedule(),
                initialData: [ScheduleModel()],
                builder: (context, child) {
                  List<ScheduleModel> list = context.watch<List<ScheduleModel>>();
                  return ListView.builder(
                    itemCount: list.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ListTile(
                            title: Container(
                                margin: EdgeInsets.all(6),
                                padding: EdgeInsets.all(2),
                                color: Colors.teal.shade50,
                                child: Text(list[index].fromLocation.toString() +' to ' +list[index].toLocation.toString())),
                            trailing: Text(list[index].time.toString()),
                            leading: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.tealAccent.withOpacity(.2)),
                              child: Center(
                                child: Text((index + 1).toString()),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Divider(),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
