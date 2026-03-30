import 'package:flutter/material.dart';
import '../../data/chapter41_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter41Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter41Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ─── Core chat bubble builder ──────────────────────────────────────────────

  Widget _chatBubble({
    required String speaker,
    required String hindi,
    required String english,
    required bool isSelf,
    required Color color,
  }) {
    final bubbleColor = isSelf ? color : AppColors.surface;
    final textColor = isSelf ? Colors.white : AppColors.textPrimary;
    final englishColor = isSelf ? Colors.white.withOpacity(0.85) : color;
    final speakerColor = isSelf ? color : AppColors.textSecondary;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment:
            isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isSelf) ...[
            CircleAvatar(
              radius: 16,
              backgroundColor: color.withOpacity(0.15),
              child: Text(
                speaker[0],
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: color,
                    fontWeight: FontWeight.w800,
                    fontSize: 13),
              ),
            ),
            const SizedBox(width: 6),
          ],
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 290),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isSelf ? color : AppColors.surface,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: isSelf
                      ? const Radius.circular(16)
                      : const Radius.circular(4),
                  bottomRight: isSelf
                      ? const Radius.circular(4)
                      : const Radius.circular(16),
                ),
                boxShadow: AppShadows.card,
                border:
                    isSelf ? null : Border.all(color: color.withOpacity(0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Speaker label
                  Text(
                    speaker,
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        color: isSelf
                            ? Colors.white.withOpacity(0.7)
                            : speakerColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 10),
                  ),
                  const SizedBox(height: 3),
                  // Hindi text
                  Text(hindi,
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12)),
                  const SizedBox(height: 4),
                  // Divider
                  Divider(
                    color: isSelf
                        ? Colors.white.withOpacity(0.25)
                        : color.withOpacity(0.2),
                    height: 6,
                    thickness: 0.5,
                  ),
                  // English text + TTS
                  Row(
                    children: [
                      Expanded(
                        child: Text(english,
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                color: englishColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                                fontStyle: FontStyle.italic)),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () {}, // TTS handled by commonWidgets
                        borderRadius: BorderRadius.circular(AppRadius.full),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Icon(Icons.volume_up_rounded,
                              size: 15,
                              color: isSelf
                                  ? Colors.white.withOpacity(0.7)
                                  : color.withOpacity(0.7)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (isSelf) ...[
            const SizedBox(width: 6),
            CircleAvatar(
              radius: 16,
              backgroundColor: color.withOpacity(0.15),
              child: Text(
                speaker[0],
                style: TextStyle(
                    fontFamily: 'Nunito',
                    color: color,
                    fontWeight: FontWeight.w800,
                    fontSize: 13),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildConversation({
    required List<Map<String, dynamic>> data,
    required Color color,
    required String title,
    required String titleHindi,
    required String context,
    required String emoji,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Context card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [color, color.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 40)),
              const SizedBox(height: 6),
              Text(title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800)),
              Text(titleHindi,
                  style: const TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white70,
                      fontSize: 12)),
              if (context.isNotEmpty) ...[
                const SizedBox(height: AppSpacing.sm),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(AppRadius.md),
                  ),
                  child: Text(context,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        // Chat legend
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md, vertical: 8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.05),
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 6),
              Text('Hindi ऊपर | English नीचे (italics)',
                  style: AppTextStyles.labelSmall.copyWith(color: color)),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        // Chat bubbles
        ...data.map((turn) => _chatBubble(
              speaker: turn['speaker'] as String,
              hindi: turn['hindi'] as String,
              english: turn['english'] as String,
              isSelf: turn['isSelf'] as bool,
              color: color,
            )),
      ],
    );
  }

  // ─── L1: Conv 1 — Doctor ──────────────────────────────────────────────────
  Widget buildConv1Content() {
    return _buildConversation(
      data: Chapter41Data.conv1,
      color: accentColor,
      title: 'Conversation 1 — Doctor Visit',
      titleHindi: 'डॉक्टर के पास',
      emoji: '🏥',
      context: 'Rakesh visits Dr. Bansal for a persistent headache.',
    );
  }

  // ─── L2: Conv 2 — Shopping ────────────────────────────────────────────────
  Widget buildConv2Content() {
    return _buildConversation(
      data: Chapter41Data.conv2,
      color: AppColors.primary,
      title: 'Conversation 2 — Shopping',
      titleHindi: 'खरीददारी',
      emoji: '🛍️',
      context: 'Seema shops for a teddy bear to gift to someone.',
    );
  }

  // ─── L3: Conv 3 — Teacher & Student ───────────────────────────────────────
  Widget buildConv3Content() {
    return _buildConversation(
      data: Chapter41Data.conv3,
      color: AppColors.success,
      title: 'Conversation 3 — Teacher & Student',
      titleHindi: 'अध्यापक और छात्र',
      emoji: '📚',
      context: 'Priya explains to Mr. Sharma why homework is incomplete.',
    );
  }

  // ─── L4: Conv 4 — Friends (Trouble) ───────────────────────────────────────
  Widget buildConv4Content() {
    return _buildConversation(
      data: Chapter41Data.conv4,
      color: AppColors.warning,
      title: 'Conversation 4 — Friends (Trouble)',
      titleHindi: 'दोस्त — मुश्किल में',
      emoji: '🤝',
      context: 'Kamal notices Sagar is sad and tries to help him.',
    );
  }

  // ─── L5: Conv 5 — Friends (Good News) ─────────────────────────────────────
  Widget buildConv5Content() {
    return _buildConversation(
      data: Chapter41Data.conv5,
      color: const Color(0xFF7C3AED),
      title: 'Conversation 5 — Friends (Good News)',
      titleHindi: 'दोस्त — खुशखबरी',
      emoji: '🎉',
      context:
          'Ram shares exciting news with Shyam about his promotion and marriage.',
    );
  }

  // ─── L6: Conv 6 — Feelings ────────────────────────────────────────────────
  Widget buildConv6Content() {
    return _buildConversation(
      data: Chapter41Data.conv6,
      color: AppColors.accent,
      title: 'Conversation 6 — Feelings',
      titleHindi: 'भावनाएं',
      emoji: '💬',
      context: 'Rohit meets Shalini and opens up about his feelings.',
    );
  }

  // ─── L7: Conv 7 — Classroom ───────────────────────────────────────────────
  Widget buildConv7Content() {
    return _buildConversation(
      data: Chapter41Data.conv7,
      color: AppColors.accentGold,
      title: 'Conversation 7 — Classroom',
      titleHindi: 'कक्षा',
      emoji: '🎓',
      context:
          'Teacher checks understanding; students discuss a Math question.',
    );
  }

  // ─── L8: Conv 8 — Gym ─────────────────────────────────────────────────────
  Widget buildConv8Content() {
    return _buildConversation(
      data: Chapter41Data.conv8,
      color: AppColors.error,
      title: 'Conversation 8 — Gym',
      titleHindi: 'जिम',
      emoji: '💪',
      context: 'Rohan and Sohan meet at the gym and discuss fitness.',
    );
  }

  // ─── L9: Conv 9 — Flatmates ───────────────────────────────────────────────
  Widget buildConv9Content() {
    return _buildConversation(
      data: Chapter41Data.conv9,
      color: AppColors.primary,
      title: 'Conversation 9 — Flatmates',
      titleHindi: 'अकेले रहना',
      emoji: '🏠',
      context:
          'Saleem calls Salman; they talk about the challenges of living alone.',
    );
  }

  Widget buildConv10Content() {
    return _buildConversation(
      data: Chapter41Data.conv10,
      color: AppColors.primary,
      title: 'Conversation 10 — Employee & Employer',
      titleHindi: 'कर्मचारी और नियोक्ता',
      emoji: '💼',
      context:
          'Raju asks his employer for help with his mother\'s medical expenses.',
    );
  }

// ─── L11: Conv 11 — Family Search ───────────────────────────────────────────
  Widget buildConv11Content() {
    return _buildConversation(
      data: Chapter41Data.conv11,
      color: AppColors.success,
      title: 'Conversation 11 — Family Search',
      titleHindi: 'परिवार की खोज',
      emoji: '🔍',
      context:
          'Rohan searches for his mom and finds her at the neighbor\'s house.',
    );
  }

// ─── L12: Conv 12 — Rakhi Celebration ───────────────────────────────────────
  Widget buildConv12Content() {
    return _buildConversation(
      data: Chapter41Data.conv12,
      color: const Color(0xFFE91E63), // Pink for Rakhi
      title: 'Conversation 12 — Rakhi Celebration',
      titleHindi: 'राखी उत्सव',
      emoji: '🎀',
      context:
          'Brother and sister celebrate Rakhi with a special surprise gift.',
    );
  }

// ─── L13: Conv 13 — Book Money ──────────────────────────────────────────────
  Widget buildConv13Content() {
    return _buildConversation(
      data: Chapter41Data.conv13,
      color: const Color(0xFF9C27B0), // Purple
      title: 'Conversation 13 — Book Money',
      titleHindi: 'किताबों के पैसे',
      emoji: '📖',
      context:
          'Shanti asks Ruchi about money their mom tried to give for books.',
    );
  }

// ─── L14: Conv 14 — Placement Discussion ────────────────────────────────────
  Widget buildConv14Content() {
    return _buildConversation(
      data: Chapter41Data.conv14,
      color: const Color(0xFF00BCD4), // Cyan
      title: 'Conversation 14 — Placement Discussion',
      titleHindi: 'प्लेसमेंट चर्चा',
      emoji: '🎯',
      context:
          'Professor discusses placement concerns with ambitious student Rahul.',
    );
  }

// ─── L15: Conv 15 — Bus Travel ──────────────────────────────────────────────
  Widget buildConv15Content() {
    return _buildConversation(
      data: Chapter41Data.conv15,
      color: const Color(0xFFFF9800), // Orange
      title: 'Conversation 15 — Bus Travel',
      titleHindi: 'बस यात्रा',
      emoji: '🚌',
      context: 'Two passengers discuss the challenges of daily bus commute.',
    );
  }

// ─── L16: Conv 16 — Old Friend ──────────────────────────────────────────────
  Widget buildConv16Content() {
    return _buildConversation(
      data: Chapter41Data.conv16,
      color: const Color(0xFF4CAF50), // Green
      title: 'Conversation 16 — Old Friend',
      titleHindi: 'पुराना दोस्त',
      emoji: '📞',
      context: 'Rakesh calls Rahul after disappearing during tough times.',
    );
  }

// ─── L17: Conv 17 — Bank Loan ───────────────────────────────────────────────
  Widget buildConv17Content() {
    return _buildConversation(
      data: Chapter41Data.conv17,
      color: const Color(0xFF3F51B5), // Indigo
      title: 'Conversation 17 — Bank Loan',
      titleHindi: 'बैंक लोन',
      emoji: '🏦',
      context:
          'Customer inquires about outstanding loan balance and interest charges.',
    );
  }

// ─── L18: Conv 18 — Bus Conductor ───────────────────────────────────────────
  Widget buildConv18Content() {
    return _buildConversation(
      data: Chapter41Data.conv18,
      color: const Color(0xFFCDDC39), // Lime
      title: 'Conversation 18 — Bus Conductor',
      titleHindi: 'बस कंडक्टर',
      emoji: '🎫',
      context: 'Aman argues with conductor about fare to Ghaziabad vs Delhi.',
    );
  }

// ─── L19: Conv 19 — Manager & Employee ──────────────────────────────────────
  Widget buildConv19Content() {
    return _buildConversation(
      data: Chapter41Data.conv19,
      color: const Color(0xFF009688), // Teal
      title: 'Conversation 19 — Manager & Employee',
      titleHindi: 'प्रबंधक और कर्मचारी',
      emoji: '👔',
      context: 'Manager advises Pooja about balancing work and personal life.',
    );
  }

// ─── L20: Conv 20 — Shopping for Suit ───────────────────────────────────────
  Widget buildConv20Content() {
    return _buildConversation(
      data: Chapter41Data.conv20,
      color: const Color(0xFFFF6B6B), // Coral
      title: 'Conversation 20 — Shopping for Suit',
      titleHindi: 'सूट खरीदारी',
      emoji: '👗',
      context:
          'Ruby shops for a suit for her cousin\'s wedding with bargaining.',
    );
  }

// ─── L21: Conv 21 — Morning Routine ─────────────────────────────────────────
  Widget buildConv21Content() {
    return _buildConversation(
      data: Chapter41Data.conv21,
      color: const Color(0xFFFFA500), // Orange
      title: 'Conversation 21 — Morning Routine',
      titleHindi: 'सुबह की दिनचर्या',
      emoji: '🌅',
      context: 'Family tries to wake up Rahul on a Sunday morning.',
    );
  }

// ─── L22: Conv 22 — Classroom Training ──────────────────────────────────────
  Widget buildConv22Content() {
    return _buildConversation(
      data: Chapter41Data.conv22,
      color: const Color(0xFF2196F3), // Blue
      title: 'Conversation 22 — Classroom Training',
      titleHindi: 'कक्षा प्रशिक्षण',
      emoji: '📝',
      context:
          'Teacher Aditya calls Pavitra about special Sunday training session.',
    );
  }

// ─── L23: Conv 23 — Doctor Visit 2 ──────────────────────────────────────────
  Widget buildConv23Content() {
    return _buildConversation(
      data: Chapter41Data.conv23,
      color: const Color(0xFFE91E63), // Pink
      title: 'Conversation 23 — Doctor Visit 2',
      titleHindi: 'डॉक्टर के पास 2',
      emoji: '🩺',
      context:
          'Sagar visits doctor for fever and anxiety; gets medication and advice.',
    );
  }

// ─── L24: Conv 24 — Job Hunt ────────────────────────────────────────────────
  Widget buildConv24Content() {
    return _buildConversation(
      data: Chapter41Data.conv24,
      color: const Color(0xFF4CAF50), // Green
      title: 'Conversation 24 — Job Hunt',
      titleHindi: 'नौकरी की तलाश',
      emoji: '💼',
      context:
          'Saleem offers to help his friend Ravi get a job in his company.',
    );
  }

// ─── L25: Conv 25 — Interview Prep ──────────────────────────────────────────
  Widget buildConv25Content() {
    return _buildConversation(
      data: Chapter41Data.conv25,
      color: const Color(0xFF9C27B0), // Purple
      title: 'Conversation 25 — Interview Prep',
      titleHindi: 'साक्षात्कार की तैयारी',
      emoji: '🎤',
      context: 'Vivek seeks advice from Ram about interview preparation.',
    );
  }

// ─── L26: Conv 26 — Social Media ────────────────────────────────────────────
  Widget buildConv26Content() {
    return _buildConversation(
      data: Chapter41Data.conv26,
      color: const Color(0xFF3B82F6), // Bright Blue
      title: 'Conversation 26 — Social Media',
      titleHindi: 'सोशल मीडिया',
      emoji: '📱',
      context:
          'Abhishek and Ayushi discover they have mutual friends in Dehradun.',
    );
  }

// ─── L27: Conv 27 — Reunion ─────────────────────────────────────────────────
  Widget buildConv27Content() {
    return _buildConversation(
      data: Chapter41Data.conv27,
      color: const Color(0xFFF59E0B), // Amber
      title: 'Conversation 27 — Reunion',
      titleHindi: 'पुनर्मिलन',
      emoji: '🤝',
      context:
          'Bobby meets Nikhil after a long time; they visit Sagar together.',
    );
  }

// ─── L28: Conv 28 — Sick Day ────────────────────────────────────────────────
  Widget buildConv28Content() {
    return _buildConversation(
      data: Chapter41Data.conv28,
      color: const Color(0xFFEF4444), // Red
      title: 'Conversation 28 — Sick Day',
      titleHindi: 'बीमारी का दिन',
      emoji: '🤒',
      context: 'Husband stays home sick while wife manages family and calls.',
    );
  }

// ─── L29: Conv 29 — Job Referral ────────────────────────────────────────────
  Widget buildConv29Content() {
    return _buildConversation(
      data: Chapter41Data.conv29,
      color: const Color(0xFF10B981), // Emerald
      title: 'Conversation 29 — Job Referral',
      titleHindi: 'नौकरी के लिए सिफारिश',
      emoji: '⭐',
      context: 'Bikrant offers to refer Aman for a Sales Manager position.',
    );
  }

// ─── L30: Conv 30 — Party Meeting ───────────────────────────────────────────
  Widget buildConv30Content() {
    return _buildConversation(
      data: Chapter41Data.conv30,
      color: const Color(0xFF8B5CF6), // Violet
      title: 'Conversation 30 — Party Meeting',
      titleHindi: 'पार्टी में मुलाकात',
      emoji: '🎉',
      context: 'Mr. Rana meets Mr. Kumar and Mr. Rawat at a social gathering.',
    );
  }

  // ─── L10: Chapter Quiz Intro ──────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final colors = [
      accentColor,
      AppColors.primary,
      AppColors.success,
      AppColors.warning,
      const Color(0xFF7C3AED),
      AppColors.accent,
      AppColors.accentGold,
      AppColors.error,
      AppColors.primary,
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [accentColor, accentColor.withOpacity(0.7)]),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('🏆', style: TextStyle(fontSize: 56)),
              const SizedBox(height: AppSpacing.md),
              const Text('अध्याय 41 — फ़ाइनल क्विज़',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white70,
                      fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Written Conversations',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('10', 'प्रश्न'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('100', 'XP'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('9', 'Conversations'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('9 वार्तालापों का सारांश', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...Chapter41Data.convMeta.asMap().entries.map((e) {
          final i = e.key;
          final m = e.value;
          final c = colors[i % colors.length];
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.all(color: c.withOpacity(0.2)),
              boxShadow: AppShadows.card,
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      color: c.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(AppRadius.md)),
                  child: Center(
                    child:
                        Text(m['emoji']!, style: const TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(m['title']!,
                          style: AppTextStyles.labelLarge.copyWith(color: c)),
                      Text('${m['titleHindi']!} — ${m['speakers']!}',
                          style:
                              AppTextStyles.bodyMedium.copyWith(fontSize: 11)),
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: c.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  child: Text('${m['lines']!} lines',
                      style: AppTextStyles.labelSmall.copyWith(color: c)),
                ),
              ],
            ),
          );
        }),
        const SizedBox(height: AppSpacing.lg),
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.warning.withOpacity(0.08),
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: AppColors.warning.withOpacity(0.3)),
          ),
          child: const Row(
            children: [
              Text('💡', style: TextStyle(fontSize: 20)),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  '6/10 या उससे अधिक अंक लाने पर अगला अध्याय खुल जाएगा।\nScore 6/10 or more to unlock the next chapter!',
                  style: AppTextStyles.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
