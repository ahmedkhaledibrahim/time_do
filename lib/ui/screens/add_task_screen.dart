import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:time_do/controllers/task_controller.dart';
import 'package:time_do/models/task.dart';
import 'package:time_do/services/theme_services.dart';
import 'package:time_do/ui/screens/home_screen.dart';
import 'package:time_do/ui/theme.dart';
import 'package:time_do/ui/widgets/buttonWidget.dart';
import 'package:time_do/ui/widgets/customAppBar_Widget.dart';
import 'package:time_do/ui/widgets/input_field.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TaskController _taskController = Get.find();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _reminderController = TextEditingController();
  final TextEditingController _repeatController = TextEditingController();


  String _selectedDate = DateFormat.yMd().format(DateTime.now());
  String _startDate = DateFormat('hh:mm a').format(DateTime.now());
  String _endDate =
      DateFormat('hh:mm a').format(DateTime.now().add(Duration(minutes: 15)));

  int _selectedReminder = 5;
  List<int> reminderList = [5, 10, 15, 20];

  String _repeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];

  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: CustomAppBar(
        leadingWidget: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 15, left: 20, right: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add Task",
                        style: TextStyle(
                            color: Get.isDarkMode ? Colors.white : darkGreyClr,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  InputField(
                    isEnabled: true,
                    hint: 'Enter Title',
                    label: 'Title',
                    iconOrdrop: 'icon',
                    controller: _titleController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                    isEnabled: true,
                    hint: 'Enter Note',
                    label: 'Note',
                    iconOrdrop: 'icon',
                    controller: _noteController,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                    controller: _dateController,
                    isEnabled: false,
                    hint: '${_selectedDate.toString()}',
                    label: 'Date',
                    iconOrdrop: 'button',
                    widget: IconButton(
                      icon: Icon(Icons.date_range),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 165,
                          child: InputField(
                            isEnabled: false,
                            controller: _startTimeController,
                            label: 'Start Time',
                            iconOrdrop: 'button',
                            hint: _startDate.toString(),
                            widget: IconButton(
                              icon: Icon(Icons.access_time),
                              onPressed: () {
                                _selectStartTime(context);
                              },
                            ),
                          )),
                      SizedBox(
                          width: 165,
                          child: InputField(
                            controller: _endTimeController,
                            isEnabled: false,
                            iconOrdrop: 'button',
                            label: 'End Time',
                            hint: _endDate.toString(),
                            widget: IconButton(
                              icon: Icon(Icons.access_time),
                              onPressed: () {
                                _selectEndTime(context);
                              },
                            ),
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                    controller: _reminderController,
                    isEnabled: false,
                    hint: '${_selectedReminder.toString()} Minutes Only',
                    label: 'Reminder',
                    iconOrdrop: 'drop',
                    widget: DropdownButton(
                      items: reminderList
                          .map<DropdownMenuItem<String>>(
                              (value) => DropdownMenuItem<String>(
                                  value: value.toString(),
                                  child: Text(
                                    '$value',
                                    style: TextStyle(
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : Colors.black),
                                  )))
                          .toList(),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 20,
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedReminder = int.parse(newValue!);
                          _reminderController.text = _selectedReminder.toString();
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InputField(
                    controller: _repeatController,
                    isEnabled: false,
                    hint: '${_repeat.toString()}',
                    label: 'Repeat',
                    iconOrdrop: 'drop',
                    widget: DropdownButton(
                      items: repeatList
                          .map<DropdownMenuItem<String>>(
                              (value) => DropdownMenuItem<String>(
                                  value: value.toString(),
                                  child: Text(
                                    '$value',
                                    style: TextStyle(
                                        color: Get.isDarkMode
                                            ? Colors.white
                                            : Colors.black),
                                  )))
                          .toList(),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                      ),
                      iconSize: 20,
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String? newValue) {
                        setState(() {
                          _repeat = newValue!;
                          _repeatController.text = _repeat;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //_colorPallete(),
                      ButtonWidget(
                          label: 'Add Task',
                          onTap: () async {
                            _submitOthers();
                            _submitDate();
                            _submitStartTime();
                            _submitEndTime();
                            if (_formKey.currentState!.validate()) {
                              final Task task = Task();
                              _addTaskToDB(task);
                              await _taskController.addTask(task);
                              Get.back();
                            }
                          },
                          color: primaryClr)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _colorPallete() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Color',
  //         style: TextStyle(
  //             color: Get.isDarkMode ? Colors.white : darkGreyClr,
  //             fontWeight: FontWeight.bold,
  //             fontSize: 17),
  //       ),
  //       Wrap(
  //         children: List.generate(
  //             3,
  //             (index) => GestureDetector(
  //                   onTap: () {
  //                     debugPrint(_selectedColor.toString());
  //                     setState(() {
  //                       _selectedColor = index;
  //                     });
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(right: 8.0, top: 5),
  //                     child: CircleAvatar(
  //                         child: _selectedColor == index
  //                             ? Icon(
  //                                 Icons.done,
  //                                 color: Colors.white,
  //                                 size: 16,
  //                               )
  //                             : SizedBox(),
  //                         radius: 16,
  //                         backgroundColor: index == 0
  //                             ? primaryClr
  //                             : index == 1
  //                                 ? pinkClr
  //                                 : orangeClr),
  //                   ),
  //                 )),
  //       )
  //     ],
  //   );
  // }

  _addTaskToDB(Task task) {
    task.isCompleted = 0;
    task.color = -_selectedColor;
    task.title = _titleController.text;
    task.note = _noteController.text;
    task.repeat = _repeat;
    task.remind = _selectedReminder;
    task.date = _selectedDate.toString();
    task.startTime = _startDate;
    task.endTime = _endDate;
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      currentDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),

    );
    setState(() {
      if(selected != null){
        _selectedDate = DateFormat.yMd().format(selected).toString();
      }
      else
        _selectedDate = DateFormat.yMd().format(DateTime.now()).toString();
    });
  }

  _submitDate() {
    _dateController.text = _selectedDate;
  }

  _selectStartTime(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    String formattedTime = selected!.format(context);
    setState(() {
      _startDate = formattedTime;
    });
  }

  _submitStartTime() {
    _startTimeController.text = _startDate;
  }

  _selectEndTime(BuildContext context) async {
    final TimeOfDay? selected = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    String formattedTime = selected!.format(context);
    setState(() {
      _endDate = formattedTime;
    });
  }

  _submitEndTime() {
    _endTimeController.text = _endDate;
  }

  _submitOthers(){
    if(_reminderController.text.isEmpty){
      _reminderController.text = _selectedReminder.toString();
    }
    if(_repeatController.text.isEmpty){
      _repeatController.text = _repeat.toString();
    }
  }
}
