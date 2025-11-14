import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import 'case_studies_navbar.dart'; // Import the separated NavBar

class CaseStudiesPage extends StatelessWidget {
  final caseStudies = [
    {
      'title': 'Medical Image Super-Resolution',
      'domain': 'Deep Learning',
      'color': Colors.purple,
      'problem': 'Low-quality medical imaging limits diagnostic accuracy.',
      'solution':
          'SR model based on VGG16, optimized with mixed-precision training.',
      'impact': '40% Resolution Uplift\nPiloted in hospital network',
      'advantage': 'Cost-Effective Clarity\nEnhances existing hardware',
      'tech': ['PyTorch', 'VGG16', 'CUDA'],
    },
    {
      'title': 'Real-Time Defect Detection',
      'domain': 'Computer Vision',
      'color': Colors.orange,
      'problem': 'Undetected manufacturing defects on production lines.',
      'solution': 'A real-time YOLOv7 system deployed on edge cameras.',
      'impact': '99.5% Detection Rate\n80% less manual inspection',
      'advantage': 'High-Speed QA\nInference at ≤50ms',
      'tech': ['YOLOv7', 'TensorRT', 'OpenCV'],
    },
    {
      'title': 'Scalable MLOps Platform',
      'domain': 'Cloud & DevOps',
      'color': Colors.blue,
      'problem': 'High inference costs and unreliable model uptime.',
      'solution':
          'Autoscaling GPU cluster with automated CI/CD for model rollout.',
      'impact': '30% Cost Reduction\n99.9% uptime maintained',
      'advantage': 'Reliable Scalability\n10k+ calls/month capacity',
      'tech': ['Docker', 'Kubernetes', 'AWS'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Top NavBar
          const CaseStudiesNavBar(),

          // Case Study Cards
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                caseStudies
                    .map((cs) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: _buildCaseStudyCard(context, cs),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaseStudyCard(BuildContext context, Map<String, dynamic> cs) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 900, // ✅ prevent cards from being too wide
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
          decoration: BoxDecoration(
            color: const Color(0xFF1E2530),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 12,
                offset: const Offset(0, 6),
              )
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                cs['title'],
                style: AppFonts.heading.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryText,
                ),
              ),
              const SizedBox(height: 20),

              // --- First row: Domain | Solution | Problem ---
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 700) {
                    // Stack vertically on small screens
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _domainBlock(cs),
                        const SizedBox(height: 16),
                        _infoBlock("Solution", cs['solution']),
                        const SizedBox(height: 16),
                        _infoBlock("Problem", cs['problem']),
                      ],
                    );
                  } else {
                    // Row layout on wide screens
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _domainBlock(cs)),
                        const SizedBox(width: 28),
                        Expanded(child: _infoBlock("Solution", cs['solution'])),
                        const SizedBox(width: 28),
                        Expanded(child: _infoBlock("Problem", cs['problem'])),
                      ],
                    );
                  }
                },
              ),

              const SizedBox(height: 28),

              // --- Second row: Impact | Advantage | Tech Stack ---
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth < 700) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _infoBlock("Impact", cs['impact'], bold: true),
                        const SizedBox(height: 16),
                        _infoBlock("Competitive Advantage", cs['advantage'],
                            bold: true),
                        const SizedBox(height: 16),
                        _techStack(cs),
                      ],
                    );
                  } else {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: _infoBlock("Impact", cs['impact'],
                                bold: true)),
                        const SizedBox(width: 28),
                        Expanded(
                            child: _infoBlock(
                                "Competitive Advantage", cs['advantage'],
                                bold: true)),
                        const SizedBox(width: 28),
                        Expanded(child: _techStack(cs)),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Domain Block
  Widget _domainBlock(Map<String, dynamic> cs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "DOMAIN",
          style: AppFonts.body.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.secondaryText,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          cs['domain'],
          style: AppFonts.body.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: cs['color'],
          ),
        ),
      ],
    );
  }

  /// Info Block
  Widget _infoBlock(String title, String text, {bool bold = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title.toUpperCase(),
            style: AppFonts.body.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.secondaryText,
            )),
        const SizedBox(height: 4),
        Text(
          text,
          style: AppFonts.body.copyWith(
            fontSize: 15,
            color: AppColors.primaryText,
            fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  /// Tech Stack
  Widget _techStack(Map<String, dynamic> cs) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("TECH STACK",
            style: AppFonts.body.copyWith(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.secondaryText,
            )),
        const SizedBox(height: 6),
        Wrap(
          spacing: 8,
          runSpacing: 6,
          children: (cs['tech'] as List<String>)
              .map((t) => Chip(
                    label: Text(t,
                        style: AppFonts.body.copyWith(
                            fontSize: 12,
                            color: cs['color'],
                            fontWeight: FontWeight.w600)),
                    backgroundColor: cs['color'].withOpacity(0.15),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 4),
                  ))
              .toList(),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import '../theme/app_colors.dart';
// import '../theme/app_fonts.dart';
// import 'case_studies_navbar.dart'; // Import the separated NavBar

// class CaseStudiesPage extends StatelessWidget {
//   final caseStudies = [
//     {
//       'title': 'Medical Image Super-Resolution',
//       'domain': 'Deep Learning',
//       'color': Colors.purple,
//       'problem': 'Low-quality medical imaging limits diagnostic accuracy.',
//       'solution':
//           'SR model based on VGG16, optimized with mixed-precision training.',
//       'impact': '40% Resolution Uplift\nPiloted in hospital network',
//       'advantage': 'Cost-Effective Clarity\nEnhances existing hardware',
//       'tech': ['PyTorch', 'VGG16', 'CUDA'],
//     },
//     {
//       'title': 'Real-Time Defect Detection',
//       'domain': 'Computer Vision',
//       'color': Colors.orange,
//       'problem': 'Undetected manufacturing defects on production lines.',
//       'solution': 'A real-time YOLOv7 system deployed on edge cameras.',
//       'impact': '99.5% Detection Rate\n80% less manual inspection',
//       'advantage': 'High-Speed QA\nInference at ≤50ms',
//       'tech': ['YOLOv7', 'TensorRT', 'OpenCV'],
//     },
//     {
//       'title': 'Scalable MLOps Platform',
//       'domain': 'Cloud & DevOps',
//       'color': Colors.blue,
//       'problem': 'High inference costs and unreliable model uptime.',
//       'solution':
//           'Autoscaling GPU cluster with automated CI/CD for model rollout.',
//       'impact': '30% Cost Reduction\n99.9% uptime maintained',
//       'advantage': 'Reliable Scalability\n10k+ calls/month capacity',
//       'tech': ['Docker', 'Kubernetes', 'AWS'],
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       body: CustomScrollView(
//         slivers: [
//           // Use the external NavBar widget
//           const CaseStudiesNavBar(),



//           // Case Study Cards
//           SliverPadding(
//             padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
//             sliver: SliverList(
//               delegate: SliverChildListDelegate(
//                 caseStudies
//                     .map((cs) => Padding(
//                           padding: const EdgeInsets.only(bottom: 24),
//                           child: _buildCaseStudyCard(context, cs),
//                         ))
//                     .toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildCaseStudyCard(BuildContext context, Map<String, dynamic> cs) {
//     return Container(
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1E2530),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: Colors.white.withOpacity(0.05)),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.25),
//             blurRadius: 12,
//             offset: const Offset(0, 6),
//           )
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Project Title (bold and attractive)
//           Text(cs['title'],
//               style: AppFonts.heading.copyWith(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.primaryText,
//               )),
//           const SizedBox(height: 16),

