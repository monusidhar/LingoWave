import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../data/chapter45_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter45Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter45Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ─── Shared: Full searchable dictionary widget ─────────────────────────────
  /// [letterFilter] = null means show all, else filter by first letter range
  Widget buildDictionaryScreen({
    required List<List<String>> words,
    required String sectionLabel,
  }) {
    return _DictionaryView(
      words: words,
      sectionLabel: sectionLabel,
      accentColor: accentColor,
      commonWidgets: commonWidgets,
    );
  }

  // ─── L1–L5: Dictionary sections ───────────────────────────────────────────
  Widget buildDictAEContent() => buildDictionaryScreen(
        words: Chapter45Data.wordsAE,
        sectionLabel: 'A – E',
      );

  Widget buildDictFJContent() => buildDictionaryScreen(
        words: Chapter45Data.wordsFJ,
        sectionLabel: 'F – J',
      );

  Widget buildDictKOContent() => buildDictionaryScreen(
        words: Chapter45Data.wordsKO,
        sectionLabel: 'K – O',
      );

  Widget buildDictPSContent() => buildDictionaryScreen(
        words: Chapter45Data.wordsPS,
        sectionLabel: 'P – S',
      );

  Widget buildDictTZContent() => buildDictionaryScreen(
        words: Chapter45Data.wordsTZ,
        sectionLabel: 'T – Z',
      );

  // ─── L6: Parts of Speech Guide ────────────────────────────────────────────
  Widget buildPOSContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'शब्दकोश में हर शब्द के साथ एक abbreviation (संक्षिप्त रूप) दिया जाता है जो उसका "Part of Speech" बताता है।',
          'Every dictionary word has a POS abbreviation showing its grammatical role.',
        ),
        const SizedBox(height: AppSpacing.lg),
        // Transitive vs Intransitive highlight
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('📘', style: TextStyle(fontSize: 36)),
              const SizedBox(height: 8),
              const Text('Transitive vs Intransitive',
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18)),
              const SizedBox(height: AppSpacing.md),
              Row(children: [
                Expanded(child: _posCompare('vt. (Transitive)', 'He moved the chair.\nObject = chair ✓', AppColors.success)),
                const SizedBox(width: 10),
                Expanded(child: _posCompare('vi. (Intransitive)', 'Dad smiled.\nNo object needed ✓', AppColors.warning)),
              ]),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('सभी Abbreviations', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter45Data.posFullForm.entries.map((e) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                boxShadow: AppShadows.card,
              ),
              child: Row(children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  child: Text(e.key,
                      style: const TextStyle(
                          fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 13)),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(child: Text(e.value, style: AppTextStyles.labelLarge.copyWith(fontSize: 13))),
              ]),
            )),
        const SizedBox(height: AppSpacing.lg),
        Text('उदाहरण (Examples)', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter45Data.posExamples.map((ex) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                border: Border.all(color: accentColor.withOpacity(0.2)),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(color: accentColor.withOpacity(0.1), borderRadius: BorderRadius.circular(AppRadius.full)),
                    child: Text(ex['pos']!, style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
                  ),
                  const SizedBox(width: 8),
                  Text(ex['example']!, style: AppTextStyles.labelLarge.copyWith(fontSize: 13)),
                ]),
                const SizedBox(height: 4),
                Text(ex['sentence']!,
                    style: AppTextStyles.bodyMedium.copyWith(fontStyle: FontStyle.italic, color: AppColors.textSecondary, fontSize: 12)),
              ]),
            )),
      ],
    );
  }

  Widget _posCompare(String title, String body, Color color) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: TextStyle(fontFamily: 'Nunito', color: color, fontWeight: FontWeight.w700, fontSize: 12)),
        const SizedBox(height: 4),
        Text(body, style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 11, height: 1.5)),
      ]),
    );
  }

  // ─── L10: Chapter Quiz Intro ──────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '🔤', 'title': 'Dictionary A–E', 'hi': 'Abandon to Extraordinary'},
      {'emoji': '📖', 'title': 'Dictionary F–J', 'hi': 'Fail to Justice'},
      {'emoji': '📚', 'title': 'Dictionary K–O', 'hi': 'Keen to Overcome'},
      {'emoji': '📝', 'title': 'Dictionary P–S', 'hi': 'Patience to Sympathy'},
      {'emoji': '🔡', 'title': 'Dictionary T–Z', 'hi': 'Talent to Zeal'},
      {'emoji': '🏷️', 'title': 'Parts of Speech', 'hi': 'n. vt. vi. adj. adv. conj. etc.'},
      {'emoji': '🧠', 'title': 'Word Quiz I & II', 'hi': 'English→Hindi & Hindi→English'},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [accentColor, accentColor.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(children: [
            const Text('🏆', style: TextStyle(fontSize: 56)),
            const SizedBox(height: AppSpacing.md),
            const Text('अध्याय 45 — फ़ाइनल क्विज़',
                style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
            const SizedBox(height: 4),
            const Text('Dictionary — Final Quiz',
                style: TextStyle(fontFamily: 'Nunito', color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: AppSpacing.md),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              commonWidgets.quizStatBadge('10', 'प्रश्न'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('100', 'XP'),
              const SizedBox(width: AppSpacing.md),
              commonWidgets.quizStatBadge('1500+', 'Words'),
            ]),
          ]),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('क्विज़ में शामिल टॉपिक', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...topics.map((t) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(color: AppColors.surface, borderRadius: BorderRadius.circular(AppRadius.md), boxShadow: AppShadows.card),
              child: Row(children: [
                Text(t['emoji']!, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: AppSpacing.md),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(t['title']!, style: AppTextStyles.labelLarge),
                  Text(t['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                ])),
                const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 18),
              ]),
            )),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.warning.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: AppColors.warning.withOpacity(0.3)),
          ),
          child: const Row(children: [
            Text('💡', style: TextStyle(fontSize: 20)),
            SizedBox(width: 8),
            Expanded(child: Text('6/10 या उससे अधिक पर अगला अध्याय खुलेगा।\nScore 6/10 or more to unlock the next chapter!', style: AppTextStyles.bodyMedium)),
          ]),
        ),
      ],
    );
  }
}

