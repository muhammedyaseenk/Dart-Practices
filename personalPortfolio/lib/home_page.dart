// import 'package:flutter/material.dart';
// import 'sections/about_section.dart';
// import 'sections/skills_section.dart';
// import 'sections/projects_section.dart';
// import 'sections/contact_section.dart';
import 'package:flutter/material.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/projects_section.dart';
import 'sections/contact_section.dart';
import 'theme/app_colors.dart';
import 'theme/app_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // ✅ for GitHub icon

enum Section { about, skills, projects, contact }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Section selectedSection = Section.about;

  Widget getSectionWidget() {
    switch (selectedSection) {
      case Section.about:
        return AboutSection();
      case Section.skills:
        return SkillsSection();
      case Section.projects:
        return ProjectsSection();
      case Section.contact:
        return ContactSection();
      default:
        return const Center(child: Text('Welcome'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // ✅ Navbar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
            color: AppColors.cardBackground,
            child: Row(
              children: [
                // Left logo + brand
                Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: AppColors.accentBlue.withOpacity(0.15),
                      child: Icon(
                        Icons.memory, // brainchip-like icon
                        color: AppColors.accentBlue,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'AI Portfolio',
                      style: AppFonts.heading.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryText,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Nav links
                Row(
                  children: [
                    _navButton('About', Section.about),
                    const SizedBox(width: 24),
                    _navButton('Skills', Section.skills),
                    const SizedBox(width: 24),
                    _navButton('Projects', Section.projects),
                    const SizedBox(width: 24),
                    _navButton('Contact', Section.contact),
                  ],
                ),

                const Spacer(),

                // GitHub button (right side)
                IconButton(
                  onPressed: () {
                    // ✅ open GitHub profile
                    // For Flutter web: use `html.window.open(url, "_blank");`
                    // For mobile: use `url_launcher` package
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.github,
                    size: 20,
                  ),
                  color: AppColors.primaryText,
                  tooltip: "View GitHub",
                  hoverColor: Colors.transparent,
                ),
              ],
            ),
          ),

          // ✅ Section content
          Expanded(
            child: Container(
              color: AppColors.background,
              child: getSectionWidget(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _navButton(String label, Section section) {
    final isSelected = selectedSection == section;
    return InkWell(
      onTap: () {
        setState(() {
          selectedSection = section;
        });
      },
      borderRadius: BorderRadius.circular(6),
      hoverColor: Colors.white10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Text(
          label,
          style: AppFonts.body.copyWith(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? AppColors.accentBlue : AppColors.primaryText,
          ),
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'sections/about_section.dart';
// import 'sections/skills_section.dart';
// import 'sections/projects_section.dart';
// import 'sections/contact_section.dart';
// import 'theme/app_colors.dart'; // ✅ make sure you import AppColors

// enum Section { about, skills, projects, contact }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Section selectedSection = Section.about;

//   Widget getSectionWidget() {
//     switch (selectedSection) {
//       case Section.about:
//         return AboutSection();
//       case Section.skills:
//         return SkillsSection();
//       case Section.projects:
//         return ProjectsSection();
//       case Section.contact:
//         return ContactSection();
//       default:
//         return Center(child: Text('Welcome'));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background, // ✅ global background
//       body: Column(
//         children: [
//           // Top Navigation Bar
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//             color: AppColors.cardBackground, // ✅ nav bar background
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Yaseen',
//                   style: TextStyle(
//                     color: AppColors.primaryText, // ✅ brand text color
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     _navButton('About', Section.about),
//                     _navButton('Skills', Section.skills),
//                     _navButton('Projects', Section.projects),
//                     _navButton('Contact', Section.contact),
//                   ],
//                 )
//               ],
//             ),
//           ),

//           // Dynamic Section Content
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.all(20),
//               color: AppColors.background, // ✅ dark navy content bg
//               child: getSectionWidget(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _navButton(String label, Section section) {
//     final isSelected = selectedSection == section;
//     return TextButton(
//       onPressed: () {
//         setState(() {
//           selectedSection = section;
//         });
//       },
//       child: Text(
//         label,
//         style: TextStyle(
//           color: isSelected ? AppColors.accentBlue : AppColors.primaryText, // ✅ highlight vs normal
//           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//     );
//   }
// }


// enum Section { about, skills, projects, contact }

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   Section selectedSection = Section.about;

//   Widget getSectionWidget() {
//     switch (selectedSection) {
//       case Section.about:
//         return AboutSection();
//       case Section.skills:
//         return SkillsSection();
//       case Section.projects:
//         return ProjectsSection();
//       case Section.contact:
//         return ContactSection();
//       default:
//         return Center(child: Text('Welcome'));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Top Navigation
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//             color: Colors.blueGrey[900],
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Yaseen',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 28,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     _navButton('About', Section.about),
//                     _navButton('Skills', Section.skills),
//                     _navButton('Projects', Section.projects),
//                     _navButton('Contact', Section.contact),
//                   ],
//                 )
//               ],
//             ),
//           ),

//           // Dynamic Section Content
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.all(20),
//               color: Colors.grey[200],
//               child: getSectionWidget(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _navButton(String label, Section section) {
//     final isSelected = selectedSection == section;
//     return TextButton(
//       onPressed: () {
//         setState(() {
//           selectedSection = section;
//         });
//       },
//       child: Text(
//         label,
//         style: TextStyle(
//           color: isSelected ? Colors.amber : Colors.white,
//           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//     );
//   }
// }
