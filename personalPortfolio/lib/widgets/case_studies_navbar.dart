import 'package:flutter/material.dart';
import '../theme/app_fonts.dart';
// import 'contact_form.dart';

class CaseStudiesNavBar extends StatelessWidget implements PreferredSizeWidget {
  const CaseStudiesNavBar({Key? key}) : super(key: key);

  void _showContactPopup(BuildContext context, GlobalKey key) {
    final RenderBox button = key.currentContext!.findRenderObject() as RenderBox;
    final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset.zero, ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero), ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );

    showMenu(
      context: context,
      position: position.shift(const Offset(-200, 50)), // shift left & down
      items: [
        PopupMenuItem(
          enabled: false,
          padding: EdgeInsets.zero,
          child: SizedBox(
            width: 320,
            child: Material(
              color: Colors.black.withOpacity(0.9),
              borderRadius: BorderRadius.circular(16),
              // child: Padding(
              //   padding: const EdgeInsets.all(20),
              //   child: const ContactForm(),
              // ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey callButtonKey = GlobalKey();

    return SliverAppBar(
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 130,
      flexibleSpace: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            colors: [Color(0xFF3A7BD5), Color(0xFF3A6073)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Left side
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          // Back button
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.black87),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                          const SizedBox(width: 14),
                          // Heading
                          Text(
                            "Case Studies",
                            style: AppFonts.heading.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                              color: Colors.black87,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Explore my journey through diverse projects, showcasing my skills and impact.",
                        style: AppFonts.body.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),

                // Right side
                Expanded(
                  flex: 4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          "Let’s build your next breakthrough together.",
                          style: AppFonts.body.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withOpacity(0.95),
                          ),
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 20),

                      // Schedule a Call button (with popup)
                      Container(
                        key: callButtonKey,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          onPressed: () => _showContactPopup(context, callButtonKey),
                          child: Text(
                            "Schedule a Call",
                            style: AppFonts.body.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // Download Resume button (no action yet)
                      Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF434343), Color(0xFF2C3E50)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Download Resume",
                            style: AppFonts.body.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130);
}

// lib/widgets/case_studies_navbar.dart
// import 'package:flutter/material.dart';
// import '../theme/app_fonts.dart';
// import 'contact_form.dart';

// class CaseStudiesNavBar extends StatelessWidget implements PreferredSizeWidget {
//   const CaseStudiesNavBar({Key? key}) : super(key: key);

//   void _showContactPopup(BuildContext context) {
//     showDialog(
//       context: context,
//       barrierDismissible: true,
//       builder: (BuildContext ctx) {
//         return Dialog(
//           backgroundColor: Colors.transparent,
//           insetPadding: const EdgeInsets.all(16),
//           child: Center(
//             child: Container(
//               constraints: const BoxConstraints(maxWidth: 400),
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.8),
//                 borderRadius: BorderRadius.circular(20),
//                 border: Border.all(color: Colors.white.withOpacity(0.1)),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.purple.withOpacity(0.3),
//                     blurRadius: 30,
//                     spreadRadius: 5,
//                   ),
//                 ],
//               ),
//               child: const ContactForm(),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       pinned: true,
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       toolbarHeight: 130,
//       flexibleSpace: Container(
//         margin: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           gradient: const LinearGradient(
//             colors: [Color(0xFF3A7BD5), Color(0xFF3A6073)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.25),
//               blurRadius: 16,
//               offset: const Offset(0, 6),
//             )
//           ],
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // --- Left Section (Back button + Heading) ---
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Row(
//                         children: [
//                           // Back button
//                           Container(
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black26,
//                                   blurRadius: 6,
//                                   offset: Offset(0, 3),
//                                 )
//                               ],
//                             ),
//                             child: IconButton(
//                               icon: const Icon(Icons.arrow_back,
//                                   color: Colors.black87),
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 14),
//                           // Heading
//                           Text(
//                             "Case Studies",
//                             style: AppFonts.heading.copyWith(
//                               fontSize: 28,
//                               fontWeight: FontWeight.w800,
//                               color: Colors.black87,
//                               letterSpacing: -0.5,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 6),
//                       // Subheading
//                       Text(
//                         "Explore my journey through diverse projects, showcasing my skills and impact.",
//                         style: AppFonts.body.copyWith(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.white.withOpacity(0.9),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // --- Right Section (Tagline + Buttons) ---
//                 Expanded(
//                   flex: 4,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Flexible(
//                         child: Text(
//                           "Let’s build your next breakthrough together.",
//                           style: AppFonts.body.copyWith(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white.withOpacity(0.95),
//                           ),
//                           textAlign: TextAlign.right,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       const SizedBox(width: 20),

//                       // Schedule a Call -> Popup
//                       Container(
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.circular(28),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.3),
//                               blurRadius: 8,
//                               offset: const Offset(0, 4),
//                             ),
//                           ],
//                         ),
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.transparent,
//                             shadowColor: Colors.transparent,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 14),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(28),
//                             ),
//                             elevation: 0,
//                           ),
//                           onPressed: () => _showContactPopup(context),
//                           child: Text(
//                             "Schedule a Call",
//                             style: AppFonts.body.copyWith(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 13,
//                               letterSpacing: 0.2,
//                             ),
//                           ),
//                         ),
//                       ),

//                       const SizedBox(width: 12),

//                       // Download Resume -> Normal Button
//                       Container(
//                         decoration: BoxDecoration(
//                           gradient: const LinearGradient(
//                             colors: [Color(0xFF434343), Color(0xFF2C3E50)],
//                             begin: Alignment.topLeft,
//                             end: Alignment.bottomRight,
//                           ),
//                           borderRadius: BorderRadius.circular(28),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.25),
//                               blurRadius: 6,
//                               offset: const Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.transparent,
//                             shadowColor: Colors.transparent,
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 20, vertical: 14),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(28),
//                             ),
//                             elevation: 0,
//                           ),
//                           onPressed: () {
//                             // TODO: Resume download logic
//                           },
//                           child: Text(
//                             "Download Resume",
//                             style: AppFonts.body.copyWith(
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 13,
//                               letterSpacing: 0.2,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(130);
// }

// import 'package:flutter/material.dart';
// import '../theme/app_colors.dart';
// import '../theme/app_fonts.dart';

// class CaseStudiesNavBar extends StatelessWidget implements PreferredSizeWidget {
//   const CaseStudiesNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       pinned: true,
//       floating: false,
//       automaticallyImplyLeading: false, // 🚀 Prevents Flutter from showing default back arrow
//       backgroundColor: Colors.transparent,
//       elevation: 0,
//       toolbarHeight: 130,
//       flexibleSpace: Container(
//         margin: const EdgeInsets.all(12),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           gradient: const LinearGradient(
//             colors: [Color(0xFF3A7BD5), Color(0xFF3A6073)],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.25),
//               blurRadius: 16,
//               offset: const Offset(0, 6),
//             )
//           ],
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 // --- Back Arrow + Heading + Subheading ---
//                 Expanded(
//                   flex: 3,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Row(
//                         children: [
//                           // Back button
//                           Container(
//                             decoration: const BoxDecoration(
//                               color: Colors.white,
//                               shape: BoxShape.circle,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black26,
//                                   blurRadius: 6,
//                                   offset: Offset(0, 3),
//                                 )
//                               ],
//                             ),
//                             child: IconButton(
//                               icon: const Icon(Icons.arrow_back, color: Colors.black87),
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                             ),
//                           ),
//                           const SizedBox(width: 14),
//                           // Heading
//                           Text(
//                             "Case Studies",
//                             style: AppFonts.heading.copyWith(
//                               fontSize: 28,
//                               fontWeight: FontWeight.w800,
//                               color: Colors.black87,
//                               letterSpacing: -0.5,
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 6),
//                       // Subheading
//                       Text(
//                         "Explore my journey through diverse projects, showcasing my skills and impact.",
//                         style: AppFonts.body.copyWith(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Colors.white.withOpacity(0.9),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 // --- Right Side: Tagline + Buttons ---
//                 Expanded(
//                   flex: 4,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Flexible(
//                         child: Text(
//                           "Let’s build your next breakthrough together.",
//                           style: AppFonts.body.copyWith(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w500,
//                             color: Colors.white.withOpacity(0.95),
//                           ),
//                           textAlign: TextAlign.right,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       _ctaButton("Schedule a Call", true),
//                       const SizedBox(width: 12),
//                       _ctaButton("Download Resume", false),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }


