// lib/sections/skills_section.dart
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';
import '../widgets/casestudies.dart';


class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> skills = [
      {
        'icon': Icons.psychology,
        'title': 'Machine Learning',
        'highlights': [
          'Deployed end-to-end pipelines (Scikit-learn → PyTorch).',
          'Optimized training on GPU clusters with mixed precision.',
          'Built robust feature engineering & production data pipelines.',
        ],
        'details': [
          'Designed data schemas and ETL for low-latency training feeds.',
          'Implemented model versioning, A/B rollout and monitoring.',
          'Reduced retrain times with cached feature stores.'
        ],
        'tags': ['PyTorch', 'Scikit-learn', 'GPU-scaling'],
        'result': 'Reduced training cost by ~30% via GPU scaling & tuning.',
        'highlight': 'Production-ready Deployment',
        'color': const Color(0xFF3B82F6),
      },
      {
        'icon': Icons.hub,
        'title': 'Deep Learning',
        'highlights': [
          'Trained super-resolution model from scratch on VGG16 (PyTorch).',
          'Built and tuned custom U-Net architectures for segmentation.',
          'Optimized models for faster inference and memory efficiency.',
        ],
        'details': [
          'Implemented mixed-precision and gradient-checkpointing to fit larger models on a single GPU.',
          'Wrote custom loss functions and augmentation pipelines for SR tasks.',
          'Profiled and reduced inference memory footprint for edge deployment.'
        ],
        'tags': ['VGG16', 'U-Net', 'Mixed-Precision'],
        'result': 'Improved image clarity for diagnostic use-cases in pilot deployments.',
        'highlight': 'Accelerated Model Training',
        'color': const Color(0xFF8B5CF6),
      },
      {
        'icon': Icons.translate,
        'title': 'Natural Language Processing',
        'highlights': [
          'Fine-tuned Whisper for Malayalam speech recognition.',
          'Built LLM-based telemedicine agent (doctor–patient flows).',
          'Deployed ICD/CPT prediction pipelines using LLMs.',
        ],
        'details': [
          'Engineered streaming inference to reduce latency in live calls.',
          'Designed prompt templates and retrieval-augmented generation for domain accuracy.',
          'Validated pipeline with clinical partners and iterated on edge cases.'
        ],
        'tags': ['Whisper', 'LLM', 'Streaming'],
        'result': 'Enabled 10k+ monthly doctor–patient conversations with robust ASR & predictions.',
        'highlight': 'Research → Production',
        'color': const Color(0xFF10B981),
      },
      {
        'icon': Icons.visibility,
        'title': 'Computer Vision',
        'highlights': [
          'Built YOLO pipelines for multiple domains (custom anchors & augmentations).',
          'Created face recognition & segmentation systems (U-Net variants).',
          'Optimized models for real-time edge inference (<=50ms).',
        ],
        'details': [
          'Implemented model pruning & quantization to meet edge constraints.',
          'Designed data pipelines for domain adaptation and hard-negative mining.',
          'Built test harnesses for accuracy/latency regression testing.'
        ],
        'tags': ['YOLO', 'Edge-Inference', 'Quantization'],
        'result': 'Delivered stable real-time detection at production latencies.',
        'highlight': 'Real-time Optimizations',
        'color': const Color(0xFFF97316),
      },
      {
        'icon': Icons.bar_chart,
        'title': 'Data Analysis',
        'highlights': [
          'Converted raw logs into dashboards and KPIs (Pandas, NumPy).',
          'Ran statistical analysis to validate model improvements.',
          'Built reporting used by product & executive teams.',
        ],
        'details': [
          'Developed automated ETL for realtime metrics ingestion.',
          'Designed dashboard templates used in stakeholder reviews.',
          'Performed cohort analyses to measure model impact.'
        ],
        'tags': ['Pandas', 'NumPy', 'Dashboards'],
        'result': 'Insights guided \$1M+ in data-driven decisions.',
        'highlight': 'Insight-driven Analytics',
        'color': const Color(0xFF06B6D4),
      },
      {
        'icon': Icons.cloud_queue,
        'title': 'Cloud & DevOps',
        'highlights': [
          'Built autoscaled GPU services (custom RANSAC + Torch infra).',
          'Deployed containers with Docker & Kubernetes.',
          'Created CI/CD for model rollout and monitoring.',
        ],
        'details': [
          'Automated GPU provisioning & spot-instance fallback logic.',
          'Implemented canary releases and automated rollback for models.',
          'Integrated SLO/alerting for model drift and latency spikes.'
        ],
        'tags': ['Docker', 'Kubernetes', 'Auto-scaling'],
        'result': 'Maintained 99.9% uptime for inference services.',
        'highlight': 'Cloud-native Scalability',
        'color': const Color(0xFF06B6D4),
      },
    ];

    return SingleChildScrollView(
      child: Container(
        color: AppColors.background,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 56),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'My Skillset',
              style: AppFonts.heading.copyWith(
                fontSize: 36,
                fontWeight: FontWeight.w800,
                color: AppColors.primaryText,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 760,
              child: Text(
                'Passionate about AI — I transform research into production-ready systems. '
                'From YOLO pipelines to autoscaled GPU services, I build solutions that move metrics.',
                style: AppFonts.body.copyWith(
                  fontSize: 15,
                  color: AppColors.secondaryText,
                  height: 1.6,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 44),
            Text(
              'Core Competencies',
              style: AppFonts.heading.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
            ),
            const SizedBox(height: 28),
            LayoutBuilder(builder: (context, constraints) {
              int crossAxisCount = 3;
              if (constraints.maxWidth < 900) crossAxisCount = 2;
              if (constraints.maxWidth < 600) crossAxisCount = 1;

              final double totalSpacing = (crossAxisCount - 1) * 24;
              final double itemWidth =
                  (constraints.maxWidth - totalSpacing).clamp(280.0, constraints.maxWidth) /
                      crossAxisCount;

              return Wrap(
                spacing: 24,
                runSpacing: 24,
                children: skills
                    .map((s) => SizedBox(
                          width: itemWidth,
                          child: SkillCard(
                            icon: s['icon'] as IconData,
                            title: s['title'] as String,
                            highlights: List<String>.from(s['highlights'] as List),
                            details: List<String>.from(s['details'] as List),
                            tags: List<String>.from(s['tags'] as List),
                            result: s['result'] as String,
                            highlight: s['highlight'] as String,
                            color: s['color'] as Color,
                          ),
                        ))
                    .toList(),
              );
            }),
            const SizedBox(height: 28),
            TextButton(
              // onPressed: () {
              //   // wire to projects section or routing in your app
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => const CaseStudies()),
              //   );
              // },
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CaseStudiesPage()),
              );
            },

              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                backgroundColor: AppColors.cardBackground,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text(
                'See case studies →',
                style: AppFonts.body.copyWith(color: AppColors.primaryText, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class SkillsSection extends StatelessWidget {
//   const SkillsSection({super.key});

//   // Use final (not const) to avoid const-evaluation issues with Colors/IconData
//   final List<Map<String, dynamic>> skills = [
//     {
//       'icon': Icons.psychology,
//       'title': 'Machine Learning',
//       'highlights': [
//         'Deployed end-to-end pipelines (Scikit-learn → PyTorch).',
//         'Optimized training on GPU clusters with mixed precision.',
//         'Built robust feature engineering & production data pipelines.',
//       ],
//       'details': [
//         'Designed data schemas and ETL for low-latency training feeds.',
//         'Implemented model versioning, A/B rollout and monitoring.',
//         'Reduced retrain times with cached feature stores.'
//       ],
//       'tags': ['PyTorch', 'Scikit-learn', 'GPU-scaling'],
//       'result': 'Reduced training cost by ~30% via GPU scaling & tuning.',
//       'highlight': 'Production-ready Deployment',
//       'color': const Color(0xFF3B82F6), // blue
//     },
//     {
//       'icon': Icons.hub,
//       'title': 'Deep Learning',
//       'highlights': [
//         'Trained super-resolution model from scratch on VGG16 (PyTorch).',
//         'Built and tuned custom U-Net architectures for segmentation.',
//         'Optimized models for faster inference and memory efficiency.',
//       ],
//       'details': [
//         'Implemented mixed-precision and gradient-checkpointing to fit larger models on a single GPU.',
//         'Wrote custom loss functions and augmentation pipelines for SR tasks.',
//         'Profiled and reduced inference memory footprint for edge deployment.'
//       ],
//       'tags': ['VGG16', 'U-Net', 'Mixed-Precision'],
//       'result': 'Improved image clarity for diagnostic use-cases in pilot deployments.',
//       'highlight': 'Accelerated Model Training',
//       'color': const Color(0xFF8B5CF6), // purple
//     },
//     {
//       'icon': Icons.translate,
//       'title': 'Natural Language Processing',
//       'highlights': [
//         'Fine-tuned Whisper for Malayalam speech recognition.',
//         'Built LLM-based telemedicine agent (doctor–patient flows).',
//         'Deployed ICD/CPT prediction pipelines using LLMs.',
//       ],
//       'details': [
//         'Engineered streaming inference to reduce latency in live calls.',
//         'Designed prompt templates and retrieval-augmented generation for domain accuracy.',
//         'Validated pipeline with clinical partners and iterated on edge cases.'
//       ],
//       'tags': ['Whisper', 'LLM', 'Streaming'],
//       'result': 'Enabled 10k+ monthly doctor–patient conversations with robust ASR & predictions.',
//       'highlight': 'Research → Production',
//       'color': const Color(0xFF10B981), // green/teal
//     },
//     {
//       'icon': Icons.visibility,
//       'title': 'Computer Vision',
//       'highlights': [
//         'Built YOLO pipelines for multiple domains (custom anchors & augmentations).',
//         'Created face recognition & segmentation systems (U-Net variants).',
//         'Optimized models for real-time edge inference (<=50ms).',
//       ],
//       'details': [
//         'Implemented model pruning & quantization to meet edge constraints.',
//         'Designed data pipelines for domain adaptation and hard-negative mining.',
//         'Built test harnesses for accuracy/latency regression testing.'
//       ],
//       'tags': ['YOLO', 'Edge-Inference', 'Quantization'],
//       'result': 'Delivered stable real-time detection at production latencies.',
//       'highlight': 'Real-time Optimizations',
//       'color': const Color(0xFFF97316), // orange
//     },
//     {
//       'icon': Icons.bar_chart,
//       'title': 'Data Analysis',
//       'highlights': [
//         'Converted raw logs into dashboards and KPIs (Pandas, NumPy).',
//         'Ran statistical analysis to validate model improvements.',
//         'Built reporting used by product & executive teams.',
//       ],
//       'details': [
//         'Developed automated ETL for realtime metrics ingestion.',
//         'Designed dashboard templates used in stakeholder reviews.',
//         'Performed cohort analyses to measure model impact.'
//       ],
//       'tags': ['Pandas', 'NumPy', 'Dashboards'],
//       'result': 'Insights guided \$1M+ in data-driven decisions.',
//       'highlight': 'Insight-driven Analytics',
//       'color': const Color(0xFF06B6D4), // teal-cyan
//     },
//     {
//       'icon': Icons.cloud_queue,
//       'title': 'Cloud & DevOps',
//       'highlights': [
//         'Built autoscaled GPU services (custom RANSAC + Torch infra).',
//         'Deployed containers with Docker & Kubernetes.',
//         'Created CI/CD for model rollout and monitoring.',
//       ],
//       'details': [
//         'Automated GPU provisioning & spot-instance fallback logic.',
//         'Implemented canary releases and automated rollback for models.',
//         'Integrated SLO/alerting for model drift and latency spikes.'
//       ],
//       'tags': ['Docker', 'Kubernetes', 'Auto-scaling'],
//       'result': 'Maintained 99.9% uptime for inference services.',
//       'highlight': 'Cloud-native Scalability',
//       'color': const Color(0xFF06B6D4), // cyan-ish
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       // ensures not to overflow vertically on smaller screens
//       child: Container(
//         color: AppColors.background,
//         padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 56),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Title
//             Text(
//               'My Skillset',
//               style: AppFonts.heading.copyWith(
//                 fontSize: 36,
//                 fontWeight: FontWeight.w800,
//                 color: AppColors.primaryText,
//               ),
//             ),
//             const SizedBox(height: 12),
//             SizedBox(
//               width: 760,
//               child: Text(
//                 'Passionate about AI — I transform research into production-ready systems. '
//                 'From YOLO pipelines to autoscaled GPU services, I build solutions that move metrics.',
//                 style: AppFonts.body.copyWith(
//                   fontSize: 15,
//                   color: AppColors.secondaryText,
//                   height: 1.6,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             const SizedBox(height: 44),
//             Text(
//               'Core Competencies',
//               style: AppFonts.heading.copyWith(
//                 fontSize: 26,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.primaryText,
//               ),
//             ),
//             const SizedBox(height: 28),

//             // responsive grid using Wrap
//             LayoutBuilder(builder: (context, constraints) {
//               int crossAxisCount = 3;
//               if (constraints.maxWidth < 900) crossAxisCount = 2;
//               if (constraints.maxWidth < 600) crossAxisCount = 1;

//               final double totalSpacing = (crossAxisCount - 1) * 24;
//               final double itemWidth =
//                   (constraints.maxWidth - totalSpacing).clamp(280.0, constraints.maxWidth) /
//                       crossAxisCount;

//               return Wrap(
//                 spacing: 24,
//                 runSpacing: 24,
//                 children: skills
//                     .map((s) => SizedBox(
//                           width: itemWidth,
//                           child: SkillCard(
//                             icon: s['icon'] as IconData,
//                             title: s['title'] as String,
//                             highlights: List<String>.from(s['highlights'] as List),
//                             details: List<String>.from(s['details'] as List),
//                             tags: List<String>.from(s['tags'] as List),
//                             result: s['result'] as String,
//                             highlight: s['highlight'] as String,
//                             color: s['color'] as Color,
//                           ),
//                         ))
//                     .toList(),
//               );
//             }),
//             const SizedBox(height: 28),
//             // CTA (optional)
//             TextButton(
//               onPressed: () {
//                 // wire to projects section or routing in your app
//               },
//               style: TextButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
//                 backgroundColor: AppColors.cardBackground,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               ),
//               child: Text(
//                 'See case studies →',
//                 style: AppFonts.body.copyWith(color: AppColors.primaryText, fontSize: 15),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class SkillCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final List<String> highlights; // short sellable bullets (scan quickly)
  final List<String> details; // expandable deeper proofs
  final List<String> tags; // quick proof tags
  final String result; // one-line impact summary
  final String highlight; // badge label
  final Color color;

  const SkillCard({
    super.key,
    required this.icon,
    required this.title,
    required this.highlights,
    required this.details,
    required this.tags,
    required this.result,
    required this.highlight,
    required this.color,
  });

  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> with SingleTickerProviderStateMixin {
  bool _hovering = false;
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: _hovering ? Matrix4.translationValues(0, -8, 0) : Matrix4.identity(),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: _hovering ? widget.color.withOpacity(0.9) : Colors.grey[800]!, width: 1),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(_hovering ? 0.38 : 0.28), blurRadius: _hovering ? 18 : 12, offset: const Offset(0, 6))
          ],
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title row
            Row(
              children: [
                Icon(widget.icon, size: 40, color: widget.color),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    widget.title,
                    style: AppFonts.heading.copyWith(fontSize: 20, fontWeight: FontWeight.w800, color: AppColors.primaryText),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // quick tags (chips)
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: widget.tags
                  .map((t) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: widget.color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(t, style: AppFonts.body.copyWith(fontSize: 12, color: widget.color, fontWeight: FontWeight.w600)),
                      ))
                  .toList(),
            ),
            const SizedBox(height: 12),

            // Highlights (short bullets for instant scanning)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.highlights
                  .map((h) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('• ', style: TextStyle(color: widget.color, fontWeight: FontWeight.bold)),
                            Expanded(
                              child: Text(h, style: AppFonts.body.copyWith(color: AppColors.secondaryText, height: 1.4, fontSize: 14)),
                            ),
                          ],
                        ),
                      ))
                  .toList(),
            ),

            const SizedBox(height: 8),

            // Result line (one short, high-impact sentence)
            Text(
              'Result: ${widget.result}',
              style: AppFonts.body.copyWith(fontSize: 13, fontStyle: FontStyle.italic, color: Colors.white70),
            ),

            const SizedBox(height: 12),

            // bottom row: badge + expand button
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: widget.color.withOpacity(0.14), borderRadius: BorderRadius.circular(20)),
                  child: Text(widget.highlight, style: AppFonts.body.copyWith(fontSize: 13, fontWeight: FontWeight.w700, color: widget.color)),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => setState(() => _expanded = !_expanded),
                  child: Row(
                    children: [
                      Text(_expanded ? 'Less' : 'Details', style: AppFonts.body.copyWith(color: AppColors.primaryText, fontSize: 13, fontWeight: FontWeight.w700)),
                      const SizedBox(width: 6),
                      Icon(_expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: AppColors.primaryText),
                    ],
                  ),
                ),
              ],
            ),

            // Expandable deeper proofs — shows when user requests details
            AnimatedCrossFade(
              duration: const Duration(milliseconds: 200),
              firstChild: const SizedBox.shrink(),
              secondChild: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.details
                      .map((d) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(Icons.check_circle, size: 16, color: widget.color.withOpacity(0.95)),
                                const SizedBox(width: 8),
                                Expanded(child: Text(d, style: AppFonts.body.copyWith(color: AppColors.secondaryText, height: 1.4, fontSize: 13))),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
              crossFadeState: _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
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

// class SkillsSection extends StatelessWidget {
//   const SkillsSection({super.key});

//   final List<Map<String, dynamic>> skills = const [
//     {
//       'icon': Icons.psychology,
//       'title': 'Machine Learning',
//       'highlights': [
//         'Deployed ML pipelines from Scikit-learn to PyTorch.',
//         'Optimized models for GPU clusters.',
//         'Feature engineering & data pipelines.',
//       ],
//       'highlight': 'Production-ready Deployment',
//       'color': Colors.blue,
//     },
//     {
//       'icon': Icons.hub,
//       'title': 'Deep Learning',
//       'highlights': [
//         'Trained super-resolution model on VGG16 (PyTorch).',
//         'Built & optimized CNNs, RNNs, Transformers.',
//         'Developed custom U-Net architectures.',
//       ],
//       'highlight': 'Accelerated Model Training',
//       'color': Colors.purple,
//     },
//     {
//       'icon': Icons.translate,
//       'title': 'Natural Language Processing',
//       'highlights': [
//         'Fine-tuned Whisper for Malayalam speech.',
//         'LLM-based doctor–patient conversation (telemedicine).',
//         'Deployed ICD/CPT prediction models.',
//       ],
//       'highlight': 'Research → Production',
//       'color': Colors.green,
//     },
//     {
//       'icon': Icons.visibility,
//       'title': 'Computer Vision',
//       'highlights': [
//         'YOLO detection for multiple domains.',
//         'Face recognition & image segmentation.',
//         'Real-time inference on edge devices.',
//       ],
//       'highlight': 'Real-time Optimizations',
//       'color': Colors.orange,
//     },
//     {
//       'icon': Icons.bar_chart,
//       'title': 'Data Analysis',
//       'highlights': [
//         'Turned raw logs into dashboards (Pandas, NumPy).',
//         'Statistical analysis with Matplotlib.',
//         'Delivered decision-driving insights.',
//       ],
//       'highlight': 'Insight-driven Analytics',
//       'color': Colors.teal,
//     },
//     {
//       'icon': Icons.cloud_queue,
//       'title': 'Cloud & DevOps',
//       'highlights': [
//         'Auto-scaled GPU service with Torch + RANSAC.',
//         'Deployed with Docker & Kubernetes.',
//         'CI/CD pipelines on AWS & GCP.',
//       ],
//       'highlight': 'Cloud-native Scalability',
//       'color': Colors.cyan,
//     },
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.background,
//       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             "My Skillset",
//             style: AppFonts.heading.copyWith(
//               fontSize: 38,
//               fontWeight: FontWeight.w800,
//               color: AppColors.primaryText,
//             ),
//           ),
//           const SizedBox(height: 16),
//           SizedBox(
//             width: 720,
//             child: Text(
//               "Passionate about AI, I transform research into production-ready systems. "
//               "From YOLO pipelines to cloud GPU scaling, my focus is on building impactful, real-world solutions.",
//               style: AppFonts.body.copyWith(
//                 fontSize: 16,
//                 color: AppColors.secondaryText,
//                 height: 1.6,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//           const SizedBox(height: 60),
//           Text(
//             "Core Competencies",
//             style: AppFonts.heading.copyWith(
//               fontSize: 28,
//               fontWeight: FontWeight.bold,
//               color: AppColors.primaryText,
//             ),
//           ),
//           const SizedBox(height: 32),

//           // Scrollable grid
//           SingleChildScrollView(
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 int crossAxisCount = 3;
//                 if (constraints.maxWidth < 900) crossAxisCount = 2;
//                 if (constraints.maxWidth < 600) crossAxisCount = 1;

//                 final itemWidth =
//                     (constraints.maxWidth - (crossAxisCount - 1) * 24) /
//                         crossAxisCount;

//                 return Wrap(
//                   spacing: 24,
//                   runSpacing: 24,
//                   children: skills
//                       .map(
//                         (skill) => SizedBox(
//                           width: itemWidth,
//                           child: _SkillCard(
//                             icon: skill['icon'],
//                             title: skill['title'],
//                             highlights: skill['highlights'],
//                             highlight: skill['highlight'],
//                             color: skill['color'],
//                           ),
//                         ),
//                       )
//                       .toList(),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _SkillCard extends StatefulWidget {
//   final IconData icon;
//   final String title;
//   final List<String> highlights;
//   final String highlight;
//   final Color color;

//   const _SkillCard({
//     required this.icon,
//     required this.title,
//     required this.highlights,
//     required this.highlight,
//     required this.color,
//   });

//   @override
//   State<_SkillCard> createState() => _SkillCardState();
// }

// class _SkillCardState extends State<_SkillCard> {
//   bool _hovering = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onEnter: (_) => setState(() => _hovering = true),
//       onExit: (_) => setState(() => _hovering = false),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 250),
//         transform:
//             _hovering ? Matrix4.translationValues(0, -8, 0) : Matrix4.identity(),
//         decoration: BoxDecoration(
//           color: AppColors.cardBackground,
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(
//             color: _hovering ? widget.color : Colors.grey[800]!,
//             width: 1,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.4),
//               blurRadius: _hovering ? 18 : 12,
//               offset: const Offset(0, 6),
//             ),
//           ],
//         ),
//         padding: const EdgeInsets.all(22),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(widget.icon, size: 42, color: widget.color),
//                 const SizedBox(width: 14),
//                 Expanded(
//                   child: Text(
//                     widget.title,
//                     style: AppFonts.heading.copyWith(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.primaryText,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 14),

//             // Mini bullet list of proofs
//             ...widget.highlights
//                 .map(
//                   (h) => Padding(
//                     padding: const EdgeInsets.only(bottom: 8),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("• ",
//                             style: TextStyle(
//                                 color: widget.color,
//                                 fontWeight: FontWeight.bold)),
//                         Expanded(
//                           child: Text(
//                             h,
//                             style: AppFonts.body.copyWith(
//                               fontSize: 14,
//                               color: AppColors.secondaryText,
//                               height: 1.4,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//                 .toList(),

//             const SizedBox(height: 10),

//             // Highlight badge
//             Container(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//               decoration: BoxDecoration(
//                 color: widget.color.withOpacity(0.15),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Text(
//                 widget.highlight,
//                 style: AppFonts.body.copyWith(
//                   fontSize: 13,
//                   fontWeight: FontWeight.w600,
//                   color: widget.color,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';

// class SkillsSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'My Skills',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import '../theme/app_colors.dart';
// import '../theme/app_fonts.dart';

// class SkillsSection extends StatelessWidget {
//   final skills = const [
//     {'name': 'Machine Learning', 'level': 95},
//     {'name': 'Deep Learning', 'level': 90},
//     {'name': 'Natural Language Processing', 'level': 90},
//     {'name': 'Computer Vision', 'level': 85},
//     {'name': 'Reinforcement Learning', 'level': 80},
//     {'name': 'Data Analysis', 'level': 92},
//     {'name': 'Cloud Computing (AWS, GCP)', 'level': 88},
//     {'name': 'DevOps (Docker, K8s)', 'level': 75},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
//         color: AppColors.background,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             // Title
//             Text(
//               "My Skillset",
//               style: AppFonts.heading.copyWith(fontSize: 28),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 16),

//             // Subtitle
//             Text(
//               "Passionate about AI, I continuously explore new techniques to solve complex problems. "
//               "My expertise spans across natural language processing, computer vision, and deep learning.",
//               style: AppFonts.body.copyWith(color: AppColors.secondaryText),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 40),

//             // Skills Card
//             Container(
//               padding: const EdgeInsets.all(24),
//               decoration: BoxDecoration(
//                 color: AppColors.cardBackground,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.3),
//                     blurRadius: 10,
//                     offset: const Offset(0, 5),
//                   )
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text("Ultra Pro Expertise",
//                       style: AppFonts.heading.copyWith(fontSize: 20)),
//                   const SizedBox(height: 24),

//                   // Two-column grid for skills
//                   LayoutBuilder(
//                     builder: (context, constraints) {
//                       final columnWidth = (constraints.maxWidth - 40) / 2;
//                       return Wrap(
//                         runSpacing: 20,
//                         spacing: 40,
//                         children: skills
//                             .map((skill) => SizedBox(
//                                   width: columnWidth,
//                                   child: _buildSkillBar(
//                                     skill['name'] as String,
//                                     skill['level'] as int,
//                                   ),
//                                 ))
//                             .toList(),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildSkillBar(String skill, int level) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Skill name + percentage
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(skill,
//                 style: AppFonts.body.copyWith(
//                     color: AppColors.primaryText,
//                     fontWeight: FontWeight.w600)),
//             Text("$level%",
//                 style: AppFonts.body.copyWith(color: AppColors.accentBlue)),
//           ],
//         ),
//         const SizedBox(height: 6),

//         // Progress bar
//         ClipRRect(
//           borderRadius: BorderRadius.circular(6),
//           child: LinearProgressIndicator(
//             value: level / 100,
//             minHeight: 6,
//             backgroundColor: Colors.grey[800],
//             valueColor: AlwaysStoppedAnimation(AppColors.accentBlue),
//           ),
//         ),
//       ],
//     );
//   }
// }
