import 'package:flutter/material.dart';


class SettingsWidget extends StatefulWidget {
  SettingsWidget({Key key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => new _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {

  List _cities =  ["Berlin", "Madryt", "Rzym", "Paryż", "Hamburg","Warszawa"];


  List<DropdownMenuItem<String>> _dropDownMenuItems;

  String _currentCitydestiny;
  String _currentCitytarget;
  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCitydestiny = _dropDownMenuItems[0].value;
    _currentCitytarget = _dropDownMenuItems[1].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String city in _cities) {
      items.add(new DropdownMenuItem(
          value: city,
          child: new Text(city)
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new Center(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center  ,
            crossAxisAlignment: CrossAxisAlignment.center ,
            children: <Widget>[

              new DropdownButton(
                value: _currentCitydestiny,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              ),
              Image.network("https://cdn.pixabay.com/photo/2017/02/20/00/03/icon-2081280_960_720.png",width: 40,height: 40,),
              new DropdownButton(
                value: _currentCitytarget,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItemTarget,
              )
            ],
          )
      ),
    );
  }

  void changedDropDownItem(String selectedCity) {
    setState(() {
      _currentCitydestiny = selectedCity;
    });
  }
  void changedDropDownItemTarget(String selectedCity) {
    setState(() {
      _currentCitytarget = selectedCity;
    });
  }
}