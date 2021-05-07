import 'package:finaltask/TaskScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("What To_Doo !.",
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        leading: Icon(Icons.list),
      ),
      body: Stack(
        children: [
            Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/p5.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
            Padding(padding: EdgeInsets.only(top: 30.0, bottom: 30.0)),
            Container(
              margin: EdgeInsets.only(top: 90.0),
              child: Text(
                    "Hello!, Welcome to (What TO_DOO!) APP ,\n\n"
                    "Is a simple App to list your task and to check when finish,\n\n\n\n"
                    "So Get Started , and finish Your Task",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Center(
            child: Container(
              margin: EdgeInsets.only(top: 400.0),
              child: MaterialButton(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0 ,right: 10.0 ,left: 10.0),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskScreen(),
                    ),
                  );

                },
                child: Text("Get Started..",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(width: 2.0)
                ),
                highlightColor: Colors.grey,
                splashColor: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
