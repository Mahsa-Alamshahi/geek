import 'package:flutter/material.dart';
import 'package:geek/domain/app_utils.dart';
import 'package:geek/presentation/widgets/string_type_view.dart';
import 'package:geek/presentation/widgets/wrong_format_view.dart';
import '../../domain/entity/view_object.dart';
import 'boolean_type_view.dart';

class BuildDynamicView extends StatefulWidget {
  String text;
  int count;

  BuildDynamicView({required this.count, required this.text, Key? key})
      : super(key: key);

  @override
  State<BuildDynamicView> createState() => _BuildDynamicViewState();
}

class _BuildDynamicViewState extends State<BuildDynamicView> {
  AppUtils appUtils = AppUtils();

  @override
  Widget build(BuildContext context) {
    var splittedTextToStringList = appUtils.splitText(widget.text);
    var viewList = appUtils.viewFieldList(splittedTextToStringList);

    var crossAxisSpacing = 8;
    var screenWidth = MediaQuery.of(context).size.width;
    var crossAxisCount = 4;
    var width = (screenWidth - ((crossAxisCount - 1) * crossAxisSpacing)) /
        crossAxisCount;
    var cellHeight = 60;
    var aspectRatio = width / cellHeight;

    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: GridView.count(
                crossAxisCount: widget.count,
                childAspectRatio: aspectRatio,
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: List.generate(viewList.length, (index) {
                  return Card(
                      elevation: 16,
                      child: Container(
                        width: MediaQuery.of(context).size.width / widget.count,
                        child: Center(
                          child: buildDynamicWidget(viewList[index]),
                        ),
                      ));
                }),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildDynamicWidget(ViewTypeObject viewType) {
    if (viewType.viewType == 'string') {
      return StringTypeView(
        text: viewType.value!,
      );
    } else if (viewType.viewType == 'int') {
      return StringTypeView(
        text: viewType.value!,
      );
    } else if (viewType.viewType == 'bool') {
      return BooleanTypeView(
        value: viewType.value!,
      );
    } else {
      return WrongFormatView();
    }
  }
}
