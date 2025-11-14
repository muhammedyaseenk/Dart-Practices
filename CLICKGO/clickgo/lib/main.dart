// lib/main.dart
import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(const FirstIntentRouterApp());

/// ---------------------- Design Tokens / Theme ----------------------
class AppTokens {
  static const double s1 = 8;
  static const double s2 = 12;
  static const double s3 = 16;
  static const double s4 = 20;
  static const double s5 = 24;
  static const double s6 = 32;

  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;

  static const double elevationLow = 6;
  static const double elevationHover = 14;
}

final ColorScheme _darkColorScheme = ColorScheme.dark(
  primary: const Color(0xFF00C774),
  onPrimary: Colors.white,
  surface: const Color(0xFF1C1C1C),
  background: const Color(0xFF121212),
  onSurface: Colors.white,
);

ThemeData _buildTheme() {
  return ThemeData.from(colorScheme: _darkColorScheme).copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: _darkColorScheme.background,
    textTheme: const TextTheme(
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white70),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: InputBorder.none,
      hintStyle: TextStyle(color: Colors.white54),
    ),
  );
}

/// ---------------------- Shared model ----------------------
class CardModel {
  final String initials;
  final String name;
  final String type;
  final String status;
  final Color color;
  CardModel(this.initials, this.name, this.type, this.status, this.color);
}

/// ---------------------- App Root ----------------------
class FirstIntentRouterApp extends StatelessWidget {
  const FirstIntentRouterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First-Intent Router (v2)',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(),
      home: const MainShell(),
    );
  }
}

/// ---------------------- Main Shell ----------------------
// MainShell now owns selected user state and opens the chat on user tap.
class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  bool _chatOpen = false;
  CardModel? _selectedUser;

  void _openChatFor(CardModel user) {
    setState(() {
      _selectedUser = user;
      _chatOpen = true;
    });
  }

  void _closeChat() => setState(() => _chatOpen = false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AppSidebar(onBadgeTap: () {
            // If no user selected yet, open chat without a selected user.
            if (_selectedUser == null) {
              setState(() => _chatOpen = true);
            } else {
              setState(() => _chatOpen = true);
            }
          }),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const AppHeader(),
                // pass the onUserTap callback into DashboardContent
                Expanded(child: DashboardContent(onUserTap: _openChatFor)),
              ],
            ),
          ),
          // ChatPanel receives the currently selected user and the open flag.
          ChatPanel(open: _chatOpen, selectedUser: _selectedUser, onClose: _closeChat),
        ],
      ),
    );
  }
}

/// ---------------------- Sidebar ----------------------
class AppSidebar extends StatelessWidget {
  final VoidCallback onBadgeTap;
  const AppSidebar({super.key, required this.onBadgeTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      color: const Color(0xFF141414),
      padding: const EdgeInsets.symmetric(vertical: AppTokens.s3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppTokens.s4),
            child: Row(
              children: const [
                Icon(Icons.eco, color: Color(0xFF00C774)),
                SizedBox(width: AppTokens.s2),
                Text('First-Intent Router',
                    style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: AppTokens.s4),
          _SidebarNavItem(icon: Icons.grid_view, label: 'Dashboard', active: true),
          _SidebarNavItem(icon: Icons.people_alt_outlined, label: 'People & Services'),
          _SidebarNavItem(icon: Icons.chat_bubble_outline, label: 'Conversations'),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppTokens.s4, vertical: AppTokens.s3),
            child: GestureDetector(
              onTap: onBadgeTap,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFF0E7A48),
                        borderRadius: BorderRadius.circular(AppTokens.radiusMd),
                      ),
                      alignment: Alignment.center,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shield, color: Colors.white, size: 16),
                          SizedBox(width: AppTokens.s2),
                          Text('RAISE A NEED REQUIRMENTS AMONG THE GROUP SEND THE REQUIRMENT TO MULTIPLE PEOPLE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarNavItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool active;
  const _SidebarNavItem({required this.icon, required this.label, this.active = false});

  @override
  State<_SidebarNavItem> createState() => _SidebarNavItemState();
}

class _SidebarNavItemState extends State<_SidebarNavItem> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final bg = widget.active
        ? const Color(0xFF1F461F)
        : (_hover ? Colors.white12 : Colors.transparent);
    final iconColor = widget.active ? const Color(0xFF00C774) : Colors.white70;
    final textColor = widget.active ? const Color(0xFF00C774) : Colors.white70;

    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(AppTokens.radiusSm)),
        child: ListTile(
          leading: Icon(widget.icon, color: iconColor),
          title: Text(widget.label, style: TextStyle(color: textColor, fontWeight: widget.active ? FontWeight.w700 : FontWeight.w500)),
          dense: true,
          horizontalTitleGap: 6,
          onTap: () {},
        ),
      ),
    );
  }
}

/// ---------------------- Header ----------------------
class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: AppTokens.s5),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1B1B),
        border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.2))),
      ),
      child: Row(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: const Color(0xFF242424),
                borderRadius: BorderRadius.circular(AppTokens.radiusMd),
              ),
              padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Colors.white54),
                  SizedBox(width: AppTokens.s3),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration.collapsed(hintText: 'Search people or services...'),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Row(
            children: [
                const Icon(Icons.shield, color: Colors.white, size: 16),
              const SizedBox(width: AppTokens.s2),
              AnimatedHoverButton(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3, vertical: 10),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00C774),
                    borderRadius: BorderRadius.circular(AppTokens.radiusMd),
                  ),
                  child: const Text('NETWORK SECURE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: AppTokens.s4),
              const CircleAvatar(backgroundColor: Colors.grey, child: Icon(Icons.person, color: Colors.white)),
              const SizedBox(width: AppTokens.s2),
              const Text('Alex Chen', style: TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ],
      ),
    );
  }
}

/// ---------------------- Dashboard Content ----------------------
// Accepts an onUserTap callback so MainShell can control chat state
class DashboardContent extends StatefulWidget {
  final ValueChanged<CardModel>? onUserTap;
  const DashboardContent({super.key, this.onUserTap});

  @override
  State<DashboardContent> createState() => _DashboardContentState();
}

class _DashboardContentState extends State<DashboardContent> {
  final List<CardModel> _allCards = [
    CardModel('GC', 'GA Cianne', 'Person', 'ONLINE', Colors.green),
    CardModel('AB', 'AA Briscola', 'Person', 'WORKING', Colors.orange),
    CardModel('WW', 'Wes Wang', 'Service', 'WEB DESIGN', Colors.orange.shade700),
    CardModel('AG', 'AA Grayson', 'Person', 'OFFLINE', Colors.grey),
    CardModel('SJ', 'Steel Jiang', 'Service', 'STREAMING', Colors.blue),
    CardModel('LD', 'Lead Delivery', 'Service', 'REQUEST', Colors.grey),
    CardModel('AE', 'AA Etienne', 'Service', 'ACTIVE', Colors.green),
    CardModel('AG2', 'AA Gomez', 'Person', 'IDLE', Colors.grey),
    for (var i = 0; i < 12; i++) CardModel('U$i', 'User $i', 'Person', i % 3 == 0 ? 'ACTIVE' : 'IDLE', i % 3 == 0 ? Colors.green : Colors.grey),
  ];

  String _filter = 'All';
  final ScrollController _gridScroll = ScrollController();
  bool _loadingMore = false;
  int _itemsToShow = 8;

  @override
  void initState() {
    super.initState();
    _gridScroll.addListener(_onScroll);
  }

  @override
  void dispose() {
    _gridScroll.removeListener(_onScroll);
    _gridScroll.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_gridScroll.position.pixels >= _gridScroll.position.maxScrollExtent - 120 && !_loadingMore && _itemsToShow < _allCards.length) {
      _loadMore();
    }
  }

  Future<void> _loadMore() async {
    setState(() => _loadingMore = true);
    await Future<void>.delayed(const Duration(milliseconds: 450));
    setState(() {
      _itemsToShow = (_itemsToShow + 6).clamp(0, _allCards.length);
      _loadingMore = false;
    });
  }

  List<CardModel> get _visibleCards {
    final list = _filter == 'All'
        ? _allCards
        : _allCards.where((c) => c.status.toLowerCase().contains(_filter.toLowerCase())).toList();
    return list.take(_itemsToShow).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _darkColorScheme.surface,
      padding: const EdgeInsets.symmetric(horizontal: AppTokens.s5, vertical: AppTokens.s4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('Dashboard', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
              const SizedBox(width: AppTokens.s4),
              Wrap(
                spacing: AppTokens.s2,
                children: [
                  _FilterChip(label: 'All', active: _filter == 'All', onTap: () => setState(() => _filter = 'All')),
                  _FilterChip(label: 'Active', active: _filter == 'Active', onTap: () => setState(() => _filter = 'Active')),
                  _FilterChip(label: 'Working', active: _filter == 'Working', onTap: () => setState(() => _filter = 'Working')),
                  _FilterChip(label: 'Streaming', active: _filter == 'Streaming', onTap: () => setState(() => _filter = 'Streaming')),
                  _FilterChip(label: 'Offline', active: _filter == 'Offline', onTap: () => setState(() => _filter = 'Offline')),
                ],
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list), color: Colors.white70),
              IconButton(onPressed: () {}, icon: const Icon(Icons.sort), color: Colors.white70),
            ],
          ),
          const SizedBox(height: AppTokens.s4),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              final double available = constraints.maxWidth;
              final crossCount = (available ~/ 300).clamp(2, 5);
              final items = _visibleCards;
              return CustomScrollView(
                controller: _gridScroll,
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: AppTokens.s4),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final card = items[index];
                          return AnimatedHoverCard(
                            child: PersonServiceCard(
                              model: card,
                              // when a user card is tapped, call parent callback
                              onTap: () => widget.onUserTap?.call(card),
                            ),
                          );
                        },
                        childCount: items.length,
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossCount,
                        crossAxisSpacing: AppTokens.s3,
                        mainAxisSpacing: AppTokens.s3,
                        childAspectRatio: 1.05,
                      ),
                    ),
                  ),
                  if (_loadingMore)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: AppTokens.s4),
                        child: Center(child: Row(mainAxisSize: MainAxisSize.min, children: const [CircularProgressIndicator(), SizedBox(width: 12), Text('Loading...')])),
                      ),
                    ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _FilterChip({required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3, vertical: 8),
        decoration: BoxDecoration(
          color: active ? Colors.white12 : Colors.transparent,
          borderRadius: BorderRadius.circular(AppTokens.radiusSm),
          border: active ? Border.all(color: Colors.white12) : null,
        ),
        child: Text(label, style: TextStyle(color: active ? Colors.white : Colors.white70, fontWeight: active ? FontWeight.w700 : FontWeight.w500)),
      ),
    );
  }
}

