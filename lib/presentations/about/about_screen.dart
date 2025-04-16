import 'package:flutter/material.dart';

import 'widgets/button_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ///////////////////////   Logo   ////////////////////////
        Image(
          image: AssetImage("assets/logo.png"),
          width: MediaQuery.sizeOf(context).width * 0.8,
        ),
        ///////////////////////   Spacer  ////////////////////////
        SizedBox(height: 10),
        ///////////////////////  Copyright Button   ////////////////////////
        AnimatedShadowButton(
          txt:
              "Copyright © 2025\nAll Rights Reserved.\nDesigned and Developed by\nSAMER SAIED.\n\nIt is high time to understand the demand of the market and upscale the business using Mobile App Development services. Contact me, we would love to execute your idea and take your business to next level.",
        ),
      ],
    );
  }
}

// class IconLeftInput extends StatelessWidget {
//   final String txt;
//   final IconData icon;
//   const IconLeftInput({super.key, required this.txt, required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: PrimaryContainer(
//         radius: 10,
//         child: TextFormField(
//           style: const TextStyle(fontSize: 18, color: Colors.white),
//           controller: TextEditingController(),
//           textAlignVertical: TextAlignVertical.center,

//           decoration: InputDecoration(
//             contentPadding: const EdgeInsets.only(
//               left: 20,
//               right: 20,
//               bottom: 3,
//             ),

//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(color: Color(0xFF00BAAB)),
//             ),
//             errorBorder: InputBorder.none,
//             disabledBorder: InputBorder.none,
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(color: Colors.grey),
//             ),
//             hintText: txt,
//             prefixIcon: Icon(icon),
//             hintStyle: const TextStyle(fontSize: 18, color: Colors.grey),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PrimaryContainer extends StatelessWidget {
//   final Widget child;
//   final double? radius;
//   final Color? color;
//   const PrimaryContainer({
//     super.key,
//     this.radius,
//     this.color,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(radius ?? 30),
//         boxShadow: [
//           BoxShadow(color: color ?? const Color(0XFF1E1E1E)),
//           const BoxShadow(
//             offset: Offset(2, 2),
//             blurRadius: 4,
//             spreadRadius: 0,
//             color: Colors.black,
//           ),
//         ],
//       ),
//       child: child,
//     );
//   }
// }
