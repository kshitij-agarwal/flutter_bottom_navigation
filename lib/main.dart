import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'camera1.dart';

void main() {
  runApp(bottom_navigation());
}

class bottom_navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bottom Navigation",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index1 = 0;
  var home_color = [
    Colors.yellow,
    Colors.red,
    Colors.blue,
    Colors.limeAccent[400]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation"),
      ),
      body: Container(
        color: home_color[index1],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index1,
        onTap: (int i) {
          setState(() {
            index1 = i;
          });
          if (index1 == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => camera_run(),
                ));
                
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title: Text("Camera"),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            title: Text("Chat"),
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: Text("Menu"),
            backgroundColor: Colors.limeAccent[400],
          ),
        ],
      ),
    );
  }
}
