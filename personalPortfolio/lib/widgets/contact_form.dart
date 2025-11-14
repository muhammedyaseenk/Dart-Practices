// import 'package:flutter/material.dart';

// class ContactForm extends StatefulWidget {
//   const ContactForm({super.key});

//   @override
//   State<ContactForm> createState() => _ContactFormState();
// }

// class _ContactFormState extends State<ContactForm> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(16),
//         gradient: const LinearGradient(
//           colors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             "🚀 Let’s Build Something Together",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           const SizedBox(height: 8),
//           const Text(
//             "Drop your email (and name if you like) — I’ll respond quickly.",
//             style: TextStyle(color: Colors.grey, fontSize: 13),
//           ),
//           const SizedBox(height: 16),

//           // Email field
//           TextField(
//             controller: emailController,
//             autofocus: true,
//             style: const TextStyle(color: Colors.white),
//             keyboardType: TextInputType.emailAddress,
//             decoration: InputDecoration(
//               hintText: "your.email@example.com",
//               hintStyle: const TextStyle(color: Colors.grey),
//               filled: true,
//               fillColor: Colors.white.withOpacity(0.05),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(color: Colors.purple, width: 2),
//               ),
//             ),
//           ),
//           const SizedBox(height: 14),

//           // Name field
//           TextField(
//             controller: nameController,
//             style: const TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               hintText: "Name (optional)",
//               hintStyle: const TextStyle(color: Colors.grey),
//               filled: true,
//               fillColor: Colors.white.withOpacity(0.05),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 borderSide: const BorderSide(color: Colors.blue, width: 2),
//               ),
//             ),
//           ),
//           const SizedBox(height: 20),

//           // Submit button
//           SizedBox(
//             width: double.infinity,
//             child: InkWell(
//               onTap: () {
//                 Navigator.pop(context);
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text(
//                       "Thanks ${nameController.text}! I’ll connect via ${emailController.text}",
//                     ),
//                   ),
//                 );
//               },
//               borderRadius: BorderRadius.circular(12),
//               child: Ink(
//                 padding: const EdgeInsets.symmetric(vertical: 14),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   gradient: const LinearGradient(
//                     colors: [Colors.blue, Colors.purple],
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                   ),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     "Share & Connect",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class ContactForm extends StatefulWidget {
//   const ContactForm({super.key});

//   @override
//   State<ContactForm> createState() => _ContactFormState();
// }

// class _ContactFormState extends State<ContactForm> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "🚀 Let’s Build Something Together",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(height: 8),
//         const Text(
//           "Drop your email (and name if you like) — I’ll respond quickly.",
//           style: TextStyle(color: Colors.grey, fontSize: 13),
//         ),
//         const SizedBox(height: 16),

//         // Email field (autofocus)
//         TextField(
//           controller: emailController,
//           autofocus: true,
//           style: const TextStyle(color: Colors.white),
//           keyboardType: TextInputType.emailAddress,
//           decoration: InputDecoration(
//             hintText: "your.email@example.com",
//             hintStyle: const TextStyle(color: Colors.grey),
//             filled: true,
//             fillColor: Colors.white.withOpacity(0.05),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Colors.purple, width: 2),
//             ),
//           ),
//         ),
//         const SizedBox(height: 14),

//         // Name field
//         TextField(
//           controller: nameController,
//           style: const TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//             hintText: "Name (optional)",
//             hintStyle: const TextStyle(color: Colors.grey),
//             filled: true,
//             fillColor: Colors.white.withOpacity(0.05),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Colors.blue, width: 2),
//             ),
//           ),
//         ),
//         const SizedBox(height: 20),

//         // Submit button
//         SizedBox(
//           width: double.infinity,
//           child: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(
//                     "Thanks ${nameController.text}! I’ll connect via ${emailController.text}",
//                   ),
//                 ),
//               );
//             },
//             borderRadius: BorderRadius.circular(12),
//             child: Ink(
//               padding: const EdgeInsets.symmetric(vertical: 14),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 gradient: const LinearGradient(
//                   colors: [Colors.blue, Colors.purple],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                 ),
//               ),
//               child: const Center(
//                 child: Text(
//                   "Share & Connect",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // lib/widgets/contact_form.dart
// import 'package:flutter/material.dart';

// class ContactForm extends StatefulWidget {
//   const ContactForm({super.key});

//   @override
//   State<ContactForm> createState() => _ContactFormState();
// }

// class _ContactFormState extends State<ContactForm> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         const Text(
//           "🚀 Let’s Build Something Together",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//         const SizedBox(height: 10),
//         const Text(
//           "Drop your email (and name if you like) — I’ll respond quickly.",
//           style: TextStyle(color: Colors.grey, fontSize: 14),
//           textAlign: TextAlign.center,
//         ),
//         const SizedBox(height: 20),

//         // Email field
//         TextField(
//           controller: emailController,
//           style: const TextStyle(color: Colors.white),
//           keyboardType: TextInputType.emailAddress,
//           decoration: InputDecoration(
//             hintText: "your.email@example.com",
//             hintStyle: const TextStyle(color: Colors.grey),
//             filled: true,
//             fillColor: Colors.white.withOpacity(0.05),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Colors.purple, width: 2),
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),

//         // Name field
//         TextField(
//           controller: nameController,
//           style: const TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//             hintText: "Name (optional)",
//             hintStyle: const TextStyle(color: Colors.grey),
//             filled: true,
//             fillColor: Colors.white.withOpacity(0.05),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12),
//               borderSide: const BorderSide(color: Colors.blue, width: 2),
//             ),
//           ),
//         ),
//         const SizedBox(height: 24),

//         // Ripple Submit Button
//         SizedBox(
//           width: double.infinity,
//           child: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: Text(
//                       "Thanks ${nameController.text}! I’ll connect via ${emailController.text}"),
//                 ),
//               );
//             },
//             borderRadius: BorderRadius.circular(12),
//             child: Ink(
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 gradient: const LinearGradient(
//                   colors: [Colors.blue, Colors.purple],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                 ),
//               ),
//               child: const Center(
//                 child: Text(
//                   "Share & Connect",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