/// ---------------------- Person/Service Card ----------------------
class PersonServiceCard extends StatelessWidget {
  final CardModel model;
  final VoidCallback? onTap;
  const PersonServiceCard({required this.model, this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final chipBg = model.color.withOpacity(0.18);
    final chipTextColor = model.color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    return GestureDetector(
      onTap: onTap, // open chat for this user
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(AppTokens.s3),
        decoration: BoxDecoration(
          color: const Color(0xFF222222),
          borderRadius: BorderRadius.circular(AppTokens.radiusLg),
          border: Border.all(color: Colors.black54),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 20, backgroundColor: Colors.grey.shade700, child: Text(model.initials, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                const SizedBox(width: AppTokens.s3),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(model.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(model.type, style: TextStyle(color: Colors.white70, fontSize: 12)),
                  ]),
                ),
                const SizedBox(width: 6),
                Tooltip(message: 'More options', child: Icon(Icons.more_vert, color: Colors.white54)),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3, vertical: 8),
                    decoration: BoxDecoration(color: chipBg, borderRadius: BorderRadius.circular(AppTokens.radiusSm)),
                    child: Text(model.status, style: TextStyle(color: chipTextColor, fontWeight: FontWeight.w700, fontSize: 12)),
                  ),
                ),
                const SizedBox(width: AppTokens.s3),
                Icon(Icons.chevron_right, color: Colors.white24),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// ---------------------- Hover & Micro Animations ----------------------
class AnimatedHoverCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  const AnimatedHoverCard({required this.child, this.onTap, super.key});

  @override
  State<AnimatedHoverCard> createState() => _AnimatedHoverCardState();
}

class _AnimatedHoverCardState extends State<AnimatedHoverCard> {
  bool _hover = false;
  bool _pressed = false;

  void _setHover(bool v) => setState(() => _hover = v);
  void _setPressed(bool v) => setState(() => _pressed = v);

  @override
  Widget build(BuildContext context) {
    final lift = _hover ? -6.0 : 0.0;
    final scale = _hover ? 1.01 : 1.0;
    final blur = _hover ? AppTokens.elevationHover : AppTokens.elevationLow;
    final opacity = _pressed ? 0.95 : 1.0;

    return MouseRegion(
      onEnter: (_) => _setHover(true),
      onExit: (_) => _setHover(false),
      child: GestureDetector(
        onTapDown: (_) => _setPressed(true),
        onTapUp: (_) => _setPressed(false),
        onTapCancel: () => _setPressed(false),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          transform: Matrix4.identity()..translate(0.0, lift)..scale(scale),
          decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.35), blurRadius: blur, offset: const Offset(0, 6))]),
          child: Opacity(opacity: opacity, child: widget.child),
        ),
      ),
    );
  }
}

class AnimatedHoverButton extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  const AnimatedHoverButton({required this.child, this.onTap, super.key});

  @override
  State<AnimatedHoverButton> createState() => _AnimatedHoverButtonState();
}

class _AnimatedHoverButtonState extends State<AnimatedHoverButton> {
  bool _hover = false;
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    final scale = _hover ? 1.02 : 1.0;
    final opacity = _pressed ? 0.9 : 1.0;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 140),
          transform: Matrix4.identity()..scale(scale),
          child: Opacity(opacity: opacity, child: widget.child),
        ),
      ),
    );
  }
}

/// ---------------------- Chat Panel ----------------------
// Accepts `open` flag and `selectedUser`. When selected user changes, header updates.
// When opened it autofocuses the input.
class ChatPanel extends StatefulWidget {
  final bool open;
  final CardModel? selectedUser;
  final VoidCallback? onClose;
  const ChatPanel({super.key, required this.open, this.selectedUser, this.onClose});

  @override
  State<ChatPanel> createState() => _ChatPanelState();
}

class _ChatPanelState extends State<ChatPanel> {
  final List<_Message> _messages = [
    _Message(sender: 'Alex Chen', text: 'Hey! Have you reviewed the latest update?', time: '10:45 AM', mine: false),
    _Message(sender: 'You', text: 'Yes, looks great! Testing remaining parts.', time: '10:46 AM', mine: true),
    _Message(sender: 'Alex Chen', text: 'Cool, let’s finalize by evening.', time: '10:47 AM', mine: false),
  ];

  final TextEditingController _ctrl = TextEditingController();
  final ScrollController _scroll = ScrollController();
  final FocusNode _focusNode = FocusNode();
  bool _typing = false;

  void _sendMessage() {
    final t = _ctrl.text.trim();
    if (t.isEmpty) return;
    setState(() {
      _messages.add(_Message(sender: 'You', text: t, time: _now(), mine: true));
      _ctrl.clear();
      _typing = false;
    });
    Timer(const Duration(milliseconds: 160), () {
      if (_scroll.hasClients) {
        _scroll.animateTo(_scroll.position.maxScrollExtent + 100, duration: const Duration(milliseconds: 280), curve: Curves.easeOut);
      }
    });
  }

