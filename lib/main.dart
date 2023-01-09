import 'package:flutter/material.dart';
import 'package:singleton_practice/example_state.base.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SingletonExample(),
    );
  }
}

class SingletonExample extends StatefulWidget {
  const SingletonExample({Key? key}) : super(key: key);

  @override
  State<SingletonExample> createState() => _SingletonExampleState();
}

class _SingletonExampleState extends State<SingletonExample> {
  List<ExampleStateBase> stateList = [
    ExampleState(),
    ExampleStateByDefinition.getState(),
    ExampleStateWithoutSingleton(),
  ];

  void _setTextValues([String text = 'Singleton']) {
    for (final state in stateList) {
      state.setStateText(text);
    }
    setState(() {});
  }

  void _reset() {
    for (final state in stateList) {
      state.reset();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (final state in stateList)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Text(state.currentText),
                  ),
                TextButton(
                  onPressed: _setTextValues,
                  child: Text("Change states' text to 'Singleton'"),
                ),
                SizedBox(height: 15.0),
                TextButton(
                  onPressed: _reset,
                  child: Text("reset"),
                ),
                TextButton(
                  onPressed: () {
                    ExampleState();
                  },
                  child: Text('ExampleState 호출'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
