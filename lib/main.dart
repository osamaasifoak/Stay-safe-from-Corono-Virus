import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'Constant/routes.dart';
import 'home.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
          Routes.home : (context)=>Home()
        },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushReplacementNamed(context, Routes.home);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:<Widget>[
            Container(
              height: MediaQuery.of(context).size.height/5,
              child: Image.asset('assets/covid-virus.png')
            ),
            Text("Stay Safe from Corona",style: TextStyle(fontSize:30,color: Colors.black54,fontWeight: FontWeight.bold),),
            SpinKitSquareCircle(
              color: Colors.red,
              size: 50.0,
            )
          ]
      ),
    );
  }
}