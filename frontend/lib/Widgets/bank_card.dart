// import 'package:flutter/material.dart';

// Widget bankCard(BuildContext context) {
//   return Column(
//     spacing: 12,
//     children: [
//       // Card 1 - Selected
//       Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           border: Border.all(color: const Color(0xff5050F3), width: 2.5),
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//         ),
//         child: Row(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "VISA",
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xff1434CB)),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   "**** 4965",
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.grey.shade700),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   "07/25",
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.grey.shade700),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             Container(
//               width: 56,
//               height: 56,
//               decoration: const BoxDecoration(
//                 color: Color(0xff5050F3),
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(Icons.check, color: Colors.white, size: 28),
//             ),
//           ],
//         ),
//       ),
//       // Card 2 - Not selected
//       Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           border: Border.all(color: Colors.grey.shade300, width: 1),
//           borderRadius: BorderRadius.circular(12),
//           color: Colors.white,
//         ),
//         child: Row(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "VISA",
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xff1434CB)),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   "**** 4779",
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.grey.shade700),
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   "07/25",
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.grey.shade700),
//                 ),
//               ],
//             ),
//             const Spacer(),
//             Container(
//               width: 56,
//               height: 56,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey.shade300, width: 2),
//                 shape: BoxShape.circle,
//               ),
//               child: const Icon(Icons.check, color: Colors.grey, size: 28),
//             ),
//           ],
//         ),
//       ),
//     ],
//   );
// }