// ─── Stateful Dictionary View ──────────────────────────────────────────────
class _DictionaryView extends StatefulWidget {
  final List<List<String>> words;
  final String sectionLabel;
  final Color accentColor;
  final LessonCommonWidgets commonWidgets;

  const _DictionaryView({
    required this.words,
    required this.sectionLabel,
    required this.accentColor,
    required this.commonWidgets,
  });

  @override
  State<_DictionaryView> createState() => _DictionaryViewState();
}

class _DictionaryViewState extends State<_DictionaryView> {
  final TextEditingController _searchCtrl = TextEditingController();
  String _searchQuery = '';
  String _selectedPOS = 'All';
  String? _speakingWord;
  final FlutterTts _tts = FlutterTts();

  static const List<String> _posFilters = [
    'All', 'n.', 'vt.', 'vi.', 'adj.', 'adv.', 'conj.', 'prep.', 'pron.', 'modal', 'interj.',
  ];

  static const Map<String, Color> _posColors = {
    'n.': Color(0xFF4F46E5),
    'vt.': Color(0xFF059669),
    'vi.': Color(0xFF0891B2),
    'adj.': Color(0xFFD97706),
    'adv.': Color(0xFF7C3AED),
    'conj.': Color(0xFFDB2777),
    'prep.': Color(0xFF0F766E),
    'pron.': Color(0xFFDC2626),
    'modal': Color(0xFF1D4ED8),
    'interj.': Color(0xFF92400E),
    'det.': Color(0xFF6D28D9),
  };

  @override
  void initState() {
    super.initState();
    _tts.setLanguage('en-IN');
    _tts.setSpeechRate(0.42);
    _tts.setCompletionHandler(() { if (mounted) setState(() => _speakingWord = null); });
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    _tts.stop();
    super.dispose();
  }

  Future<void> _speak(String word) async {
    await _tts.stop();
    setState(() => _speakingWord = word);
    await _tts.speak(word);
  }

  List<List<String>> get _filtered {
    var list = widget.words;
    if (_selectedPOS != 'All') {
      list = list.where((w) => w[1] == _selectedPOS).toList();
    }
    if (_searchQuery.isNotEmpty) {
      final q = _searchQuery.toLowerCase();
      list = list.where((w) =>
          w[0].toLowerCase().contains(q) ||
          w[2].contains(q) ||
          w[3].contains(q)).toList();
    }
    return list;
  }

