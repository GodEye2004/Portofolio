import 'package:flutter/material.dart';
import '../data/portfolio_data.dart';
import '../theme/app_theme.dart';
import 'common.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = isWideScreen(context);
    return Container(
      width: double.infinity,
      color: AppColors.ink,
      child: ContentContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 96),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Let's work together.",
                style: AppSerif.of(context).copyWith(
                  fontSize: wide ? 52 : 36,
                  fontWeight: FontWeight.w600,
                  color: AppColors.paper,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 20),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 560),
                child: const Text(
                  'Open to Flutter roles, contract work, and interesting '
                  'problems in mobile and AI. The fastest way to reach me '
                  'is email.',
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.65,
                    color: Color(0xFFB8B2A4),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Wrap(
                spacing: 28,
                runSpacing: 12,
                children: const [
                  _FooterLink(
                    label: 'mohammadg248015@gmail.com',
                    url: 'mailto:${PortfolioData.email}',
                  ),
                  _FooterLink(label: 'GitHub ↗', url: PortfolioData.githubUrl),
                  _FooterLink(
                    label: 'LinkedIn ↗',
                    url: PortfolioData.linkedinUrl,
                  ),
                ],
              ),
              const SizedBox(height: 72),
              const Divider(height: 1, thickness: 1, color: Color(0xFF3B372C)),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '© ${DateTime.now().year} ${PortfolioData.name}',
                      style: const TextStyle(
                        color: Color(0xFF8C8676),
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const Text(
                    'Built with Flutter',
                    style: TextStyle(color: Color(0xFF8C8676), fontSize: 13),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterLink extends StatefulWidget {
  final String label;
  final String url;
  const _FooterLink({required this.label, required this.url});

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
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
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: _hovered ? const Color(0xFF9FC9B4) : AppColors.paper,
            decoration: TextDecoration.underline,
            decorationColor:
                _hovered ? const Color(0xFF9FC9B4) : const Color(0xFF5C5747),
          ),
        ),
      ),
    );
  }
}
