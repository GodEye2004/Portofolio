import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = isWideScreen(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 72),
      child: ContentContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: 'Experience & Work',
              subtitle: 'A few things I\'ve built recently.',
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: PortfolioData.projects
                      .map(
                        (p) => SizedBox(
                          width: wide
                              ? (constraints.maxWidth - 40) / 3
                              : constraints.maxWidth,
                          child: _ProjectCard(project: p),
                        ),
                      )
                      .toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Project project;
  const _ProjectCard({required this.project});

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
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            project.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.45,
                ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: project.tags
                .map((t) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceAlt,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        t,
                        style: const TextStyle(
                            fontSize: 12, color: AppColors.accentAlt),
                      ),
                    ))
                .toList(),
          ),
          if (project.url.isNotEmpty) ...[
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: () => _open(project.url),
              icon: const Icon(Icons.arrow_outward_rounded, size: 16),
              label: const Text('View project'),
              style: TextButton.styleFrom(
                foregroundColor: AppColors.accent,
                padding: EdgeInsets.zero,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
