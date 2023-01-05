import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarCard extends StatelessWidget {
  const CalendarCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TableCalendar(
        firstDay: DateTime.utc(2021, 10, 25),
        lastDay: DateTime.utc(2080, 10, 25),
        focusedDay: DateTime.now(),
        headerVisible: true,
        daysOfWeekVisible: true,
        sixWeekMonthsEnforced: true,
        headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w800)),
        calendarStyle: CalendarStyle(
            todayTextStyle: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class Calendar extends StatefulWidget {
  Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
   return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 100),
      delegate: SliverChildListDelegate(
        [
          CalendarCard()
         
        ],
      ),
    );
  }
}
