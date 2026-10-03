import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = isWideScreen(context);
    return ContentContainer(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: sectionPadding(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(number: '05', label: 'Selected Projects'),
            LayoutBuilder(
              builder: (context, constraints) {
                final columnWidth =
                    wide ? (constraints.maxWidth - 64) / 2 : constraints.maxWidth;
                return Wrap(
                  spacing: 64,
                  runSpacing: 56,
                  children: PortfolioData.projects
                      .map(
                        (p) => SizedBox(
                          width: columnWidth,
                          child: _ProjectEntry(project: p),
                        ),
                      )
                      .toList(),
                );
              },
            ),
            const SizedBox(height: 56),
            const TextLink(
              label: 'Everything else on GitHub ↗',
              url: PortfolioData.githubUrl,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectEntry extends StatelessWidget {
  final Project project;
  const _ProjectEntry({required this.project});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => openUrl(project.url),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Expanded(
                  child: Text(
                    project.title,
                    style: AppSerif.of(context).copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Text(
                  '↗',
                  style: TextStyle(fontSize: 16, color: AppColors.accent),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          project.description,
          style: const TextStyle(
            fontSize: 15,
            height: 1.6,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          project.tags.join('  ·  '),
          style: const TextStyle(
            fontSize: 12.5,
            letterSpacing: 0.6,
            color: AppColors.faint,
          ),
        ),
      ],
    );
  }
}
