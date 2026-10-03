import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
              title: 'Skills & Tech Stack',
              subtitle: 'Tools I use across the web, backend and mobile.',
            ),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: PortfolioData.skillGroups
                  .map((group) => _SkillGroupCard(group: group))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillGroupCard extends StatelessWidget {
  final SkillGroup group;
  const _SkillGroupCard({required this.group});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            group.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.accentAlt,
                ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: group.skills
                .map((skill) => Chip(
                      label: Text(skill),
                      backgroundColor: AppColors.background,
                      labelStyle: const TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 13,
                      ),
                      side: const BorderSide(color: AppColors.border),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
