import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'camera1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(Bottom_Navigation_Bar());
}

class Bottom_Navigation_Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
CameraController controller;
 @override
  void initState()  {
    super.initState();
    
    controller=CameraController(cameras[0],ResolutionPreset.medium);
    controller.initialize().then((_){
      if (!mounted) {
        return;
      }
      setState(() {
        
      });
    });
  }
 

  int index = 0;
  var home_color = [Colors.blue, Colors.cyan, Colors.green];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation"),
      ),
      body: Container(
        color: home_color[index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int i) {
          setState(() {
            index = i;
          });
          if(index==1){
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraApp(controller),
                ));
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.camera),
              title: Text("Camera"),
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text("Chat"),
              backgroundColor: Colors.black),
        ],
      ),
    );
  }
}