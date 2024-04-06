import 'package:flutter/material.dart';

import 'InboxCardCustom.dart';

class OfiicialListItems extends StatelessWidget {
  final List<String> titles;
  final List<String> subtitles;
  final List<String> dates;

  const OfiicialListItems(
      {Key? key,
      required this.titles,
      required this.subtitles,
      required this.dates})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: titles.length,
      itemBuilder: (context, index) {
        final title = titles[index];
        final subtitle = subtitles[index];
        final date = dates[index];

        return InboxCardCustom(
          date: date,
          title: title,
          subtitle: subtitle,
        );
      },
    );
  }
}
