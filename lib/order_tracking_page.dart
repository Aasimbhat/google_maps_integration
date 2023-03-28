import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTrackingPage extends StatefulWidget {

  @override
  State<OrderTrackingPage> createState() => _OrderTrackingPageState();
}

class _OrderTrackingPageState extends State<OrderTrackingPage> {
  static const LatLng sourceLocation=LatLng(34.083656, 74.797371 );
    static const LatLng destination = LatLng(28.6139, 77.2090);
 List<LatLng> polylineCoordinates=[];
 
 void getPolyPoints()async{
  PolylinePoints polylinePoints=PolylinePoints();

  PolylineResult result=await polylinePoints.getRouteBetweenCoordinates("API_KEY",
  PointLatLng(sourceLocation.latitude,sourceLocation.longitude),
  PointLatLng(destination.latitude,destination.longitude),
  
  );
  if(result.points.isEmpty){
    result.points.forEach((PointLatLng point)=> polylineCoordinates.add(LatLng(point.latitude,point.longitude)
    )
    );
    setState(() {
      
    });
  }
 }

 @override
  void initState() {
    getPolyPoints();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6751B5),
        elevation: 0,
        
        title: const Center(
          child: Text(
            
            "Track Orders",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          ),
        ),
        
      ),
      drawer: 
       Drawer(
      child: Container(
        color:Color(0xFF6751B5) ,
        child: ListView(
          children: [
            DrawerHeader(
              
              padding: EdgeInsets.zero,
              child:UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("User"),
                accountEmail: Text("User799@gmail.com"),
                currentAccountPicture:  Image.asset("assets/Avatar.png",
              ),

              ) ),
              ListTile(
                leading: Icon(
                  Icons.map,
                  color: Colors.white,
                ),
                title: Text("Map",
                textScaleFactor: 1.4,
                style: TextStyle(
                  color: Colors.white
                ),),
              ),
              ListTile(
                leading: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                title: Text("Search",
                textScaleFactor: 1.4,
                style: TextStyle(
                  color: Colors.white
                ),),
              ),
              ListTile(
                leading: Icon(
                  Icons.directions,
                  color: Colors.white,
                ),
                title: Text("Directions",
                textScaleFactor: 1.4,
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              ),
               ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: const Text("Account",
                textScaleFactor: 1.4,
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              ),
          ],
        ),
      )
    
      ),
      
      body:GoogleMap(
      initialCameraPosition:const CameraPosition(
        target: sourceLocation,
        zoom:13.5 ),
      
        polylines: {
          Polyline(
          polylineId:PolylineId("route"),
          points: polylineCoordinates, 
          )
        },
        markers: {
        const  Marker(markerId: MarkerId("source"),
          position: sourceLocation,
          ),
         const  Marker(markerId: MarkerId("destination"),
          position: destination,
          )
        },
         ),
         bottomNavigationBar: 
         Container(
          height: 80,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
            
          ),
                  color: Color(0xFF6751B5),

        ),
           child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: (){},
               icon: Icon(Icons.map_sharp,color: Colors.white,size: 30,)
               ),
               IconButton(
              onPressed: (){},
               icon: Icon(Icons.search,color: Colors.white,size: 30)
               ),
               IconButton(
              onPressed: (){},
               icon: Icon(Icons.directions,color: Colors.white,size: 30)
               ),
                IconButton(
              onPressed: (){},
               icon: Icon(Icons.person,color: Colors.white,size: 30)
               ),
          ],
        ),
          
        //   items:[
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.map_rounded,color: Colors.red,),
        //     // activeIcon: Icon(),
        //     label: "home",
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.search_off_outlined,color: Colors.red),
        //     // activeIcon: Icon(FluentSystemIcons.ic_fluent_search_filled),
        //     label: "home",
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.directions,color: Colors.red),
        //     // activeIcon: Icon(FluentSystemIcons.ic_fluent_ticket_filled),
        //     label: "home",
        //   ),
        //   BottomNavigationBarItem(
        //     icon: Icon(Icons.person,color: Colors.red),
        //     // activeIcon: Icon(FluentSystemIcons.ic_fluent_person_filled),
        //     label: "home",
        //   )
        // ], ),
         )   
    );
  }
}