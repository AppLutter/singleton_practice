import 'package:flutter/cupertino.dart';

abstract class ExampleStateBase {
  @protected
  late String initialText;

  @protected
  late String stateText;

  String get currentText => stateText;

  void setStateText(String text) {
    stateText = text;
  }

  void reset() {
    stateText = initialText;
  }
}

class ExampleStateByDefinition extends ExampleStateBase {
  static ExampleStateByDefinition? _instance;

  ExampleStateByDefinition._initial() {
    initialText = "A new 'ExampleStateByDefinition' instance has been created.";
    stateText = initialText;
  }

  static ExampleStateByDefinition getState() {
    return _instance ??= ExampleStateByDefinition._initial();
  }
}

class ExampleState extends ExampleStateBase {
  static final ExampleState _instance = ExampleState._internal();

  /// factory constructor 덕분에 getState() 메서드를 만들지 않아도 된다.
  factory ExampleState() {
    return _instance;
  }

  ExampleState._internal() {
    initialText = "A new 'ExampleState' instance has been created.";
    stateText = initialText;
  }
}

/// Singleton 없이 구현
class ExampleStateWithoutSingleton extends ExampleStateBase {
  ExampleStateWithoutSingleton() {
    initialText = "A new 'ExampleStateWithoutSingleton' instance has been created.";
    stateText = initialText;
  }
}
