import 'package:flutter/material.dart';
import 'package:geek/domain/app_utils.dart';
import 'package:logger/logger.dart';
import '../widgets/build_dynamic_view.dart';

class DynamicViewScreen extends StatefulWidget {
  const DynamicViewScreen({Key? key}) : super(key: key);

  @override
  State<DynamicViewScreen> createState() => _DynamicViewScreenState();
}

class _DynamicViewScreenState extends State<DynamicViewScreen> {
  Logger logger = Logger(printer: PrettyPrinter());

  String dropDownValue = '1';
  var dropDownItems = ['1', '2', '3', '4'];
  List<String> litems = [];
  AppUtils appUtills = AppUtils();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _counter = ValueNotifier(1);
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: _textEditingController,
                    keyboardType: TextInputType.multiline,
                    maxLength: null,
                    maxLines: null,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                    onChanged: change,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InputDecorator(
                      decoration:
                          const InputDecoration(border: OutlineInputBorder()),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: dropDownValue,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: dropDownItems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Center(
                                  child: Text(
                                items,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              )),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue = newValue!;
                              _counter.value = int.parse(dropDownValue);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
            ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) => BuildDynamicView(
                  count: int.parse(dropDownValue),
                  text: _textEditingController.text),
            ),
          ],
        ),
      ),
    );
  }

  void change(String text) {
    setState(() {
      if (_textEditingController.text.endsWith('\n')) {
        if (_textEditingController.text.allMatches(' ').length == 1) {
          BuildDynamicView(
              count: int.parse(dropDownValue),
              text: _textEditingController.text);
        }
      }
    });
  }
}
