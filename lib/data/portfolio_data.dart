import 'package:flutter/material.dart';

/// All editable portfolio content lives here.
/// Update the values below with your own details — nothing else in the
/// project needs to change.
class PortfolioData {
  // ---- Identity -----------------------------------------------------
  static const String name = 'Mohammad Mahdi';
  static const String fullName = 'Mohammad Mahdi Maghsodlu';
  static const String eyebrow = "HI, I'M MOHAMMAD MAHDI";
  static const String headline = 'I build software that\nsurvives production.';
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
  static const String email = 'mohammadmaqsodlu@gmail.com';
  static const String phone = '989113690717';

  // ---- Selected work ----------------------------------------------------
  static const List<WorkItem> work = [
    WorkItem(
      index: '01 / 03',
      title: 'RIVIUM TRACE',
      tags: ['OBSERVABILITY', 'CRASH REPORTING', 'FLUTTER'],
      description:
          'Rivium Trace is a production-ready observability and crash '
          'reporting platform for mobile and backend applications. Built '
          'for the Iranian developer ecosystem, with powerful debugging, '
          'alerting and performance insights.',
      url: 'https://rivium.co/cloud/rivium-trace',
    ),
    // WorkItem(
    //   index: '02 / 03',
    //   title: 'HOMENGER',
    //   tags: ['AI REAL-ESTATE INTELLIGENCE', 'DATA PLATFORM'],
    //   description:
    //       'An AI-powered real-estate platform for Iran. From data scraping '
    //       'to intelligent recommendations, Homeenger helps users find '
    //       'better housing with AI agents and advanced data pipelines.',
    //   url: 'https://homeenger.com',
    // ),
    WorkItem(
      index: '03 / 03',
      title: 'MINASHOPS',
      tags: ['COMMERCE', 'PAYMENTS', 'FULL-STACK'],
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
    JourneyStep(
      period: '2018',
      title: 'The Beginning',
      organization: 'Personal Journey',
      category: 'START',
      description:
          'Started programming at the age of 13. '
          'What began as curiosity gradually became '
          'a long-term passion for software engineering.',
      highlights: [
        'First steps into programming',
        'Built early projects and experiments',
      ],
    ),

    JourneyStep(
      period: '2021',
      title: 'Computer Engineering',
      organization: 'Islamic Azad University',
      category: 'EDUCATION',
      description:
          'Started my academic journey in Computer '
          'Engineering while continuing to deepen my practical '
          'software skills and product thinking.',
      highlights: [
        'Computer Engineering studies',
        'Connecting theory with real-world building',
      ],
    ),

    JourneyStep(
      period: '2022',
      title: 'Software Engineer',
      organization: 'International Company',
      category: 'CAREER',
      description:
          'Entered an international professional '
          'environment and expanded my experience '
          'in building software systems.',
      highlights: [
        'Professional engineering experience',
        'Working with production software',
      ],
    ),

    JourneyStep(
      period: '2023',
      title: 'Head of Technology',
      organization: 'Startup · Gorgan',
      category: 'LEADERSHIP',
      description:
          'Moved into a technical leadership position, '
          'taking responsibility for technical direction '
          'and engineering decisions.',
      highlights: [
        'Technical decision-making',
        'Software architecture',
        'Startup technology development',
      ],
    ),

    JourneyStep(
      period: '2021–2025',
      title: 'Technology & Innovation',
      organization: 'Science & Technology Park',
      category: 'EXPERIENCE',
      description:
          'Four years of professional experience '
          'in a technology-focused environment.',
      highlights: [
        'Professional software development',
        'Continuous technical growth',
      ],
    ),

    JourneyStep(
      period: '2025–Present',
      title: 'Product Engineering & AI Systems',
      organization: 'Rivium  | Personal Products',
      category: 'ENGINEERING',
      description:
          'Building production-grade products across product strategy, '
          'backend systems, observability, deployment, and AI-powered user experiences.',
      technologies: [
        'Flutter',
        'Dart',
        'TypeScript',
        'Python',
        'Docker',
        'AI & LLMs',
      ],
      highlights: [
        'End-to-end product development',
        'Reliability and observability',
        'Technical ownership and product thinking',
        'Shipping AI-driven experiences',
      ],
    ),
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
      description: 'Building intelligent systems that actually solve problems.',
    ),
    CareItem(
      icon: Icons.groups_outlined,
      title: 'Developer Experience',
      description: 'Better tools, smoother workflows, happier developers.',
    ),
  ];
}

class WorkItem {
  final String index;
  final String title;
  final List<String> tags;
  final String description;
  final String url;
  const WorkItem({
    required this.index,
    required this.title,
    required this.tags,
    required this.description,
    required this.url,
  });
}

class JourneyStep {
  final String period;
  final String year;
  final String note;
  final String title;
  final String organization;
  final String description;
  final List<String> highlights;
  final List<String> technologies;
  final String category;

  const JourneyStep({
    required this.period,
    required this.title,
    required this.organization,
    required this.description,
    this.highlights = const [],
    this.technologies = const [],
    required this.category,
    String? year,
    String? note,
  }) : year = year ?? period,
       note = note ?? description;
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
