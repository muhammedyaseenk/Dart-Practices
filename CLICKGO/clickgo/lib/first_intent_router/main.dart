// lib/main.dart
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const FirstIntentApp());
}

class FirstIntentApp extends StatelessWidget {
  const FirstIntentApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF166534),
      brightness: Brightness.light,
    );
    return MaterialApp(
      title: 'First-Intent Router',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: colorScheme,
        scaffoldBackgroundColor: const Color(0xFFF5F6F3),
      ),
      home: const HomeScreen(),
    );
  }
}

/// Responsive helper (no magic numbers)
class Responsive {
  final double width;
  final double height;
  Responsive(BuildContext context)
      : width = MediaQuery.of(context).size.width,
        height = MediaQuery.of(context).size.height;

  // Breakpoints
  bool get isMobile => width < 640;
  bool get isTablet => width >= 640 && width < 1024;
  bool get isDesktop => width >= 1024;

  // Base reference (typical phone width)
  static const double _baseWidth = 390;

  // Scale factor (soft growth, clamped)
  double get scale {
    final raw = sqrt(width / _baseWidth);
    return raw.clamp(0.75, 1.6);
  }

  // Slightly gentler scale for text
  double get textScale => (scale * 0.98).clamp(0.8, 1.4);

  // 8pt base spacing token times scale
  double spacing(double units) => units * (8.0 * scale);

  // Font size helper
  double font(double base) => (base * textScale).clamp(10.0, 96.0);

  // Icon size helper
  double icon(double base) => (base * scale).clamp(12.0, 128.0);

  // Grid columns
  int columns() {
    if (isDesktop) return 4;
    if (isTablet) return 3;
    return 2;
  }

  // Max content width to center layout on large screens
  double maxContentWidth() {
    if (isDesktop) return min(width * 0.85, 1200);
    if (isTablet) return min(width * 0.92, 1000);
    return width - spacing(1); // small gutter on mobile
  }
}

