import 'package:flutter/material.dart';
import 'package:flutter_getx_sqlite/controller/controller.dart';

class ItemTodo extends StatelessWidget {
  const ItemTodo({super.key, required this.controller, required this.index});
  final SqlController controller;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[300],
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: InkWell(
        child: SizedBox(
          height: 150.0,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              textDirection: TextDirection.ltr,
              children: [
                Text(
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.start,
                  'Title : ${controller.lists[index].title.toString()}',
                ),
                Text(
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                    textAlign: TextAlign.start,
                    'Description : ${controller.lists[index].description.toString()}'),
                SizedBox(
                  height: 45.0,
                ),
                Row(
                  children: [
                    Text(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.start,
                        'Time : ${controller.lists[index].time.toString()}'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
