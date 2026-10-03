import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class VenturesSection extends StatelessWidget {
  const VenturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.accentSoft,
      child: ContentContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 88),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionHeading(number: '03', label: 'Products I Run'),
              for (var i = 0; i < PortfolioData.ventures.length; i++) ...[
                if (i > 0) const SizedBox(height: 56),
                _VentureEntry(venture: PortfolioData.ventures[i]),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _VentureEntry extends StatelessWidget {
  final Venture venture;
  const _VentureEntry({required this.venture});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 14,
          runSpacing: 6,
          children: [
            Text(
              venture.name,
              style: AppSerif.of(context).copyWith(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              venture.role.toUpperCase(),
              style: const TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.8,
                color: AppColors.accent,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640),
          child: Text(
            venture.description,
            style: const TextStyle(
              fontSize: 15.5,
              height: 1.65,
              color: AppColors.muted,
            ),
          ),
        ),
        const SizedBox(height: 14),
        Text(
          venture.tags.join('  ·  '),
          style: const TextStyle(
            fontSize: 13,
            letterSpacing: 0.6,
            color: AppColors.faint,
          ),
        ),
        const SizedBox(height: 16),
        TextLink(label: '${venture.url.replaceFirst('https://', '')} ↗', url: venture.url),
      ],
    );
  }
}
