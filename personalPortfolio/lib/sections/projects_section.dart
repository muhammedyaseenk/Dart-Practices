import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const double contentMaxWidth = 1200;
  static const List<Map<String, String>> projects = [
    {
      'title': 'AI-Powered Chatbot',
      'desc':
          'An intelligent chatbot capable of handling complex user queries and providing personalized responses.',
      'image':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuCl2CPyWUYH-fyr4lfhda10QUINSWwbTTu-w6hO3WUNt3UKfJeIl_Xy4oUNvvntMAnfpvk592smQsoD1FjgZWLuxqPQE738JqyOF4oVgXtKzMIeAtgWycm3y9Sls0J91SlsnH8O947n7BPy4yeykEMubTxhu_OSCW-ziAwzMiRUSMDOTSZp-fglWLicw3ScfyxvDJhsKCrHdzLPgqDz2aUWX8lHG4zUcn_DrISqC777ZjGN99xbasyky2cNp2KWN-446WoV-gonfA',
    },
    {
      'title': 'Image Recognition System',
      'desc':
          'A system that accurately identifies objects and scenes in images using advanced deep learning techniques.',
      'image':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuB0r6XRvowfPnBrS8gTWCd7KCUbhSCzAGnjJETsdK1hMehKI5ETvwFNe4G69Em0w0_JLq5PqNrzqeiN5Yj762BPI9m86h4dOUGy9rSw34WIA1WlWebhN-_xiTjF1XMB5TWW9A6MGcfOlpCJLNNGGF0Zx9TAOqTIEUuhMdsVt6rZSopCZsKqMVVM0DBdYcwF3W4vEGwDRarqg6tFYpQNOeJLFuHrEnzwQ1Cjv_p4jK6vy0aQTQooX-Cr39rkRb_VTfnGAvo3vmG8ig',
    },
    {
      'title': 'Natural Language Processing Model',
      'desc':
          'A model that understands and processes human language for sentiment analysis and text summarization.',
      'image':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBQ0Yvj3ux-P0Fd0vbgYlRb0plwVo7z0yfJng0Denu6l0kjuRb7ASCHpsYJsUlID1LBs9VqofyoiaabGg4iq4NWlSGJP38rN9YmhibA6mq9Hj9dxbJry09_5e0RLRIpXkvFymwJz_oTR51h9pPFLllrQJ339PeFYrdzmjmg7LhFD93ZWZ9WqoMvRjB-9FtS5i533Qz8jbjnM9t0b9qeFfE6ljdHJebxrsdpdeGMAjBdqpPhO8kueWEWjFfUOEowo8LkBm2E5bVrtw',
    },
    {
      'title': 'Predictive Analytics Dashboard',
      'desc':
          'A dashboard visualizing predictive models, providing insights into future trends and outcomes.',
      'image':
          'https://lh3.googleusercontent.com/aida-public/AB6AXuB2Tr2YHNkAFkXs7CyiqJt9iTc16q2ucFrawzGzwJUj8sQ8m88YqNd69jFfeEOWRulXvQ4hlJE1XpQrpZRKkptGHDWx-qv8fRTP4YzdpcVudhe1jCr4nXyMJDL420kNp38ttUtTZDe_Vk9oDm07QtkpgSiv30OBVrtD83KvWpHKWM2KNoUbNjGmx5sr9OTVR_Kiqe3dyHTre9_NZDPSFN7SafzrjQXJ0M2wHXmM7xsu-8sSfyDMvDnvx86IY5S8Ev5RB9ckPAo9_w',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: contentMaxWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
            child: Column(
              children: [
                // Heading + subtitle (centered, with spacing like the HTML)
                const SizedBox(height: 8),
                Text(
                  'My AI Projects',
                  style: AppFonts.heading.copyWith(fontSize: 32),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'A collection of AI projects showcasing my skills and expertise in building intelligent systems.',
                  style: AppFonts.body.copyWith(
                    color: AppColors.secondaryText,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 36),

                // Responsive Grid that mirrors the Tailwind behavior:
                LayoutBuilder(builder: (context, constraints) {
                  final maxW = constraints.maxWidth;
                  int crossAxisCount = 1;
                  if (maxW >= 1200) {
                    crossAxisCount = 4;
                  } else if (maxW >= 900) {
                    crossAxisCount = 3;
                  } else if (maxW >= 600) {
                    crossAxisCount = 2;
                  } else {
                    crossAxisCount = 1;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: projects.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 24,
                      mainAxisSpacing: 24,
                      childAspectRatio: 0.78, // nice tall cards (image + body)
                    ),
                    itemBuilder: (context, index) {
                      final p = projects[index];
                      return _HoverProjectCard(
                        title: p['title']!,
                        desc: p['desc']!,
                        imageUrl: p['image']!,
                      );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// A card that lifts on hover (for web) and matches the HTML style:
/// - 4:3 image with gradient overlay
/// - rounded corners, shadow
/// - title (bold), description (wrap), and view link bottom-right
class _HoverProjectCard extends StatefulWidget {
  final String title;
  final String desc;
  final String imageUrl;

  const _HoverProjectCard({
    required this.title,
    required this.desc,
    required this.imageUrl,
  });

  @override
  State<_HoverProjectCard> createState() => _HoverProjectCardState();
}

class _HoverProjectCardState extends State<_HoverProjectCard> {
  bool _hovering = false;

  void _onEnter(PointerEvent _) => setState(() => _hovering = true);
  void _onExit(PointerEvent _) => setState(() => _hovering = false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        transform: Matrix4.translationValues(0, _hovering ? -8 : 0, 0),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(_hovering ? 0.35 : 0.25),
              blurRadius: _hovering ? 18 : 10,
              offset: Offset(0, _hovering ? 8 : 5),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            // Image area with 4:3 ratio and top gradient overlay like HTML
            AspectRatio(
              aspectRatio: 4 / 3,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (ctx, err, st) => Container(
                      color: Colors.grey.shade800,
                      child: const Center(
                        child: Icon(Icons.image_not_supported, size: 48),
                      ),
                    ),
                    loadingBuilder: (ctx, child, progress) {
                      if (progress == null) return child;
                      return Container(
                        color: Colors.grey.shade800,
                        child: const Center(
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                      );
                    },
                  ),

                  // Gradient overlay (dark -> transparent)
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.6),
                          Colors.transparent,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content area
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 140, // fixed content area to match consistent card sizes
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title (bold, left)
                    Text(
                      widget.title,
                      style: AppFonts.heading.copyWith(fontSize: 18),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // Description (wrap, fills available space)
                    Expanded(
                      child: Text(
                        widget.desc,
                        style: AppFonts.body.copyWith(
                            color: AppColors.secondaryText, fontSize: 14),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    // View Project aligned bottom-right (HTML had justify-end)
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_forward,
                            size: 16, color: AppColors.accentBlue),
                        label: Text(
                          'View Project',
                          style: AppFonts.body.copyWith(
                              color: AppColors.accentBlue,
                              fontWeight: FontWeight.w600),
                        ),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          alignment: Alignment.centerRight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// import '../theme/app_colors.dart';
// import '../theme/app_fonts.dart';

// class ProjectsSection extends StatefulWidget {
//   const ProjectsSection({super.key});

//   @override
//   State<ProjectsSection> createState() => _ProjectsSectionState();
// }

// class _ProjectsSectionState extends State<ProjectsSection> {
//   final ScrollController _scrollController = ScrollController();
//   final double cardWidth = 300; // fixed card width
//   final double cardSpacing = 20; // spacing between cards

//   final projects = const [
//     {
//       'title': 'AI-Powered Chatbot',
//       'desc': 'An intelligent chatbot capable of handling complex user queries and providing personalized responses.',
//       'image': 'https://via.placeholder.com/400x250.png?text=Chatbot',
//     },
//     {
//       'title': 'Image Recognition System',
//       'desc': 'A system that accurately identifies objects and scenes in images using advanced deep learning techniques.',
//       'image': 'https://via.placeholder.com/400x250.png?text=Image+Recognition',
//     },
//     {
//       'title': 'Natural Language Processing Model',
//       'desc': 'A model that understands and processes human language for sentiment analysis and text summarization.',
//       'image': 'https://via.placeholder.com/400x250.png?text=NLP',
//     },
//     {
//       'title': 'Predictive Analytics Dashboard',
//       'desc': 'A dashboard visualizing predictive models, providing insights into future trends and outcomes.',
//       'image': 'https://via.placeholder.com/400x250.png?text=Analytics',
//     },
//     {
//       'title': 'Reinforcement Learning Agent',
//       'desc': 'An RL agent trained to perform tasks using reward-based optimization.',
//       'image': 'https://via.placeholder.com/400x250.png?text=RL+Agent',
//     },
//   ];

//   void _scrollLeft() {
//     _scrollController.animateTo(
//       _scrollController.offset - (cardWidth + cardSpacing),
//       duration: const Duration(milliseconds: 400),
//       curve: Curves.easeOut,
//     );
//   }

//   void _scrollRight() {
//     _scrollController.animateTo(
//       _scrollController.offset + (cardWidth + cardSpacing),
//       duration: const Duration(milliseconds: 400),
//       curve: Curves.easeOut,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.background,
//       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
//       child: Column(
//         children: [
//           // Heading
//           Text(
//             "My AI Projects",
//             style: AppFonts.heading.copyWith(fontSize: 32),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 12),
//           Text(
//             "A collection of AI projects showcasing my skills and expertise in building intelligent systems.",
//             style: AppFonts.body.copyWith(color: AppColors.secondaryText),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 32),

//           // Scrollable Row with arrows
//           Stack(
//             children: [
//               // Horizontal List
//               SizedBox(
//                 height: 380,
//                 child: ListView.separated(
//                   controller: _scrollController,
//                   scrollDirection: Axis.horizontal,
//                   itemCount: projects.length,
//                   separatorBuilder: (_, __) => SizedBox(width: cardSpacing),
//                   itemBuilder: (context, index) {
//                     final project = projects[index];
//                     return SizedBox(
//                       width: cardWidth,
//                       child: _ProjectCard(
//                         title: project['title']!,
//                         desc: project['desc']!,
//                         image: project['image']!,
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               // Left Arrow
//               Positioned(
//                 left: 0,
//                 top: 150,
//                 child: IconButton(
//                   icon: const Icon(Icons.arrow_back_ios, color: Colors.white70),
//                   onPressed: _scrollLeft,
//                 ),
//               ),

//               // Right Arrow
//               Positioned(
//                 right: 0,
//                 top: 150,
//                 child: IconButton(
//                   icon:
//                       const Icon(Icons.arrow_forward_ios, color: Colors.white70),
//                   onPressed: _scrollRight,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _ProjectCard extends StatelessWidget {
//   final String title;
//   final String desc;
//   final String image;

//   const _ProjectCard({
//     required this.title,
//     required this.desc,
//     required this.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.cardBackground,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.25),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       clipBehavior: Clip.hardEdge,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Image
//           AspectRatio(
//             aspectRatio: 4 / 3,
//             child: Image.network(image, fit: BoxFit.cover),
//           ),
//           // Text content
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title,
//                       style: AppFonts.heading.copyWith(fontSize: 18)),
//                   const SizedBox(height: 8),
//                   Expanded(
//                     child: Text(
//                       desc,
//                       style: AppFonts.body.copyWith(
//                         color: AppColors.secondaryText,
//                         fontSize: 14,
//                       ),
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Row(
//                     children: [
//                       const Icon(Icons.arrow_forward,
//                           size: 16, color: AppColors.accentBlue),
//                       const SizedBox(width: 4),
//                       Text("View Project",
//                           style: AppFonts.body
//                               .copyWith(color: AppColors.accentBlue)),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }






// // import 'package:flutter/material.dart';

// // class ProjectsSection extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Center(
// //       child: Text(
// //         'Projects',
// //         style: TextStyle(fontSize: 24),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import '../theme/app_colors.dart';
// import '../theme/app_fonts.dart';

// class ProjectsSection extends StatelessWidget {
//   final projects = const [
//     {
//       'title': 'AI-Powered Chatbot',
//       'desc': 'An intelligent chatbot capable of handling complex user queries and providing personalized responses.',
//       'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuCl2CPyWUYH-fyr4lfhda10QUINSWwbTTu-w6hO3WUNt3UKfJeIl_Xy4oUNvvntMAnfpvk592smQsoD1FjgZWLuxqPQE738JqyOF4oVgXtKzMIeAtgWycm3y9Sls0J91SlsnH8O947n7BPy4yeykEMubTxhu_OSCW-ziAwzMiRUSMDOTSZp-fglWLicw3ScfyxvDJhsKCrHdzLPgqDz2aUWX8lHG4zUcn_DrISqC777ZjGN99xbasyky2cNp2KWN-446WoV-gonfA'
//     },
//     {
//       'title': 'Image Recognition System',
//       'desc': 'A system that accurately identifies objects and scenes in images using advanced deep learning techniques.',
//       'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuB0r6XRvowfPnBrS8gTWCd7KCUbhSCzAGnjJETsdK1hMehKI5ETvwFNe4G69Em0w0_JLq5PqNrzqeiN5Yj762BPI9m86h4dOUGy9rSw34WIA1WlWebhN-_xiTjF1XMB5TWW9A6MGcfOlpCJLNNGGF0Zx9TAOqTIEUuhMdsVt6rZSopCZsKqMVVM0DBdYcwF3W4vEGwDRarqg6tFYpQNOeJLFuHrEnzwQ1Cjv_p4jK6vy0aQTQooX-Cr39rkRb_VTfnGAvo3vmG8ig'
//     },
//     {
//       'title': 'Natural Language Processing Model',
//       'desc': 'A model that understands and processes human language for sentiment analysis and text summarization.',
//       'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuBQ0Yvj3ux-P0Fd0vbgYlRb0plwVo7z0yfJng0Denu6l0kjuRb7ASCHpsYJsUlID1LBs9VqofyoiaabGg4iq4NWlSGJP38rN9YmhibA6mq9Hj9dxbJry09_5e0RLRIpXkvFymwJz_oTR51h9pPFLllrQJ339PeFYrdzmjmg7LhFD93ZWZ9WqoMvRjB-9FtS5i533Qz8jbjnM9t0b9qeFfE6ljdHJebxrsdpdeGMAjBdqpPhO8kueWEWjFfUOEowo8LkBm2E5bVrtw'
//     },
//     {
//       'title': 'Predictive Analytics Dashboard',
//       'desc': 'A dashboard visualizing predictive models, providing insights into future trends and outcomes.',
//       'image': 'https://lh3.googleusercontent.com/aida-public/AB6AXuB2Tr2YHNkAFkXs7CyiqJt9iTc16q2ucFrawzGzwJUj8sQ8m88YqNd69jFfeEOWRulXvQ4hlJE1XpQrpZRKkptGHDWx-qv8fRTP4YzdpcVudhe1jCr4nXyMJDL420kNp38ttUtTZDe_Vk9oDm07QtkpgSiv30OBVrtD83KvWpHKWM2KNoUbNjGmx5sr9OTVR_Kiqe3dyHTre9_NZDPSFN7SafzrjQXJ0M2wHXmM7xsu-8sSfyDMvDnvx86IY5S8Ev5RB9ckPAo9_w'
//     },
//   ];

//   const ProjectsSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         color: AppColors.background,
//         padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
//         child: Column(
//           children: [
//             // Title
//             Text(
//               "My AI Projects",
//               style: AppFonts.heading.copyWith(fontSize: 32),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 12),
//             Text(
//               "A collection of AI projects showcasing my skills and expertise in building intelligent systems.",
//               style: AppFonts.body.copyWith(color: AppColors.secondaryText),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 32),

//             // Responsive Grid
//             LayoutBuilder(
//               builder: (context, constraints) {
//                 int crossAxisCount = 1;
//                 if (constraints.maxWidth > 1200) {
//                   crossAxisCount = 4;
//                 } else if (constraints.maxWidth > 900) {
//                   crossAxisCount = 3;
//                 } else if (constraints.maxWidth > 600) {
//                   crossAxisCount = 2;
//                 }

//                 return GridView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: crossAxisCount,
//                     crossAxisSpacing: 20,
//                     mainAxisSpacing: 20,
//                     childAspectRatio: 4 / 5,
//                   ),
//                   itemCount: projects.length,
//                   itemBuilder: (context, index) {
//                     final project = projects[index];
//                     return _ProjectCard(
//                       title: project['title']!,
//                       desc: project['desc']!,
//                       image: project['image']!,
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _ProjectCard extends StatelessWidget {
//   final String title;
//   final String desc;
//   final String image;

//   const _ProjectCard({
//     required this.title,
//     required this.desc,
//     required this.image,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: AppColors.cardBackground,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.3),
//             blurRadius: 12,
//             offset: const Offset(0, 6),
//           ),
//         ],
//       ),
//       clipBehavior: Clip.hardEdge,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Image
//           Stack(
//             children: [
//               AspectRatio(
//                 aspectRatio: 4 / 3,
//                 child: Image.network(image, fit: BoxFit.cover),
//               ),
//               Container(
//                 height: 140,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.topCenter,
//                     colors: [Colors.black54, Colors.transparent],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // Content
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(title,
//                       style: AppFonts.heading.copyWith(fontSize: 18)),
//                   const SizedBox(height: 8),
//                   Expanded(
//                     child: Text(
//                       desc,
//                       style: AppFonts.body.copyWith(
//                         color: AppColors.secondaryText,
//                         fontSize: 14,
//                       ),
//                       maxLines: 4,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   Align(
//                     alignment: Alignment.bottomRight,
//                     child: TextButton.icon(
//                       onPressed: () {},
//                       icon: const Icon(Icons.arrow_forward,
//                           size: 18, color: AppColors.accentBlue),
//                       label: Text(
//                         "View Project",
//                         style: AppFonts.body
//                             .copyWith(color: AppColors.accentBlue),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
