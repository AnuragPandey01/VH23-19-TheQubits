import 'package:flutter/material.dart';
import 'package:studycate/constants.dart';

Widget onBoarding({
  required String image,
  required String title,
  required String subtitle,
}) =>
    Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 36, right: 34),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(image)),
              const SizedBox(
                height: 60,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xffA0A0A0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
