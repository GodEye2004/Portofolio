import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Centers content and caps its width on wide screens (desktop/web),
/// while using the full width on narrow screens (mobile).
class ContentContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  const ContentContainer({super.key, required this.child, this.maxWidth = 980});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: child,
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;
  const SectionTitle({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 6),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
        ],
        const SizedBox(height: 28),
      ],
    );
  }
}

/// True when the layout should switch to a wider, multi-column style.
bool isWideScreen(BuildContext context) => MediaQuery.of(context).size.width >= 760;
