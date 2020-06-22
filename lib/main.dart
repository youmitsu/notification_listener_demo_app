import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NotificationListenerDemo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const length = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationListenerDemo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _buildCards(),
        ),
      ),
    );
  }

  List<Widget> _buildCards() {
    return List.generate(
      length,
      (index) => Card(
        child: Container(
          height: 200,
          color: Colors.amber,
        ),
      ),
    );
  }
}
