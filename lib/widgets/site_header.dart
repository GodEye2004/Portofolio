import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class NavTarget {
  final String label;
  final GlobalKey? key;
  final String? url;
  final String? routeName;
  final bool active;
  const NavTarget(
    this.label, {
    this.key,
    this.url,
    this.routeName,
    this.active = false,
  });
}

/// Monospace masthead: name on the left, nav links on the right.
class SiteHeader extends StatelessWidget {
  final List<NavTarget> targets;
  const SiteHeader({super.key, required this.targets});

  @override
  Widget build(BuildContext context) {
    final wide = isWideScreen(context);
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.line, width: 1)),
      ),
      child: ContentContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 22),
          child: Row(
            children: [
              Text(
                '${PortfolioData.name.toUpperCase()}  /  ENGINEER',
                style: AppMono.of(context).copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.8,
                ),
              ),
              const Spacer(),
              if (wide)
                for (final target in targets)
                  Padding(
                    padding: const EdgeInsets.only(left: 36),
                    child: _NavButton(target: target),
                  )
              else
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pushNamed('/contact'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  child: Text(
                    'CONTACT',
                    style: AppMono.of(context).copyWith(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.6,
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
    if (widget.target.label.toUpperCase() == 'CONTACT') {
      return ElevatedButton(
        onPressed: () {
          if (widget.target.routeName != null) {
            Navigator.of(context).pushNamed(widget.target.routeName!);
            return;
          }
          if (widget.target.url != null) {
            openUrl(widget.target.url!);
            return;
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(999),
          ),
        ),
        child: Text(
          widget.target.label,
          style: AppMono.of(context).copyWith(
            fontSize: 11.5,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.6,
          ),
        ),
      );
    }

    final active = widget.target.active || _hovered;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () {
          if (widget.target.url != null) {
            openUrl(widget.target.url!);
            return;
          }
          if (widget.target.routeName != null) {
            Navigator.of(context).pushNamed(widget.target.routeName!);
            return;
          }
          final ctx = widget.target.key?.currentContext;
          if (ctx != null) {
            Scrollable.ensureVisible(
              ctx,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Container(
          padding: const EdgeInsets.only(bottom: 4),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: active ? AppColors.accent : Colors.transparent,
                width: 2.5,
              ),
            ),
          ),
          child: Text(
            widget.target.label,
            style: AppMono.of(context).copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.8,
              color: AppColors.ink,
            ),
          ),
        ),
      ),
    );
  }
}
