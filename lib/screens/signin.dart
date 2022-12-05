import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:provider/provider.dart';
import 'package:smart_bus_user/screens/sign_up.dart';
import 'package:smart_bus_user/screens/turnon_location.dart';

import '../providers/user_provider.dart';
import '../services/auth_services.dart';
import '../services/user_services.dart';
import 'home.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  final AuthServices _authServices = AuthServices();

  bool isLoading = false;

  final UserServices _userServices = UserServices();

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: isLoading,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
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
                const SizedBox(
                  width: 8,
                ),
                Container(
                    padding: const EdgeInsets.only(top: 1),
                    child: const Text(
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 110,
                  ),
                  const Center(
                    child: Text(
                      'Please sign in for the service\n'
                      '            of KUST busses',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Enter your registered email or Student ID &\n'
                    '                  password to Sign in',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                          onTap: () {},
                          child: Container(
                              width: MediaQuery.of(context).size.width * .4,
                              height: MediaQuery.of(context).size.height * .08,
                              decoration: BoxDecoration(
                                  color: Colors.cyan,
                                  borderRadius: BorderRadius.circular(12)),
                              child: const Center(
                                  child: Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )))),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * .4,
                            height: MediaQuery.of(context).size.height * .08,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(12)),
                            child: const Center(
                                child: Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            )),
                          )),
                      const SizedBox(
                        width: 20,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          hintText: 'Email/Student ID',
                          hintStyle: const TextStyle(color: Colors.black45),
                          prefixIcon: const Icon(Icons.email_outlined,
                              color: Colors.black45),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                  color: Colors.black12,
                                  width: 2.0,
                                  style: BorderStyle.solid)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: const BorderSide(
                                  color: Colors.cyan, width: 2.0)))),
                  const SizedBox(height: 20),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        controller: _pwdController,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: Colors.black45),
                            hintStyle: const TextStyle(color: Colors.black45),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: const BorderSide(
                                    color: Colors.black12,
                                    width: 2.0,
                                    style: BorderStyle.solid)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: const BorderSide(
                                    color: Colors.cyan, width: 2.0))),
                        obscureText: true,
                      )),
                  const SizedBox(height: 10),
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 300, minHeight: 150),
                          alignment: Alignment.center,
                          child: const Text('Sign in',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      onPressed: () {
                        makeLoadingTrue();
                        _authServices
                            .loginUser(
                                email: _emailController.text,
                                password: _pwdController.text)
                            .then((firebaseUser) async {
                          makeLoadingFalse();
                          await _userServices
                              .fetchUserRecord(
                                  firebaseUser.user.uid.toString())
                              .first
                              .then((userData) async {
                            print(userData.toJson('docID'));
                            Provider.of<UserProvider>(context, listen: false)
                                .saveUserData(userData);

                            // await storage.write(key: 'LOGIN_STATUS', value: 'exist');
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TurnOnLocation()));
                        }).onError((error, stackTrace) {
                          makeLoadingFalse();
                          showDialog(
                              context: context,
                              builder: (context) {
                                return CupertinoAlertDialog(
                                  title: const Text("Message!"),
                                  content: Text(error.toString()),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Okay'))
                                  ],
                                );
                              });
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
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