  Color _posColor(String pos) => _posColors[pos] ?? const Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    final filtered = _filtered;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [widget.accentColor, widget.accentColor.withOpacity(0.75)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Row(children: [
            const Text('📚', style: TextStyle(fontSize: 32)),
            const SizedBox(width: AppSpacing.md),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Section ${widget.sectionLabel}',
                  style: const TextStyle(fontFamily: 'Nunito', color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18)),
              Text('${widget.words.length} words | Tap word to hear',
                  style: const TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 12)),
            ]),
          ]),
        ),

        const SizedBox(height: AppSpacing.md),

        // Search bar
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.md),
            boxShadow: AppShadows.card,
          ),
          child: TextField(
            controller: _searchCtrl,
            onChanged: (v) => setState(() => _searchQuery = v),
            decoration: InputDecoration(
              hintText: 'खोजें — Search word or meaning...',
              hintStyle: AppTextStyles.bodyMedium.copyWith(color: AppColors.textHint),
              prefixIcon: Icon(Icons.search_rounded, color: widget.accentColor),
              suffixIcon: _searchQuery.isNotEmpty
                  ? GestureDetector(
                      onTap: () { _searchCtrl.clear(); setState(() => _searchQuery = ''); },
                      child: const Icon(Icons.close_rounded, color: AppColors.textHint))
                  : null,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 14),
            ),
          ),
        ),

        const SizedBox(height: AppSpacing.sm),

        // POS filter chips
        SizedBox(
          height: 36,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: _posFilters.length,
            separatorBuilder: (_, __) => const SizedBox(width: 6),
            itemBuilder: (context, i) {
              final pos = _posFilters[i];
              final isSelected = _selectedPOS == pos;
              final chipColor = pos == 'All' ? widget.accentColor : _posColor(pos);
              return GestureDetector(
                onTap: () => setState(() => _selectedPOS = pos),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? chipColor : chipColor.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(AppRadius.full),
                    border: Border.all(color: chipColor.withOpacity(0.4)),
                  ),
                  child: Text(pos,
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          color: isSelected ? Colors.white : chipColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 12)),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: AppSpacing.sm),

        // Result count
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: Row(children: [
            Text('${filtered.length} शब्द', style: AppTextStyles.labelSmall.copyWith(color: widget.accentColor, fontWeight: FontWeight.w700)),
            if (_searchQuery.isNotEmpty || _selectedPOS != 'All') ...[
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  _searchCtrl.clear();
                  setState(() { _searchQuery = ''; _selectedPOS = 'All'; });
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.error.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  child: Text('Reset', style: AppTextStyles.labelSmall.copyWith(color: AppColors.error)),
                ),
              ),
            ],
          ]),
        ),

        // Word list
        if (filtered.isEmpty)
          Container(
            padding: const EdgeInsets.all(AppSpacing.xl),
            alignment: Alignment.center,
            child: Column(children: [
              const Text('🔍', style: TextStyle(fontSize: 40)),
              const SizedBox(height: 8),
              Text('कोई शब्द नहीं मिला', style: AppTextStyles.bodyMedium),
              Text('No results found for "$_searchQuery"',
                  style: AppTextStyles.bodyMedium.copyWith(color: AppColors.textHint, fontSize: 12)),
            ]),
          )
        else
          ...filtered.asMap().entries.map((e) {
            final i = e.key;
            final word = e.value;
            // word[0]=English, word[1]=POS, word[2]=Pronunciation, word[3]=Hindi
            final posColor = _posColor(word[1]);
            final isSpeaking = _speakingWord == word[0];
            final isAlternate = i % 2 == 1;

            return GestureDetector(
              onTap: () => _speak(word[0]),
              child: Container(
                margin: const EdgeInsets.only(bottom: 6),
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 12),
                decoration: BoxDecoration(
                  color: isSpeaking
                      ? widget.accentColor.withOpacity(0.08)
                      : isAlternate
                          ? AppColors.surface
                          : AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(AppRadius.md),
                  border: isSpeaking
                      ? Border.all(color: widget.accentColor.withOpacity(0.4), width: 1.5)
                      : null,
                ),
                child: Row(children: [
                  // POS badge
                  Container(
                    width: 44,
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    decoration: BoxDecoration(
                      color: posColor.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(AppRadius.sm),
                      border: Border.all(color: posColor.withOpacity(0.3)),
                    ),
                    child: Text(word[1],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Nunito', color: posColor, fontWeight: FontWeight.w700, fontSize: 10)),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  // Word info
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [
                      Text(word[0],
                          style: AppTextStyles.labelLarge.copyWith(
                              color: isSpeaking ? widget.accentColor : AppColors.textPrimary,
                              fontSize: 14)),
                      const SizedBox(width: 6),
                      Text('(${word[2]})',
                          style: AppTextStyles.bodyMedium.copyWith(color: posColor, fontSize: 11)),
                    ]),
                    const SizedBox(height: 2),
                    Text(word[3],
                        style: AppTextStyles.bodyMedium.copyWith(fontSize: 12, color: AppColors.textSecondary)),
                  ])),
                  // TTS button
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 34,
                    height: 34,
                    decoration: BoxDecoration(
                      color: isSpeaking ? widget.accentColor : widget.accentColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isSpeaking ? Icons.stop_rounded : Icons.volume_up_rounded,
                      color: isSpeaking ? Colors.white : widget.accentColor,
                      size: 16,
                    ),
                  ),
                ]),
              ),
            );
          }),
      ],
    );
  }
}