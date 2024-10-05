import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Text("Aspect Ratio Demo",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
          centerTitle: true,
          backgroundColor: Colors.blue,

        ),
        body: Center(
          child: Container(                           ///Aspect Ratio=width/height=HCM(ratio)
            height: 200,
            width: 300,
            color: Colors.amber,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network("https://th.bing.com/th/id/OIP.BWm_wn-EGtmHm_B0PGnP-QHaE8?rs=1&pid=ImgDetMain"),
          ),
          ),
        ),
      ),
    );
  }
}