  String _now() {
    final now = DateTime.now();
    final hour = now.hour == 0 ? 12 : (now.hour > 12 ? now.hour - 12 : now.hour);
    final minute = now.minute.toString().padLeft(2, '0');
    final ampm = now.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $ampm';
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _ctrl.dispose();
    _scroll.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ChatPanel oldWidget) {
    super.didUpdateWidget(oldWidget);

    // When panel opens, focus input (small delay so animation finishes)
    if (!oldWidget.open && widget.open) {
      Future.delayed(const Duration(milliseconds: 180), () {
        if (mounted) _focusNode.requestFocus();
      });
    }

    // If selected user changed while open, keep focus (and optionally you could
    // load that user's message history here).
    if (oldWidget.selectedUser?.name != widget.selectedUser?.name && widget.open) {
      // you can clear or replace _messages here to show per-user history.
      // For demo, we keep messages but update header; in real app you'd fetch messages.
      if (mounted) _focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final targetWidth = widget.open ? 380.0 : 0.0;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeInOut,
      width: targetWidth,
      child: ClipRect(
        child: Offstage(
          offstage: !widget.open,
          child: Container(
            width: 380,
            color: const Color(0xFF151515),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppTokens.s4, vertical: AppTokens.s3),
                  child: Row(
                    children: [
                      // show selected user name if present
                      Text(widget.selectedUser?.name ?? 'Conversation', style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                      const SizedBox(width: AppTokens.s3),
                      const Chip(label: Text('3'), backgroundColor: Colors.white10),
                      const Spacer(),
                      IconButton(
                        onPressed: widget.onClose,
                        icon: const Icon(Icons.close, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1, color: Colors.black26),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3, vertical: AppTokens.s3),
                    child: ListView.builder(
                      controller: _scroll,
                      itemCount: _messages.length + (_typing ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (_typing && index == _messages.length) return _TypingIndicator();
                        final m = _messages[index];
                        final bool lastFromSame = index > 0 && _messages[index - 1].sender == m.sender;
                        return Padding(
                          padding: EdgeInsets.only(top: lastFromSame ? 4 : 12),
                          child: HoverChatBubble(message: m),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(AppTokens.s3),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3),
                          decoration: BoxDecoration(color: const Color(0xFF232323), borderRadius: BorderRadius.circular(AppTokens.radiusMd)),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  focusNode: _focusNode,
                                  controller: _ctrl,
                                  decoration: const InputDecoration.collapsed(hintText: 'Type your message...'),
                                  style: const TextStyle(color: Colors.white),
                                  onChanged: (v) => setState(() => _typing = v.trim().isNotEmpty),
                                  onSubmitted: (_) => _sendMessage(),
                                ),
                              ),
                              IconButton(onPressed: () {}, icon: const Icon(Icons.attach_file, color: Colors.white54)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: AppTokens.s2),
                      AnimatedHoverButton(
                        onTap: _typing ? _sendMessage : null,
                        child: Container(
                          decoration: BoxDecoration(color: _typing ? const Color(0xFF00C774) : Colors.white12, borderRadius: BorderRadius.circular(AppTokens.radiusSm)),
                          padding: const EdgeInsets.all(12),
                          child: Icon(Icons.send, color: _typing ? Colors.white : Colors.white70),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// small chat UI helpers
class _Message {
  final String sender;
  final String text;
  final String time;
  final bool mine;
  const _Message({required this.sender, required this.text, required this.time, required this.mine});
}

class HoverChatBubble extends StatefulWidget {
  final _Message message;
  const HoverChatBubble({required this.message, super.key});

  @override
  State<HoverChatBubble> createState() => _HoverChatBubbleState();
}

class _HoverChatBubbleState extends State<HoverChatBubble> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    final isMine = widget.message.mine;
    final bg = isMine ? const Color(0xFF1B4F2F) : const Color(0xFF262626);
    final align = isMine ? Alignment.centerRight : Alignment.centerLeft;
    final cross = isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final textColor = Colors.white;
    final lift = _hover ? -4.0 : 0.0;
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        transform: Matrix4.identity()..translate(0.0, lift),
        child: Align(
          alignment: align,
          child: Container(
            constraints: const BoxConstraints(maxWidth: 280),
            decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: cross,
              children: [
                if (!isMine) Text(widget.message.sender, style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w700)),
                const SizedBox(height: 6),
                Text(widget.message.text, style: TextStyle(color: textColor)),
                const SizedBox(height: 8),
                Text(widget.message.time, style: TextStyle(color: Colors.white54, fontSize: 11)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TypingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(color: const Color(0xFF262626), borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            SizedBox(width: 6),
            Dot(),
            SizedBox(width: 6),
            Dot(delay: 120),
            SizedBox(width: 6),
            Dot(delay: 240),
          ],
        ),
      ),
    );
  }
}

class Dot extends StatefulWidget {
  final int delay;
  const Dot({this.delay = 0, super.key});
  @override
  State<Dot> createState() => _DotState();
}

class _DotState extends State<Dot> with SingleTickerProviderStateMixin {
  late final AnimationController _c;
  late final Animation<double> _a;
  @override
  void initState() {
    super.initState();
    _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 600))..repeat(reverse: true);
    _a = Tween<double>(begin: 0.35, end: 1.0).animate(CurvedAnimation(parent: _c, curve: Curves.easeInOut));
    if (widget.delay > 0) Future.delayed(Duration(milliseconds: widget.delay), () => _c.forward());
  }

  @override
  void dispose() {
    _c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _a,
      child: Container(width: 6, height: 6, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white70)),
    );
  }
}


// // lib/main.dart
// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const FirstIntentRouterApp());
// }

// /// ---------------------- Design Tokens / Theme ----------------------
// class AppTokens {
//   static const double s1 = 8;
//   static const double s2 = 12;
//   static const double s3 = 16;
//   static const double s4 = 20;
//   static const double s5 = 24;
//   static const double s6 = 32;
//   static const double radiusSm = 8;
//   static const double radiusMd = 12;
//   static const double radiusLg = 16;
//   static const double elevationLow = 6;
//   static const double elevationHover = 14;
// }

// final ColorScheme _darkColorScheme = ColorScheme.dark(
//   primary: const Color(0xFF00C774),
//   onPrimary: Colors.white,
//   surface: const Color(0xFF1C1C1C),
//   background: const Color(0xFF121212),
//   onSurface: Colors.white,
// );

// ThemeData _buildTheme() {
//   return ThemeData.from(colorScheme: _darkColorScheme).copyWith(
//     useMaterial3: true,
//     scaffoldBackgroundColor: _darkColorScheme.background,
//     textTheme: const TextTheme(
//       bodyMedium: TextStyle(color: Colors.white),
//       bodySmall: TextStyle(color: Colors.white70),
//     ),
//     inputDecorationTheme: const InputDecorationTheme(
//       border: InputBorder.none,
//       hintStyle: TextStyle(color: Colors.white54),
//     ),
//   );
// }

// /// ---------------------- App Root ----------------------
// class FirstIntentRouterApp extends StatelessWidget {
//   const FirstIntentRouterApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'First-Intent Router (v2)',
//       debugShowCheckedModeBanner: false,
//       theme: _buildTheme(),
//       home: const MainShell(),
//     );
//   }
// }

// /// ---------------------- Main Shell ----------------------
// // Now stores chat open state and passes a toggle callback to the sidebar
// class MainShell extends StatefulWidget {
//   const MainShell({super.key});

//   @override
//   State<MainShell> createState() => _MainShellState();
// }

// class _MainShellState extends State<MainShell> {
//   String activeSection = 'Dashboard';
//   bool _chatOpen = false;

//   void _toggleChat() => setState(() => _chatOpen = !_chatOpen);
//   void _openChat() => setState(() => _chatOpen = true);
//   void _closeChat() => setState(() => _chatOpen = false);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Row(
//         children: [
//           // Sidebar — receives the callback
//           AppSidebar(onBadgeTap: _openChat),
//           // Middle content
//           Expanded(
//             flex: 3,
//             child: Column(
//               children: const [
//                 AppHeader(),
//                 Expanded(child: DashboardContent()),
//               ],
//             ),
//           ),
//           // Chat panel — animated show/hide based on _chatOpen
//           ChatPanel(open: _chatOpen, onClose: _closeChat),
//         ],
//       ),
//     );
//   }
// }

// /// ---------------------- Sidebar ----------------------
// class AppSidebar extends StatelessWidget {
//   final VoidCallback onBadgeTap;
//   const AppSidebar({super.key, required this.onBadgeTap});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 220,
//       color: const Color(0xFF141414),
//       padding: const EdgeInsets.symmetric(vertical: AppTokens.s3),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Logo area
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: AppTokens.s4),
//             child: Row(
//               children: const [
//                 Icon(Icons.eco, color: Color(0xFF00C774)),
//                 SizedBox(width: AppTokens.s2),
//                 Text('First-Intent Router',
//                     style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
//               ],
//             ),
//           ),
//           const SizedBox(height: AppTokens.s4),
//           // Nav items
//           _SidebarNavItem(icon: Icons.grid_view, label: 'Dashboard', active: true),
//           _SidebarNavItem(icon: Icons.people_alt_outlined, label: 'People & Services'),
//           _SidebarNavItem(icon: Icons.chat_bubble_outline, label: 'Conversations'),
//           const Spacer(),
//           // compact network pill at bottom-left — now tappable and calls onBadgeTap
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: AppTokens.s4, vertical: AppTokens.s3),
//             child: GestureDetector(
//               onTap: onBadgeTap,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       height: 44,
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF0E7A48),
//                         borderRadius: BorderRadius.circular(AppTokens.radiusMd),
//                       ),
//                       alignment: Alignment.center,
//                       child: const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.shield, color: Colors.white, size: 16),
//                           SizedBox(width: AppTokens.s2),
//                           Text('NETWORK SECURE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _SidebarNavItem extends StatefulWidget {
//   final IconData icon;
//   final String label;
//   final bool active;
//   const _SidebarNavItem({required this.icon, required this.label, this.active = false});

//   @override
//   State<_SidebarNavItem> createState() => _SidebarNavItemState();
// }

// class _SidebarNavItemState extends State<_SidebarNavItem> {
//   bool _hover = false;

//   @override
//   Widget build(BuildContext context) {
//     final bg = widget.active
//         ? const Color(0xFF1F461F)
//         : (_hover ? Colors.white12 : Colors.transparent);
//     final iconColor = widget.active ? const Color(0xFF00C774) : Colors.white70;
//     final textColor = widget.active ? const Color(0xFF00C774) : Colors.white70;

//     return MouseRegion(
//       onEnter: (_) => setState(() => _hover = true),
//       onExit: (_) => setState(() => _hover = false),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 140),
//         margin: const EdgeInsets.symmetric(vertical: 6),
//         decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(AppTokens.radiusSm)),
//         child: ListTile(
//           leading: Icon(widget.icon, color: iconColor),
//           title: Text(widget.label, style: TextStyle(color: textColor, fontWeight: widget.active ? FontWeight.w700 : FontWeight.w500)),
//           dense: true,
//           horizontalTitleGap: 6,
//           onTap: () {},
//         ),
//       ),
//     );
//   }
// }

// /// ---------------------- Header ----------------------
// class AppHeader extends StatelessWidget {
//   const AppHeader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Header places the single authoritative "Network Secure" pill at top-right.
//     return Container(
//       height: 72,
//       padding: const EdgeInsets.symmetric(horizontal: AppTokens.s5),
//       decoration: BoxDecoration(
//         color: const Color(0xFF1B1B1B),
//         border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.2))),
//       ),
//       child: Row(
//         children: [
//           // Limited-width search (keeps header balanced)
//           ConstrainedBox(
//             constraints: const BoxConstraints(maxWidth: 720),
//             child: Container(
//               height: 44,
//               decoration: BoxDecoration(
//                 color: const Color(0xFF242424),
//                 borderRadius: BorderRadius.circular(AppTokens.radiusMd),
//               ),
//               padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3),
//               child: Row(
//                 children: const [
//                   Icon(Icons.search, color: Colors.white54),
//                   SizedBox(width: AppTokens.s3),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration.collapsed(hintText: 'Search people or services...'),
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const Spacer(),
//           // Top-right authoritative indicator + user avatar
//           Row(
//             children: [
//               AnimatedHoverButton(
//                 onTap: () {},
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3, vertical: 10),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFF00C774),
//                     borderRadius: BorderRadius.circular(AppTokens.radiusMd),
//                   ),
//                   child: const Text('NETWORK SECURE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
//                 ),
//               ),
//               const SizedBox(width: AppTokens.s4),
//               const CircleAvatar(backgroundColor: Colors.grey, child: Icon(Icons.person, color: Colors.white)),
//               const SizedBox(width: AppTokens.s2),
//               const Text('Alex Chen', style: TextStyle(fontWeight: FontWeight.w600)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// ---------------------- Dashboard Content ----------------------
// class DashboardContent extends StatefulWidget {
//   const DashboardContent({super.key});

