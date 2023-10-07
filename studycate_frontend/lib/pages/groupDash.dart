import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:studycate/classes/group.dart';
import 'package:studycate/classes/groupDetailed.dart';
import 'package:studycate/constants.dart';

class GroupDashPage extends StatefulWidget {
  final GroupDetailed group;
  const GroupDashPage({required this.group, super.key});

  @override
  State<GroupDashPage> createState() => _GroupDashPageState();
}

class _GroupDashPageState extends State<GroupDashPage> {
  @override
  void initState() {
    super.initState();
    Timer mytimer = Timer.periodic(const Duration(seconds: 10), (timer) {});
  }

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        color: bgColor,
        image: DecorationImage(
          image: AssetImage('assets/images/threads.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.chevron_left, color: textColor),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: GestureDetector(
              onTap: () {
                _controller.animateToPage(0,
                    duration: Duration(milliseconds: 400),
                    curve: Curves.easeInOut);
              },
              child: Text(
                widget.group.name!,
                style: const TextStyle(
                  color: Color(0xFFB7B7B7),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 45, left: 24, right: 24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: chatBtnColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                            child: Image.asset("assets/images/chatIcon.png")),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.animateToPage(2,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    },
                    child: Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: libBtnColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                            child: Image.asset("assets/images/bookIcon.png")),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: qnaBtnColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Center(
                            child: Image.asset("assets/images/qnaIcon.png")),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 70.0,
                      width: 70.0,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: studyseshBtnColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                            child: Image.asset("assets/images/groupIcon.png")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    height: size.height * 0.6,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: darkerBgColor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            top: 24,
                          ),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(15)),
                                child: Image.network(
                                  widget.group.grpIcon!,
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.group.name!,
                                    style: const TextStyle(
                                      color: textColor,
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    widget.group.description ?? "",
                                    style: const TextStyle(
                                      color: textColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            top: 20,
                          ),
                          child: Text(
                            'Created by: ${widget.group.admin!.first}',
                            style: const TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            top: 20,
                          ),
                          child: Text(
                            'Created on: ${widget.group.createdAt}',
                            style: const TextStyle(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Chats',
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Library',
                        style: const TextStyle(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
