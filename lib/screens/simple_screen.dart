import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimpleRoute extends StatelessWidget {
  final Color bgcolor=Color(0xff000000);
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body:Padding(
          padding: const EdgeInsets.symmetric(horizontal:18),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back,size:20,),

                  Image.asset('assets/kust2.jpg')
                ],
              ),
              Text(""),
              Text(""),
              Row(children: [
                GestureDetector(
                  child: Container(
                    height:80,
                    width: 80,
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(12),
                      color:bgcolor,
                    ),

                  ),
                  onTap:(){
                    
                  },
                ),

              ],)
            ],
          ),
        ),
      ),
    );
  }
}
