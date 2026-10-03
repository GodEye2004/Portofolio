import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = isWideScreen(context);
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.line, width: 1)),
      ),
      child: ContentContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: sectionPadding(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(number: '04', label: 'Toolbox'),
              for (var i = 0; i < PortfolioData.skillGroups.length; i++) ...[
                if (i > 0)
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Divider(height: 1, thickness: 1),
                  ),
                _SkillRow(group: PortfolioData.skillGroups[i], wide: wide),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SkillRow extends StatelessWidget {
  final SkillGroup group;
  final bool wide;
  const _SkillRow({required this.group, required this.wide});

  @override
  Widget build(BuildContext context) {
    final title = Text(
      group.title.toUpperCase(),
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.8,
        color: AppColors.muted,
      ),
    );
    final skills = Text(
      group.skills.join('   ·   '),
      style: const TextStyle(
        fontSize: 15.5,
        height: 1.6,
        color: AppColors.ink,
      ),
    );

    if (!wide) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [title, const SizedBox(height: 8), skills],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 200, child: title),
        const SizedBox(width: 48),
        Expanded(child: skills),
      ],
    );
  }
}
