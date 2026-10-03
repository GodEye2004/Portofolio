import 'package:flutter/material.dart';

/// All editable portfolio content lives here.
/// Update the values below with your own details — nothing else in the
/// project needs to change.
class PortfolioData {
  // ---- Identity -----------------------------------------------------
  static const String name = 'Mohammad Mahdi';
  static const String fullName = 'Mohammad Mahdi Maghsodlu';
  static const String eyebrow = "HI, I'M MOHAMMAD MAHDI";
  static const String headline =
      'I build software that\nsurvives production.';
  static const String intro =
      'Software Engineer building products, infrastructure, and developer '
      'tools. From mobile systems to backend architecture, observability, '
      'and AI.';
  static const String location = 'BASED IN IRAN / WORKING GLOBALLY';
  static const String mindset =
      'I care about real problems, clean architecture, and systems that '
      'scale.';
  static const String focusCode =
      "const focus = [\n  'build',\n  'improve',\n  'ship',\n  'repeat'\n];";

  // ---- Links ----------------------------------------------------------
  static const String githubUrl = 'https://github.com/GodEye2004';
  static const String linkedinUrl =
      'https://www.linkedin.com/in/mohammad-mahdi-maghsodlu/';
  static const String twitterUrl = '';
  static const String email = 'mohammadg248015@gmail.com';

  // ---- Selected work ----------------------------------------------------
  static const List<WorkItem> work = [
    WorkItem(
      index: '01 / 03',
      title: 'RIVIUM TRACE',
      tags: ['OBSERVABILITY', 'CRASH REPORTING', 'FLUTTER'],
      image: 'assets/images/work_rivium.png',
      description:
          'Rivium Trace is a production-ready observability and crash '
          'reporting platform for mobile and backend applications. Built '
          'for the Iranian developer ecosystem, with powerful debugging, '
          'alerting and performance insights.',
      url: 'https://rivium.co/cloud/rivium-trace',
    ),
    WorkItem(
      index: '02 / 03',
      title: 'HOMENGER',
      tags: ['AI REAL-ESTATE INTELLIGENCE', 'DATA PLATFORM'],
      image: 'assets/images/work_homeenger.png',
      description:
          'An AI-powered real-estate platform for Iran. From data scraping '
          'to intelligent recommendations, Homeenger helps users find '
          'better housing with AI agents and advanced data pipelines.',
      url: 'https://homeenger.com',
    ),
    WorkItem(
      index: '03 / 03',
      title: 'MINASHOPS',
      tags: ['COMMERCE', 'PAYMENTS', 'FULL-STACK'],
      image: 'assets/images/work_minaskill.png',
      description:
          'An online learning platform for sewing courses with modern '
          'e-commerce and payment infrastructure. Built with Next.js, '
          'Express, PostgreSQL and Prisma.',
      url: 'https://minaskill.com',
    ),
  ];

  // ---- Stats strip ----------------------------------------------------
  static const List<String> stats = [
    'SOFTWARE ENGINEER',
    'PRODUCT BUILDER',
    '8+ YEARS CODING',
    'PRODUCTION SYSTEMS',
  ];
  static const String statsRight = 'TECHNOLOGY / PRODUCTS / PEOPLE';

  // ---- Journey ----------------------------------------------------------
  static const List<JourneyStep> journey = [
    JourneyStep(year: '2018', title: 'Started programming', note: 'at age 13'),
    JourneyStep(
        year: '2021',
        title: 'Computer Engineering',
        note: 'Islamic Azad University'),
    JourneyStep(
        year: '2022', title: 'Head of Tech', note: 'Startup — Gorgan'),
    JourneyStep(
        year: '2023',
        title: 'International Company',
        note: 'Software Engineer'),
    JourneyStep(
        year: '2024',
        title: 'Science & Technology Park',
        note: '4 years'),
    JourneyStep(
        year: '2025',
        title: 'Current Role',
        note: 'Real Software Engineer'),
  ];

  // ---- What I care about ------------------------------------------------
  static const List<CareItem> cares = [
    CareItem(
      icon: Icons.verified_user_outlined,
      title: 'Reliability',
      description:
          'Systems that stay online, handle failure, and keep users safe.',
    ),
    CareItem(
      icon: Icons.code,
      title: 'Product Engineering',
      description:
          'Turning ideas into real products with clean, scalable code.',
    ),
    CareItem(
      icon: Icons.psychology_outlined,
      title: 'AI Systems',
      description:
          'Building intelligent systems that actually solve problems.',
    ),
    CareItem(
      icon: Icons.groups_outlined,
      title: 'Developer Experience',
      description:
          'Better tools, smoother workflows, happier developers.',
    ),
  ];
}

class WorkItem {
  final String index;
  final String title;
  final List<String> tags;
  final String image;
  final String description;
  final String url;
  const WorkItem({
    required this.index,
    required this.title,
    required this.tags,
    required this.image,
    required this.description,
    required this.url,
  });
}

class JourneyStep {
  final String year;
  final String title;
  final String note;
  const JourneyStep({
    required this.year,
    required this.title,
    required this.note,
  });
}

class CareItem {
  final IconData icon;
  final String title;
  final String description;
  const CareItem({
    required this.icon,
    required this.title,
    required this.description,
  });
}
