import 'package:flutter/material.dart';

class BooleanTypeView extends StatefulWidget {
  String value;

  BooleanTypeView({required this.value, Key? key}) : super(key: key);

  @override
  State<BooleanTypeView> createState() => _BooleanTypeViewState();
}

class _BooleanTypeViewState extends State<BooleanTypeView> {
  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(
                child: Checkbox(
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                  value: checkedValue,
                  onChanged: (bool? value) {
                    setState(() {
                      checkedValue = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: Text(
                  widget.value,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
