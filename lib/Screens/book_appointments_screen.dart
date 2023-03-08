import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/appointment_success.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';
import 'package:healthfooddelivery/widgets/calender_widgets.dart';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:healthfooddelivery/widgets/textfield.dart';
import 'package:healthfooddelivery/widgets/time_widget.dart';
import 'package:table_calendar/table_calendar.dart';

class BookAppointmentsScreen extends StatefulWidget {
  // const BookAppointmentsScreen({.key});

  @override
  State<BookAppointmentsScreen> createState() => _BookAppointmentsScreenState();
}

class _BookAppointmentsScreenState extends State<BookAppointmentsScreen> {
  TextEditingController appointmentController = TextEditingController();

  CalendarController calenderController;
  @override
  void initState() {
    super.initState();
    calenderController = CalendarController();
  }

  @override
  void dispose() {
    appointmentController.dispose;
    super.dispose();
    calenderController.dispose();
  }

  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;
  bool value8 = false;
  bool value9 = false;
  bool value10 = false;
  bool value11 = false;
  bool value12 = false;
  bool value13 = false;

  void toggleValue1() {
    setState(() {
      value1 = !value1;

      value2 = false;
      value3 = false;
      value4 = false;
      value5 = false;
      value6 = false;
      value7 = false;
      value8 = false;
      value9 = false;
      value10 = false;
      value11 = false;
      value12 = false;
      value13 = false;
    });
  }

  void toggleValue2() {
    setState(() {
      value2 = !value2;
      value1 = false;
      value3 = false;
      value4 = false;
      value5 = false;
      value6 = false;
      value7 = false;
      value8 = false;
      value9 = false;
      value10 = false;
      value11 = false;
      value12 = false;
      value13 = false;
    });
  }

  void toggleValue3() {
    setState(() {
      value3 = !value3;
      value1 = false;
      value2 = false;
      value4 = false;
      value5 = false;
      value6 = false;
      value7 = false;
      value8 = false;
      value9 = false;
      value10 = false;
      value11 = false;
      value12 = false;
      value13 = false;
    });
  }

  void toggleValue4() {
    setState(() {
      value4 = !value4;
      value1 = false;
      value2 = false;
      value3 = false;
      value5 = false;
      value6 = false;
      value7 = false;
      value8 = false;
      value9 = false;
      value10 = false;
      value11 = false;
      value12 = false;
      value13 = false;
    });
  }

  void toggleValue5() {
    setState(() {
      value5 = !value5;
      value1 = false;
      value2 = false;
      value3 = false;
      value4 = false;
      value6 = false;
      value7 = false;
      value8 = false;
      value9 = false;
      value10 = false;
      value11 = false;
      value12 = false;
      value13 = false;
    });
  }

  void toggleValue6() {
    setState(() {
      value6 = !value6;
      value1 = false;
      value2 = false;
      value3 = false;
      value4 = false;
      value5 = false;
      value7 = false;
      value8 = false;
      value9 = false;
      value10 = false;
      value11 = false;
      value12 = false;
      value13 = false;
    });
  }

  void toggleValue7() {
    setState(() {
      value7 = !value7;
      value1 = false;
      value2 = false;
      value3 = false;
      value4 = false;
      value5 = false;
      value6 = false;
      value8 = false;
      value9 = false;
      value10 = false;
      value11 = false;
      value12 = false;
      value13 = false;
    });
  }

  void toggleValue8() {
    setState(() {
      value8 = !value8;
      value1 = false;
      value2 = false;
      value3 = false;
      value4 = false;
      value5 = false;
      value6 = false;
      value7 = false;
      value9 = false;
      value10 = false;
      value11 = false;
      value12 = false;
      value13 = false;
    });
  }

  void toggleValue9() {
    setState(() {
      value9 = !value9;
      value1 = false;
      value2 = false;
      value3 = false;
      value4 = false;
      value5 = false;
      value6 = false;
      value7 = false;
      value8 = false;
      value10 = false;
      value11 = false;
      value12 = false;
      value13 = false;
    });
  }

  void toggleValue10() {
    setState(() {
      value10 = !value10;
      value1 = false;
      value2 = false;
      value3 = false;
      value4 = false;
      value5 = false;
      value6 = false;
      value7 = false;
      value8 = false;
      value9 = false;
      value11 = false;
      value12 = false;
      value13 = false;
    });
  }

  void toggleValue11() {
    setState(() {
      value11 = !value11;
      value1 = false;
      value2 = false;
      value3 = false;
      value4 = false;
      value5 = false;
      value6 = false;
      value7 = false;
      value8 = false;
      value9 = false;
      value10 = false;
      value12 = false;
      value13 = false;
    });
  }

