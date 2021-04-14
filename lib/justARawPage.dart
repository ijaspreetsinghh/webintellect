import 'package:flutter/material.dart';

class RawPage extends StatelessWidget {
  final List selectedCountries;
  RawPage({@required this.selectedCountries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
        title: Text(
          'Selected Countries',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            itemCount: selectedCountries.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${selectedCountries[index]}'),
              );
            },
          ),
        ),
      ),
    );
  }
}
