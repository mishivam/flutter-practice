import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home:AppBar1(),
  )
);

class AppBar1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title:Row(
          children: <Widget>[
            Image.asset(
              'assets/email.png',
              height:50
            ),
            SizedBox(width:15),
            Text("Email"),
            
          ],
        ),
        actions:<Widget>[
            FlatButton.icon(
              onPressed:(){},
              icon:Icon(Icons.person,color:Colors.white),
              label: Text("Sign Out",style: TextStyle(color:Colors.white),),
            )
          ]
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(horizontal:80,vertical: 180),
        child: Column(
          children: <Widget>[
            new Text("Welcome",style: TextStyle(color:Colors.blue,fontSize:35,fontWeight: FontWeight.bold)),
            new Text("This is",style: TextStyle(color:Colors.white,fontSize:18,fontWeight: FontWeight.bold)),
            new Text("TheSaiyanMan",style: TextStyle(color:Colors.blue,fontSize:35,fontWeight: FontWeight.bold)), 
            new Text("Please Subscribe",style: TextStyle(color:Colors.white,fontSize:20,fontWeight: FontWeight.bold)),
          ],
        ),
      )
      
    );
  }
}


