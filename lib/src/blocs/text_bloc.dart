import 'dart:async';

import 'package:untitled/src/models/Text_Provider.dart';

class TextBloc {
  var _textController = StreamController<String>();
  TextProvider tp = TextProvider();
  Stream<String> get textStream => _textController.stream;

  void updateText(String text) {
    tp.updateText(text);
    _textController.sink.add(tp.text);
  }
  dispose()
  {
    _textController.close();
  }

}