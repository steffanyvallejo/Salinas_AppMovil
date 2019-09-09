import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

class FilterForm extends StatefulWidget {
  @override
  _FilterFormState createState() => new _FilterFormState();
}

class _FilterFormState extends State<FilterForm> {
  final _formKey = GlobalKey<FormState>();

  int _selectedRoomType = 0;
  int _selectNoAdults = 1;
  int _selectNoChildren = 0;

  DateTime _check_in_date = new DateTime.now();
  DateTime _check_out_date = new DateTime.now();

  String _check_in_date_str =
      new DateFormat("dd-MM-yyyy").format(new DateTime.now());
  String _check_out_date_str =
      new DateFormat("dd-MM-yyyy").format(new DateTime.now());

  List<DropdownMenuItem<int>> roomTypeList = [];
  List<DropdownMenuItem<int>> noAdultsList = [];
  List<DropdownMenuItem<int>> noChildrenList = [];

  void loadRoomTypeList() {
    roomTypeList = [];
    roomTypeList.add(new DropdownMenuItem(
      child: Container(
        width: 100,
        child: Text(
          'Suite',
          style: TextStyle(color: Colors.black, fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
      value: 0,
    ));
    roomTypeList.add(new DropdownMenuItem(
      child: Container(
        width: 100,
        child: Text(
          'Familiar',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      value: 1,
    ));
    roomTypeList.add(new DropdownMenuItem(
      child: Container(
        width: 100,
        child: Text(
          'Clásico',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      value: 2,
    ));
    roomTypeList.add(new DropdownMenuItem(
      child: Container(
        width: 100,
        child: Text(
          'Deluxe',
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      value: 3,
    ));
  }

  void loadNoAdultsList() {
    noAdultsList = [];
    noAdultsList.add(new DropdownMenuItem(
      child: new Text(
        '1',
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
      value: 1,
    ));
    noAdultsList.add(new DropdownMenuItem(
      child: new Text(
        '2',
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
      value: 2,
    ));
    noAdultsList.add(new DropdownMenuItem(
      child: new Text(
        '3',
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
      value: 3,
    ));
    noAdultsList.add(new DropdownMenuItem(
      child: new Text(
        '4',
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
      value: 4,
    ));
  }

  void loadNoChildrenList() {
    noChildrenList = [];
    noChildrenList.add(new DropdownMenuItem(
      child: new Text(
        '0',
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
      value: 0,
    ));
    noChildrenList.add(new DropdownMenuItem(
      child: new Text(
        '1',
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
      value: 1,
    ));
    noChildrenList.add(new DropdownMenuItem(
      child: new Text(
        '2',
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
      value: 2,
    ));
    noChildrenList.add(new DropdownMenuItem(
      child: new Text(
        '3',
        style: TextStyle(color: Colors.black, fontSize: 24),
      ),
      value: 3,
    ));
  }

  void onPressedSubmit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print('Entra a submit');
      print(_check_in_date_str);
      print(_check_out_date_str);
      print(_selectedRoomType);
      print(_selectNoAdults);
      print(_selectNoChildren);
    }
  }

  @override
  Widget build(BuildContext context) {
    loadRoomTypeList();
    loadNoAdultsList();
    loadNoChildrenList();

    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/font1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              //Back and title
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          IconData(58820,
                              fontFamily: 'MaterialIcons',
                              matchTextDirection: true),
                          color: Colors.white,
                        ),
                        tooltip: 'Volver',
                        onPressed: () {
                          print("Volver");
                        },
                      ),
                      Expanded(
                        child: Center(
                          child: Text('Reserva normal',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24)),
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 1,
              ),
              Spacer(),
              //DatePicker Range
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //Fecha entrada
                      Expanded(
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Entrada',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 36),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: Text('$_check_in_date_str',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 34)),
                                ),
                              ),
                            ),
                          ],
                        )),
                        flex: 3,
                      ),
                      //Icon calendar
                      Expanded(
                        child: Container(
                          child: IconButton(
                            icon: Icon(
                              IconData(59701, fontFamily: 'MaterialIcons'),
                              color: Colors.white,
                            ),
                            tooltip: 'Calendario',
                            onPressed: () async {
                              final List<DateTime> picked =
                                  await DateRangePicker.showDatePicker(
                                      context: context,
                                      initialFirstDate: _check_in_date,
                                      initialLastDate: _check_out_date,
                                      firstDate: new DateTime(2019),
                                      lastDate: new DateTime(2022));
                              if (picked != null) {
                                setState(() {
                                  _check_in_date_str =
                                      new DateFormat("dd-MM-yyyy")
                                          .format(picked.elementAt(0));
                                  _check_out_date_str =
                                      new DateFormat("dd-MM-yyyy")
                                          .format(picked.elementAt(1));
                                  _check_in_date = picked.elementAt(0);
                                  _check_out_date = picked.elementAt(1);
                                });
                              }
                            },
                          ),
                        ),
                        flex: 1,
                      ),
                      //Fecha salida
                      Expanded(
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Salida',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 36),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: Text('$_check_out_date_str',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 34)),
                                ),
                              ),
                            ),
                          ],
                        )),
                        flex: 3,
                      ),
                    ],
                  ),
                ),
                flex: 2,
              ),
              Spacer(),
              //Dropdown roomtype, no_adultos no_ninos
              Expanded(
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //Tipo
                      Expanded(
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Tipo',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 36),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: DropdownButton(
                                    iconEnabledColor: Colors.white,
                                    iconSize: 36,
                                    isExpanded: true,
                                    items: roomTypeList,
                                    value: _selectedRoomType,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedRoomType = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                      //No adultos
                      Expanded(
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Adultos',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 36),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: DropdownButton(
                                    iconEnabledColor: Colors.white,
                                    iconSize: 36,
                                    items: noAdultsList,
                                    value: _selectNoAdults,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectNoAdults = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                      //No ninos
                      Expanded(
                        child: Center(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: Text(
                                    'Niños',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 36),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Center(
                                  child: DropdownButton(
                                    iconEnabledColor: Colors.white,
                                    iconSize: 36,
                                    items: noChildrenList,
                                    value: _selectNoChildren,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectNoChildren = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
                flex: 2,
              ),
              //Boton
              Spacer(),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: new Text('Buscar'),
                          onPressed: onPressedSubmit),
                    )
                  ],
                ),
                flex: 1,
              ),
            ],
          ),
        ) /* add child content here */,
      ),
    );
  }
}
