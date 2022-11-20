import 'package:flutter/material.dart';

class WrongFormatView extends StatelessWidget {
   WrongFormatView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Wrong Format.", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.red))
        ),
    );
  }
}
