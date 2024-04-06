import 'package:flutter/material.dart';

import '../../../Inbox/presentation/widgets/inbox_appbar.dart';
import 'home_appbar.dart';

class AppBarCustomI extends StatelessWidget implements PreferredSizeWidget {
  final int index;

  //final double? height ;
  const AppBarCustomI({required this.index});

  @override
  Size get preferredSize => index == 1
      ? const Size.fromHeight(kToolbarHeight)
      : Size.fromHeight(100!);

  @override
  Widget build(BuildContext context) {
    return index == 1 ? HomeAppBar() : InboxAppBar();
  }
}
