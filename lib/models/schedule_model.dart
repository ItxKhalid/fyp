
import 'dart:convert';


class ScheduleModel {
  ScheduleModel({
    this.fromLocation,
    this.toLocation,
    this.time
  });

  String fromLocation;
  String toLocation;
  String time;


  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
    fromLocation: json["fromLocation"],
    toLocation: json["toLocation"],
    time: json["time"],

  );

  Map<String, dynamic> toJson(String docID) => {
    "fromLocation": fromLocation,
    "toLocation": toLocation,
    "time": time,
  };
}