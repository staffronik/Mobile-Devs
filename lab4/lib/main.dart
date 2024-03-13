import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Общежитие №20'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //func space
  @override
  void initState() {
    super.initState();
    loadAsset();
  }

  int _likeCounter = 5;
  bool isLiked = false;
  String _fileContents = "";

  Future<void> loadAsset() async {
    String fileText = await rootBundle.loadString('assets/text.txt');
    setState(() {
      _fileContents = fileText;
    });
  }

  Future<void> _shareImage() async {
    XFile file = await XFile('assets/dormitoryImg.png');
    List<XFile> s = [];
    s.add(file);
    await Share.shareXFiles(s);
  }

  _callNumber() async {
    const number = '88005553535'; //set the number here
    return await FlutterPhoneDirectCaller.callNumber(number);
  }

  _buildRoute() async {
    MapsLauncher.launchQuery(
        'Краснодар, улица Калинина 13, корпус 20, Общежитие 20');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView(children: [
        Image.asset('assets/dormitoryImg.png'),
        Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(3.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(children: [
                    Expanded(
                        flex: 4,
                        child: Container(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.all(5.0),
                              child: const Text("Общежитие №20",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 5.0),
                                child: Text("Краснодар, ул. Калинина 13к20",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.5)))),
                          ],
                        ))),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: IconButton(
                          icon: Icon(
                            isLiked ? Icons.favorite : Icons.favorite_border,
                            color: isLiked ? Colors.red : null,
                          ),
                          onPressed: () {
                            setState(() {
                              isLiked = !isLiked;
                              if (isLiked) {
                                _likeCounter++;
                              } else {
                                _likeCounter--;
                              }
                            });
                          },
                        ),
                      ),
                    ),
                    Text(_likeCounter.toString()),
                  ]),
                  Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: _buildRoute, child: Text("Route")),
                          TextButton(
                              onPressed: _callNumber, child: Text("Call")),
                          TextButton(
                            onPressed: _shareImage,
                            child: Text("Share"),
                          )
                        ],
                      )),
                  Flexible(child: Text(_fileContents)),
                ]))
      ]),
    );
  }
}
