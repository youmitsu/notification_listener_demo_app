import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

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
  ScrollNotification _notification = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationListenerDemo'),
      ),
      body: Stack(
        children: <Widget>[
          NotificationListener<ScrollNotification>(
            child: SingleChildScrollView(
              child: Column(
                children: _buildCards(),
              ),
            ),
            onNotification: (notification) {
              Logger()..d(notification);
              setState(() {
                _notification = notification;
              });
              return false;
            },
          ),
          Center(
            child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              child: Text(
                _notification.runtimeType.toString(),
              ),
            ),
          ),
        ],
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
