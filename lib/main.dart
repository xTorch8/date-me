import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Date Me?',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> rejectionMessage = [
    "Are you sure?",
    "Please no :(",
    "Give me a chance :'",
    "Accept me please"
  ];

  var acceptanceMessage = "Yay! Love you <3 :D";

  var message = "";
  var counter = 0;
  var showDateMe = true;

  void noButtonClickHandler() {
    setState(() {
      message = rejectionMessage[counter % 4];
      counter = counter + 1;
    });
  }

  void yesButtonClickHandler() {
    setState(() {
      message = acceptanceMessage;
      showDateMe = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showDateMe)
              Column(
                children: [
                  Text('Date me?', style: TextStyle(fontSize: 36)),
                  ElevatedButton(
                      onPressed: () => noButtonClickHandler(),
                      child: Text("No")),
                  ElevatedButton(
                      onPressed: () => yesButtonClickHandler(),
                      child: Text("Yes")),
                  Text(message, style: TextStyle(fontSize: 24))
                ],
              ),
            if (!showDateMe) Text(message, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
