import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color color = Colors.grey;
  bool dragged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            DragTarget<Color>(
              onAccept: (data) => setState(() {
                color = data;
                dragged = true;
              }),
              builder: (BuildContext context, _, __) {
                return Container(
                  width: 200,
                  height: 200,
                  color: color,
                );
              },
            ),
            IgnorePointer(
              ignoring: dragged,
              child: Opacity(
                opacity: dragged ? 0 : 1,
                child: Draggable<Color>(
                  data: Colors.blue,
                  feedback: Container(
                    width: 200,
                    height: 200,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(offset: Offset(3, 3), blurRadius: 5)
                      ],
                      color: Colors.blue,
                    ),
                  ),
                  childWhenDragging: const SizedBox(
                    width: 200,
                    height: 200,
                  ),
                  child: Container(
                    width: 200,
                    height: 200,
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
