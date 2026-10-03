import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = isWideScreen(context);
    final serif = AppSerif.of(context);

    return ContentContainer(
      child: Padding(
        padding: EdgeInsets.only(top: wide ? 96 : 64, bottom: 88),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  color: AppColors.accent,
                ),
                const SizedBox(width: 10),
                Text(
                  PortfolioData.location.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                    color: AppColors.muted,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            Text(
              PortfolioData.name,
              style: serif.copyWith(
                fontSize: wide ? 68 : 44,
                fontWeight: FontWeight.w600,
                height: 1.05,
                letterSpacing: -1.0,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              PortfolioData.role,
              style: serif.copyWith(
                fontSize: wide ? 21 : 18,
                fontStyle: FontStyle.italic,
                color: AppColors.accent,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 28),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 620),
              child: Text(
                PortfolioData.tagline,
                style: const TextStyle(
                  fontSize: 16.5,
                  height: 1.65,
                  color: AppColors.muted,
                ),
              ),
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 28,
              runSpacing: 12,
              children: const [
                TextLink(label: 'GitHub ↗', url: PortfolioData.githubUrl),
                TextLink(label: 'LinkedIn ↗', url: PortfolioData.linkedinUrl),
                TextLink(
                  label: 'mohammadg248015@gmail.com',
                  url: 'mailto:${PortfolioData.email}',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
