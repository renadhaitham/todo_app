import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_application/models/task_model.dart';
import 'package:todo_application/shared/network/firebase/firebase_manager.dart';
import 'package:todo_application/shared/styles/colors.dart';

class TaskItem extends StatelessWidget {
  TaskModel task;

  TaskItem(this.task, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      elevation: 12,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent)),
      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(), children: [
          SlidableAction(
            onPressed: (BuildContext context) {
              FirebaseManager.deleteTask(task.id);
              FirebaseManager.deleteTask(task.id);
            },
            backgroundColor: Colors.red,
            label: "Delete",
            icon: Icons.delete,
            spacing: 15,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          SlidableAction(
            onPressed: (BuildContext context) {},
            backgroundColor: primary,
            label: "Edit",
            icon: Icons.edit,
            spacing: 15,
            // borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20),),
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 80,
                width: 4,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.blue),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task.title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  Text(task.description,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              Spacer(),
              InkWell(
                onTap: (){
                  FirebaseManager.updateTask(task.id, true);
                },
                child: Container(
                  margin: EdgeInsets.only(right: 12),
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 16),
                  decoration: BoxDecoration(
                    color: task.isDone ? Colors.green : primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: task.isDone
                      ? Text("Done!",style: TextStyle(color: Colors.white),)
                      : Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
