
 import 'package:cupcat/features/home/presentation/widgets/Inbox/features.dart';
import 'package:cupcat/features/home/presentation/widgets/Inbox/interactions.dart';
import 'package:flutter/material.dart';

import '../widgets/Inbox/official1.dart';


class Inbox extends StatelessWidget {
  List<String> tabNames = [
    'CapCut official',
    'Interactions',
    'Features',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
         appBar: AppBar(

           title: Text(
             'Inbox',
             textAlign: TextAlign.center,
           ),   centerTitle: true,
           bottom: TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,

            indicatorPadding: EdgeInsets.all(0.0),
                  indicatorWeight: 4.0,
                  labelPadding: EdgeInsets.only(left: 2.0, right: 2.0),


                 tabs: tabNames.map((String tabName) {
                   return Tab(
                     child: Text(
                       tabName,
                       style: TextStyle(
                         fontSize: 13,
                       ),
                     ),
                   );
                 }).toList(),
               )


        ),

        body: TabBarView(
          children: [
            CapCutOfficial(),
            TabInteraction(),
            TabFeatures(),
          ],
        ),
      ),
    );
  }
}



