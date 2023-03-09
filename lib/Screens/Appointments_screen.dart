import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/book_appointments_screen.dart';
import 'package:healthfooddelivery/Screens/navigaton_screen.dart';
import 'package:healthfooddelivery/widgets/buttons.dart';

class AppointmentsScreen extends StatefulWidget {
  // const AppointmentsScreen({.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NavigationScreen()));
                    },
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.black),
                const Text("Appointments",
                    style: TextStyle(
                        letterSpacing: 1.2,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                        fontSize: 18)),
              ],
            )),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              const Text(
                "No Appointments yet, you must be new!",
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w100),
              ),
              const Text(
                "Book an Appointment to get started",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "images/appointment.png",
                height: size.height * 0.5,
              ),
              SizedBox(height: 30),
              ClickButtons(
                  onpressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BookAppointmentsScreen()));
                  },
                  text: "Book Appointment")
            ],
          ),
        ));
  }
}
