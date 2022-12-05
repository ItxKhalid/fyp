import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../models/user_model.dart';
import '../services/auth_services.dart';
import '../services/user_services.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthServices _authServices = AuthServices();
  bool isLoading = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController regNoController = TextEditingController();
  TextEditingController semesterController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  TextEditingController _confirmPwd = TextEditingController();
  UserServices _userServices = UserServices();

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading:isLoading,
      child: Scaffold(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    'Please sign up for the service\n'
                        '            of KUST busses',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Center(
                  child: Text(
                    'Fill name-email-student ID-password & verify\n'
                        '            your email for get access',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const SignIn()));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * .08,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * .08,
                        decoration: BoxDecoration(
                            color: Colors.cyan,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        hintText: 'Full name',
                        hintStyle: TextStyle(color: Colors.black45),
                        prefixIcon: Icon(
                          Icons.perm_identity,
                          color: Colors.black45,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                color: Colors.black12,
                                width: 2,
                                style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                              color: Colors.cyan,
                              width: 2,
                            ))),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: regNoController,
                    decoration: InputDecoration(
                        hintText: 'Student ID',
                        hintStyle: TextStyle(color: Colors.black45),
                        prefixIcon: Icon(
                          Icons.tag,
                          color: Colors.black45,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                color: Colors.black12,
                                width: 2,
                                style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan, width: 2),
                            borderRadius: BorderRadius.circular(18))),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: semesterController,
                    decoration: InputDecoration(
                        hintText: 'Semester',
                        hintStyle: TextStyle(color: Colors.black45),
                        prefixIcon: Icon(
                          Icons.tag,
                          color: Colors.black45,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                color: Colors.black12,
                                width: 2,
                                style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan, width: 2),
                            borderRadius: BorderRadius.circular(18))),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        hintText: ' Email',
                        hintStyle: TextStyle(color: Colors.black45),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.black45,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                color: Colors.black12,
                                width: 2,
                                style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan, width: 2),
                            borderRadius: BorderRadius.circular(18))),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: mobileController,
                    decoration: InputDecoration(
                        hintText: ' Phone No',
                        hintStyle: TextStyle(color: Colors.black45),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: Colors.black45,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                color: Colors.black12,
                                width: 2,
                                style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan, width: 2),
                            borderRadius: BorderRadius.circular(18))),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _pwdController,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.black45),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.black45,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                color: Colors.black12,
                                width: 2,
                                style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan, width: 2),
                            borderRadius: BorderRadius.circular(18))),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: TextFormField(
                    controller: _confirmPwd,
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.black45),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.black45,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide(
                                color: Colors.black12,
                                width: 2,
                                style: BorderStyle.solid)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.cyan, width: 2),
                            borderRadius: BorderRadius.circular(18))),
                    obscureText: true,
                  ),
                ),
                SizedBox(height: 10),
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
                        constraints:
                        BoxConstraints(maxWidth: 300, minHeight: 150),
                        alignment: Alignment.center,
                        child: Text('Sign up',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    onPressed: () {
                      if (_pwdController.text == _confirmPwd.text) {
                        makeLoadingTrue();
                        _authServices
                            .registerUser(
                            email: _emailController.text,
                            password: _pwdController.text)
                            .then((value) async{
                          await _userServices.createUser(UserModel(
                            docId: value.user.uid,
                            email: _emailController.text,
                            contactNumber: mobileController.text,
                            name: nameController.text,
                            registrationNo: regNoController.text,
                            semester: semesterController.text,
                          ));
                          makeLoadingFalse();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: Text("Message!"),
                                  content:
                                  Text("You have successfully registered."),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Okay'))
                                  ],
                                );
                              });
                        }).onError((error, stackTrace) {
                          makeLoadingFalse();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: Text("Message!"),
                                  content: Text(error.toString()),
                                  actions: [
                                   TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Okay'))
                                  ],
                                );
                              });
                        });
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text("Message!"),
                                content: Text('Password does not match.'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Okay'))
                                ],
                              );
                            });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  makeLoadingFalse() {
    isLoading = false;
    setState(() {});
  }

  makeLoadingTrue() {
    isLoading = true;
    setState(() {});
  }
}
