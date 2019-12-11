import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function onAdd;
  final Function onSubmitted;

  AddTaskScreen({Key key, @required this.onAdd, @required this.onSubmitted})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30,
              ),
            ),
            TextField(
              textAlign: TextAlign.center,
              autofocus: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              onChanged: onSubmitted,
            ),
            SizedBox(
              height: 16,
            ),
            RaisedButton(
              color: Colors.lightBlueAccent,
              child: Text(
                "ADD",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: onAdd,
            )
          ],
        ),
      ),
    );
  }
}
