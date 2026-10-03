import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

/// Mono stats row: SOFTWARE ENGINEER | PRODUCT BUILDER | ...
class StatsStrip extends StatelessWidget {
  const StatsStrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.line, width: 1)),
      ),
      child: ContentContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: Wrap(
            spacing: 24,
            runSpacing: 10,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              for (var i = 0; i < PortfolioData.stats.length; i++) ...[
                if (i > 0)
                  Text('|',
                      style:
                          monoLabel(context).copyWith(color: AppColors.faint)),
                Text(PortfolioData.stats[i], style: monoLabel(context)),
              ],
              const SizedBox(width: 24),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 26, height: 2.5, color: AppColors.accent),
                  const SizedBox(width: 12),
                  Text(PortfolioData.statsRight, style: monoLabel(context)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// "MY JOURNEY" timeline + "WHAT I CARE ABOUT" grid side by side.
class JourneySection extends StatelessWidget {
  const JourneySection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = isWideScreen(context);
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.line, width: 1)),
      ),
      child: ContentContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: sectionPadding(context)),
          child: wide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(flex: 7, child: _Journey()),
                    const SizedBox(width: 64),
                    const Expanded(flex: 6, child: _CareAbout()),
                  ],
                )
              : const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _Journey(),
                    SizedBox(height: 56),
                    _CareAbout(),
                  ],
                ),
        ),
      ),
    );
  }
}

class _Journey extends StatelessWidget {
  const _Journey();

  @override
  Widget build(BuildContext context) {
    final wide = isWideScreen(context);
    final steps = PortfolioData.journey;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('MY JOURNEY'),
        const SizedBox(height: 40),
        if (wide)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < steps.length; i++)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              color: AppColors.ink,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const Expanded(
                            child:
                                Divider(height: 1, thickness: 1, indent: 6),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Text(steps[i].year,
                          style: monoLabel(context)
                              .copyWith(color: AppColors.ink)),
                      const SizedBox(height: 6),
                      Text(
                        steps[i].title,
                        style: const TextStyle(
                            fontSize: 12.5, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        steps[i].note,
                        style: const TextStyle(
                            fontSize: 11.5, color: AppColors.muted),
                      ),
                    ],
                  ),
                ),
            ],
          )
        else
          Column(
            children: [
              for (var i = 0; i < steps.length; i++)
                IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 7,
                            height: 7,
                            margin: const EdgeInsets.only(top: 5),
                            decoration: const BoxDecoration(
                              color: AppColors.ink,
                              shape: BoxShape.circle,
                            ),
                          ),
                          if (i < steps.length - 1)
                            const Expanded(
                              child: VerticalDivider(
                                  width: 7, thickness: 1),
                            ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(steps[i].year, style: monoLabel(context)),
                              const SizedBox(height: 4),
                              Text(
                                steps[i].title,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                steps[i].note,
                                style: const TextStyle(
                                    fontSize: 12.5,
                                    color: AppColors.muted),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

class _CareAbout extends StatelessWidget {
  const _CareAbout();

  @override
  Widget build(BuildContext context) {
    final cares = PortfolioData.cares;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('WHAT I CARE ABOUT'),
        const SizedBox(height: 40),
        Wrap(
          spacing: 40,
          runSpacing: 36,
          children: [
            for (final item in cares)
              SizedBox(width: 200, child: _CareCell(item: item)),
          ],
        ),
      ],
    );
  }
}

class _CareCell extends StatelessWidget {
  final CareItem item;
  const _CareCell({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(item.icon, size: 26, color: AppColors.ink),
        const SizedBox(height: 14),
        Text(
          item.title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 6),
        Text(
          item.description,
          style: const TextStyle(
              fontSize: 12.5, height: 1.5, color: AppColors.muted),
        ),
      ],
    );
  }
}
