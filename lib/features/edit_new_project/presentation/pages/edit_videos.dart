import '/features/edit_new_project/presentation/widgets/general_new_project_scaffold.dart';
import 'package:flutter/material.dart';

class EditVideos extends StatelessWidget {
  const EditVideos({super.key});

  @override
  Widget build(BuildContext context) {
    return GeneralNewProjectScaffold(
      body: Center(
        child: Container(
          width: 50,
          height: 50,
          color: Colors.white,
        ),
      ),
    );
  }
}