/// ---------- HOME SCREEN ----------
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String language = 'EN';

  @override
  Widget build(BuildContext context) {
    final R = Responsive(context);
    final cols = R.columns();
    final horizontal = R.isDesktop
        ? R.spacing(4)
        : R.isTablet
            ? R.spacing(3)
            : R.spacing(2);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header uses spaceBetween to avoid double Spacer issues
            HeaderBar(
              language: language,
              onLanguageChanged: (v) => setState(() => language = v),
            ),

            // Content
            Expanded(
              child: LayoutBuilder(
                builder: (c, constraints) {
                  final contentWidth =
                      min(constraints.maxWidth, R.maxContentWidth());
                  final crossGap = R.spacing(0.5);
                  final totalGaps = (cols - 1) * crossGap;
                  final tileWidth = (contentWidth - totalGaps) / cols;

                  // conservative tile height estimate:
                  final iconSz = R.icon(34); // icon
                  final labelFont = R.font(12);
                  final internalVerticalPadding =
                      R.spacing(1.25) * 2; // top + bottom
                  final estimatedLabelHeightTwoLines = (labelFont * 1.15) * 2;
                  // FIX: Increased safetyPx to prevent minor vertical overflows
                  final safetyPx = max(
                    10.0, // increased from 8.0
                    R.spacing(1.0), // increased from 0.6
                  ); // buffer so we never under-allocate
                  final estimatedTileHeight = iconSz +
                      R.spacing(0.5) +
                      estimatedLabelHeightTwoLines +
                      internalVerticalPadding +
                      safetyPx;

                  // ensure min tile height (touch-target friendly)
                  final minTileHeight = max(
                    estimatedTileHeight,
                    72.0 * (R.scale / 1.0),
                  ); // ~72 scaled minimum

                  // final childAspectRatio
                  final childAspect = max(0.45, tileWidth / minTileHeight);

                  return SingleChildScrollView(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: contentWidth),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            horizontal,
                            R.spacing(2),
                            horizontal,
                            R.spacing(3),
                          ),
                          child: Column(
                            crossAxisAlignment: R.isDesktop
                                ? CrossAxisAlignment.center
                                : CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: R.spacing(0.5)),
                              Text(
                                language == 'EN' ? 'Welcome.' : 'സ്വാഗതം.',
                                style: TextStyle(
                                  color: Colors.green.shade700,
                                  fontSize: R.font(18),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: R.spacing(0.4)),
                              Text(
                                language == 'EN'
                                    ? 'How Can We Connect You Today?'
                                    : 'ഇന്ന് നിങ്ങളെ എങ്ങനെ ബന്ധിപ്പിക്കാം?',
                                textAlign: R.isDesktop
                                    ? TextAlign.center
                                    : TextAlign.start,
                                style: TextStyle(
                                  fontSize: R.font(
                                    R.isDesktop
                                        ? 32
                                        : R.isTablet
                                            ? 26
                                            : 22,
                                  ),
                                  fontWeight: FontWeight.w800,
                                  height: 1.15,
                                ),
                              ),
                              SizedBox(
                                height: R.spacing(R.isDesktop ? 4 : 2.5),
                              ),
                              const SearchBarBig(),
                              SizedBox(
                                height: R.spacing(R.isDesktop ? 4 : 2.5),
                              ),

                              // Grid - aligned under the search bar (same content width)
                              GridView.count(
                                crossAxisCount: cols,
                                crossAxisSpacing: crossGap,
                                mainAxisSpacing: crossGap,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                childAspectRatio: childAspect,
                                children: [
                                  _tileWrapper(
                                    CategoryTile(
                                      // icon: Icons.home_outlined,
                                      icon: Icons.people_rounded,
                                      labelEN: 'People',
                                      labelML: 'ആൾക്കാർ',
                                      language: language,
                                    ),
                                    tileWidth,
                                    minTileHeight,
                                  ),
                                  _tileWrapper(
                                    CategoryTile(
                                      icon: Icons.home_sharp,
                                      labelEN: 'Rooms',
                                      labelML: 'റൂമുകൾ',
                                      language: language,
                                    ),
                                    tileWidth,
                                    minTileHeight,
                                  ),
                                  _tileWrapper(
                                    CategoryTile(
                                      icon: Icons.landscape_sharp,
                                      labelEN: 'Land',
                                      labelML: 'ഭൂമി',
                                      language: language,
                                    ),
                                    tileWidth,
                                    minTileHeight,
                                  ),
                                  _tileWrapper(
                                    CategoryTile(
                                      icon:
                                          Icons.miscellaneous_services_outlined,
                                      labelEN: 'Services',
                                      labelML: 'സേവനങ്ങൾ',
                                      language: language,
                                    ),
                                    tileWidth,
                                    minTileHeight,
                                  ),
                                  _tileWrapper(
                                    CategoryTile(
                                      icon: Icons.work_outline,
                                      labelEN: 'Jobs',
                                      labelML: 'ജോലികൾ',
                                      language: language,
                                    ),
                                    tileWidth,
                                    minTileHeight,
                                  ),
                                  _tileWrapper(
                                    CategoryTile(
                                      icon: Icons.menu_book_outlined,
                                      labelEN: 'Articles',
                                      labelML: 'ലേഖനങ്ങൾ',
                                      language: language,
                                    ),
                                    tileWidth,
                                    minTileHeight,
                                  ),
                                ],
                              ),

                              SizedBox(height: R.spacing(2)),
                              Align(
                                alignment: R.isDesktop
                                    ? Alignment.center
                                    : Alignment.centerLeft,
                                child: TextButton.icon(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.chevron_right,
                                    size: R.icon(18),
                                  ),
                                  label: Text(
                                    language == 'EN'
                                        ? 'Browse All Categories'
                                        : 'എല്ലാ വിഭാഗങ്ങളും കാണുക',
                                    style: TextStyle(fontSize: R.font(14)),
                                  ),
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.green.shade800,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: R.spacing(1),
                                      vertical: R.spacing(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: R.spacing(2)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Wraps tile in AspectRatio + IntrinsicHeight to avoid overflow and preserve stable heights.
  Widget _tileWrapper(Widget tile, double tileWidth, double tileMinHeight) {
    final desiredAR = max(0.45, tileWidth / tileMinHeight);
    return LayoutBuilder(
      builder: (context, bc) {
        return AspectRatio(
          aspectRatio: desiredAR,
          child: IntrinsicHeight(child: tile),
        );
      },
    );
  }
}

/// ---------- HEADER ----------
class HeaderBar extends StatelessWidget {
  final String language;
  final ValueChanged<String> onLanguageChanged;

  const HeaderBar({
    super.key,
    required this.language,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    final R = Responsive(context);
    final padding = EdgeInsets.symmetric(
      horizontal: R.isDesktop ? R.spacing(6) : R.spacing(2),
      vertical: R.spacing(1),
    );

    // Use spaceBetween to keep left content and right actions aligned and predictable
    return Container(
      color: const Color(0xFFEFF3EC),
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: R.icon(24),
                  height: R.icon(24),
                  decoration: BoxDecoration(
                    color: Colors.green.shade700,
                    borderRadius: BorderRadius.circular(R.spacing(0.5)),
                  ),
                ),
                SizedBox(width: R.spacing(1)),
                Expanded(
                  child: Text(
                    'First-Intent Router',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: R.font(16),
                      color: Colors.grey.shade900,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: () => onLanguageChanged(language == 'EN' ? 'ML' : 'EN'),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: R.spacing(1),
                    vertical: R.spacing(0.5),
                  ),
                  child: Row(
                    children: [
                      Text(
                        language,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: R.font(14),
                        ),
                      ),
                      SizedBox(width: R.spacing(0.5)),
                      Icon(Icons.keyboard_arrow_down_rounded,
                          size: R.icon(16)),
                    ],
                  ),
                ),
              ),
              SizedBox(width: R.spacing(0.5)),
              CircleAvatar(
                radius: R.icon(12),
                backgroundColor: Colors.green.shade100,
                child: Icon(
                  Icons.person,
                  color: Colors.green.shade800,
                  size: R.icon(14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// ---------- SEARCH BAR ----------
class SearchBarBig extends StatefulWidget {
  const SearchBarBig({super.key});
  @override
  State<SearchBarBig> createState() => _SearchBarBigState();
}

class _SearchBarBigState extends State<SearchBarBig> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final R = Responsive(context);
    final radius = BorderRadius.circular(R.spacing(1));
    return Material(
      elevation: 0,
      color: Colors.transparent,
      child: Container(
        height: max(R.spacing(4), R.spacing(6)), // fully dynamic height
        decoration: BoxDecoration(
          borderRadius: radius,
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE4E7E1)),
        ),
        padding: EdgeInsets.symmetric(horizontal: R.spacing(1)),
        child: Row(
          children: [
            SizedBox(width: R.spacing(0.5)),
            Icon(
              Icons.search,
              color: const Color(0xFF6B7280),
              size: R.icon(20),
            ),
            SizedBox(width: R.spacing(0.5)),
            Expanded(
              child: TextField(
                controller: controller,
                style: TextStyle(fontSize: R.font(14)),
                decoration: InputDecoration(
                  hintText: 'Search people, rooms, land, and more…',
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(vertical: R.spacing(0.5)),
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.mic_none_rounded, size: R.icon(20)),
              tooltip: 'Voice Search',
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------- CATEGORY TILE ----------
class CategoryTile extends StatefulWidget {
  final IconData icon;
  final String labelEN;
  final String labelML;
  final String language;
  const CategoryTile({
    super.key,
    required this.icon,
    required this.labelEN,
    required this.labelML,
    required this.language,
  });

  @override
  State<CategoryTile> createState() => _CategoryTileState();
}

class _CategoryTileState extends State<CategoryTile> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    final R = Responsive(context);
    final label = widget.language == 'EN' ? widget.labelEN : widget.labelML;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        padding: EdgeInsets.symmetric(
          horizontal: R.spacing(1.75),
          vertical: R.spacing(1.25),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(R.spacing(1.5)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _hover
                ? [const Color(0xFF0F5132), const Color(0xFF145A3A)]
                : [const Color(0xFF134E3A), const Color(0xFF1B5E3B)],
          ),
          boxShadow: _hover
              ? [
                  BoxShadow(
                    color: const Color(0xFF134E3A).withOpacity(0.22),
                    blurRadius: R.spacing(1.5),
                    offset: Offset(0, R.spacing(1)),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.06),
                    blurRadius: R.spacing(1.25),
                    offset: Offset(0, R.spacing(0.5)),
                  ),
                ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, size: R.icon(30), color: Colors.white),
            SizedBox(height: R.spacing(0.5)),
            Text(
              label.toUpperCase(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.6 * R.scale, // now dynamic
                fontSize: R.font(
                  R.isDesktop
                      ? 14
                      : R.isTablet
                          ? 13
                          : 12,
                ),
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
