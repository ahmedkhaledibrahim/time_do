import 'package:flutter/material.dart';
import 'package:time_do/models/task.dart';
import 'package:time_do/ui/theme.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key, required this.task}) : super(key: key);
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).orientation == Orientation.portrait ?  MediaQuery.of(context).size.height *0.2:200,
      width: MediaQuery.of(context).orientation == Orientation.portrait ?  MediaQuery.of(context).size.width :MediaQuery.of(context).size.width *0.7,
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: MediaQuery.of(context).orientation == Orientation.portrait ? 20 : 0),
      decoration: BoxDecoration(
          color: task.color == 0 ? bluishClr : Colors.green,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${task.title}',
                    style: Themes().taskTileHeadingTextStyle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.access_time_sharp,color: Colors.white,),
                      const SizedBox(
                        width: 15,
                      ),
                      Text('${task.startTime} - ${task.endTime}',style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(child: SingleChildScrollView(child: Text('${task.note}',style: TextStyle(color: Colors.white),)))
                ],
              ),
            ),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: task.isCompleted == 0 ? Text('TODO',style: TextStyle(color: Colors.white)) : Text('COMPLETED',style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }


}
