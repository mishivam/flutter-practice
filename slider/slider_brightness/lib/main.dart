import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  
  home:MyApp(),
));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int brightness=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title:Text("Brightness",
          style:TextStyle(
            fontSize:20,
            color:Colors.red[900-brightness]
          )
        )
      ),      
      body:Container(
        color:Colors.grey[900-brightness] ,
        child:Slider.adaptive(
          value:brightness.toDouble(),
          onChanged: (newBrightness){
            setState(()=>brightness=newBrightness.toInt());
          },
          min: 0,
          max:800,
          divisions: 8,
          label:"$brightness",
          activeColor: Colors.red[900],
          inactiveColor: Colors.red[900],
        )
      )
    );
  }
}
