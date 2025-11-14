import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static const double pageHorizontalPadding = 40;
  static const double contentMaxWidth = 1200;
  static const double columnGap = 48;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: contentMaxWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: pageHorizontalPadding, vertical: 28),
            child: _AboutContent(columnGap: columnGap),
          ),
        ),
      ),
    );
  }
}

// ——————————————————— INNER COMPONENTS ———————————————————

class _AboutContent extends StatelessWidget {
  final double columnGap;
  const _AboutContent({required this.columnGap});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 800;

    return isNarrow
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _LeftProfile(centered: false),
              const SizedBox(height: 28),
              const _RightContent(),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(flex: 1, child: _LeftProfile(centered: true)),
              SizedBox(width: columnGap),
              const Flexible(flex: 2, child: _RightContent()),
            ],
          );
  }
}

class _LeftProfile extends StatelessWidget {
  final bool centered;
  const _LeftProfile({this.centered = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 68,
              backgroundColor: AppColors.cardBackground,
              child: const Icon(Icons.person,
                  size: 72, color: Colors.white30),
            ),
            Positioned(
              right: 6,
              bottom: 6,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  color: AppColors.highlight,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.background, width: 3),
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 18),
        Text('Yaseen', style: AppFonts.name),
        const SizedBox(height: 6),
        Text('AI Engineer', style: AppFonts.role),
        const SizedBox(height: 6),
        Text(
          'San Francisco, CA  |  Available for new opportunities',
          style: AppFonts.body.copyWith(fontSize: 12),
          textAlign: centered ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 18),
        SizedBox(
          width: centered ? 300 : double.infinity,
          child: Text(
            "A highly motivated AI Engineer with 2 years of experience in deep learning, machine learning, model engineering, system architecture, and team leadership.",
            style: AppFonts.body,
            textAlign: centered ? TextAlign.center : TextAlign.start,
          ),
        ),
        const SizedBox(height: 18),
        SizedBox(
          width: centered ? 260 : 200,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentBlue,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text('Download Resume', style: AppFonts.button),
          ),
        ),
      ],
    );
  }
}

class _RightContent extends StatelessWidget {
  const _RightContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Specialties', style: AppFonts.heading),
        const SizedBox(height: 14),
        Wrap(
          spacing: 24,
          runSpacing: 12,
          children: const [
            _CheckText('Deep Learning'),
            _CheckText('PyTorch'),
            _CheckText('Model Fine-tuning'),
            _CheckText('Deployment (GCP/Azure)'),
            _CheckText('FastAPI Microservices'),
            _CheckText('Infra (RabbitMQ, Redis)'),
            _CheckText('Monitoring'),
            _CheckText('LlamaIndex IR Systems'),
          ],
        ),
        const SizedBox(height: 26),
        Text('Leadership & Mentoring', style: AppFonts.heading),
        const SizedBox(height: 10),
        Text(
          'Led and mentored teams of 3-5 engineers on various AI projects...',
          style: AppFonts.body,
        ),
        const SizedBox(height: 28),
        Text('Tech Stack', style: AppFonts.heading),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _TechCard(label: 'PyTorch'),
            _TechCard(label: 'FastAPI'),
            _TechCard(label: 'Docker'),
            _TechCard(label: 'Redis'),
            _TechCard(label: 'RabbitMQ'),
            _TechCard(label: 'SQL'),
            _TechCard(label: 'Azure'),
            _TechCard(label: 'GCP'),
          ],
        ),
        const SizedBox(height: 36),
        Text('Education & Certifications', style: AppFonts.heading),
        const SizedBox(height: 18),
        const _TimelineItem(
            title: 'Master of Science in Computer Science, UC Berkeley',
            subtitle: '2020 - 2022'),
        const _TimelineItem(
            title: 'Certified Machine Learning Professional',
            subtitle: '2023'),
      ],
    );
  }
}

class _CheckText extends StatelessWidget {
  final String text;
  const _CheckText(this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: AppColors.accentBlue,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(Icons.check, size: 14, color: Colors.white),
        ),
        const SizedBox(width: 8),
        Text(text, style: AppFonts.body),
      ],
    );
  }
}

class _TechCard extends StatelessWidget {
  final String label;
  const _TechCard({required this.label});

