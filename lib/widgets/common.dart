import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

/// Centers content and caps its width on wide screens (desktop/web),
/// while using the full width on narrow screens (mobile).
class ContentContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  const ContentContainer({super.key, required this.child, this.maxWidth = 1240});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: child,
        ),
      ),
    );
  }
}

/// Uppercase monospace section label with a short dash and a
/// trailing hairline — the running header of the page.
class SectionLabel extends StatelessWidget {
  final String label;
  const SectionLabel(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            label.toUpperCase(),
            style: monoLabel(context).copyWith(color: AppColors.ink),
          ),
        ),
        const SizedBox(width: 16),
        const Expanded(child: Divider(height: 1, thickness: 1)),
      ],
    );
  }
}

/// Small uppercase monospace label used for eyebrows and metadata.
TextStyle monoLabel(BuildContext context) => AppMono.of(context).copyWith(
      fontSize: 11.5,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.6,
      color: AppColors.muted,
    );

/// A monospace text link that shows an accent underline on hover.
class TextLink extends StatefulWidget {
  final String label;
  final String url;
  final VoidCallback? onTap;
  final double fontSize;
  const TextLink({
    super.key,
    required this.label,
    this.url = '',
    this.onTap,
    this.fontSize = 12,
  });

  @override
  State<TextLink> createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap ?? () => openUrl(widget.url),
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _hovered ? AppColors.accent : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            widget.label,
            style: AppMono.of(context).copyWith(
              fontSize: widget.fontSize,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.4,
              color: AppColors.ink,
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> openUrl(String url) async {
  if (url.isEmpty) return;
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

/// True when the layout should switch to a wider, multi-column style.
bool isWideScreen(BuildContext context) =>
    MediaQuery.of(context).size.width >= 900;

/// Generous vertical section spacing on desktop, tighter on mobile.
double sectionPadding(BuildContext context) =>
    isWideScreen(context) ? 64 : 44;
