import 'package:flutter/material.dart';
import 'package:studycate/constants.dart';

class TxtField extends StatefulWidget {
  final String name;
  final String hintText;
  final bool toggle;
  final TextEditingController controller;
  bool? valid;
  TxtField(
      {required this.name,
      required this.hintText,
      required this.toggle,
      required this.controller,
      this.valid,
      super.key});

  @override
  State<TxtField> createState() => _TxtFieldState();
}

class _TxtFieldState extends State<TxtField> {
  bool hidden = true;
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
        const SizedBox(height: 10),
        widget.toggle
            ? TextFormField(
                controller: widget.controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                style: const TextStyle(
                  color: Color(0xFFB7B7B7),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                obscureText: hidden,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(14),
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
                    padding: const EdgeInsets.all(6.0),
                    child: IconButton(
                      icon: Icon(
                        hidden ? Icons.visibility_off : Icons.visibility,
                        color: textColor,
                        size: 20.0,
                      ),
                      onPressed: () {
                        setState(() {
                          hidden = !hidden;
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
  return TextFormField(
    controller: controller,
    style: const TextStyle(
      color: Color(0xFFB7B7B7),
      fontSize: 18,
      fontWeight: FontWeight.w400,
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
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
