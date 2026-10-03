import 'package:flutter/material.dart';
import 'data/portfolio_data.dart';
import 'theme/app_theme.dart';
import 'widgets/hero_section.dart';
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
      theme: AppTheme.dark,
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroSection(),
            SkillsSection(),
            ProjectsSection(),
            ContactSection(),
          ],
        ),
      ),
    );
  }
}
