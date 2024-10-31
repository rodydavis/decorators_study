import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: const MyButton(),
      ),
    ),
  );
}

class MyButton extends StatefulWidget {
  const MyButton({super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Text('Click me')
      .gestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Button clicked!')),
          );
        },
      )
      .animatedContainer(
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: _isHovering ? Colors.orange : Colors.amber,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              offset: Offset(5, 5),
              blurRadius: 5,
            ),
          ],
        ),
      )
      .center();
  }
}