//   @override
//   State<DashboardContent> createState() => _DashboardContentState();
// }

// class _DashboardContentState extends State<DashboardContent> {
//   final List<_CardModel> _allCards = [
//     _CardModel('GC', 'GA Cianne', 'Person', 'ONLINE', Colors.green),
//     _CardModel('AB', 'AA Briscola', 'Person', 'WORKING', Colors.orange),
//     _CardModel('WW', 'Wes Wang', 'Service', 'WEB DESIGN', Colors.orange.shade700),
//     _CardModel('AG', 'AA Grayson', 'Person', 'OFFLINE', Colors.grey),
//     _CardModel('SJ', 'Steel Jiang', 'Service', 'STREAMING', Colors.blue),
//     _CardModel('LD', 'Lead Delivery', 'Service', 'REQUEST', Colors.grey),
//     _CardModel('AE', 'AA Etienne', 'Service', 'ACTIVE', Colors.green),
//     _CardModel('AG2', 'AA Gomez', 'Person', 'IDLE', Colors.grey),
//     for (var i = 0; i < 12; i++) _CardModel('U$i', 'User $i', 'Person', i % 3 == 0 ? 'ACTIVE' : 'IDLE', i % 3 == 0 ? Colors.green : Colors.grey),
//   ];

//   String _filter = 'All';
//   final ScrollController _gridScroll = ScrollController();
//   bool _loadingMore = false;
//   int _itemsToShow = 8;

//   @override
//   void initState() {
//     super.initState();
//     _gridScroll.addListener(_onScroll);
//   }

//   @override
//   void dispose() {
//     _gridScroll.removeListener(_onScroll);
//     _gridScroll.dispose();
//     super.dispose();
//   }

//   void _onScroll() {
//     if (_gridScroll.position.pixels >= _gridScroll.position.maxScrollExtent - 120 && !_loadingMore && _itemsToShow < _allCards.length) {
//       _loadMore();
//     }
//   }

//   Future<void> _loadMore() async {
//     setState(() => _loadingMore = true);
//     await Future<void>.delayed(const Duration(milliseconds: 450));
//     setState(() {
//       _itemsToShow = (_itemsToShow + 6).clamp(0, _allCards.length);
//       _loadingMore = false;
//     });
//   }

//   List<_CardModel> get _visibleCards {
//     final list = _filter == 'All'
//         ? _allCards
//         : _allCards.where((c) => c.status.toLowerCase().contains(_filter.toLowerCase())).toList();
//     return list.take(_itemsToShow).toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: _darkColorScheme.surface,
//       padding: const EdgeInsets.symmetric(horizontal: AppTokens.s5, vertical: AppTokens.s4),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Toolbar - section title + filter chips + sort placeholder
//           Row(
//             children: [
//               const Text('Dashboard', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
//               const SizedBox(width: AppTokens.s4),
//               Wrap(
//                 spacing: AppTokens.s2,
//                 children: [
//                   _FilterChip(label: 'All', active: _filter == 'All', onTap: () => setState(() => _filter = 'All')),
//                   _FilterChip(label: 'Active', active: _filter == 'Active', onTap: () => setState(() => _filter = 'Active')),
//                   _FilterChip(label: 'Working', active: _filter == 'Working', onTap: () => setState(() => _filter = 'Working')),
//                   _FilterChip(label: 'Streaming', active: _filter == 'Streaming', onTap: () => setState(() => _filter = 'Streaming')),
//                   _FilterChip(label: 'Offline', active: _filter == 'Offline', onTap: () => setState(() => _filter = 'Offline')),
//                 ],
//               ),
//               const Spacer(),
//               IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list), color: Colors.white70),
//               IconButton(onPressed: () {}, icon: const Icon(Icons.sort), color: Colors.white70),
//             ],
//           ),
//           const SizedBox(height: AppTokens.s4),
//           // Grid area
//           Expanded(
//             child: LayoutBuilder(builder: (context, constraints) {
//               final double available = constraints.maxWidth;
//               final crossCount = (available ~/ 300).clamp(2, 5);
//               final items = _visibleCards;
//               return CustomScrollView(
//                 controller: _gridScroll,
//                 slivers: [
//                   SliverPadding(
//                     padding: const EdgeInsets.only(bottom: AppTokens.s4),
//                     sliver: SliverGrid(
//                       delegate: SliverChildBuilderDelegate(
//                         (context, index) {
//                           final card = items[index];
//                           return AnimatedHoverCard(
//                             child: PersonServiceCard(model: card),
//                           );
//                         },
//                         childCount: items.length,
//                       ),
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: crossCount,
//                         crossAxisSpacing: AppTokens.s3,
//                         mainAxisSpacing: AppTokens.s3,
//                         childAspectRatio: 1.05,
//                       ),
//                     ),
//                   ),
//                   if (_loadingMore)
//                     SliverToBoxAdapter(
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: AppTokens.s4),
//                         child: Center(child: Row(mainAxisSize: MainAxisSize.min, children: const [CircularProgressIndicator(), SizedBox(width: 12), Text('Loading...')]))),
//                     ),
//                 ],
//               );
//             }),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _CardModel {
//   final String initials;
//   final String name;
//   final String type;
//   final String status;
//   final Color color;
//   _CardModel(this.initials, this.name, this.type, this.status, this.color);
// }

// class _FilterChip extends StatelessWidget {
//   final String label;
//   final bool active;
//   final VoidCallback onTap;
//   const _FilterChip({required this.label, required this.active, required this.onTap});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 140),
//         padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3, vertical: 8),
//         decoration: BoxDecoration(
//           color: active ? Colors.white12 : Colors.transparent,
//           borderRadius: BorderRadius.circular(AppTokens.radiusSm),
//           border: active ? Border.all(color: Colors.white12) : null,
//         ),
//         child: Text(label, style: TextStyle(color: active ? Colors.white : Colors.white70, fontWeight: active ? FontWeight.w700 : FontWeight.w500)),
//       ),
//     );
//   }
// }

// /// ---------------------- Person/Service Card ----------------------
// class PersonServiceCard extends StatelessWidget {
//   final _CardModel model;
//   const PersonServiceCard({required this.model, super.key});

//   @override
//   Widget build(BuildContext context) {
//     final chipBg = model.color.withOpacity(0.18);
//     final chipTextColor = model.color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
//     return Container(
//       margin: const EdgeInsets.all(6),
//       padding: const EdgeInsets.all(AppTokens.s3),
//       decoration: BoxDecoration(
//         color: const Color(0xFF222222),
//         borderRadius: BorderRadius.circular(AppTokens.radiusLg),
//         border: Border.all(color: Colors.black54),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               CircleAvatar(radius: 20, backgroundColor: Colors.grey.shade700, child: Text(model.initials, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
//               const SizedBox(width: AppTokens.s3),
//               Expanded(
//                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   Text(model.name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 4),
//                   Text(model.type, style: TextStyle(color: Colors.white70, fontSize: 12)),
//                 ]),
//               ),
//               const SizedBox(width: 6),
//               Tooltip(message: 'More options', child: Icon(Icons.more_vert, color: Colors.white54)),
//             ],
//           ),
//           const Spacer(),
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3, vertical: 8),
//                   decoration: BoxDecoration(color: chipBg, borderRadius: BorderRadius.circular(AppTokens.radiusSm)),
//                   child: Text(model.status, style: TextStyle(color: chipTextColor, fontWeight: FontWeight.w700, fontSize: 12)),
//                 ),
//               ),
//               const SizedBox(width: AppTokens.s3),
//               Icon(Icons.chevron_right, color: Colors.white24),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// /// ---------------------- Hover & Micro Animations ----------------------
// class AnimatedHoverCard extends StatefulWidget {
//   final Widget child;
//   final VoidCallback? onTap;
//   const AnimatedHoverCard({required this.child, this.onTap, super.key});

//   @override
//   State<AnimatedHoverCard> createState() => _AnimatedHoverCardState();
// }

// class _AnimatedHoverCardState extends State<AnimatedHoverCard> {
//   bool _hover = false;
//   bool _pressed = false;

//   void _setHover(bool v) => setState(() => _hover = v);
//   void _setPressed(bool v) => setState(() => _pressed = v);

//   @override
//   Widget build(BuildContext context) {
//     final lift = _hover ? -6.0 : 0.0;
//     final scale = _hover ? 1.01 : 1.0;
//     final blur = _hover ? AppTokens.elevationHover : AppTokens.elevationLow;
//     final opacity = _pressed ? 0.95 : 1.0;

