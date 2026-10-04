import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

/// Light footer: copyright left, slash-separated links right,
/// trailing accent dash — matching the mockup.
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final links = <(String, String)>[
      ('GitHub', PortfolioData.githubUrl),
      ('LinkedIn', PortfolioData.linkedinUrl),
      if (PortfolioData.twitterUrl.isNotEmpty)
        ('Twitter', PortfolioData.twitterUrl),
      ('Email', 'mailto:${PortfolioData.email}'),
    ];

    return ContentContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28),
        child: Wrap(
          spacing: 24,
          runSpacing: 12,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.spaceBetween,
          children: [
            Text(
              '© ${DateTime.now().year} ${PortfolioData.name}. All rights reserved.',
              style: monoLabel(
                context,
              ).copyWith(letterSpacing: 0.6, color: AppColors.muted),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var i = 0; i < links.length; i++) ...[
                  if (i > 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '/',
                        style: monoLabel(
                          context,
                        ).copyWith(color: AppColors.faint),
                      ),
                    ),
                  TextLink(label: links[i].$1, url: links[i].$2),
                ],
                const SizedBox(width: 16),
                Container(width: 26, height: 2.5, color: AppColors.accent),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
