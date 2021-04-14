import 'justARawPage.dart';
import 'package:flutter/material.dart';
import 'package:webintellect/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List countryList = [
    'Australia',
    'China',
    'India',
    'Singapore',
    'Malaysia',
    'Vietnam',
    'Thailand',
    'Taiwan',
  ];

  List _selectedCountry = [];

  @override
  Widget build(BuildContext context) {
    Widget gridViewSelection = GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 2.0,
      crossAxisSpacing: 2.0,
      children: countryList.map((country) {
        return GestureDetector(
          onTap: () {
            if (_selectedCountry.contains(country)) {
              setState(() {
                _selectedCountry.remove(country);
              });
            } else {
              setState(() {
                _selectedCountry.add(country);
              });
            }
          },
          child: GridViewItem(country, _selectedCountry.contains(country)),
        );
      }).toList(),
    );

    return Scaffold(
      backgroundColor: kGreyBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RawPage(
                            selectedCountries: _selectedCountry,
                          ))),
              child: Row(
                children: [
                  Text(
                    'Next ',
                    style: TextStyle(color: kNavyColor, fontSize: 16),
                  ),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: kNavyColor,
                    size: 18,
                  )
                ],
              ))
        ],
        title: RichText(
          text: TextSpan(
              text: 'Select ',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
              children: [
                TextSpan(
                    text: 'Country',
                    style: TextStyle(fontWeight: FontWeight.w300))
              ]),
        ),
      ),
      body: gridViewSelection,
    );
  }
}

class GridViewItem extends StatelessWidget {
  final String _country;
  final bool _isSelected;

  GridViewItem(this._country, this._isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/flags/$_country.png'))),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                _country,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Icon(
              Icons.check,
              color: _isSelected ? kNavyColor : Colors.transparent,
            ),
          )
        ],
      ),
      color: _isSelected ? kLightGrey : Colors.white,
    );
  }
}
