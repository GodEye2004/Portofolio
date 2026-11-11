import 'package:flutter/material.dart';

import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import '../widgets/common.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = isWideScreen(context);
    final links = <({String label, String url})>[
      (label: 'Email', url: 'mailto:${PortfolioData.email}'),
      (label: 'Phone', url: 'tel:${PortfolioData.phone}'),
      (label: 'GitHub', url: PortfolioData.githubUrl),
      (label: 'LinkedIn', url: PortfolioData.linkedinUrl),
      if (PortfolioData.twitterUrl.isNotEmpty)
        (label: 'Twitter', url: PortfolioData.twitterUrl),
    ];

    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.line, width: 1),
                  ),
                ),
                child: ContentContainer(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    child: Row(
                      children: [
                        TextButton.icon(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_left,
                            size: 18,
                            color: AppColors.ink,
                          ),
                          label: Text(
                            'BACK',
                            style: AppMono.of(context).copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.8,
                              color: AppColors.ink,
                            ),
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton.icon(
                          onPressed: () =>
                              openUrl('mailto:${PortfolioData.email}'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.accent,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(999),
                            ),
                          ),
                          icon: const Icon(Icons.mail_outline, size: 18),
                          label: Text(
                            'CONTACT ME',
                            style: AppMono.of(context).copyWith(
                              fontSize: 11.5,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ContentContainer(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: wide ? 72 : 44),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('LET\'S BUILD SOMETHING', style: monoLabel(context)),
                      const SizedBox(height: 18),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 760),
                        child: Text(
                          'I\'m always open to product ideas, engineering collaborations, and meaningful conversations.',
                          style: TextStyle(
                            fontSize: wide ? 34 : 26,
                            fontWeight: FontWeight.w800,
                            height: 1.15,
                            letterSpacing: wide ? -1.2 : -0.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 620),
                        child: Text(
                          'Whether you need a product-minded engineer, a technical partner, or a builder who can turn rough ideas into real systems, I\'d love to hear about it.',
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1.75,
                            color: AppColors.muted,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                      Column(
                        children: [
                          for (var i = 0; i < links.length; i++) ...[
                            if (i > 0) const SizedBox(height: 16),
                            _ContactCard(
                              label: links[i].label,
                              url: links[i].url,
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final String label;
  final String url;

  const _ContactCard({required this.label, required this.url});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => openUrl(url),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.line),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label.toUpperCase(),
                  style: monoLabel(context).copyWith(color: AppColors.ink),
                ),
                const SizedBox(height: 10),
                Text(
                  switch (label.toLowerCase()) {
                    'email' => PortfolioData.email,
                    'phone' => '+${PortfolioData.phone}',
                    'github' || 'linkedin' => 'View profile',
                    'twitter' => 'Open profile',
                    _ => 'Open link',
                  },
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.ink,
                  ),
                  softWrap: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
