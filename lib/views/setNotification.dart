// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:alertify/views/Homepage.dart';
import 'package:alertify/views/gradereport.dart';
import 'package:flutter/material.dart';

class SetNotification extends StatefulWidget {
  const SetNotification({super.key});

  @override
  State<SetNotification> createState() => _SetNotificationState();
}

class _SetNotificationState extends State<SetNotification> {
  DateTime selectedDate = DateTime.now();
  TextEditingController task = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  void _showTaskAddedDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Task Added"),
            content: Text(
                "Your task ${task.text.toString()} has been added successfully."),
            actions: <Widget>[
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>[
      '1 Day ',
      ' 2 Day ',
      '3 Day ',
      '4 Day ',
    ];
    String dropdownValue = list.first;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Set Reminder",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 250,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(146, 174, 187, 198),
                      radius: 80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 20),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(146, 204, 225, 243),
                      radius: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 100),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color:  Color.fromARGB(255, 141, 184, 219),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: ListTile(
                            title: Text(
                              "Pick Date",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            leading: Icon(
                              Icons.calendar_month_outlined,
                              size: 30,
                              color: Colors.black,
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 50,
                                color: Colors.black,
                              ),
                              onPressed: () => _selectDate(context),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              "Selected Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 141, 184, 219),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Column(children: [
                            SizedBox(
                              height: 12,
                            ),
                          
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextFormField(
                                controller: task,
                                decoration:
                                    InputDecoration(hintText: "Task here"),
                              ),
                            ),
                           
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(144, 255, 255, 255),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: ListTile(
                                  leading: Icon(Icons.date_range),
                                  title: Text("Repeat"),
                                  trailing: DropdownButton<String>(
                                    value: dropdownValue,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      size: 50,
                                    ),
                                    elevation: 16,
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    onChanged: (String? value) {
                                      setState(() {
                                        dropdownValue = value!;
                                      });
                                    },
                                    items: list.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(30))),
                                            child: Text(value)),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, top: 40),
                              child: Container(
                                height: 50,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    if (selectedDate != DateTime.now()) {
                                      _showTaskAddedDialog(context);
                                    }
                                  },
                                  child: Text(
                                    "Add Task",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 0.08,
        child: Row(children: [
          SizedBox(
            width: 30,
          ),
          IconButton(
            icon: Icon(
              Icons.calendar_month_outlined,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SetNotification(),
                  ));
            },
          ),
          SizedBox(
            width: 100,
          ),
          IconButton(
            icon: Icon(
              Icons.home_outlined,
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));
            },
          ),
          SizedBox(
            width: 100,
          ),
          IconButton(
            icon: Icon(
              Icons.crisis_alert_outlined,
              size: 35,
            ),
            onPressed: () {

                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GradeReport()));
            },
          )
        ]),
      ),
    );
  }
}
