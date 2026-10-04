import 'package:flutter/material.dart';
import 'data/portfolio_data.dart';
import 'theme/app_theme.dart';
import 'widgets/site_header.dart';
import 'widgets/hero_section.dart';
import 'widgets/work_section.dart';
import 'widgets/journey_section.dart';
import 'widgets/contact_section.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${PortfolioData.fullName} — Software Engineer',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _workKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _contactKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final targets = [
      NavTarget('WORK', key: _workKey, active: true),
      NavTarget('ABOUT', key: _aboutKey),
      NavTarget('NOTES', url: PortfolioData.linkedinUrl),
      NavTarget('CONTACT', key: _contactKey),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SiteHeader(targets: targets),
            HeroSection(
              onAboutTap: () => _scrollTo(_aboutKey),
              onWorkTap: () => _scrollTo(_workKey),
            ),
            WorkSection(key: _workKey),
            const StatsStrip(),
            JourneySection(key: _aboutKey),
            ContactSection(key: _contactKey),
          ],
        ),
      ),
    );
  }
}
