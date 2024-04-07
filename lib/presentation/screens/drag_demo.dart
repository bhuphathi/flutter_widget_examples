import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DragDemo(),
    );
  }
}

class DragDemo extends StatefulWidget {
  @override
  _DragDemoState createState() => _DragDemoState();
}

class _DragDemoState extends State<DragDemo> {
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drag Demo'),
      ),
      body: Center(
        child: Draggable<Color>(
          data: _color,
          child: Container(
            width: 100,
            height: 100,
            color: _color,
            child: Center(
              child: Text(
                'Drag Me',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          feedback: Container(
            width: 100,
            height: 100,
            color: _color.withOpacity(0.5),
            child: Center(
              child: Text(
                'Dragging...',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          childWhenDragging: Container(
            width: 100,
            height: 100,
            color: Colors.grey,
            child: Center(
              child: Text(
                'Dragged',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _color = _color == Colors.blue ? Colors.red : Colors.blue;
          });
        },
        child: Icon(Icons.color_lens),
      ),
    );
  }
}
