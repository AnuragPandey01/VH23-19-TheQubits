import 'dart:ui';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:studycate/classes/group.dart';
import 'package:studycate/classes/groupDetailed.dart';
import 'package:studycate/classes/user.dart';

const Color textColor = Color(0xFFB7B7B7);
const Color lightertextColor = Color(0xFFd4d4d4);
const Color darkerTextColor = Color(0xFF42434A);
const Color themeColor = Color(0xFFD76528);
const Color darkerThemeColor = Color(0xFFAC4514);
//const Color bgColor = Color(0xFF030C11);
const Color bgColor = Color(0xFF071219);
const Color darkerBgColor = Color(0xFF040b0f);
const chatBtnColor = Color(0xFF93B6D7);
const libBtnColor = Color(0xFFA8D793);
const qnaBtnColor = Color(0xFFB8A7EA);
const studyseshBtnColor = Color(0xFFE0C091);

final api = Uri.parse("http://139.59.78.179:8080/");
final loginUri = Uri.parse("http://139.59.78.179:8080/user/login");
final registerUri = Uri.parse("http://139.59.78.179:8080/user/register");
final groupsUri = Uri.parse("http://139.59.78.179:8080/user/chatGroups");
final joinGroupUri = Uri.parse("http://139.59.78.179:8080/user/joinGroup");
final createGroupUri = Uri.parse("http://139.59.78.179:8080/group/create");
final groupDtlsUri = Uri.parse("http://139.59.78.179:8080/group/info");

User loggedInUser = User();
List<Group> groups = [];
GroupDetailed groupd = GroupDetailed();
