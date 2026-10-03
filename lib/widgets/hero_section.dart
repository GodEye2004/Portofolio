import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

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
      padding: const EdgeInsets.symmetric(vertical: 96),
      child: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShaderMask(
              shaderCallback: (bounds) =>
                  AppColors.heroGradient.createShader(bounds),
              child: Text(
                PortfolioData.name,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              PortfolioData.role,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Text(
                PortfolioData.tagline,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
              ),
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 14,
              runSpacing: 14,
              children: [
                _ActionButton(
                  label: 'GitHub',
                  icon: Icons.code_rounded,
                  filled: true,
                  onTap: () => _open(PortfolioData.githubUrl),
                ),
                _ActionButton(
                  label: 'LinkedIn',
                  icon: Icons.business_center_rounded,
                  filled: false,
                  onTap: () => _open(PortfolioData.linkedinUrl),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool filled;
  final VoidCallback onTap;

  const _ActionButton({
    required this.label,
    required this.icon,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (filled) {
      return ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, size: 18),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600),
        ),
      );
    }
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        side: const BorderSide(color: AppColors.border),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
