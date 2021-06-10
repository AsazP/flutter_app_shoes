import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
//Para Slider
  RangeValues _currentRangePrice = const RangeValues(10, 150);
  RangeValues _currentRangeDating = const RangeValues(0, 6);
//CheckBox
  bool _istrueMen = true;
 bool _istrueWoman = true;
  bool _istrueKids = true;
   bool _istrueSportShoes = true;
    bool _istrueGirlsShoes = false;
     bool _istrueAllShoes= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(240, 241, 248, 1.0),
      appBar: AppBar(
        elevation: 0.8,
        foregroundColor: Colors.black,
        backgroundColor: Color.fromRGBO(240, 241, 248, 1.0),
        actions: [
          Icon(Icons.arrow_back, color: Colors.black),
          SizedBox(width: 25.0),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: ListView(
            children: [
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "FIlter",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  Text(
                    "Reset",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Text("PRICE"),
              _sliderPrice(),
              SizedBox(
                height: 15.0,
              ),
              Text("DATING"),
              _sliderDating(),
              SizedBox(
                height: 50.0,
              ),
              Text("TYPE"),
                  SizedBox(
                height: 15.0,
              ),
              _checkBoxMen(),
              _checkBoxWoman(),
              _checkBoxKids(),
              _checkBoxSportShoes(),
              _checkBoxGirlsShoes(),
              _checkBoxAllShoes(),
                SizedBox(
                height: 30.0,
              ),
              TextButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.purple),
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
  ),
  onPressed: () { },
  child: Text('APPLY FILTER'),
),

            ],
          ),
        ),
      ),
    );
  }

  Widget _sliderPrice() {
    return RangeSlider(
        values: _currentRangePrice,
        min: 0,
        max: 200,
        divisions: 5,
        inactiveColor: Colors.deepPurple[100],
        activeColor: Colors.purple,
        labels: RangeLabels(
          "\$ " + _currentRangePrice.start.round().toString(),
          "\$ " + _currentRangePrice.end.round().toString(),
        ),
        onChanged: (RangeValues values) {
          setState(() {
            _currentRangePrice = values;
          });
        });
  }

  Widget _sliderDating() {
    return RangeSlider(
        values: _currentRangeDating,
        min: 0,
        max: 6,
        divisions: 2,
        inactiveColor: Colors.deepPurple[100],
        activeColor: Colors.purple,
        labels: RangeLabels(
          _currentRangeDating.start.round().toString() + " Stars",
          _currentRangeDating.end.round().toString() + " Stars",
        ),
        onChanged: (RangeValues values) {
          setState(() {
            _currentRangeDating = values;
          });
        });
  }

  Widget _checkBoxMen() {
    return CheckboxListTile(
      title: Text('Men'),
      value: _istrueMen,
      activeColor:  Colors.purple,
      onChanged: (value) {
        //value = _istrue;
        _istrueMen = value;
        setState(() {});
      },
    );
  }

  Widget _checkBoxWoman() {
    return CheckboxListTile(
      title: Text('Woman'),
      value: _istrueWoman,
      activeColor:  Colors.purple,
      onChanged: (value) {
        //value = _istrue;
        _istrueWoman = value;
        setState(() {});
      },
    );
  }
 Widget _checkBoxKids() {
    return CheckboxListTile(
      title: Text('Kids'),
      value: _istrueKids,
      activeColor:  Colors.purple,
      onChanged: (value) {
        //value = _istrue;
        _istrueKids = value;
        setState(() {});
      },
    );
  }

 Widget _checkBoxSportShoes() {
    return CheckboxListTile(
      title: Text('Kids'),
      value: _istrueSportShoes,
      activeColor:  Colors.purple,
      onChanged: (value) {
        //value = _istrue;
        _istrueSportShoes = value;
        setState(() {});
      },
    );
  }

 Widget _checkBoxGirlsShoes() {
    return CheckboxListTile(
      title: Text('Kids'),
      value: _istrueGirlsShoes,
      activeColor:  Colors.purple,
      onChanged: (value) {
        //value = _istrue;
        _istrueGirlsShoes = value;
        setState(() {});
      },
    );
  }
 Widget _checkBoxAllShoes() {
    return CheckboxListTile(
      title: Text('Kids'),
      value: _istrueAllShoes,
      activeColor:  Colors.purple,
      onChanged: (value) {
        //value = _istrue;
        _istrueAllShoes = value;
        setState(() {});
      },
    );
  }

  }
