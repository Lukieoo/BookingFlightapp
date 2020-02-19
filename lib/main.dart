import 'package:bookinapp/SettingsWidget.dart';
import 'package:bookinapp/TabLayout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BookingFlight',
        home: Scaffold(
          backgroundColor: Colors.white,
          body: CardProject(),
        ));
  }
}

class CardProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Card(
//            child: InkWell(
//      splashColor: Colors.blue.withAlpha(30),
//      onTap: () {
//        print('Card tapped.');
//      },
      child: Container(
        width: 300,
        height: 600,
        child: Column(
          children: <Widget>[
            Stack(
                children: <Widget>[
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 300,
                          height: 220,
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              Image.network(
                                "https://i.pinimg.com/originals/b4/70/34/b470340fc0edd6303747a79b15e1e77d.png",
                                fit: BoxFit.fill,
                              ),
                              Positioned(
                                bottom: 0,
                                left: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(

                                    children: <Widget>[

                                      Text(
                                        "Ryjaner flight",
                                        style: TextStyle(

                                            fontFamily: 'AirbnbCerealBold',
                                            fontSize: 28,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "Book your flight with us !",
                                        style: TextStyle(
                                            fontFamily: 'AirbnbCerealBook',
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),

                ]
            ),
            BookList()

          ],
        ),

    )));
  }
}
class BookList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return BookListState();
  }
}
class BookListState extends State<BookList> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        children: <Widget>[
        SettingsWidget(),
          TabBarDemo(),
        ]
    );
  }

}