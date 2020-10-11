import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() {
    Future.delayed(Duration(seconds: 3), (){
      setState(() {
        counter+=100;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(
          onPressed: () {
            setState(() {
              counter++;
            });
            getData();
          },
          child: Text('Counter is $counter')),
    );
  }
}
