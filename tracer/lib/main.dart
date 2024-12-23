import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(TracingApp());
}

class TracingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tracing App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TracingScreen(),
    );
  }
}

class TracingScreen extends StatefulWidget {
  @override
  _TracingScreenState createState() => _TracingScreenState();
}

class _TracingScreenState extends State<TracingScreen> {
  List<Offset?> _points = []; // Stores points for drawing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn to Trace'),
      ),
      body: Stack(
        children: [
          // The canvas with the red swiggly line
          CustomPaint(
            size: Size(double.infinity, double.infinity),
            painter: RedSwigglyLinePainter(),
          ),
          // The drawing overlay
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                RenderBox box = context.findRenderObject() as RenderBox;
                _points.add(box.globalToLocal(details.globalPosition));
              });
            },
            onPanEnd: (details) {
              setState(() {
                _points.add(null);
              });
            },
            child: CustomPaint(
              size: Size(double.infinity, double.infinity),
              painter: DrawingPainter(_points),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _points.clear();
          });
        },
        child: Icon(Icons.refresh),
        tooltip: 'Clear Drawing',
      ),
    );
  }
}

class RedSwigglyLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke;

    Path path = Path();
    path.moveTo(50, size.height / 2);
    for (double i = 50; i < size.width - 50; i += 20) {
      path.quadraticBezierTo(
        i + 10,
        size.height / 2 - 20,
        i + 20,
        size.height / 2,
      );
      path.quadraticBezierTo(
        i + 30,
        size.height / 2 + 20,
        i + 40,
        size.height / 2,
      );
    }

    for (ui.PathMetric metric in path.computeMetrics()) {
      for (double i = 0; i < metric.length; i += 10) {
        ui.Tangent? tangent = metric.getTangentForOffset(i);
        if (tangent != null) {
          canvas.drawCircle(tangent.position, 3.0, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DrawingPainter extends CustomPainter {
  final List<Offset?> points;

  DrawingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
