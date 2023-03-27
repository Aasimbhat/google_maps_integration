import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTrackingPage extends StatefulWidget {

  @override
  State<OrderTrackingPage> createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  static const LatLng sourceLocation=LatLng(37.33500926, -122.03272188);
    static const LatLng destination = LatLng(37.33429383, -122.06600055);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Track Order",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16
          ),
        ),
        
      ),
      body:GoogleMap(
        initialCameraPosition:CameraPosition(
          target: sourceLocation,
          zoom:13.5 ),
          markers: {
            Marker(markerId: MarkerId("source"),
            position: sourceLocation,
            ),
             Marker(markerId: MarkerId("destination"),
            position: destination,
            )
          },
           ),
          
    );
  }
}