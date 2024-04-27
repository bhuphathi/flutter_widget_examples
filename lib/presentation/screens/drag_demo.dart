import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DragDemo(),
    );
  }
}

class DragDemo extends StatefulWidget {
  const DragDemo({super.key});

  @override
  _DragDemoState createState() => _DragDemoState();
}

class _DragDemoState extends State<DragDemo> {
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drag Demo'),
      ),
      body: Center(
        child: Draggable<Color>(
          data: _color,
          feedback: Container(
            width: 100,
            height: 100,
            color: _color.withOpacity(0.5),
            child: const Center(
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
            child: const Center(
              child: Text(
                'Dragged',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          child: Container(
            width: 100,
            height: 100,
            color: _color,
            child: const Center(
              child: Text(
                'Drag Me',
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
        child: const Icon(Icons.color_lens),
      ),
    );
  }
}