// Widget _ctaButton(String text, bool primary) {
//   if (!primary) {
//     // Secondary button with elegant gradient
//     return Container(
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xFF434343), Color(0xFF2C3E50)], // Slate to steel
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(28),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.25),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ],
//       ),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(28),
//           ),
//           elevation: 0,
//         ).copyWith(
//           overlayColor: MaterialStateProperty.all(
//             Colors.white.withOpacity(0.08),
//           ),
//         ),
//         onPressed: () {},
//         child: Text(
//           text,
//           style: AppFonts.body.copyWith(
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//             fontSize: 13,
//             letterSpacing: 0.2,
//           ),
//         ),
//       ),
//     );
//   } else {
//     // Primary button with luxury blue gradient
//     return Container(
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xFF00C6FF), Color(0xFF0072FF)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(28),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.transparent,
//           shadowColor: Colors.transparent,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(28),
//           ),
//           elevation: 0,
//         ).copyWith(
//           overlayColor: MaterialStateProperty.all(
//             Colors.white.withOpacity(0.08),
//           ),
//         ),
//         onPressed: () {},
//         child: Text(
//           text,
//           style: AppFonts.body.copyWith(
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//             fontSize: 13,
//             letterSpacing: 0.2,
//           ),
//         ),
//       ),
//     );
//   }
// }

//   @override
//   Size get preferredSize => const Size.fromHeight(130);
// }

