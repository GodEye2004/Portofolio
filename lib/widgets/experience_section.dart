import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentContainer(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 88),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(number: '01', label: 'About'),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Text(
                PortfolioData.about,
                style: const TextStyle(
                  fontSize: 17,
                  height: 1.7,
                  color: AppColors.ink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = isWideScreen(context);
    return ContentContainer(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 88),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(number: '02', label: 'Experience'),
            for (var i = 0; i < PortfolioData.experience.length; i++) ...[
              if (i > 0)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: Divider(height: 1, thickness: 1),
                ),
              _ExperienceEntry(
                experience: PortfolioData.experience[i],
                wide: wide,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ExperienceEntry extends StatelessWidget {
  final Experience experience;
  final bool wide;
  const _ExperienceEntry({required this.experience, required this.wide});

  @override
  Widget build(BuildContext context) {
    final meta = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          experience.period.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.6,
            color: AppColors.accent,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          experience.location,
          style: const TextStyle(fontSize: 13.5, color: AppColors.faint),
        ),
      ],
    );

    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          experience.role,
          style: AppSerif.of(context).copyWith(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          experience.company,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          experience.summary,
          style: const TextStyle(
            fontSize: 15.5,
            height: 1.6,
            color: AppColors.muted,
          ),
        ),
      ],
    );

    if (!wide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [meta, const SizedBox(height: 16), body],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 200, child: meta),
        const SizedBox(width: 48),
        Expanded(child: body),
      ],
    );
  }
}
