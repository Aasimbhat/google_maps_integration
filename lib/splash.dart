import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_app/order_tracking_page.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(0xFF6751B5),
      body: Stack(
        children:[ Center(
          child:Lottie.network("https://assets4.lottiefiles.com/packages/lf20_kx6a1byu.json"),
          
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 290),
          child:
           Center(child: Text("Welcome to the directions app ",
           style: TextStyle(fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white)))),
        SizedBox(height: 60),
        GestureDetector(
          onTap: (){
            Get.to(()=>OrderTrackingPage());
          },
          child: Center(
            child: Container(
              
              margin: EdgeInsets.only(top: 440),
              height: 60,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.purple[400],
                borderRadius: BorderRadius.circular(20)
              ),
              child: Center(
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 80),
                      child: Text("Directions",
                      style: TextStyle(fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.forward,color: Colors.white,size: 40,)
                  ],
                ),
              ),
            ),
          ),
        )
        ]
      ),
    
    );
  }
}