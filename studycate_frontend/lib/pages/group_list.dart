import 'package:flutter/material.dart';

class groupList extends StatelessWidget {
  const groupList({super.key});

  @override
  Widget build(BuildContext context) {

 
      

    var groupNames = ['CMPN-1 group', 'Mukesh classes', 'ECS-2 group','CMPN-1 group', 'Mukesh classes', 'CMPN-1 group', 'Mukesh classes', 'CMPN-1 group', 'Mukesh classes', ];
    var groupMembers = ['10', '20', '30','10', '20','10', '20','10', '20','10', '20','10', '20',];

    return Scaffold(
      backgroundColor: const Color(0xff030C11),
      appBar: AppBar(
        backgroundColor: Color(0xff071219),
        title: Text("Groups",style: TextStyle(color: Color(0xffA0A0A0),fontWeight: FontWeight.bold),),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search,color: Color(0xffA0A0A0),),
            tooltip: 'Search Icon',
            onPressed: () {},
          ), 
          IconButton(
            icon: const Icon(Icons.person, color: Color(0xffA0A0A0),),
            tooltip: 'User Profile',
            onPressed: () {},
          ), 
        ], 
      ),
      body: 
        Padding(
          padding: const EdgeInsets.only(top: 45, left: 24, right: 24),
          child: ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 24),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 2),
                  borderRadius: BorderRadius.circular(16),
                ),
                title: Text(groupNames[index]),
                tileColor: Color(0xffE7E7E7),
                subtitle: Text(groupMembers[index] + ' Members'),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xffD76528),
                ),
              );
            },
            itemCount: groupNames.length,
            separatorBuilder: (context, index) => SizedBox(height: 16),
          ),
        ),
      
    );
  }
}