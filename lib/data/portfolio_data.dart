/// All editable portfolio content lives here.
/// Update the values below with your own details — nothing else in the
/// project needs to change.
class PortfolioData {
  // ---- Identity -----------------------------------------------------
  static const String name = 'Mohammad Mahdi Maghsodlu';
  static const String role =
      'Flutter & Dart Developer · Cross-Platform Apps · AI & LLM Integration';
  static const String location = 'Gorgan, Iran — working worldwide, remotely';
  static const String tagline =
      'Flutter developer with 3+ years shipping high-performance mobile apps '
      'for iOS and Android — and the backends behind them. I work at the '
      'intersection of design and functionality, and I spend the rest of my '
      'time building Rivium, a backend platform for modern apps.';

  static const String about =
      'I build cross-platform products end to end: polished Flutter apps on '
      'the front, Node.js and PostgreSQL underneath, AI and LLM features '
      'woven in where they actually help. Lately that means shipping '
      'production apps for clients in Iran and the US, and running the '
      'engineering side of two products of my own — Rivium and MinaSkill.';

  // ---- Links ----------------------------------------------------------
  static const String githubUrl = 'https://github.com/GodEye2004';
  static const String linkedinUrl =
      'https://www.linkedin.com/in/mohammad-mahdi-maghsodlu/';
  static const String email = 'mohammadg248015@gmail.com';

  // ---- Experience -----------------------------------------------------
  static const List<Experience> experience = [
    Experience(
      role: 'Flutter Developer & AI Engineer',
      company: 'Homeenger',
      period: 'Jul 2023 — Present',
      location: 'Gorgan, Iran',
      summary:
          'Mobile development for a real-estate platform, plus AI-powered '
          'features and LLM integrations on the engineering team.',
    ),
    Experience(
      role: 'Flutter Developer',
      company: 'Panda Ride, Inc',
      period: 'Jun 2025 — Jan 2026',
      location: 'Remote — United States (EST)',
      summary:
          'Delivered Flutter projects for American clients, collaborating '
          'remotely with a US-based team across the EST timezone.',
    ),
  ];

  // ---- Ventures -------------------------------------------------------
  static const List<Venture> ventures = [
    Venture(
      name: 'Rivium Technologies',
      url: 'https://rivium.co',
      role: 'Co-founder & CTO',
      description:
          'A backend-as-a-service platform — one API key and one dashboard '
          'for auth, push notifications, real-time chat, storage, feature '
          'flags, A/B testing and sync. Includes Rivium Trace, a self-hosted '
          'Sentry alternative with SDKs for 6+ platforms.',
      tags: ['BaaS', 'Observability', 'Flutter', 'Node.js'],
    ),
    Venture(
      name: 'MinaSkill',
      url: 'https://minaskill.com',
      role: 'Founder & Engineer',
      description:
          'The full e-learning and e-commerce platform for an 18-year-old '
          'sewing academy — course catalog, video delivery, lifetime-access '
          'purchases, OTP login and Iranian payment gateways.',
      tags: ['Next.js', 'Node.js', 'PostgreSQL', 'Docker'],
    ),
  ];

  // ---- Skills ---------------------------------------------------------
  static const List<SkillGroup> skillGroups = [
    SkillGroup(
      title: 'Mobile',
      skills: ['Flutter', 'Dart', 'iOS', 'Android'],
    ),
    SkillGroup(
      title: 'AI & LLM',
      skills: ['LLM Integration', 'Prompt Engineering', 'LLMOps', 'Python'],
    ),
    SkillGroup(
      title: 'Frontend',
      skills: ['Next.js', 'TypeScript'],
    ),
    SkillGroup(
      title: 'Backend',
      skills: ['Node.js', 'Express', 'Prisma'],
    ),
    SkillGroup(
      title: 'Data & DevOps',
      skills: ['PostgreSQL', 'Docker', 'CI/CD'],
    ),
  ];

  // ---- Projects -------------------------------------------------------
  static const List<Project> projects = [
    Project(
      title: 'Rivium Trace',
      description:
          'Error tracking, APM and crash reporting SDK for Flutter and the '
          'web — async error capture, native crash detection, source-map '
          'symbolication and gesture breadcrumbs.',
      tags: ['Flutter', 'Dart', 'Observability'],
      url: 'https://rivium.co/cloud/rivium-trace',
    ),
    Project(
      title: 'Filo',
      description:
          'Cross-platform Flutter app built with a monorepo architecture, '
          'shipping to web, Android and iOS from one codebase.',
      tags: ['Flutter', 'Monorepo'],
      url: 'https://github.com/GodEye2004/Filo',
    ),
    Project(
      title: 'Talksy',
      description:
          'End-to-end chat application — real-time messaging built from '
          'scratch, not just a WebSocket demo.',
      tags: ['Flutter', 'WebSocket', 'Chat'],
      url: 'https://github.com/GodEye2004/Talksy',
    ),
    Project(
      title: 'Agentic Real-Estate Platform',
      description:
          'Chat-based property search for a Persian real-estate market: a '
          'structured search form, live status updates and a '
          'WebSocket-powered backend driven by AI agents.',
      tags: ['Flutter', 'AI Agents', 'WebSocket'],
      url: 'https://github.com/GodEye2004/agentic-real-state-platform',
    ),
    Project(
      title: 'Push Notification Service',
      description:
          'TypeScript service for reliable push delivery — built around '
          'the reality that FCM alone is unreliable on many devices and '
          'networks.',
      tags: ['TypeScript', 'Node.js'],
      url: 'https://github.com/GodEye2004/push-notification',
    ),
    Project(
      title: 'Server Monitoring Panel',
      description:
          'A management panel for watching server health and services — '
          'the ops companion to the products above.',
      tags: ['TypeScript', 'DevOps'],
      url: 'https://github.com/GodEye2004/server-monitoring',
    ),
  ];
}

class Experience {
  final String role;
  final String company;
  final String period;
  final String location;
  final String summary;
  const Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.location,
    required this.summary,
  });
}

class Venture {
  final String name;
  final String url;
  final String role;
  final String description;
  final List<String> tags;
  const Venture({
    required this.name,
    required this.url,
    required this.role,
    required this.description,
    required this.tags,
  });
}

class SkillGroup {
  final String title;
  final List<String> skills;
  const SkillGroup({required this.title, required this.skills});
}

class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String url;
  const Project({
    required this.title,
    required this.description,
    required this.tags,
    required this.url,
  });
}
