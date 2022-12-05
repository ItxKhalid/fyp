// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) =>
    json.encode(data.toJson(data.docId.toString()));

class UserModel {
  UserModel({
    this.docId,
    this.email,
    this.contactNumber,
    this.name,
    this.registrationNo,
    this.semester
  });

  String docId;
  String email;
  String contactNumber;
  String name;
  String semester;
  String registrationNo;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    docId: json["docID"],
    email: json["email"],
    contactNumber: json["contactNumber"],
    name: json["name"],
    semester: json["semester"],
    registrationNo: json["registrationNo"],
  );

  Map<String, dynamic> toJson(String docID) => {
    "docID": docID,
    "email": email,
    "contactNumber": contactNumber,
    "name": name,
    "semester":semester,
    "registrationNo":registrationNo,
  };
}