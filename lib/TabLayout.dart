import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class TabBarDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Container(
      height: 200,

        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize:Size.fromHeight(50.0),
              child: AppBar(
                backgroundColor: Colors.cyan[200],
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.flight_land)),
                    Tab(icon: Icon(Icons.flight_takeoff)),

                  ],
                ),

              ),
            ),
            body: TabBarView(
              children: [
                HomePage(title: "Data Przylotu",),
                HomePage(title: "Data Odlotu",),

              ],
            ),
          ),
        ),
      );

  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("${selectedDate.toLocal()}".split(' ')[0]),
            SizedBox(height: 20.0,),
            RaisedButton(
              textColor: Colors.white,
              color:  Colors.cyan[300],
              onPressed: () => _selectDate(context),
              child: Text('Select date'),
            ),
          ],
        ),
      ),
    );
  }
}
//class _HomePageState extends State<HomePage> {
//  CalendarController _controller;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _controller = CalendarController();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return   SingleChildScrollView(
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            TableCalendar(
//              initialCalendarFormat: CalendarFormat.week,
//              calendarStyle: CalendarStyle(
//                  todayColor: Colors.orange,
//                  selectedColor: Theme.of(context).primaryColor,
//                  todayStyle: TextStyle(
//                      fontWeight: FontWeight.bold,
//                      fontSize: 18.0,
//                      color: Colors.white)),
//              headerStyle: HeaderStyle(
//                centerHeaderTitle: true,
//                formatButtonDecoration: BoxDecoration(
//                  color: Colors.orange,
//                  borderRadius: BorderRadius.circular(20.0),
//                ),
//                formatButtonTextStyle: TextStyle(color: Colors.white),
//                formatButtonShowsNext: false,
//              ),
//              startingDayOfWeek: StartingDayOfWeek.monday,
//              onDaySelected: (date, events) {
//                print(date.toIso8601String());
//              },
//              builders: CalendarBuilders(
//                selectedDayBuilder: (context, date, events) => Container(
//                    margin: const EdgeInsets.all(4.0),
//                    alignment: Alignment.center,
//                    decoration: BoxDecoration(
//                        color: Theme.of(context).primaryColor,
//                        borderRadius: BorderRadius.circular(10.0)),
//                    child: Text(
//                      date.day.toString(),
//                      style: TextStyle(color: Colors.white),
//                    )),
//                todayDayBuilder: (context, date, events) => Container(
//                    margin: const EdgeInsets.all(4.0),
//                    alignment: Alignment.center,
//                    decoration: BoxDecoration(
//                        color: Colors.orange,
//                        borderRadius: BorderRadius.circular(10.0)),
//                    child: Text(
//                      date.day.toString(),
//                      style: TextStyle(color: Colors.white),
//                    )),
//              ),
//              calendarController: _controller,
//            )
//          ],
//        ));
//
//
//  }
//}
