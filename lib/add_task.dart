import 'package:finaltask/taskList.dart';
import 'package:flutter/material.dart';



class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}


class _AddTaskState extends State<AddTask> {
  void Add_Tasks(String task){
    TaskList.tasks.add(task);
    print(TaskList.tasks);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Add Task! ...",
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
          Center(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                icon: Icon(Icons.input,color: Colors.white,),
                hintText: 'Add your task !',
                hintStyle: TextStyle(
                  fontSize: 19,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(width: 3.0)
                )
              ),
              keyboardType: TextInputType.text,
              onSubmitted: (task)=> Add_Tasks(task),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 400.0),
              child: MaterialButton(
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0 ,right: 10.0 ,left: 10.0),
                onPressed: (){
                  setState(() {

                  });
                  Navigator.popUntil(context, ModalRoute.withName("TaskScreen"));
                  },
                child: Text("Add",
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
          ),
        ],
      ),
    );
  }
}
