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
  static const length = 10;
  ScrollNotification _notification;
  final ScrollController _scrollController = ScrollController();

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
              controller: _scrollController,
              child: Column(
                children: _buildCards(),
              ),
            ),
            onNotification: (notification) {
              Logger()..d(notification);
              if (notification is ScrollStartNotification) {
                Logger()..d(notification.dragDetails);
              } else if (notification is UserScrollNotification) {
                Logger()..d(notification.direction);
              } else if (notification is ScrollUpdateNotification) {
                Logger()..d(notification.dragDetails);
              } else if (notification is ScrollEndNotification) {
                Logger()..d(notification.dragDetails);
              } else if (notification is OverscrollNotification) {
                Logger()..d(notification.dragDetails);
              }
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_downward),
        onPressed: () {
          _scrollController.animateTo(200,
              duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        },
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
