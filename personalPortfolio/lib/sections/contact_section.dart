// import 'package:flutter/material.dart';

// class ContactSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         'Contact Me',
//         style: TextStyle(fontSize: 24),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_fonts.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.background,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900),
            child: Column(
              children: [
                // Heading
                Text("Get in Touch",
                    style: AppFonts.heading.copyWith(fontSize: 32),
                    textAlign: TextAlign.center),
                const SizedBox(height: 16),
                Text(
                  "I'm always open to discussing new projects, creative ideas, or opportunities. "
                  "Feel free to reach out through any of the channels below.",
                  style: AppFonts.body.copyWith(color: AppColors.secondaryText),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),

                // Contact Options
                Column(
                  children: const [
                    _ContactCard(
                      icon: Icons.event_available,
                      title: "Schedule a Call",
                      subtitle: "Schedule a call back at your convenience.",
                      buttonLabel: "Book Now",
                    ),
                    SizedBox(height: 16),
                    _ContactCard(
                      icon: Icons.chat_bubble,
                      title: "Live Chat / WhatsApp",
                      subtitle: "Instant communication for quick questions.",
                      buttonLabel: "Chat Now",
                    ),
                    SizedBox(height: 16),
                    _ContactCard(
                      icon: Icons.mail,
                      title: "Email",
                      subtitle: "For professional inquiries and discussions.",
                      buttonLabel: "contact@example.com",
                      isEmail: true,
                    ),
                    SizedBox(height: 16),
                    _ContactCard(
                      icon: Icons.linked_camera, // you can use FontAwesome/LinkedIn here
                      title: "LinkedIn",
                      subtitle: "Connect and explore opportunities.",
                      buttonLabel: "Connect",
                      outlined: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String buttonLabel;
  final bool outlined;
  final bool isEmail;

  const _ContactCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    this.outlined = false,
    this.isEmail = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade800, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.accentBlue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 28, color: AppColors.accentBlue),
          ),
          const SizedBox(width: 16),

          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: AppFonts.heading.copyWith(fontSize: 18)),
                const SizedBox(height: 4),
                Text(subtitle,
                    style: AppFonts.body.copyWith(color: AppColors.secondaryText)),
              ],
            ),
          ),

          // Action Button / Email
          isEmail
              ? Text(
                  buttonLabel,
                  style: AppFonts.body.copyWith(color: AppColors.accentBlue),
                )
              : ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        outlined ? Colors.transparent : AppColors.accentBlue,
                    foregroundColor:
                        outlined ? AppColors.accentBlue : AppColors.buttonText,
                    side: outlined
                        ? BorderSide(color: AppColors.accentBlue, width: 1.5)
                        : BorderSide.none,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(buttonLabel, style: AppFonts.button),
                ),
        ],
      ),
    );
  }
}
