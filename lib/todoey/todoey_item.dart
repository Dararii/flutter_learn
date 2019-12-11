import 'package:flutter/material.dart';

class ItemListTodo extends StatelessWidget {
  const ItemListTodo({
    Key key,
    @required this.todo,
    @required this.value,
    @required this.onChangedCheck,
  }) : super(key: key);

  final String todo;
  final bool value;
  final Function onChangedCheck;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          todo,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              decoration:
                  value ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        Checkbox(
          activeColor: Colors.lightBlueAccent,
          checkColor: Colors.white,
          value: value,
          onChanged: onChangedCheck,
        )
      ],
    );
  }
}
