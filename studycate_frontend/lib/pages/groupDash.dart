import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scalable_ocr/flutter_scalable_ocr.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:studycate/classes/group.dart';
import 'package:studycate/classes/groupDetailed.dart';
import 'package:http/http.dart' as http;
import 'package:studycate/constants.dart';
import 'package:studycate/functions.dart';
import 'package:studycate/widgets/btn.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    var creation = jsonDecode(jsonEncode(widget.group.createdAt));
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
              onTap: () async {
                var response = await http.post(
                  groupDtlsUri,
                  headers: {"Content-Type": "application/json"},
                  body: jsonEncode({
                    "groupId": groupd.id,
                  }),
                );
                if (response.statusCode == 200) {
                  groupd = GroupDetailed.fromJson(jsonDecode(response.body));
                  GroupDashPage grp = GroupDashPage(group: groupd);
                  await _controller.animateToPage(0,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut);
                } else {
                  errorDlg(
                      context, "Error", jsonDecode(response.body)['error']);
                }
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
              padding: const EdgeInsets.only(top: 25, left: 24, right: 24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await refreshLib();
                      setState(() {});
                      _controller.animateToPage(1,
                          duration: const Duration(milliseconds: 400),
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
                    onTap: () {
                      _controller.animateToPage(2,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    },
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
                    onTap: () {
                      _controller.animateToPage(3,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    },
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
                  GestureDetector(
                    onTap: () {
                      _controller.animateToPage(4,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    },
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
                            top: 60,
                          ),
                          child: Text(
                            'Created by: ${widget.group.creatorName}',
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
                            'Created on: ${creation['day']}/${creation['month']}/${creation['year']}',
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
                            'No. of members: ${groupd.memberC} members',
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
                            top: 50,
                          ),
                          child: Btn(
                            text: "Leave group",
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.6,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: darkerBgColor,
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 70.0),
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                              return Material(
                                type: MaterialType.transparency,
                                child: ListTile(
                                  onTap: () async {
                                    final supabase = Supabase.instance.client;
                                    final Directory tempDir =
                                        await getTemporaryDirectory();
                                    final Uint8List file = await supabase
                                        .storage
                                        .from('qubits')
                                        .download(library[index].name);
                                    await File(
                                            "${tempDir.path}/${library[index].name}")
                                        .writeAsBytes(file);
                                    OpenFile.open(
                                        "${tempDir.path}/${library[index].name}");
                                  },
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(width: 2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  leading: const Icon(Icons.file_open),
                                  title: Text(library[index].name),
                                  tileColor: Colors.white,
                                  /*subtitle:
                                      Text('${groups[index].members} Members'),*/
                                  trailing: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Color(0xffD76528),
                                  ),
                                ),
                              );
                            },
                            itemCount: library.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                            right: 30.0,
                            top: 15,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Library',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              TextButton(
                                  child: Text(
                                    "Upload",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(themeColor),
                                  ),
                                  onPressed: () async {
                                    final supabase = Supabase.instance.client;
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles();

                                    if (result != null) {
                                      File file =
                                          File(result.files.single.path!);
                                      final String path = await supabase.storage
                                          .from('qubits')
                                          .upload(
                                            'public/qubits.png',
                                            file,
                                            fileOptions: const FileOptions(
                                                cacheControl: '3600',
                                                upsert: false),
                                          );
                                      await refreshLib();
                                      setState(() {});
                                    }
                                  })
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.6,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: darkerBgColor,
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 30.0,
                            right: 30.0,
                            top: 70,
                          ),
                          child: Column(
                            children: [
                              ScalableOCR(
                                paintboxCustom: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 4.0
                                  ..color =
                                      const Color.fromARGB(153, 102, 160, 241),
                                boxLeftOff: 4,
                                boxBottomOff: 2.7,
                                boxRightOff: 4,
                                boxTopOff: 2.7,
                                boxHeight:
                                    MediaQuery.of(context).size.height / 5,
                                getRawData: (value) {
                                  inspect(value);
                                },
                                getScannedText: (value) {
                                  print(value);
                                },
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 30.0,
                            right: 30.0,
                            top: 15,
                          ),
                          child: Text(
                            'Q & A',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.6,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: darkerBgColor,
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                            right: 30.0,
                            top: 70,
                          ),
                          child: Column(
                            children: [
                              Btn(
                                text: "Create Session",
                                onTap: () {},
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Btn(
                                text: "Join Session",
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 30.0,
                            right: 30.0,
                            top: 15,
                          ),
                          child: Text(
                            'Study Session',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.6,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      color: darkerBgColor,
                    ),
                    child: Stack(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 70,
                              bottom: 40,
                            ),
                            child: SingleChildScrollView(
                              child: Image.asset(
                                'assets/images/group_chat.png',
                                width: size.width - 10,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                            right: 30.0,
                            top: 15,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Chat',
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Container(
                                color: darkerBgColor,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: MessageBar(
                                    sendButtonColor: themeColor,
                                    messageBarColor: darkerBgColor,
                                    onSend: (_) => print(_),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
