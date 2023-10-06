import 'package:flutter/material.dart';
import 'package:studycate/constants.dart';

TabBar get tabBar => TabBar(
      dividerColor: Colors.transparent,
      unselectedLabelColor: Colors.white,
      labelColor: Colors.white,
      labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      indicatorSize: TabBarIndicatorSize.tab,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: themeColor,
      ),
      indicatorColor: themeColor,
      tabs: const [
        Tab(text: "School"),
        Tab(
          text: "College",
        ),
      ],
    );
