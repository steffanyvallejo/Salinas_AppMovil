import 'package:flutter/material.dart';
import 'package:salinas_app/typable_text.dart';
import 'package:intl/intl.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';




class BusquedaWidget extends StatefulWidget {


@override
_BusquedaWidgetState createState() => _BusquedaWidgetState();
}

class _BusquedaWidgetState extends State<BusquedaWidget>{
  DateTime _dateTime = new DateTime.now();
  String _fechaLlegada = "---";
  String _fechaSalida = "---";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Colors.white,

      child: new Form(

        child: new ListView(

          children: <Widget>[

            RaisedButton(

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              //elevation: 4.0,
              onPressed: () {
                DatePicker.showDatePicker(context,
                    theme: DatePickerTheme(
                      containerHeight: 210.0,
                    ),
                    showTitleActions: true,
                    minTime: DateTime(_dateTime.year,_dateTime.month, _dateTime.day ),
                    maxTime: DateTime(2024, 12, 31), onConfirm: (date) {
                      print('confirm $date');
                      _fechaLlegada = '${date.year} - ${date.month} - ${date.day}';
                      setState(() {});


                    }, currentTime: DateTime.now(), locale: LocaleType.es);

              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.flight_land,
                                size: 18.0,
                                color: Colors.lightBlue,
                               
                              ),
                              Text(
                                " $_fechaLlegada",
                                style: TextStyle(
                                    color: Colors.black,

                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.lightBlue,

                    ),
                  ],
                ),
              ),
              color: Colors.white,
            ),
            RaisedButton(

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              
              onPressed: () {
                DatePicker.showDatePicker(context,
                    theme: DatePickerTheme(
                      containerHeight: 210.0,
                    ),
                    showTitleActions: true,
                    minTime: DateTime(_dateTime.year,_dateTime.month, _dateTime.day ),
                    maxTime: DateTime(2024, 12, 31), onConfirm: (date) {
                      print('confirm $date');
                      _fechaSalida = '${date.year} - ${date.month} - ${date.day}';
                      setState(() {});
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.flight_takeoff,
                                size: 18.0,
                                color: Colors.lightBlue,
                              ),
                              Text(
                                " $_fechaSalida",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Icon(
                     Icons.edit,
                      color: Colors.lightBlue,

                    ),
                  ],
                ),
              ),
              color: Colors.white,
            ),

          ],
        ),
      ),
    );
  }


  }




