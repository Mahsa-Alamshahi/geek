import 'package:flutter/material.dart';

class StringTypeView extends StatelessWidget {
  String text;

  StringTypeView({required this.text, Key? key}) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = text;
    return Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(),
          ),
        ),
    );
  }
}
