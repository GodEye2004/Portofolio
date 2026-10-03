import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class WorkSection extends StatelessWidget {
  const WorkSection({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SectionLabel('SELECTED WORK'),
              SizedBox(height: wide ? 48 : 32),
              if (wide)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < PortfolioData.work.length; i++) ...[
                      if (i > 0) const SizedBox(width: 44),
                      Expanded(
                        child: _WorkCard(item: PortfolioData.work[i], wide: true),
                      ),
                    ],
                  ],
                )
              else
                Column(
                  children: [
                    for (var i = 0; i < PortfolioData.work.length; i++) ...[
                      if (i > 0) const SizedBox(height: 48),
                      _WorkCard(item: PortfolioData.work[i], wide: false),
                    ],
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WorkCard extends StatelessWidget {
  final WorkItem item;
  final bool wide;
  const _WorkCard({required this.item, required this.wide});

  @override
  Widget build(BuildContext context) {
    final image = AspectRatio(
      aspectRatio: wide ? 1 : 16 / 9,
      child: Image.asset(item.image, fit: BoxFit.cover),
    );

    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.index, style: monoLabel(context).copyWith(color: AppColors.faint)),
        const SizedBox(height: 10),
        Text(
          item.title,
          style: AppMono.of(context).copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.6,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 14,
          runSpacing: 4,
          children: item.tags
              .map((t) => Text(t,
                  style: monoLabel(context)
                      .copyWith(fontSize: 10.5, color: AppColors.muted)))
              .toList(),
        ),
        const SizedBox(height: 14),
        Text(
          item.description,
          style: const TextStyle(
            fontSize: 13.5,
            height: 1.55,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 16),
        TextLink(label: 'VIEW PROJECT →', url: item.url),
      ],
    );

    if (wide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 11, child: image),
          const SizedBox(width: 18),
          Expanded(flex: 10, child: text),
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [image, const SizedBox(height: 18), text],
    );
  }
}