//     return MouseRegion(
//       onEnter: (_) => _setHover(true),
//       onExit: (_) => _setHover(false),
//       child: GestureDetector(
//         onTapDown: (_) => _setPressed(true),
//         onTapUp: (_) => _setPressed(false),
//         onTapCancel: () => _setPressed(false),
//         onTap: widget.onTap,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 160),
//           transform: Matrix4.identity()..translate(0.0, lift)..scale(scale),
//           decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.35), blurRadius: blur, offset: const Offset(0, 6))]),
//           child: Opacity(opacity: opacity, child: widget.child),
//         ),
//       ),
//     );
//   }
// }

// class AnimatedHoverButton extends StatefulWidget {
//   final Widget child;
//   final VoidCallback? onTap;
//   const AnimatedHoverButton({required this.child, this.onTap, super.key});

//   @override
//   State<AnimatedHoverButton> createState() => _AnimatedHoverButtonState();
// }

// class _AnimatedHoverButtonState extends State<AnimatedHoverButton> {
//   bool _hover = false;
//   bool _pressed = false;
//   @override
//   Widget build(BuildContext context) {
//     final scale = _hover ? 1.02 : 1.0;
//     final opacity = _pressed ? 0.9 : 1.0;
//     return MouseRegion(
//       onEnter: (_) => setState(() => _hover = true),
//       onExit: (_) => setState(() => _hover = false),
//       child: GestureDetector(
//         onTapDown: (_) => setState(() => _pressed = true),
//         onTapUp: (_) => setState(() => _pressed = false),
//         onTapCancel: () => setState(() => _pressed = false),
//         onTap: widget.onTap,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 140),
//           transform: Matrix4.identity()..scale(scale),
//           child: Opacity(opacity: opacity, child: widget.child),
//         ),
//       ),
//     );
//   }
// }

// /// ---------------------- Chat Panel ----------------------
// // Now accepts `open` and `onClose`. When open becomes true, it focuses the input.
// class ChatPanel extends StatefulWidget {
//   final bool open;
//   final VoidCallback? onClose;
//   const ChatPanel({super.key, required this.open, this.onClose});

//   @override
//   State<ChatPanel> createState() => _ChatPanelState();
// }

// class _ChatPanelState extends State<ChatPanel> {
//   final List<_Message> _messages = [
//     _Message(sender: 'Alex Chen', text: 'Hey! Have you reviewed the latest update?', time: '10:45 AM', mine: false),
//     _Message(sender: 'You', text: 'Yes, looks great! Testing remaining parts.', time: '10:46 AM', mine: true),
//     _Message(sender: 'Alex Chen', text: 'Cool, let’s finalize by evening.', time: '10:47 AM', mine: false),
//   ];

//   final TextEditingController _ctrl = TextEditingController();
//   final ScrollController _scroll = ScrollController();
//   final FocusNode _focusNode = FocusNode();
//   bool _typing = false;

//   void _sendMessage() {
//     final t = _ctrl.text.trim();
//     if (t.isEmpty) return;
//     setState(() {
//       _messages.add(_Message(sender: 'You', text: t, time: _now(), mine: true));
//       _ctrl.clear();
//       _typing = false;
//     });
//     Timer(const Duration(milliseconds: 160), () {
//       if (_scroll.hasClients) {
//         _scroll.animateTo(_scroll.position.maxScrollExtent + 100, duration: const Duration(milliseconds: 280), curve: Curves.easeOut);
//       }
//     });
//   }

//   String _now() {
//     final now = DateTime.now();
//     final hour = now.hour == 0 ? 12 : (now.hour > 12 ? now.hour - 12 : now.hour);
//     final minute = now.minute.toString().padLeft(2, '0');
//     final ampm = now.hour >= 12 ? 'PM' : 'AM';
//     return '$hour:$minute $ampm';
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     _ctrl.dispose();
//     _scroll.dispose();
//     super.dispose();
//   }

//   @override
//   void didUpdateWidget(covariant ChatPanel oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     // When panel is opened, request focus on the text field
//     if (!oldWidget.open && widget.open) {
//       // small delay to ensure panel finished animating
//       Future.delayed(const Duration(milliseconds: 180), () {
//         if (mounted) _focusNode.requestFocus();
//       });
//     }
//     // Optionally close focus when panel closed
//     if (oldWidget.open && !widget.open) {
//       _focusNode.unfocus();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Animate width between 0 and 380
//     final targetWidth = widget.open ? 380.0 : 0.0;
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 240),
//       curve: Curves.easeInOut,
//       width: targetWidth,
//       child: ClipRect(
//         child: Offstage(
//           offstage: !widget.open,
//           child: Container(
//             width: 380,
//             color: const Color(0xFF151515),
//             child: Column(
//               children: [
//                 // Top header with close affordance
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: AppTokens.s4, vertical: AppTokens.s3),
//                   child: Row(
//                     children: [
//                       const Text('Conversation', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
//                       const SizedBox(width: AppTokens.s3),
//                       Chip(label: const Text('3'), backgroundColor: Colors.white10),
//                       const Spacer(),
//                       IconButton(
//                         onPressed: widget.onClose,
//                         icon: const Icon(Icons.close, color: Colors.white70),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Divider(height: 1, color: Colors.black26),
//                 // Messages
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3, vertical: AppTokens.s3),
//                     child: ListView.builder(
//                       controller: _scroll,
//                       itemCount: _messages.length + (_typing ? 1 : 0),
//                       itemBuilder: (context, index) {
//                         if (_typing && index == _messages.length) {
//                           return _TypingIndicator();
//                         }
//                         final m = _messages[index];
//                         final bool lastFromSame = index > 0 && _messages[index - 1].sender == m.sender;
//                         return Padding(
//                           padding: EdgeInsets.only(top: lastFromSame ? 4 : 12),
//                           child: HoverChatBubble(message: m),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 // Input area
//                 Container(
//                   padding: const EdgeInsets.all(AppTokens.s3),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3),
//                           decoration: BoxDecoration(color: const Color(0xFF232323), borderRadius: BorderRadius.circular(AppTokens.radiusMd)),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 child: TextField(
//                                   focusNode: _focusNode,
//                                   controller: _ctrl,
//                                   decoration: const InputDecoration.collapsed(hintText: 'Type your message...'),
//                                   style: const TextStyle(color: Colors.white),
//                                   onChanged: (v) => setState(() => _typing = v.trim().isNotEmpty),
//                                   onSubmitted: (_) => _sendMessage(),
//                                 ),
//                               ),
//                               IconButton(onPressed: () {}, icon: const Icon(Icons.attach_file, color: Colors.white54)),
//                             ],
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: AppTokens.s2),
//                       AnimatedHoverButton(
//                         onTap: _typing ? _sendMessage : null,
//                         child: Container(
//                           decoration: BoxDecoration(color: _typing ? const Color(0xFF00C774) : Colors.white12, borderRadius: BorderRadius.circular(AppTokens.radiusSm)),
//                           padding: const EdgeInsets.all(12),
//                           child: Icon(Icons.send, color: _typing ? Colors.white : Colors.white70),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _Message {
//   final String sender;
//   final String text;
//   final String time;
//   final bool mine;
//   const _Message({required this.sender, required this.text, required this.time, required this.mine});
// }

// class HoverChatBubble extends StatefulWidget {
//   final _Message message;
//   const HoverChatBubble({required this.message, super.key});

//   @override
//   State<HoverChatBubble> createState() => _HoverChatBubbleState();
// }

// class _HoverChatBubbleState extends State<HoverChatBubble> {
//   bool _hover = false;

//   @override
//   Widget build(BuildContext context) {
//     final isMine = widget.message.mine;
//     final bg = isMine ? const Color(0xFF1B4F2F) : const Color(0xFF262626);
//     final align = isMine ? Alignment.centerRight : Alignment.centerLeft;
//     final cross = isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start;
//     final textColor = isMine ? Colors.white : Colors.white;
//     final lift = _hover ? -4.0 : 0.0;
//     return MouseRegion(
//       onEnter: (_) => setState(() => _hover = true),
//       onExit: (_) => setState(() => _hover = false),
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 160),
//         transform: Matrix4.identity()..translate(0.0, lift),
//         child: Align(
//           alignment: align,
//           child: Container(
//             constraints: const BoxConstraints(maxWidth: 280),
//             decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)),
//             padding: const EdgeInsets.all(12),
//             child: Column(
//               crossAxisAlignment: cross,
//               children: [
//                 if (!isMine) Text(widget.message.sender, style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w700)),
//                 const SizedBox(height: 6),
//                 Text(widget.message.text, style: TextStyle(color: textColor)),
//                 const SizedBox(height: 8),
//                 Text(widget.message.time, style: TextStyle(color: Colors.white54, fontSize: 11)),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _TypingIndicator extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//         decoration: BoxDecoration(color: const Color(0xFF262626), borderRadius: BorderRadius.circular(10)),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: const [
//             SizedBox(width: 6),
//             Dot(),
//             SizedBox(width: 6),
//             Dot(delay: 120),
//             SizedBox(width: 6),
//             Dot(delay: 240),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Dot extends StatefulWidget {
//   final int delay;
//   const Dot({this.delay = 0, super.key});
//   @override
//   State<Dot> createState() => _DotState();
// }

// class _DotState extends State<Dot> with SingleTickerProviderStateMixin {
//   late final AnimationController _c;
//   late final Animation<double> _a;
//   @override
//   void initState() {
//     super.initState();
//     _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 600))..repeat(reverse: true);
//     _a = Tween<double>(begin: 0.35, end: 1.0).animate(CurvedAnimation(parent: _c, curve: Curves.easeInOut));
//     if (widget.delay > 0) Future.delayed(Duration(milliseconds: widget.delay), () => _c.forward());
//   }

