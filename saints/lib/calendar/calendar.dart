import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CalendarWidget extends StatefulWidget {
  @override
  _CalendarWidgetState createState() => new _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  CalendarController _controller;
  Map<DateTime, List<dynamic>> _events;
  List<dynamic> _selectedEvents;
  void initState() {
    super.initState();
    _controller = CalendarController();
    final sampleDay = DateTime.parse("2019-12-15");

    _selectedEvents = [];

    _events = {
      sampleDay: [
        "You are worried and troubled about many things. But one thing is needed. \n \n-Luke 10:41-42"
      ],
      sampleDay.add(Duration(days: 1)): [
        'there is nothing He loves and desires to see in us more than a sincere consciousness of our insignificance and inability, '
            'together with a firm and deeply felt conviction that any good we may have in our life comes from Him alone, '
            'since He is the source of all good. \n \n-Fr. Jack Sparks'],
      sampleDay.add(Duration(days: 2)): ['During prayer, intentional, deliberate, extreme humility is indispensable. \n\n-St. John of Kronstadt'],
      sampleDay.add(Duration(days: 3)): ['By its nature, the cross is the strongest and deepest degree of love.\n\n-Metropolitan Saba(Esber)']
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Calendar Saints'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              events: _events,
              initialCalendarFormat: CalendarFormat.month,
              calendarController: _controller,
              calendarStyle: CalendarStyle(
                todayColor: Colors.lightBlue,
                selectedColor: Colors.deepOrange,
                todayStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18),
              ),
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                formatButtonTextStyle: TextStyle(color: Colors.white),
              ),
              onDaySelected: (data, events) {
                setState(() {
                  _selectedEvents = events;
                });
              },
              builders: CalendarBuilders(
                selectedDayBuilder: (context, data, events) => Container(
                  margin: EdgeInsets.all(4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepOrange, shape: BoxShape.circle),
                  child: Text(
                    data.day.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                todayDayBuilder: (context, data, events) => Container(
                  margin: EdgeInsets.all(4),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue, shape: BoxShape.circle),
                  child: Text(
                    data.day.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            ..._selectedEvents.map((event) => Container(
                      height: 270,
                      margin: EdgeInsets.all(25),
                      child: AutoSizeText(
                          event,
                          presetFontSizes: [35, 20, 13],
                          maxLines: 10,
                        ),
                    ),
                ),
          ],
        ),
      ),
    );
  }
}
