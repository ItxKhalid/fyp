import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_bus_user/models/schedule_model.dart';

class ScheduleServices {
  ///Create Product
  Future createSchedule(ScheduleModel scheduleModel) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('scheduleCollection').doc();
    return await docRef.set(scheduleModel.toJson(docRef.id));
  }

  ///Update Product
  // Future updateSchedule(ScheduleModel scheduleModel) async {
  //   return await FirebaseFirestore.instance
  //       .collection('scheduleCollection')
  //       .doc(scheduleModel.)
  //       .update({
  //     'fromLocation': scheduleModel.fromLocation,
  //     'toLocation': scheduleModel.toLocation,
  //     'time': scheduleModel.time,
  //   });
  // }

  ///Delete Products
  Future deleteSchedule(String scheduleID) async {
    return await FirebaseFirestore.instance
        .collection('scheduleCollection')
        .doc(scheduleID)
        .delete();
  }

  ///Get All Products
  Stream<List<ScheduleModel>> streamSchedule() {
    return FirebaseFirestore.instance
        .collection('scheduleCollection')
        .snapshots()
        .map((list) => list.docs
            .map((singleDoc) => ScheduleModel.fromJson(singleDoc.data()))
            .toList());
  }
}