  void toggleValue12() {
    setState(() {
      value12 = !value12;
      value1 = false;
      value2 = false;
      value3 = false;
      value4 = false;
      value5 = false;
      value6 = false;
      value7 = false;
      value8 = false;
      value9 = false;
      value10 = false;
      value11 = false;
      value13 = false;
    });
  }

  void toggleValue13() {
    setState(() {
      value13 = !value13;
      value1 = false;
      value2 = false;
      value3 = false;
      value4 = false;
      value5 = false;
      value6 = false;
      value7 = false;
      value8 = false;
      value9 = false;
      value10 = false;
      value11 = false;
      value12 = false;
    });
  }

  bool audioChecked = false;
  bool videoChecked = false;
  void audio() {
    setState(() {
      audioChecked = !audioChecked;
      videoChecked = false;
    });
  }

  void video() {
    setState(() {
      videoChecked = !videoChecked;
      audioChecked = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black)),
              const Text("Book Appointments",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                      color: Colors.black,
                      letterSpacing: 1.2,
                      fontSize: 18)),
            ],
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CalenderWidget(calenderController: calenderController),
            //const SizedBox(height: 10),
            const Text(
              "Available Times",
              style: TextStyle(
                  fontFamily: "montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black),
            ),
            const SizedBox(height: 15),
            //TimeWidget
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: [
                    TimeWidget(
                        time: "6:00 AM",
                        toggleValue: toggleValue1,
                        value: value1),
                    SizedBox(width: 2),
                    TimeWidget(
                        time: "7:00 AM",
                        toggleValue: toggleValue2,
                        value: value2),
                    SizedBox(width: 2),
                    TimeWidget(
                        time: "8:00 AM",
                        toggleValue: toggleValue3,
                        value: value3),
                    SizedBox(width: 2),
                    TimeWidget(
                        time: "9:00 AM",
                        toggleValue: toggleValue4,
                        value: value4),
                    SizedBox(width: 2),
                    TimeWidget(
                        time: "10:00 AM",
                        toggleValue: toggleValue5,
                        value: value5),
                    SizedBox(width: 2),
                    TimeWidget(
                        time: "11:00 AM",
                        toggleValue: toggleValue6,
                        value: value6),
                    SizedBox(width: 2),
                    TimeWidget(
                        time: "12:00 PM",
                        toggleValue: toggleValue7,
                        value: value7),
                    SizedBox(width: 2),
                    TimeWidget(
                        time: "1:00 PM",
                        toggleValue: toggleValue8,
                        value: value8),
                    SizedBox(width: 2),
                    TimeWidget(
                        time: "2:00 PM",
                        toggleValue: toggleValue9,
                        value: value9),
                    SizedBox(width: 2),
                    TimeWidget(
                        time: "3:00 PM",
                        toggleValue: toggleValue10,
                        value: value10),
                    SizedBox(width: 2),
                    TimeWidget(
                        time: "4:00 PM",
                        toggleValue: toggleValue11,
                        value: value11),
                    SizedBox(width: 2),
                    TimeWidget(
                        time: "5:00 PM",
                        toggleValue: toggleValue12,
                        value: value12),
                    SizedBox(width: 2),
                    TimeWidget(
                        time: "6:00 PM",
                        toggleValue: toggleValue13,
                        value: value13),
                  ],
                )),
            const SizedBox(height: 18),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 35,
                    alignment:Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black)),
                  child: IconButton(
                    icon: audioChecked
                        ? Icon(Icons.circle, color: greenColor, size:23)
                        : Icon(Icons.circle_outlined, color: Colors.black,size:23),
                    onPressed: audio,
                  ),
                ),
                const Text(
                  "Audio",
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "montserrat",
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  alignment:Alignment.center,
                  height: 35,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black)),
                 
                    child: IconButton(
                      icon: videoChecked
                           ? Icon(Icons.circle, color: greenColor, size:23)
                          : Icon(Icons.circle_outlined, color: Colors.black, size:23),
                      onPressed: video,
                    ),
                  
                ),
                const Text(
                  "Video",
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "montserrat",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const Text("Appointment Note",
                style: TextStyle(
                    fontFamily: "montserrat",
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            const SizedBox(height: 10),
            SingleChildScrollView(
              child: TextFieldWidget(
                  controller: appointmentController,
                  obscure: false,
                  hint: "Enter appointment notes here..."),
            ),
            const SizedBox(height: 30),
            ClickButtons(
                onpressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AppointmentSuccess()));
                },
                text: "Book Appointment")
          ],
        ),
      ),
    );
  }
}
