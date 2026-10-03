import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class NavTarget {
  final String label;
  final GlobalKey key;
  const NavTarget(this.label, this.key);
}

/// Thin masthead: name on the left, anchor navigation on the right.
class SiteHeader extends StatelessWidget {
  final List<NavTarget> targets;
  const SiteHeader({super.key, required this.targets});

  @override
  Widget build(BuildContext context) {
    final wide = isWideScreen(context);
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.accent, width: 3)),
      ),
      child: ContentContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Text(
                PortfolioData.name,
                style: AppSerif.of(context).copyWith(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              if (wide)
                for (final target in targets)
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: _NavButton(target: target),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatefulWidget {
  final NavTarget target;
  const _NavButton({required this.target});

  @override
  State<_NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<_NavButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {
          final ctx = widget.target.key.currentContext;
          if (ctx != null) {
            Scrollable.ensureVisible(
              ctx,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Text(
          widget.target.label,
          style: TextStyle(
            fontSize: 13.5,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.4,
            color: _hovered ? AppColors.accent : AppColors.muted,
          ),
        ),
      ),
    );
  }
}