  @override
  Widget build(BuildContext context) {
    const double size = 96;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.memory, size: 28, color: Colors.white70),
            const SizedBox(height: 8),
            Text(label, style: AppFonts.body.copyWith(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;
  const _TimelineItem({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                    color: AppColors.timelineDot, shape: BoxShape.circle),
              ),
              Container(width: 2, height: 60, color: AppColors.mutedText),
            ],
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppFonts.timelineTitle),
                const SizedBox(height: 4),
                Text(subtitle, style: AppFonts.timelineSubtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import '../theme/app_colors.dart';
// import '../theme/app_fonts.dart';


// class AboutSection extends StatelessWidget {
//   const AboutSection({super.key});

//   static const double pageHorizontalPadding = 40;
//   static const double contentMaxWidth = 1200;
//   static const double columnGap = 48;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Center(
//         child: ConstrainedBox(
//           constraints: const BoxConstraints(maxWidth: contentMaxWidth),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: pageHorizontalPadding, vertical: 28),
//             child: _AboutContent(columnGap: columnGap),
//           ),
//         ),
//       ),
//     );
//   }
// }

// // ——————————————————— INNER COMPONENTS ———————————————————

// class _AboutContent extends StatelessWidget {
//   final double columnGap;
//   const _AboutContent({required this.columnGap});

//   @override
//   Widget build(BuildContext context) {
//     final isNarrow = MediaQuery.of(context).size.width < 800;

//     return isNarrow
//         ? Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _LeftProfile(centered: false),
//               const SizedBox(height: 28),
//               _RightContent(),
//             ],
//           )
//         : Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Flexible(flex: 1, child: _LeftProfile(centered: true)),
//               SizedBox(width: columnGap),
//               Flexible(flex: 2, child: _RightContent()),
//             ],
//           );
//   }
// }

// class _LeftProfile extends StatelessWidget {
//   final bool centered;
//   const _LeftProfile({this.centered = true});

//   @override
//   Widget build(BuildContext context) {
//     final nameStyle = const TextStyle(
//         fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white);
//     final roleStyle = TextStyle(fontSize: 14, color: Colors.grey[350]);

//     return Column(
//       crossAxisAlignment:
//           centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
//       children: [
//         Stack(
//           children: [
//             CircleAvatar(
//               radius: 68,
//               backgroundColor: Colors.blueGrey.shade800,
//               child: const Icon(Icons.person, size: 72, color: Colors.white30),
//             ),
//             Positioned(
//               right: 6,
//               bottom: 6,
//               child: Container(
//                 width: 18,
//                 height: 18,
//                 decoration: BoxDecoration(
//                   color: Colors.greenAccent.shade400,
//                   shape: BoxShape.circle,
//                   border: Border.all(color: const Color(0xFF0f1923), width: 3),
//                 ),
//               ),
//             )
//           ],
//         ),
//         const SizedBox(height: 18),
//         Text('Yaseen', style: nameStyle),
//         const SizedBox(height: 6),
//         Text('AI Engineer', style: roleStyle),
//         const SizedBox(height: 6),
//         Text('San Francisco, CA  |  Available for new opportunities',
//             style: TextStyle(fontSize: 12, color: Colors.grey[500])),
//         const SizedBox(height: 18),
//         SizedBox(
//           width: centered ? 300 : double.infinity,
//           child: Text(
//             "A highly motivated AI Engineer with 2 years of experience in deep learning, machine learning, model engineering, system architecture, and team leadership.",
//             style: TextStyle(fontSize: 14, color: Colors.grey[350]),
//             textAlign: centered ? TextAlign.center : TextAlign.start,
//           ),
//         ),
//         const SizedBox(height: 18),
//         SizedBox(
//           width: centered ? 260 : 200,
//           child: ElevatedButton(
//             onPressed: () {},
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF1f7cf8),
//               padding: const EdgeInsets.symmetric(vertical: 14),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text('Download Resume',
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _RightContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final headingStyle = const TextStyle(
//         fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white);
//     final bodyColor = Colors.grey[350];

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('Specialties', style: headingStyle),
//         const SizedBox(height: 14),
//         Wrap(
//           spacing: 24,
//           runSpacing: 12,
//           children: const [
//             _CheckText('Deep Learning'),
//             _CheckText('PyTorch'),
//             _CheckText('Model Fine-tuning'),
//             _CheckText('Deployment (GCP/Azure)'),
//             _CheckText('FastAPI Microservices'),
//             _CheckText('Infra (RabbitMQ, Redis)'),
//             _CheckText('Monitoring'),
//             _CheckText('LlamaIndex IR Systems'),
//           ],
//         ),
//         const SizedBox(height: 26),
//         Text('Leadership & Mentoring', style: headingStyle),
//         const SizedBox(height: 10),
//         Text(
//           'Led and mentored teams of 3-5 engineers on various AI projects...',
//           style: TextStyle(fontSize: 14, color: bodyColor),
//         ),
//         const SizedBox(height: 28),
//         Text('Tech Stack', style: headingStyle),
//         const SizedBox(height: 12),
//         Wrap(
//           spacing: 12,
//           runSpacing: 12,
//           children: [
//             _TechCard(label: 'PyTorch'),
//             _TechCard(label: 'FastAPI'),
//             _TechCard(label: 'Docker'),
//             _TechCard(label: 'Redis'),
//             _TechCard(label: 'RabbitMQ'),
//             _TechCard(label: 'SQL'),
//             _TechCard(label: 'Azure'),
//             _TechCard(label: 'GCP'),
//           ],
//         ),
//         const SizedBox(height: 36),
//         Text('Education & Certifications', style: headingStyle),
//         const SizedBox(height: 18),
//         _TimelineItem(
//             title:
//                 'Master of Science in Computer Science, UC Berkeley',
//             subtitle: '2020 - 2022'),
//         _TimelineItem(
//             title: 'Certified Machine Learning Professional',
//             subtitle: '2023'),
//       ],
//     );
//   }
// }

// class _CheckText extends StatelessWidget {
//   final String text;
//   const _CheckText(this.text);
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Container(
//           width: 18,
//           height: 18,
//           decoration: BoxDecoration(
//             color: const Color(0xFF1f8cf9),
//             borderRadius: BorderRadius.circular(4),
//           ),
//           child: const Icon(Icons.check, size: 14, color: Colors.white),
//         ),
//         const SizedBox(width: 8),
//         Text(text, style: const TextStyle(color: Colors.white70)),
//       ],
//     );
//   }
// }

// class _TechCard extends StatelessWidget {
//   final String label;
//   const _TechCard({required this.label});

//   @override
//   Widget build(BuildContext context) {
//     const double size = 96;

//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         color: Colors.blueGrey.shade800,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(Icons.memory, size: 28, color: Colors.white70),
//             const SizedBox(height: 8),
//             Text(label,
//                 style: const TextStyle(color: Colors.white70, fontSize: 12)),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _TimelineItem extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   const _TimelineItem({required this.title, required this.subtitle});

//   @override
//   Widget build(BuildContext context) {
//     final dot = Container(
//         width: 10,
//         height: 10,
//         decoration: const BoxDecoration(
//             color: Color(0xFF1f8cf9), shape: BoxShape.circle));
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 18),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(
//             children: [
//               dot,
//               Container(width: 2, height: 60, color: Colors.grey.shade800),
//             ],
//           ),
//           const SizedBox(width: 14),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(title,
//                     style: const TextStyle(
//                         color: Colors.white, fontWeight: FontWeight.w700)),
//                 const SizedBox(height: 4),
//                 Text(subtitle, style: TextStyle(color: Colors.grey[400])),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }




// // import 'package:flutter/material.dart';

// // class AboutSection extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Text(
// //         'About Me',
// //         style: TextStyle(fontSize: 24),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';

// class AboutSection extends StatelessWidget {
//   const AboutSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Profile Section
//             Row(
//               children: [
//                 CircleAvatar(
//                   radius: 50,
//                   backgroundColor: Colors.blueGrey[700],
//                   child: Icon(Icons.person, size: 60, color: Colors.white),
//                 ),
//                 SizedBox(width: 20),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Yaseen",
//                         style: TextStyle(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white)),
//                     Text("AI Engineer",
//                         style: TextStyle(fontSize: 18, color: Colors.grey[300])),
//                     Text("Available for new opportunities",
//                         style: TextStyle(fontSize: 14, color: Colors.amber)),
//                   ],
//                 )
//               ],
//             ),
//             SizedBox(height: 30),

//             // About text
//             Text(
//               "A highly motivated AI Engineer with 2 years of experience in deep learning, "
//               "machine learning, model engineering, system architecture, and team leadership.",
//               style: TextStyle(fontSize: 16, color: Colors.grey[300]),
//             ),
//             SizedBox(height: 30),

//             // Specialties
//             Text("Specialties",
//                 style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white)),
//             SizedBox(height: 10),
//             Wrap(
//               spacing: 10,
//               runSpacing: 10,
//               children: [
//                 _chip("Deep Learning"),
//                 _chip("PyTorch"),
//                 _chip("Model Fine-tuning"),
//                 _chip("FastAPI"),
//                 _chip("Monitoring"),
//                 _chip("Infra (Redis, RabbitMQ)"),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _chip(String label) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.blueGrey[800],
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(label, style: TextStyle(color: Colors.white)),
//     );
//   }
// }
