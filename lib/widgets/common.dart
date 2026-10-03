import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';

/// Centers content and caps its width on wide screens (desktop/web),
/// while using the full width on narrow screens (mobile).
class ContentContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  const ContentContainer({super.key, required this.child, this.maxWidth = 920});

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

/// Numbered, letter-spaced section label with a hairline rule —
/// the running header of the page, like a printed document.
class SectionHeading extends StatelessWidget {
  final String number;
  final String label;
  const SectionHeading({super.key, required this.number, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              number,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 2.4,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                label.toUpperCase(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.4,
                  color: AppColors.muted,
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(child: Divider(height: 1, thickness: 1)),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

/// An underlined text link with a subtle hover state — the only
/// "button" style on the page.
class TextLink extends StatefulWidget {
  final String label;
  final String url;
  final double fontSize;
  final FontWeight fontWeight;
  const TextLink({
    super.key,
    required this.label,
    required this.url,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w500,
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
        onTap: () => openUrl(widget.url),
        child: Text(
          widget.label,
          style: TextStyle(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: _hovered ? AppColors.accent : AppColors.ink,
            decoration: TextDecoration.underline,
            decorationColor: _hovered ? AppColors.accent : AppColors.faint,
            decorationThickness: 1,
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
    MediaQuery.of(context).size.width >= 760;

/// Generous vertical section spacing on desktop, tighter on mobile.
double sectionPadding(BuildContext context) =>
    isWideScreen(context) ? 88 : 56;
