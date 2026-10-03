import 'package:flutter/material.dart';
import 'data/portfolio_data.dart';
import 'theme/app_theme.dart';
import 'widgets/site_header.dart';
import 'widgets/hero_section.dart';
import 'widgets/experience_section.dart';
import 'widgets/ventures_section.dart';
import 'widgets/skills_section.dart';
import 'widgets/projects_section.dart';
import 'widgets/contact_section.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${PortfolioData.name} — Portfolio',
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
  final _aboutKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _venturesKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final targets = [
      NavTarget('About', _aboutKey),
      NavTarget('Experience', _experienceKey),
      NavTarget('Products', _venturesKey),
      NavTarget('Projects', _projectsKey),
      NavTarget('Contact', _contactKey),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SiteHeader(targets: targets),
            const HeroSection(),
            AboutSection(key: _aboutKey),
            ExperienceSection(key: _experienceKey),
            VenturesSection(key: _venturesKey),
            const SkillsSection(),
            ProjectsSection(key: _projectsKey),
            ContactSection(key: _contactKey),
          ],
        ),
      ),
    );
  }
}
