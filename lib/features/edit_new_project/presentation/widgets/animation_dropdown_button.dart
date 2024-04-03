// import 'dart:math';
//
// import 'package:flutter/material.dart';
//
// import '/core/constants/app_colors.dart';
//
// class MyCustomWidget extends StatefulWidget {
//   const MyCustomWidget({super.key});
//
//   @override
//   _MyCustomWidgetState createState() => _MyCustomWidgetState();
// }
//
// class _MyCustomWidgetState extends State<MyCustomWidget>
//     with TickerProviderStateMixin {
//   AnimationController? animationController;
//   Animation? _arrowAnimation;
//   AnimationController? _arrowAnimationController;
//   bool isTapped = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _arrowAnimationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );
//     _arrowAnimation =
//         Tween(begin: 0.0, end: pi).animate(_arrowAnimationController!);
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _arrowAnimationController!.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.blue,
//       body: Center(
//         child: firstChild(),
//       ),
//     );
//   }
//
//   Widget firstChild() {
//     return InkWell(
//       splashColor: AppColors.transparent,
//       highlightColor: AppColors.transparent,
//       onHighlightChanged: (value) {
//         setState(() {
//           isTapped = value;
//         });
//       },
//       onTap: () {
//         setState(
//           () {
//             _arrowAnimationController!.isCompleted
//                 ? _arrowAnimationController!.reverse()
//                 : _arrowAnimationController!.forward();
//           },
//         );
//       },
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.fastLinearToSlowEaseIn,
//         height: isTapped ? 45 : 50,
//         width: isTapped ? 45 : 50,
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           shape: BoxShape.circle,
//           boxShadow: [
//             BoxShadow(
//               color: AppColors.black.withOpacity(0.2),
//               blurRadius: 30,
//               offset: const Offset(5, 5),
//             )
//           ],
//         ),
//         child: AnimatedBuilder(
//           animation: _arrowAnimationController!,
//           builder: (context, child) => Transform.rotate(
//             angle: _arrowAnimation!.value,
//             child: const Icon(
//               Icons.expand_more,
//               size: 30.0,
//               color: AppColors.black,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
