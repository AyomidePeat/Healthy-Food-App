import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/book_appointments_screen.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';
import 'package:healthfooddelivery/widgets/color.dart';

class AppointmentWidget extends StatefulWidget {
  String month;
  String day;
  String year;
  String type;
  String status;
  AppointmentWidget({
    @required this.month,
    @required this.year,
    @required this.day,
    @required this.type,
    @required this.status,
  });

  @override
  State<AppointmentWidget> createState() => _AppointmentWidgetState();
}

class _AppointmentWidgetState extends State<AppointmentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(3)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Row(
                children: const [
                  Text("Upcoming",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: "montserrat",
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 90,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                        ),
                        child: Text(widget.month,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontFamily: "montserrat")),
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      Container(
                        height: 130,
                        width: 100,
                        decoration: const BoxDecoration(
                          color: greenColor,
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                        ),
                        child: Column(
                          children: [
                            Text(widget.day,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontFamily: "montserrat")),
                            Text(widget.year,
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    fontFamily: "montserrat")),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Column(
                    children: [
                      const Text("Appointment with FitAshar",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "montserrat")),
                      Text("Type: ${widget.type}",
                          style: const TextStyle(
                              color: Colors.grey, fontFamily: "montserrat")),
                      Text("Status: ${widget.status}",
                          style: const TextStyle(
                              color: Colors.grey, fontFamily: "montserrat")),
                      const SizedBox(width: 15),
                      SizedBox(
                          width: 39,
                          child: ClickButtons(
                            text: 'Reschedule',
                          ))
                    ],
                  )
                ],
              )
            ]),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.height * 0.5,
        ),
        ClickButtons(
          text: "Book Appointment",
          onpressed: Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookAppointmentsScreen(),
              )),
        )
      ],
    );
  }
}
