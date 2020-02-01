import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:web_req/services/handleRequests.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> t=['null','null'],temp;
  var location;
  @override
  void initState(){ 
    getLocation(); 
    super.initState();  
  }
void getTemp()async{    
    Services loc=Services(lat: location.latitude,lon: location.longitude);
    temp=await loc.getReq();    
    setState((){
      t=temp;
    });
  }
  void getLocation()async{
    location=await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/weatr.jpeg'),
            fit: BoxFit.cover,
          )
        ),
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(vertical: 50.0,horizontal: 15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () {      
                  getTemp();
                },
                child: Text('Tap to know Current Weather'),
                color: Colors.yellowAccent,
              ),
              SizedBox(height: 10.0,),
              Text(t[1],
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              ),
              SizedBox(height: 10.0,),
              Text(t[0] +' degrees',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              ),
            ],
          ),
        )
        ),      
    );
  }
}