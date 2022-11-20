import 'entity/view_object.dart';

class AppUtils {


  List<String> splitText(String text) {
    List<String> splittedList = [];
    final splitted = text.split('\n');
    for (var value in splitted) {
      if (value.isNotEmpty) {
        splittedList.add(value);
      }
    }
    return splittedList;
  }


  List<ViewTypeObject> viewFieldList(List<String> textList) {
    List<ViewTypeObject> viewList = [];
    for (var value in textList) {
      var trimItem = value.trim();
      var item = trimItem.split(' ');
      if (item.length == 2) {
        var viewObject = ViewTypeObject(
            viewType: item[0].toLowerCase(), value: item[1]);
        viewList.add(viewObject);
      }
    }
    return viewList;
  }

}