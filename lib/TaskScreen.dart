import 'package:finaltask/main.dart';
import 'package:finaltask/taskList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'add_task.dart';

var CHECK = Icons.check_circle_outline;

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

int s = 0;

class _TaskScreenState extends State<TaskScreen> {
  String value;
  String Value(String task) {
    value = task;
  }

  void Add_Tasks(String task) {
    TaskList.tasks.add(task);
    print(TaskList.tasks);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> bodywidget = [
      Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Text(
                "Your Tasks...",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(width: 70.0,),
              IconButton(
                  icon: Icon(Icons.delete_forever, size: 30, color: Colors.red,),
                  onPressed: () {
                    setState(() {
                      TaskList.tasks.length = 0 ;
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => TaskScreen()),
                      );
                    });
                  }
              ),
            ],
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
            TaskList.tasks.length == 0
                ? Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 90.0),
                      child: Text(
                        "There is no tasks\n\n\n"
                        "Add one ...",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: TaskList.tasks.length,
                    itemBuilder: (context, i) => YourTask(index: i),
                  )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              s = 1;
            });
          },
          backgroundColor: Colors.black,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30.0,
          ),
        ),
      ),
      Scaffold(
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
                    icon: Icon(
                      Icons.input,
                      color: Colors.white,
                    ),
                    hintText: 'Enter your task !',
                    hintStyle: TextStyle(
                      fontSize: 19,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                    labelText: "Add Your Task...!",
                    labelStyle: TextStyle(
                      fontSize: 19,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(width: 3.0))),
                keyboardType: TextInputType.text,
                onSubmitted: (task) => Value(task),
                maxLines: 2,
                autocorrect: true,
                maxLength: 10000,
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 400.0),
                child: MaterialButton(
                  padding: EdgeInsets.only(
                      top: 5.0, bottom: 5.0, right: 10.0, left: 10.0),
                  onPressed: () {
                    Add_Tasks(value);
                    setState(() {
                      s = 0;
                    });
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => TaskScreen()),
                    );
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(width: 2.0)),
                  highlightColor: Colors.grey,
                  splashColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    ];
    return bodywidget[s];
  }
}

var ic = Icons.check_circle_outline;
var deco = TextDecoration.none;
var col = Colors.black;

class YourTask extends StatefulWidget {
  final index;
  const YourTask({this.index});

  @override
  _YourTaskState createState() => _YourTaskState();
}

class _YourTaskState extends State<YourTask> {
  bool IsDone = false;

  @override
  Widget build(BuildContext context) {
    void delete_Item(int index) {
      setState(() {
        for (int i = index; i < TaskList.tasks.length - 1; i++) {
          TaskList.tasks[i] = TaskList.tasks[i + 1];
        }
        //TaskList.tasks.removeAt(TaskList.tasks.length);
        print(index);
        TaskList.tasks.length--;
        print(TaskList.tasks);
        print(TaskList.tasks.length);
      });
    }

    return Container(
        height: 70.0,
        width: double.infinity,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  icon: Icon(
                    ic,
                    size: 25,
                    color: col,
                  ),
                  onPressed: () {
                    setState(() {
                      if (ic == Icons.check_circle_outline &&
                          deco == TextDecoration.none &&
                          col == Colors.black) {
                        ic = Icons.check_circle;
                        deco = TextDecoration.lineThrough;
                        col = Colors.white;
                      } else {
                        ic = Icons.check_circle_outline;
                        deco = TextDecoration.none;
                        col = Colors.black;
                      }
                    });
                  }),
              Text(
                TaskList.tasks[widget.index],
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  decoration: deco,
                  decorationThickness: 4.0,
                  decorationColor: Colors.black,
                ),
                maxLines: 2,
                //semanticsLabel: "",
              ),
              IconButton(
                  icon: Icon(
                    Icons.delete_sharp,
                    size: 25,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    delete_Item(widget.index);
                    //Navigator.pop(context);
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => TaskScreen()),
                    );
                  })
            ],
          ),
        ));
  }
}
