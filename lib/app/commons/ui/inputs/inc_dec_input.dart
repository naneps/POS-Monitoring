import 'package:flutter/material.dart';

class IncDecInput extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final ValueChanged<int> onChange;
  final double iconSize;
  final double textSize;
  final Color? minBtnColor;
  final Color? addBtnColor;
  final Color? buttonBackgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final VisualDensity? visualDensity;

  const IncDecInput({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.onChange,
    this.iconSize = 24.0,
    this.textSize = 12.0,
    this.minBtnColor,
    this.addBtnColor,
    this.buttonBackgroundColor,
    this.textStyle,
    this.padding = const EdgeInsets.all(0),
    this.visualDensity = VisualDensity.compact,
  });

  @override
  _IncrementDecrementInputState createState() =>
      _IncrementDecrementInputState();
}

class _IncrementDecrementInputState extends State<IncDecInput> {
  late int _value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          onPressed: _decrement,
          icon: Icon(Icons.remove, size: widget.iconSize),
          color: widget.minBtnColor ?? Colors.red,
          style: IconButton.styleFrom(
            backgroundColor: widget.buttonBackgroundColor,
            shape: const CircleBorder(),
            visualDensity: widget.visualDensity,
            padding: widget.padding,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          child: Text(
            '$_value',
            style: widget.textStyle ??
                TextStyle(
                  fontSize: widget.textSize,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        IconButton(
          onPressed: _increment,
          icon: Icon(Icons.add, size: widget.iconSize),
          color: widget.addBtnColor ?? Colors.green,
          style: IconButton.styleFrom(
            backgroundColor: widget.buttonBackgroundColor,
            shape: const CircleBorder(),
            visualDensity: widget.visualDensity,
            padding: widget.padding,
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _value = widget.initialValue;
  }

  void _decrement() {
    if (_value > widget.minValue) {
      setState(() {
        _value--;
        widget.onChange(_value);
      });
    }
  }

  void _increment() {
    if (_value < widget.maxValue) {
      setState(() {
        _value++;
        widget.onChange(_value);
      });
    }
  }
}
