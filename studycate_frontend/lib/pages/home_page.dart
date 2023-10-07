import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studycate/classes/group.dart';
import 'package:studycate/classes/groupDetailed.dart';
import 'package:http/http.dart' as http;
import 'package:studycate/classes/user.dart';
import 'package:studycate/constants.dart';
import 'package:studycate/functions.dart';
import 'package:studycate/pages/groupDash.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: const Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              "Groups",
              style: TextStyle(
                color: textColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Tooltip(
              message: "Create a study group",
              child: IconButton(
                onPressed: () async {
                  Navigator.of(context).pushNamed('/createGroup');
                },
                icon: const Icon(
                  Icons.add,
                  color: textColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).popAndPushNamed('/login');
                },
                icon: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(35)),
                  child: Image.network(
                    loggedInUser.profileImg!,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () async {
                var msg =
                    await displayTextInputDialog("Join a study group", context);
                var obj = jsonEncode({
                  "userId": loggedInUser.id,
                  "invitationCode": msg,
                });
                var response = await http.post(
                  joinGroupUri,
                  headers: {"Content-Type": "application/json"},
                  body: obj,
                );
                if (response.statusCode == 200) {
                  var responsegrps = await http.post(
                    groupsUri,
                    headers: {"Content-Type": "application/json"},
                    body: jsonEncode({
                      "userId": loggedInUser.id,
                    }),
                  );
                  Iterable l = jsonDecode(responsegrps.body);
                  groups = (json.decode(responsegrps.body) as List)
                      .map((i) => Group.fromJson(i))
                      .toList();
                  setState(() {});
                } else {
                  errorDlg(
                      context, "Error", jsonDecode(response.body)['error']);
                }
              },
              child: Container(
                height: 60.0,
                width: 60.0,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(
                    colors: [themeColor, darkerThemeColor],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Center(child: Icon(Icons.people)),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 45, left: 24, right: 24),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () async {
                  var response = await http.post(
                    groupDtlsUri,
                    headers: {"Content-Type": "application/json"},
                    body: jsonEncode({
                      "groupId": groups[index].id,
                    }),
                  );
                  if (response.statusCode == 200) {
                    groupd = GroupDetailed.fromJson(jsonDecode(response.body));
                    GroupDashPage grp = GroupDashPage(group: groupd);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => grp));
                  } else {
                    errorDlg(
                        context, "Error", jsonDecode(response.body)['error']);
                  }
                },
                contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                leading: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(35)),
                  child: Image.network(
                    groups[index].grpIcon!,
                    width: 40,
                    height: 40,
                  ),
                ),
                title: Text(groups[index].name!),
                tileColor: lightertextColor,
                subtitle: Text('${groups[index].members} Members'),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xffD76528),
                ),
              );
            },
            itemCount: groups.length,
            separatorBuilder: (context, index) => const SizedBox(height: 16),
          ),
        ),
      ),
    );
  }
}
