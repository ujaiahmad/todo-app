import 'package:flutter/material.dart';

class CustomRowTask extends StatefulWidget {
  const CustomRowTask({
    super.key,
    required this.taskName,
    required this.deleteWidgetCallback,
  });
  final String taskName;
  final void Function() deleteWidgetCallback;
  @override
  State<CustomRowTask> createState() => _CustomRowTaskState();
}

class _CustomRowTaskState extends State<CustomRowTask> {
  bool isComplete = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.taskName,
            style: isComplete
                ? const TextStyle(decoration: TextDecoration.lineThrough)
                : const TextStyle(decoration: null)),
        Spacer(),
        CustomCheckbox(
          isComplete: isComplete,
          toggleBoolCallback: (p0) {
            setState(() {
              isComplete = !isComplete;
            });
          },
        ),
        IconButton(
            onPressed: widget.deleteWidgetCallback, icon: Icon(Icons.delete))
      ],
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.isComplete,
    required this.toggleBoolCallback,
  });
  final bool isComplete;
  final void Function(bool?) toggleBoolCallback;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.green,
      value: isComplete,
      onChanged: toggleBoolCallback,
    );
  }
}
