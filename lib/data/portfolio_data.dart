/// All editable portfolio content lives here.
/// Update the values below with your own details — nothing else in the
/// project needs to change.
class PortfolioData {
  // ---- Identity -----------------------------------------------------
  static const String name = 'Mohammad Mahdi Maghsodlu';
  static const String role = 'SoftwareEngineer & Mobile Developer';
  static const String tagline =
      'I build fast, reliable products across web, backend and mobile — '
      'from Next.js interfaces to Flutter apps backed by Node.js and '
      'PostgreSQL, shipped with Docker.';

  // ---- Links ----------------------------------------------------------
  // TODO: replace with your exact GitHub username — the link you sent
  // ("https://github.com/") was incomplete, so this is a placeholder.
  static const String githubUrl = 'https://github.com/yourusername';
  static const String linkedinUrl =
      'https://www.linkedin.com/in/mohammad-mahdi-maghsodlu/';
  static const String email = 'you@example.com';

  // ---- Skills ---------------------------------------------------------
  static const List<SkillGroup> skillGroups = [
    SkillGroup(title: 'Frontend', skills: ['Next.js', 'TypeScript']),
    SkillGroup(title: 'Backend', skills: ['Node.js', 'Express', 'Prisma']),
    SkillGroup(title: 'Database', skills: ['PostgreSQL']),
    SkillGroup(title: 'Mobile', skills: ['Flutter', 'Dart']),
    SkillGroup(title: 'DevOps', skills: ['Docker', 'Deployment / CI-CD']),
  ];

  // ---- Projects ---------------------------------------------------------
  // Replace the placeholder ones with your real projects and links.
  static const List<Project> projects = [
    Project(
      title: 'Divar Smart Search (Flutter)',
      description:
          'Mobile version of a Persian real-estate search tool: chat-based '
          'search, a structured search form, live status updates and a '
          'WebSocket-powered backend for real-time results.',
      tags: ['Flutter', 'Dart', 'WebSocket'],
      url: '', // add a repo or store link when ready
    ),
    Project(
      title: 'Add your project title',
      description:
          'Short, concrete description: what it does, the problem it '
          'solves, and your role in building it.',
      tags: ['Next.js', 'Node.js', 'PostgreSQL'],
      url: '',
    ),
    Project(
      title: 'Add another project title',
      description:
          'Another short description — keep each one to 2-3 sentences '
          'so the card stays easy to scan.',
      tags: ['Docker', 'Prisma', 'Express'],
      url: '',
    ),
  ];
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
