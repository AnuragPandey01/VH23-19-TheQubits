import 'package:flutter/material.dart';
import 'package:studycate/constants.dart';

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
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: textColor,
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
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.only(top: 45, left: 24, right: 24),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {},
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
