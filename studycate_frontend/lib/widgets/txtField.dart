import 'package:flutter/material.dart';
import 'package:studycate/constants.dart';

class TxtField extends StatefulWidget {
  final String name;
  final String hintText;
  final bool toggle;
  final TextEditingController controller;
  const TxtField(
      {required this.name,
      required this.hintText,
      required this.toggle,
      required this.controller,
      super.key});

  @override
  State<TxtField> createState() => _TxtFieldState();
}

class _TxtFieldState extends State<TxtField> {
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: const TextStyle(
            color: Color(0xFFB7B7B7),
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        widget.toggle
            ? TextField(
                controller: widget.controller,
                style: const TextStyle(
                  color: Color(0xFFB7B7B7),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                obscureText: visible,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(16),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(width: 5, color: textColor),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(width: 2, color: textColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(width: 2, color: themeColor),
                  ),
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                    color: darkerTextColor,
                  ),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: IconButton(
                      icon: Icon(
                        visible ? Icons.visibility : Icons.visibility_off,
                        color: textColor,
                        size: 20.0,
                      ),
                      onPressed: () {
                        setState(() {
                          visible = !visible;
                        });
                      },
                    ),
                  ),
                ),
              )
            : noToggle(widget.hintText, widget.controller),
      ],
    );
  }
}

Widget noToggle(hintText, controller) {
  return TextField(
    controller: controller,
    style: const TextStyle(
      color: Color(0xFFB7B7B7),
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(width: 5, color: textColor),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(width: 2, color: textColor),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(width: 2, color: themeColor),
      ),
      hintText: hintText,
      hintStyle: const TextStyle(
        color: darkerTextColor,
      ),
    ),
  );
}
