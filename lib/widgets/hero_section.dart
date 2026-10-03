import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onAboutTap;
  final VoidCallback? onWorkTap;
  const HeroSection({super.key, this.onAboutTap, this.onWorkTap});

  @override
  Widget build(BuildContext context) {
    final wide = isWideScreen(context);

    final intro = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(PortfolioData.eyebrow, style: monoLabel(context)),
        const SizedBox(height: 20),
        Text(
          PortfolioData.headline,
          style: AppDisplay.of(context).copyWith(
            fontSize: wide ? 56 : 36,
            fontWeight: FontWeight.w800,
            height: 1.08,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Text(
            PortfolioData.intro,
            style: const TextStyle(
              fontSize: 15.5,
              height: 1.6,
              color: AppColors.muted,
            ),
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 18,
          runSpacing: 12,
          children: [
            Container(width: 34, height: 3, color: AppColors.accent),
            Text(PortfolioData.location, style: monoLabel(context)),
            Text('|', style: monoLabel(context)),
            TextLink(label: 'CURRENTLY BUILDING →', onTap: onWorkTap),
          ],
        ),
      ],
    );

    final photo = ClipRect(
      child: Image.asset(
        'assets/images/portrait.png',
        fit: BoxFit.cover,
        filterQuality: FilterQuality.medium,
      ),
    );

    final mindset = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('// developer mindset', style: monoLabel(context)),
        const SizedBox(height: 18),
        Text(
          PortfolioData.focusCode,
          style: AppMono.of(context).copyWith(
            fontSize: 12.5,
            height: 1.7,
            color: AppColors.muted,
          ),
        ),
        const SizedBox(height: 28),
        const Divider(height: 1, thickness: 1),
        const SizedBox(height: 24),
        Text(
          PortfolioData.mindset,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 1.55,
          ),
        ),
        const SizedBox(height: 20),
        TextLink(label: 'MORE ABOUT ME →', onTap: onAboutTap),
      ],
    );

    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.line, width: 1)),
      ),
      child: ContentContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: wide ? 72 : 48),
          child: wide
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: intro),
                    const SizedBox(width: 48),
                    Expanded(flex: 3, child: photo),
                    const SizedBox(width: 48),
                    Expanded(flex: 3, child: mindset),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    intro,
                    const SizedBox(height: 40),
                    photo,
                    const SizedBox(height: 40),
                    mindset,
                  ],
                ),
        ),
      ),
    );
  }
}
