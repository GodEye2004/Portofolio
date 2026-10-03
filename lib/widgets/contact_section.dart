import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  Future<void> _open(String url) async {
    if (url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.surface,
      padding: const EdgeInsets.symmetric(vertical: 72),
      child: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: "Let's work together",
              subtitle: 'Feel free to reach out through any of these.',
            ),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _ContactChip(
                  icon: Icons.email_rounded,
                  label: PortfolioData.email,
                  onTap: () => _open('mailto:${PortfolioData.email}'),
                ),
                _ContactChip(
                  icon: Icons.code_rounded,
                  label: 'GitHub',
                  onTap: () => _open(PortfolioData.githubUrl),
                ),
                _ContactChip(
                  icon: Icons.business_center_rounded,
                  label: 'LinkedIn',
                  onTap: () => _open(PortfolioData.linkedinUrl),
                ),
              ],
            ),
            const SizedBox(height: 48),
            Text(
              '© ${DateTime.now().year} ${PortfolioData.name}',
              style: const TextStyle(color: AppColors.textSecondary, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}

class _ContactChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ContactChip({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.surfaceAlt,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: AppColors.accent),
            const SizedBox(width: 10),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
