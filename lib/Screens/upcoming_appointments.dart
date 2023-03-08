import 'package:flutter/material.dart';
import 'package:healthfooddelivery/Screens/book_appointments_screen.dart';

class UpcomingAppointments extends StatefulWidget {
  // const UpcomingAppointments({super.key});

  @override
  State<UpcomingAppointments> createState() => _UpcomingAppointmentsState();
}

class _UpcomingAppointmentsState extends State<UpcomingAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                  icon:const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
                  const Text("Appointments",
                  style: TextStyle(
                      letterSpacing: 1.2,
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserat')),
            ],
          )),

          body: Column(),
    );
  }
}