//   @override
//   void dispose() {
//     _c.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FadeTransition(
//       opacity: _a,
//       child: Container(width: 6, height: 6, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white70)),
//     );
//   }
// }



// // // lib/main.dart
// // import 'dart:async';
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const FirstIntentRouterApp());
// // }

// // /// ---------------------- Design Tokens / Theme ----------------------
// // class AppTokens {
// //   // Spacing
// //   static const double s1 = 8;
// //   static const double s2 = 12;
// //   static const double s3 = 16;
// //   static const double s4 = 20;
// //   static const double s5 = 24;
// //   static const double s6 = 32;

// //   // Corner radius
// //   static const double radiusSm = 8;
// //   static const double radiusMd = 12;
// //   static const double radiusLg = 16;

// //   // Elevation shadows (as blur radius)
// //   static const double elevationLow = 6;
// //   static const double elevationHover = 14;
// // }

// // final ColorScheme _darkColorScheme = ColorScheme.dark(
// //   primary: const Color(0xFF00C774),
// //   onPrimary: Colors.white,
// //   surface: const Color(0xFF1C1C1C),
// //   background: const Color(0xFF121212),
// //   onSurface: Colors.white,
// // );

// // ThemeData _buildTheme() {
// //   return ThemeData.from(colorScheme: _darkColorScheme).copyWith(
// //     useMaterial3: true,
// //     scaffoldBackgroundColor: _darkColorScheme.background,
// //     textTheme: const TextTheme(
// //       bodyMedium: TextStyle(color: Colors.white),
// //       bodySmall: TextStyle(color: Colors.white70),
// //     ),
// //     inputDecorationTheme: const InputDecorationTheme(
// //       border: InputBorder.none,
// //       hintStyle: TextStyle(color: Colors.white54),
// //     ),
// //   );
// // }

// // /// ---------------------- App Root ----------------------
// // class FirstIntentRouterApp extends StatelessWidget {
// //   const FirstIntentRouterApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'First-Intent Router (v2)',
// //       debugShowCheckedModeBanner: false,
// //       theme: _buildTheme(),
// //       home: const MainShell(),
// //     );
// //   }
// // }

// // /// ---------------------- Main Shell ----------------------
// // class MainShell extends StatefulWidget {
// //   const MainShell({super.key});

// //   @override
// //   State<MainShell> createState() => _MainShellState();
// // }

