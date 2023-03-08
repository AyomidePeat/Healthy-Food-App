import 'dart:async';
import 'package:healthfooddelivery/widgets/color.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class CalenderWidget extends StatefulWidget {
  CalenderWidget({
    Key key,
    this.calenderController,
  }) : super(key: key);

  final CalendarController calenderController;

  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  Map<DateTime, List> _events;

  StreamController<DateTime> selectedDateStreamController;

  @override
  void initState() {
    super.initState();

    _events = {};
    selectedDateStreamController = StreamController<DateTime>();
  }

  void onDaySelected(DateTime day, List events, List date) {
    setState(() {
      selectedDateStreamController.add(day);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.4,
      child: TableCalendar(
        rowHeight: 30,
        events: _events,
        onDaySelected: onDaySelected,
        // height:size.height*0.5 ,
        calendarController: widget.calenderController,
        builders: CalendarBuilders(
          todayDayBuilder: (context, date, events) => Container(
              margin: const EdgeInsets.all(3.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: greenColor, borderRadius: BorderRadius.circular(3.0)),
              child: Text(
                date.day.toString(),
                style: TextStyle(color: Colors.white),
              )),
          selectedDayBuilder: (context, date, events) => Container(
            margin: const EdgeInsets.all(3.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(3.0)),
            child: Text(
              date.day.toString(),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        startingDayOfWeek: StartingDayOfWeek.monday,
        headerStyle: HeaderStyle(
          centerHeaderTitle: true,
          formatButtonDecoration: BoxDecoration(
            color: greenColor,
            borderRadius: BorderRadius.circular(22.0),
          ),
          formatButtonTextStyle: TextStyle(color: Colors.white),
          formatButtonShowsNext: false,
        ),
        initialCalendarFormat: CalendarFormat.month,
        calendarStyle: CalendarStyle(
            todayColor: Colors.greenAccent,
            selectedColor: Theme.of(context).primaryColor,
            todayStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 10.0,
                color: Colors.white)),
      ),
    );
  }
}