//           // First row: Domain | Solution | Problem
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Domain (Skill)
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "DOMAIN",
//                       style: AppFonts.body.copyWith(
//                         fontSize: 13,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.secondaryText,
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       cs['domain'],
//                       style: AppFonts.body.copyWith(
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold,
//                         color: cs['color'],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(width: 20),

//               // Solution
//               Expanded(child: _infoBlock("Solution", cs['solution'])),

//               const SizedBox(width: 20),

//               // Problem
//               Expanded(child: _infoBlock("Problem", cs['problem'])),
//             ],
//           ),

//           const SizedBox(height: 24),

//           // Second row: Impact | Competitive Advantage | Tech Stack
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(child: _infoBlock("Impact", cs['impact'], bold: true)),
//               const SizedBox(width: 20),
//               Expanded(
//                   child: _infoBlock("Competitive Advantage", cs['advantage'],
//                       bold: true)),
//               const SizedBox(width: 20),
//               Expanded(child: _techStack(cs)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _infoBlock(String title, String text, {bool bold = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title.toUpperCase(),
//             style: AppFonts.body.copyWith(
//               fontSize: 13,
//               fontWeight: FontWeight.w700,
//               color: AppColors.secondaryText,
//             )),
//         const SizedBox(height: 4),
//         Text(
//           text,
//           style: AppFonts.body.copyWith(
//             fontSize: 15,
//             color: AppColors.primaryText,
//             fontWeight: bold ? FontWeight.bold : FontWeight.normal,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _techStack(Map<String, dynamic> cs) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("TECH STACK",
//             style: AppFonts.body.copyWith(
//               fontSize: 13,
//               fontWeight: FontWeight.w700,
//               color: AppColors.secondaryText,
//             )),
//         const SizedBox(height: 6),
//         Wrap(
//           spacing: 8,
//           runSpacing: 6,
//           children: (cs['tech'] as List<String>)
//               .map((t) => Chip(
//                     label: Text(t,
//                         style: AppFonts.body.copyWith(
//                             fontSize: 12,
//                             color: cs['color'],
//                             fontWeight: FontWeight.w600)),
//                     backgroundColor: cs['color'].withOpacity(0.15),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 14),
//                   ))
//               .toList(),
//         ),
//       ],
//     );
//   }

//   Widget _ctaButton(String text, Color color) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color,
//         padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         shadowColor: Colors.black.withOpacity(0.3),
//         elevation: 6,
//       ),
//       onPressed: () {},
//       child: Text(text,
//           style: AppFonts.body.copyWith(
//               color: Colors.white, fontWeight: FontWeight.w600)),
//     );
//   }
// }

// /// Sticky CTA Header
// class _StickyCTA extends SliverPersistentHeaderDelegate {
//   final double height;
//   final Widget child;

//   _StickyCTA({required this.height, required this.child});

//   @override
//   Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return SizedBox(height: height, child: child);
//   }

//   @override
//   double get maxExtent => height;

//   @override
//   double get minExtent => height;

//   @override
//   bool shouldRebuild(_StickyCTA oldDelegate) => false;
// }