// // class _MainShellState extends State<MainShell> {
// //   String activeSection = 'Dashboard';

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Row(
// //         children: [
// //           // Sidebar
// //           const AppSidebar(),
// //           // Middle content
// //           Expanded(
// //             flex: 3,
// //             child: Column(
// //               children: const [
// //                 AppHeader(),
// //                 Expanded(child: DashboardContent()),
// //               ],
// //             ),
// //           ),
// //           // Chat panel
// //           const ChatPanel(),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // /// ---------------------- Sidebar ----------------------
// // class AppSidebar extends StatelessWidget {
// //   const AppSidebar({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 220,
// //       color: const Color(0xFF141414),
// //       padding: const EdgeInsets.symmetric(vertical: AppTokens.s3),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Logo area
// //           Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: AppTokens.s4),
// //             child: Row(
// //               children: const [
// //                 Icon(Icons.eco, color: Color(0xFF00C774)),
// //                 SizedBox(width: AppTokens.s2),
// //                 Text('First-Intent Router',
// //                     style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white)),
// //               ],
// //             ),
// //           ),
// //           const SizedBox(height: AppTokens.s4),
// //           // Nav items
// //           _SidebarNavItem(icon: Icons.grid_view, label: 'Dashboard', active: true),
// //           _SidebarNavItem(icon: Icons.people_alt_outlined, label: 'People & Services'),
// //           _SidebarNavItem(icon: Icons.chat_bubble_outline, label: 'Conversations'),
// //           const Spacer(),
// //           // compact network pill at bottom-left (non-primary location)
// //           Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: AppTokens.s4, vertical: AppTokens.s3),
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   child: Container(
// //                     height: 44,
// //                     decoration: BoxDecoration(
// //                       color: const Color(0xFF0E7A48),
// //                       borderRadius: BorderRadius.circular(AppTokens.radiusMd),
// //                     ),
// //                     alignment: Alignment.center,
// //                     child: const Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         Icon(Icons.shield, color: Colors.white, size: 16),
// //                         SizedBox(width: AppTokens.s2),
// //                         Text('NETWORK SECURE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 13)),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _SidebarNavItem extends StatefulWidget {
// //   final IconData icon;
// //   final String label;
// //   final bool active;
// //   const _SidebarNavItem({required this.icon, required this.label, this.active = false});

// //   @override
// //   State<_SidebarNavItem> createState() => _SidebarNavItemState();
// // }

// // class _SidebarNavItemState extends State<_SidebarNavItem> {
// //   bool _hover = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     final bg = widget.active
// //         ? const Color(0xFF1F461F)
// //         : (_hover ? Colors.white12 : Colors.transparent);
// //     final iconColor = widget.active ? const Color(0xFF00C774) : Colors.white70;
// //     final textColor = widget.active ? const Color(0xFF00C774) : Colors.white70;

// //     return MouseRegion(
// //       onEnter: (_) => setState(() => _hover = true),
// //       onExit: (_) => setState(() => _hover = false),
// //       child: AnimatedContainer(
// //         duration: const Duration(milliseconds: 140),
// //         margin: const EdgeInsets.symmetric(vertical: 6),
// //         decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(AppTokens.radiusSm)),
// //         child: ListTile(
// //           leading: Icon(widget.icon, color: iconColor),
// //           title: Text(widget.label, style: TextStyle(color: textColor, fontWeight: widget.active ? FontWeight.w700 : FontWeight.w500)),
// //           dense: true,
// //           horizontalTitleGap: 6,
// //           onTap: () {},
// //         ),
// //       ),
// //     );
// //   }
// // }

// // /// ---------------------- Header ----------------------
// // class AppHeader extends StatelessWidget {
// //   const AppHeader({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     // Header places the single authoritative "Network Secure" pill at top-right.
// //     return Container(
// //       height: 72,
// //       padding: const EdgeInsets.symmetric(horizontal: AppTokens.s5),
// //       decoration: BoxDecoration(
// //         color: const Color(0xFF1B1B1B),
// //         border: Border(bottom: BorderSide(color: Colors.black.withOpacity(0.2))),
// //       ),
// //       child: Row(
// //         children: [
// //           // Limited-width search (keeps header balanced)
// //           ConstrainedBox(
// //             constraints: const BoxConstraints(maxWidth: 720),
// //             child: Container(
// //               height: 44,
// //               decoration: BoxDecoration(
// //                 color: const Color(0xFF242424),
// //                 borderRadius: BorderRadius.circular(AppTokens.radiusMd),
// //               ),
// //               padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3),
// //               child: Row(
// //                 children: const [
// //                   Icon(Icons.search, color: Colors.white54),
// //                   SizedBox(width: AppTokens.s3),
// //                   Expanded(
// //                     child: TextField(
// //                       decoration: InputDecoration.collapsed(hintText: 'Search people or services...'),
// //                       style: TextStyle(color: Colors.white),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           const Spacer(),
// //           // Top-right authoritative indicator + user avatar
// //           Row(
// //             children: [
// //               AnimatedHoverButton(
// //                 onTap: () {},
// //                 child: Container(
// //                   padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3, vertical: 10),
// //                   decoration: BoxDecoration(
// //                     color: const Color(0xFF00C774),
// //                     borderRadius: BorderRadius.circular(AppTokens.radiusMd),
// //                   ),
// //                   child: const Text('NETWORK SECURE', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
// //                 ),
// //               ),
// //               const SizedBox(width: AppTokens.s4),
// //               const CircleAvatar(backgroundColor: Colors.grey, child: Icon(Icons.person, color: Colors.white)),
// //               const SizedBox(width: AppTokens.s2),
// //               const Text('Alex Chen', style: TextStyle(fontWeight: FontWeight.w600)),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // /// ---------------------- Dashboard Content ----------------------
// // class DashboardContent extends StatefulWidget {
// //   const DashboardContent({super.key});

// //   @override
// //   State<DashboardContent> createState() => _DashboardContentState();
// // }

// // class _DashboardContentState extends State<DashboardContent> {
// //   // sample dataset
// //   final List<_CardModel> _allCards = [
// //     _CardModel('GC', 'GA Cianne', 'Person', 'ONLINE', Colors.green),
// //     _CardModel('AB', 'AA Briscola', 'Person', 'WORKING', Colors.orange),
// //     _CardModel('WW', 'Wes Wang', 'Service', 'WEB DESIGN', Colors.orange.shade700),
// //     _CardModel('AG', 'AA Grayson', 'Person', 'OFFLINE', Colors.grey),
// //     _CardModel('SJ', 'Steel Jiang', 'Service', 'STREAMING', Colors.blue),
// //     _CardModel('LD', 'Lead Delivery', 'Service', 'REQUEST', Colors.grey),
// //     _CardModel('AE', 'AA Etienne', 'Service', 'ACTIVE', Colors.green),
// //     _CardModel('AG2', 'AA Gomez', 'Person', 'IDLE', Colors.grey),
// //     // add more for lazy loading demonstration
// //     for (var i = 0; i < 12; i++) _CardModel('U$i', 'User $i', 'Person', i % 3 == 0 ? 'ACTIVE' : 'IDLE', i % 3 == 0 ? Colors.green : Colors.grey),
// //   ];

// //   String _filter = 'All';
// //   final ScrollController _gridScroll = ScrollController();
// //   bool _loadingMore = false;
// //   int _itemsToShow = 8;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _gridScroll.addListener(_onScroll);
// //   }

// //   @override
// //   void dispose() {
// //     _gridScroll.removeListener(_onScroll);
// //     _gridScroll.dispose();
// //     super.dispose();
// //   }

// //   void _onScroll() {
// //     if (_gridScroll.position.pixels >= _gridScroll.position.maxScrollExtent - 120 && !_loadingMore && _itemsToShow < _allCards.length) {
// //       _loadMore();
// //     }
// //   }

// //   Future<void> _loadMore() async {
// //     setState(() => _loadingMore = true);
// //     await Future<void>.delayed(const Duration(milliseconds: 450));
// //     setState(() {
// //       _itemsToShow = (_itemsToShow + 6).clamp(0, _allCards.length);
// //       _loadingMore = false;
// //     });
// //   }

// //   List<_CardModel> get _visibleCards {
// //     final list = _filter == 'All'
// //         ? _allCards
// //         : _allCards.where((c) => c.status.toLowerCase().contains(_filter.toLowerCase())).toList();
// //     return list.take(_itemsToShow).toList();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       color: _darkColorScheme.surface,
// //       padding: const EdgeInsets.symmetric(horizontal: AppTokens.s5, vertical: AppTokens.s4),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Toolbar - section title + filter chips + sort placeholder
// //           Row(
// //             children: [
// //               const Text('Dashboard', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
// //               const SizedBox(width: AppTokens.s4),
// //               // Filters
// //               Wrap(
// //                 spacing: AppTokens.s2,
// //                 children: [
// //                   _FilterChip(label: 'All', active: _filter == 'All', onTap: () => setState(() => _filter = 'All')),
// //                   _FilterChip(label: 'Active', active: _filter == 'Active', onTap: () => setState(() => _filter = 'Active')),
// //                   _FilterChip(label: 'Working', active: _filter == 'Working', onTap: () => setState(() => _filter = 'Working')),
// //                   _FilterChip(label: 'Streaming', active: _filter == 'Streaming', onTap: () => setState(() => _filter = 'Streaming')),
// //                   _FilterChip(label: 'Offline', active: _filter == 'Offline', onTap: () => setState(() => _filter = 'Offline')),
// //                 ],
// //               ),
// //               const Spacer(),
// //               // small hint of actions
// //               IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list), color: Colors.white70),
// //               IconButton(onPressed: () {}, icon: const Icon(Icons.sort), color: Colors.white70),
// //             ],
// //           ),
// //           const SizedBox(height: AppTokens.s4),
// //           // Grid area
// //           Expanded(
// //             child: LayoutBuilder(builder: (context, constraints) {
// //               final double available = constraints.maxWidth;
// //               final crossCount = (available ~/ 300).clamp(2, 5);
// //               final items = _visibleCards;
// //               return CustomScrollView(
// //                 controller: _gridScroll,
// //                 slivers: [
// //                   SliverPadding(
// //                     padding: const EdgeInsets.only(bottom: AppTokens.s4),
// //                     sliver: SliverGrid(
// //                       delegate: SliverChildBuilderDelegate(
// //                         (context, index) {
// //                           final card = items[index];
// //                           return AnimatedHoverCard(
// //                             child: PersonServiceCard(model: card),
// //                           );
// //                         },
// //                         childCount: items.length,
// //                       ),
// //                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                         crossAxisCount: crossCount,
// //                         crossAxisSpacing: AppTokens.s3,
// //                         mainAxisSpacing: AppTokens.s3,
// //                         childAspectRatio: 1.05,
// //                       ),
// //                     ),
// //                   ),
// //                   if (_loadingMore)
// //                     SliverToBoxAdapter(
// //                       child: Padding(
// //                         padding: const EdgeInsets.symmetric(vertical: AppTokens.s4),
// //                         child: Center(child: Row(mainAxisSize: MainAxisSize.min, children: const [CircularProgressIndicator(), SizedBox(width: 12), Text('Loading...')])),
// //                       ),
// //                     ),
// //                 ],
// //               );
// //             }),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _CardModel {
// //   final String initials;
// //   final String name;
// //   final String type;
// //   final String status;
// //   final Color color;
// //   _CardModel(this.initials, this.name, this.type, this.status, this.color);
// // }

// // class _FilterChip extends StatelessWidget {
// //   final String label;
// //   final bool active;
// //   final VoidCallback onTap;
// //   const _FilterChip({required this.label, required this.active, required this.onTap});

// //   @override
// //   Widget build(BuildContext context) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: AnimatedContainer(
// //         duration: const Duration(milliseconds: 140),
// //         padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3, vertical: 8),
// //         decoration: BoxDecoration(
// //           color: active ? Colors.white12 : Colors.transparent,
// //           borderRadius: BorderRadius.circular(AppTokens.radiusSm),
// //           border: active ? Border.all(color: Colors.white12) : null,
// //         ),
// //         child: Text(label, style: TextStyle(color: active ? Colors.white : Colors.white70, fontWeight: active ? FontWeight.w700 : FontWeight.w500)),
// //       ),
// //     );
// //   }
// // }

// // /// ---------------------- Person/Service Card ----------------------
// // class PersonServiceCard extends StatelessWidget {
// //   final _CardModel model;
// //   const PersonServiceCard({required this.model, super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     // use a chip with good contrast
// //     final chipBg = model.color.withOpacity(0.18);
// //     final chipTextColor = model.color.computeLuminance() > 0.5 ? Colors.black : Colors.white;
// //     return Container(
// //       margin: const EdgeInsets.all(6),
// //       padding: const EdgeInsets.all(AppTokens.s3),
// //       decoration: BoxDecoration(
// //         color: const Color(0xFF222222),
// //         borderRadius: BorderRadius.circular(AppTokens.radiusLg),
// //         border: Border.all(color: Colors.black54),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Row(
// //             children: [
// //               CircleAvatar(radius: 20, backgroundColor: Colors.grey.shade700, child: Text(model.initials, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
// //               const SizedBox(width: AppTokens.s3),
// //               Expanded(
// //                 child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// //                   Text(model.name, style: const TextStyle(fontWeight: FontWeight.bold)),
// //                   const SizedBox(height: 4),
// //                   Text(model.type, style: TextStyle(color: Colors.white70, fontSize: 12)),
// //                 ]),
// //               ),
// //               // three-dot action with hover affordance
// //               const SizedBox(width: 6),
// //               Tooltip(message: 'More options', child: Icon(Icons.more_vert, color: Colors.white54)),
// //             ],
// //           ),
// //           const Spacer(),
// //           Row(
// //             children: [
// //               // status chip with accessible contrast
// //               Expanded(
// //                 child: Container(
// //                   padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3, vertical: 8),
// //                   decoration: BoxDecoration(color: chipBg, borderRadius: BorderRadius.circular(AppTokens.radiusSm)),
// //                   child: Text(model.status, style: TextStyle(color: chipTextColor, fontWeight: FontWeight.w700, fontSize: 12)),
// //                 ),
// //               ),
// //               const SizedBox(width: AppTokens.s3),
// //               Icon(Icons.chevron_right, color: Colors.white24),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // /// ---------------------- Hover & Micro Animations ----------------------
// // class AnimatedHoverCard extends StatefulWidget {
// //   final Widget child;
// //   final VoidCallback? onTap;
// //   const AnimatedHoverCard({required this.child, this.onTap, super.key});

// //   @override
// //   State<AnimatedHoverCard> createState() => _AnimatedHoverCardState();
// // }

// // class _AnimatedHoverCardState extends State<AnimatedHoverCard> {
// //   bool _hover = false;
// //   bool _pressed = false;

// //   void _setHover(bool v) => setState(() => _hover = v);
// //   void _setPressed(bool v) => setState(() => _pressed = v);

// //   @override
// //   Widget build(BuildContext context) {
// //     final lift = _hover ? -6.0 : 0.0;
// //     final scale = _hover ? 1.01 : 1.0;
// //     final blur = _hover ? AppTokens.elevationHover : AppTokens.elevationLow;
// //     final opacity = _pressed ? 0.95 : 1.0;

// //     return MouseRegion(
// //       onEnter: (_) => _setHover(true),
// //       onExit: (_) => _setHover(false),
// //       child: GestureDetector(
// //         onTapDown: (_) => _setPressed(true),
// //         onTapUp: (_) => _setPressed(false),
// //         onTapCancel: () => _setPressed(false),
// //         onTap: widget.onTap,
// //         child: AnimatedContainer(
// //           duration: const Duration(milliseconds: 160),
// //           transform: Matrix4.identity()..translate(0.0, lift)..scale(scale),
// //           decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.35), blurRadius: blur, offset: const Offset(0, 6))]),
// //           child: Opacity(opacity: opacity, child: widget.child),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class AnimatedHoverButton extends StatefulWidget {
// //   final Widget child;
// //   final VoidCallback? onTap;
// //   const AnimatedHoverButton({required this.child, this.onTap, super.key});

// //   @override
// //   State<AnimatedHoverButton> createState() => _AnimatedHoverButtonState();
// // }

// // class _AnimatedHoverButtonState extends State<AnimatedHoverButton> {
// //   bool _hover = false;
// //   bool _pressed = false;
// //   @override
// //   Widget build(BuildContext context) {
// //     final scale = _hover ? 1.02 : 1.0;
// //     final opacity = _pressed ? 0.9 : 1.0;
// //     return MouseRegion(
// //       onEnter: (_) => setState(() => _hover = true),
// //       onExit: (_) => setState(() => _hover = false),
// //       child: GestureDetector(
// //         onTapDown: (_) => setState(() => _pressed = true),
// //         onTapUp: (_) => setState(() => _pressed = false),
// //         onTapCancel: () => setState(() => _pressed = false),
// //         onTap: widget.onTap,
// //         child: AnimatedContainer(
// //           duration: const Duration(milliseconds: 140),
// //           transform: Matrix4.identity()..scale(scale),
// //           child: Opacity(opacity: opacity, child: widget.child),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // /// ---------------------- Chat Panel ----------------------
// // class ChatPanel extends StatefulWidget {
// //   const ChatPanel({super.key});

// //   @override
// //   State<ChatPanel> createState() => _ChatPanelState();
// // }

// // class _ChatPanelState extends State<ChatPanel> {
// //   final List<_Message> _messages = [
// //     _Message(sender: 'Alex Chen', text: 'Hey! Have you reviewed the latest update?', time: '10:45 AM', mine: false),
// //     _Message(sender: 'You', text: 'Yes, looks great! Testing remaining parts.', time: '10:46 AM', mine: true),
// //     _Message(sender: 'Alex Chen', text: 'Cool, let’s finalize by evening.', time: '10:47 AM', mine: false),
// //   ];

// //   final TextEditingController _ctrl = TextEditingController();
// //   final ScrollController _scroll = ScrollController();
// //   bool _typing = false;

// //   void _sendMessage() {
// //     final t = _ctrl.text.trim();
// //     if (t.isEmpty) return;
// //     setState(() {
// //       _messages.add(_Message(sender: 'You', text: t, time: _now(), mine: true));
// //       _ctrl.clear();
// //       _typing = false;
// //     });
// //     Timer(const Duration(milliseconds: 160), () {
// //       _scroll.animateTo(_scroll.position.maxScrollExtent + 100, duration: const Duration(milliseconds: 280), curve: Curves.easeOut);
// //     });
// //   }

// //   String _now() {
// //     final now = DateTime.now();
// //     final hour = now.hour == 0 ? 12 : (now.hour > 12 ? now.hour - 12 : now.hour);
// //     final minute = now.minute.toString().padLeft(2, '0');
// //     final ampm = now.hour >= 12 ? 'PM' : 'AM';
// //     return '$hour:$minute $ampm';
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: 380,
// //       color: const Color(0xFF151515),
// //       child: Column(
// //         children: [
// //           // Top header
// //           Container(
// //             padding: const EdgeInsets.symmetric(horizontal: AppTokens.s4, vertical: AppTokens.s3),
// //             child: Row(
// //               children: const [
// //                 Text('Conversation', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
// //                 SizedBox(width: AppTokens.s3),
// //                 Chip(label: Text('3'), backgroundColor: Colors.white10),
// //                 Spacer(),
// //                 CircleAvatar(radius: 16, backgroundColor: Colors.grey, child: Icon(Icons.person, color: Colors.white, size: 16)),
// //                 SizedBox(width: AppTokens.s2),
// //                 Text('Alex Chen', style: TextStyle(fontWeight: FontWeight.w600)),
// //               ],
// //             ),
// //           ),
// //           const Divider(height: 1, color: Colors.black26),
// //           // Messages
// //           Expanded(
// //             child: Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3, vertical: AppTokens.s3),
// //               child: ListView.builder(
// //                 controller: _scroll,
// //                 itemCount: _messages.length + (_typing ? 1 : 0),
// //                 itemBuilder: (context, index) {
// //                   if (_typing && index == _messages.length) {
// //                     return _TypingIndicator();
// //                   }
// //                   final m = _messages[index];
// //                   // group consecutive messages from same sender visually
// //                   final bool lastFromSame = index > 0 && _messages[index - 1].sender == m.sender;
// //                   return Padding(
// //                     padding: EdgeInsets.only(top: lastFromSame ? 4 : 12),
// //                     child: HoverChatBubble(message: m),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ),
// //           // Input area
// //           Container(
// //             padding: const EdgeInsets.all(AppTokens.s3),
// //             child: Row(
// //               children: [
// //                 Expanded(
// //                   child: Container(
// //                     padding: const EdgeInsets.symmetric(horizontal: AppTokens.s3),
// //                     decoration: BoxDecoration(color: const Color(0xFF232323), borderRadius: BorderRadius.circular(AppTokens.radiusMd)),
// //                     child: Row(
// //                       children: [
// //                         Expanded(
// //                           child: TextField(
// //                             controller: _ctrl,
// //                             decoration: const InputDecoration.collapsed(hintText: 'Type your message...'),
// //                             style: const TextStyle(color: Colors.white),
// //                             onChanged: (v) => setState(() => _typing = v.trim().isNotEmpty),
// //                             onSubmitted: (_) => _sendMessage(),
// //                           ),
// //                         ),
// //                         IconButton(onPressed: () {}, icon: const Icon(Icons.attach_file, color: Colors.white54)),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(width: AppTokens.s2),
// //                 AnimatedHoverButton(
// //                   onTap: _typing ? _sendMessage : null,
// //                   child: Container(
// //                     decoration: BoxDecoration(color: _typing ? const Color(0xFF00C774) : Colors.white12, borderRadius: BorderRadius.circular(AppTokens.radiusSm)),
// //                     padding: const EdgeInsets.all(12),
// //                     child: Icon(Icons.send, color: _typing ? Colors.white : Colors.white70),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class _Message {
// //   final String sender;
// //   final String text;
// //   final String time;
// //   final bool mine;
// //   const _Message({required this.sender, required this.text, required this.time, required this.mine});
// // }

// // class HoverChatBubble extends StatefulWidget {
// //   final _Message message;
// //   const HoverChatBubble({required this.message, super.key});

// //   @override
// //   State<HoverChatBubble> createState() => _HoverChatBubbleState();
// // }

// // class _HoverChatBubbleState extends State<HoverChatBubble> {
// //   bool _hover = false;

// //   @override
// //   Widget build(BuildContext context) {
// //     final isMine = widget.message.mine;
// //     final bg = isMine ? const Color(0xFF1B4F2F) : const Color(0xFF262626);
// //     final align = isMine ? Alignment.centerRight : Alignment.centerLeft;
// //     final cross = isMine ? CrossAxisAlignment.end : CrossAxisAlignment.start;
// //     final textColor = isMine ? Colors.white : Colors.white;
// //     final lift = _hover ? -4.0 : 0.0;
// //     return MouseRegion(
// //       onEnter: (_) => setState(() => _hover = true),
// //       onExit: (_) => setState(() => _hover = false),
// //       child: AnimatedContainer(
// //         duration: const Duration(milliseconds: 160),
// //         transform: Matrix4.identity()..translate(0.0, lift),
// //         child: Align(
// //           alignment: align,
// //           child: Container(
// //             constraints: const BoxConstraints(maxWidth: 280),
// //             decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(10)),
// //             padding: const EdgeInsets.all(12),
// //             child: Column(
// //               crossAxisAlignment: cross,
// //               children: [
// //                 if (!isMine) Text(widget.message.sender, style: TextStyle(color: Colors.white70, fontSize: 12, fontWeight: FontWeight.w700)),
// //                 const SizedBox(height: 6),
// //                 Text(widget.message.text, style: TextStyle(color: textColor)),
// //                 const SizedBox(height: 8),
// //                 Text(widget.message.time, style: TextStyle(color: Colors.white54, fontSize: 11)),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class _TypingIndicator extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Align(
// //       alignment: Alignment.centerLeft,
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
// //         decoration: BoxDecoration(color: const Color(0xFF262626), borderRadius: BorderRadius.circular(10)),
// //         child: Row(
// //           mainAxisSize: MainAxisSize.min,
// //           children: const [
// //             SizedBox(width: 6),
// //             Dot(),
// //             SizedBox(width: 6),
// //             Dot(delay: 120),
// //             SizedBox(width: 6),
// //             Dot(delay: 240),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class Dot extends StatefulWidget {
// //   final int delay;
// //   const Dot({this.delay = 0, super.key});
// //   @override
// //   State<Dot> createState() => _DotState();
// // }

// // class _DotState extends State<Dot> with SingleTickerProviderStateMixin {
// //   late final AnimationController _c;
// //   late final Animation<double> _a;
// //   @override
// //   void initState() {
// //     super.initState();
// //     _c = AnimationController(vsync: this, duration: const Duration(milliseconds: 600))..repeat(reverse: true);
// //     _a = Tween<double>(begin: 0.35, end: 1.0).animate(CurvedAnimation(parent: _c, curve: Curves.easeInOut));
// //     if (widget.delay > 0) Future.delayed(Duration(milliseconds: widget.delay), () => _c.forward());
// //   }

// //   @override
// //   void dispose() {
// //     _c.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return FadeTransition(
// //       opacity: _a,
// //       child: Container(width: 6, height: 6, decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white70)),
// //     );
// //   }
// // }
