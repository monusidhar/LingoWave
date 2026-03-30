import 'package:flutter/material.dart';
import '../../data/chapter44_data.dart';
import '../../theme/app_theme.dart';
import '../common_widgets.dart';

class Chapter44Widgets {
  final LessonCommonWidgets commonWidgets;
  final Color accentColor;

  Chapter44Widgets({
    required this.commonWidgets,
    required this.accentColor,
  });

  // ─── Shared helpers ────────────────────────────────────────────────────────

  Widget _sectionHeader(String title, {String? sub}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm, top: AppSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyles.headingMedium),
          if (sub != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: accentColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppRadius.full),
              ),
              child: Text(sub, style: AppTextStyles.labelSmall.copyWith(color: accentColor)),
            ),
        ],
      ),
    );
  }

  Widget _infoBox(String text, {String emoji = '💡', Color? color}) {
    final c = color ?? accentColor;
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: c.withOpacity(0.07),
        borderRadius: BorderRadius.circular(AppRadius.lg),
        border: Border.all(color: c.withOpacity(0.25)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: AppTextStyles.bodyMedium)),
        ],
      ),
    );
  }

  /// Renders a dialogue bubble for interview conversations
  Widget _dialogBubble({
    required String speaker,
    required String text,
    required bool isInterviewer,
    String? note,
  }) {
    final bg = isInterviewer
        ? AppColors.primaryLight
        : accentColor.withOpacity(0.08);
    final nameColor = isInterviewer ? AppColors.primary : accentColor;
    final align = isInterviewer ? CrossAxisAlignment.start : CrossAxisAlignment.end;
    final mainAlign = isInterviewer ? MainAxisAlignment.start : MainAxisAlignment.end;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: align,
        children: [
          Row(
            mainAxisAlignment: mainAlign,
            children: [
              if (isInterviewer)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  child: Text(speaker,
                      style: const TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700)),
                ),
              if (!isInterviewer) ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: accentColor,
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                  child: Text(speaker,
                      style: const TextStyle(
                          fontFamily: 'Nunito',
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700)),
                ),
              ],
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: mainAlign,
            children: [
              if (!isInterviewer) const Spacer(),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 280),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: bg,
                    borderRadius: BorderRadius.circular(AppRadius.md),
                    border: Border.all(
                      color: isInterviewer
                          ? AppColors.primary.withOpacity(0.2)
                          : accentColor.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(text,
                                style: AppTextStyles.bodyMedium.copyWith(
                                    fontSize: 13, height: 1.4)),
                          ),
                          if (!isInterviewer) ...[
                            const SizedBox(width: 6),
                            commonWidgets.ttsButton(text, color: accentColor),
                          ],
                        ],
                      ),
                      if (note != null) ...[
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.warning.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(AppRadius.sm),
                          ),
                          child: Text('📌 $note',
                              style: AppTextStyles.labelSmall.copyWith(
                                  color: AppColors.warning, fontSize: 10)),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              if (isInterviewer) const Spacer(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _interviewCard({
    required String number,
    required String candidate,
    required String role,
    required List<Widget> dialogues,
    required List<String> highlights,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.xl),
        boxShadow: AppShadows.card,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [accentColor, accentColor.withOpacity(0.75)],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(number,
                        style: const TextStyle(
                            fontFamily: 'Nunito',
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 16)),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(candidate,
                          style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 16)),
                      Text(role,
                          style: const TextStyle(
                              fontFamily: 'Nunito',
                              color: Colors.white70,
                              fontSize: 12)),
                    ],
                  ),
                ),
                const Text('🎙️', style: TextStyle(fontSize: 24)),
              ],
            ),
          ),

          // Dialogue
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...dialogues,
                if (highlights.isNotEmpty) ...[
                  const Divider(height: 24),
                  Text('✅ Key Takeaways',
                      style: AppTextStyles.labelLarge.copyWith(color: AppColors.success)),
                  const SizedBox(height: 8),
                  ...highlights.map((h) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• ', style: TextStyle(color: AppColors.success)),
                            Expanded(
                              child: Text(h, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                            ),
                          ],
                        ),
                      )),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─── L1: Interview Tips ────────────────────────────────────────────────────
  Widget buildTipsContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इंटरव्यू में confident और natural रहें। घबराएं नहीं। यहाँ 12 real interview samples हैं — call center और BPO के लिए।',
          'Stay confident and natural in interviews. Practice with these 12 real BPO/call center interview samples.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Hero card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.lg),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [accentColor, accentColor.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: const [
              Text('💼', style: TextStyle(fontSize: 48)),
              SizedBox(height: 8),
              Text('Interview Preparation',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              SizedBox(height: 4),
              Text('इंटरव्यू की तैयारी',
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),
        _sectionHeader('ज़रूरी Tips', sub: '6 tips'),
        ...Chapter44Data.interviewTips.map((tip) => Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.sm),
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                boxShadow: AppShadows.card,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tip['emoji']!, style: const TextStyle(fontSize: 26)),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tip['tip']!, style: AppTextStyles.labelLarge),
                        const SizedBox(height: 2),
                        Text(tip['detail']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              ),
            )),

        const SizedBox(height: AppSpacing.md),
        _infoBox(
          '"Practice makes a man perfect." — Mock interviews with friends build real confidence.',
          emoji: '🎭',
          color: AppColors.success,
        ),
      ],
    );
  }

  // ─── L2: Interview I & II ──────────────────────────────────────────────────
  Widget buildInterview1Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Rahul और Aditya के real interview conversations पढ़ें और सीखें।',
          'Read and learn from Rahul\'s and Aditya\'s real interview conversations.',
        ),
        const SizedBox(height: AppSpacing.lg),

        _interviewCard(
          number: 'I',
          candidate: 'Rahul',
          role: 'B.Tech Graduate — BPO Fresher',
          dialogues: [
              _dialogBubble(speaker: 'Rahul', text: 'May I come in sir?', isInterviewer: false),
            _dialogBubble(speaker: 'Interviewer', text: 'Yes please. Have a seat.', isInterviewer: true),
            _dialogBubble(speaker: 'Interviewer', text: 'Tell me something about yourself?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Rahul',
              text: 'Sir, I am Rahul, 23 years old. I belong to Dehradun. I have done B.Tech from MITTE University in 2011. We are four members in family...',
              isInterviewer: false,
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'You have done B.Tech so what\'s the point of coming in BPO industry?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Rahul',
              text: 'Sir, BPO industry is a booming industry. As far as I know, 75% of IT revenue comes from this industry. There are good opportunities.',
              isInterviewer: false,
              note: '"As far as I know" — great phrase to use!',
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'Do you know what BPO stands for?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Rahul',
              text: 'Yes sir, it\'s Business Process Outsourcing.',
              isInterviewer: false,
            ),
          ],
          highlights: [
            'Use "As far as I know" when sharing information you\'re confident about.',
            'Always know the full form of industry terms like BPO.',
            'When asked why BPO after B.Tech — give a positive answer about industry growth.',
          ],
        ),

        _interviewCard(
          number: 'II',
          candidate: 'Aditya Rana',
          role: '6 Years BPO Experience — Team Leader',
          dialogues: [
            _dialogBubble(speaker: 'Interviewer', text: 'Tell me something about yourself?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Aditya',
              text: 'Ma\'am, I\'ve got 6 years experience with international BPOs; 4 years UK inbound and 2 years US outbound. My hobby is reading biographies.',
              isInterviewer: false,
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'Which is your all time favorite biography?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Aditya',
              text: 'A Beautiful Mind — it\'s based on genius mathematician John Nash.',
              isInterviewer: false,
              note: 'Only mention hobbies you know deeply!',
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'What qualities must a team leader have?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Aditya',
              text: 'Good product knowledge, welcome ideas from team, maintain professional relationships, audit calls, give feedback, be impartial, and listen to team problems.',
              isInterviewer: false,
            ),
          ],
          highlights: [
            'Only raise hobbies you know deeply — interviewer WILL ask related questions.',
            'A complete, structured answer to "team leader qualities" shows leadership maturity.',
            '"Pleasure talking to you" is always a great closing line.',
          ],
        ),
      ],
    );
  }

  // ─── L3: Interview III & IV ────────────────────────────────────────────────
  Widget buildInterview2Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Pooja और Renu के interviews से city description और MBA relevance जैसे smart answers सीखें।',
          'Learn smart answers on city description, MBA relevance and salary from Pooja & Renu\'s interviews.',
        ),
        const SizedBox(height: AppSpacing.lg),

        _interviewCard(
          number: 'III',
          candidate: 'Pooja',
          role: 'BA Graduate — Fresher',
          dialogues: [
            _dialogBubble(speaker: 'Interviewer', text: 'Tell me something about Dehradun?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Pooja',
              text: 'Sir, Dehradun is a beautiful city. It is the capital of Uttarakhand. Climate is very good. It\'s a green & clean city known for quality education.',
              isInterviewer: false,
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'How did you like Delhi?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Pooja',
              text: 'Sir, Delhi is a big city. I don\'t like it much because pollution is too much and crime rate is very high.',
              isInterviewer: false,
              note: 'Honest answer — balanced with facts.',
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'Tell me something about your mother?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Pooja',
              text: 'Sir, my mother is a housewife but a post graduate in Physics. She is intelligent, cooks well, is a bit short tempered but just like my friend.',
              isInterviewer: false,
            ),
          ],
          highlights: [
            'When asked about a city — mention location, climate, facilities and what it is known for.',
            'Describing family: mention their background, qualities and your relationship with them.',
            'Honesty about likes/dislikes (Delhi) while being respectful is appreciated.',
          ],
        ),

        _interviewCard(
          number: 'IV',
          candidate: 'Renu',
          role: 'MBA Graduate — Fresher',
          dialogues: [
            _dialogBubble(speaker: 'Interviewer', text: 'How can your MBA benefit our organization?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Renu',
              text: 'Sir, MBA teaches communication and convincing skills. Such skills can certainly benefit the customer service department.',
              isInterviewer: false,
              note: 'Great way to connect qualification to the job role.',
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'What do you know about BPOs?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Renu',
              text: 'Sir, BPO stands for Business Process Outsourcing. When a company outsources its customer care to another company — it saves infrastructure cost and expertise requirement.',
              isInterviewer: false,
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'What about your salary expectations?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Renu',
              text: 'Sir, I am a fresher so whatever is there as per the company norms.',
              isInterviewer: false,
              note: 'Perfect fresher salary answer — shows humility.',
            ),
          ],
          highlights: [
            'Always connect your qualification to the job role when asked "how does X benefit us?"',
            'Freshers should not demand specific salary — "as per company norms" is best.',
            '"I have no issues but my core interest lies in..." — shows preference without being rigid.',
          ],
        ),
      ],
    );
  }

  // ─── L4: Interview V & VI ─────────────────────────────────────────────────
  Widget buildInterview3Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Priya और Pankaj के interviews से attitude और common mistakes सीखें।',
          'Learn positive attitude and common mistakes from Priya\'s and Pankaj\'s interviews.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Pankaj mistake highlight box
        _infoBox(
          'Pankaj ने "How are you doing?" का जवाब "I am doing nothing" दिया — यह गलत है!\n\n'
          'Correct: "I am fine." या "I am doing well."\n\n'
          'साथ ही "Take this" की जगह "Here it is." — ज़्यादा polite और professional है।',
          emoji: '❌',
          color: AppColors.error,
        ),

        _interviewCard(
          number: 'V',
          candidate: 'Priya',
          role: 'Post Graduate — Fresher (Teaching background)',
          dialogues: [
            _dialogBubble(speaker: 'Interviewer', text: 'Your mother is a teacher — why not apply for teaching job?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Priya',
              text: 'I applied but I couldn\'t get through.',
              isInterviewer: false,
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'If you get a teaching opportunity, you may leave us, right?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Priya',
              text: 'Not at all sir. If I get good working environment and growth opportunities based on my performance, there is no point to switch.',
              isInterviewer: false,
              note: 'Smart answer — committed without closing future doors.',
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'Customers might abuse you sometimes. Will you be able to handle?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Priya',
              text: 'Sir, I know that. My friends work in call centers. They have told me. I have no issues with that.',
              isInterviewer: false,
            ),
          ],
          highlights: [
            '"Not at all sir" — strong, confident denial of switching.',
            'Showing that you\'ve researched the job (friends in call center) shows preparedness.',
            'Saying "I have no issues" for rotational shifts/bonds shows flexibility.',
          ],
        ),

        _interviewCard(
          number: 'VI',
          candidate: 'Pankaj Koli',
          role: 'Graduate — Fresher',
          dialogues: [
            _dialogBubble(speaker: 'Interviewer', text: 'How are you doing Pankaj?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Pankaj',
              text: 'Ma\'am I am doing nothing.',
              isInterviewer: false,
              note: '❌ WRONG! Should be "I am fine/doing well"',
            ),
            _dialogBubble(speaker: 'Interviewer', text: '"How are you doing" means "How are you". (Corrects Pankaj)', isInterviewer: true),
            _dialogBubble(speaker: 'Pankaj', text: 'I am sorry ma\'am. I am fine.', isInterviewer: false),
            _dialogBubble(speaker: 'Interviewer', text: '(After Pankaj hands resume) Never say "take this", always say "here it is".', isInterviewer: true),
            _dialogBubble(
              speaker: 'Interviewer (Feedback)',
              text: 'Your grammar is good but pronunciation is a major issue. Work on it and try again.',
              isInterviewer: true,
              note: 'Grammar ≠ Pronunciation. Both matter.',
            ),
          ],
          highlights: [
            '"How are you doing" = "How are you" — answer with "I am fine/doing well".',
            '"Here it is" instead of "Take this" — always choose the polite form.',
            'Grammar and pronunciation are separate skills — both must be worked on.',
          ],
        ),
      ],
    );
  }

  // ─── L5: Interview VII & VIII ──────────────────────────────────────────────
  Widget buildInterview4Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Puneet और Arun के interviews से job switch reasons और problem-solving attitude सीखें।',
          'Learn how to explain job switches and show problem-solving attitude from Puneet\'s and Arun\'s interviews.',
        ),
        const SizedBox(height: AppSpacing.lg),

        _interviewCard(
          number: 'VII',
          candidate: 'Puneet Sharma',
          role: '3 Years BPO Experience',
          dialogues: [
            _dialogBubble(speaker: 'Interviewer', text: 'Why did you switch from Spectrastics?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Puneet',
              text: 'Sir, my family relocated from South Delhi to Noida. It was quite time consuming and the company wasn\'t providing cabs to Noida. Hence, I had no choice but to leave.',
              isInterviewer: false,
              note: 'Genuine reason — relocation. Not negative about employer.',
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'What is your strength?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Puneet',
              text: 'Sir, my strength is my comfortability with rotational shifts and my convincing skills, which can benefit the company.',
              isInterviewer: false,
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'What do you know about our company HMTC BPO?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Puneet',
              text: 'Sir, I\'ve heard it\'s a very good company. Three of my friends work here and are satisfied. One has been here for 3 years.',
              isInterviewer: false,
              note: 'Research via people who work there — smart preparation.',
            ),
          ],
          highlights: [
            'When explaining job switch — give genuine, non-negative reasons.',
            'Researching the company through employees there shows initiative.',
            'Connect your strength (convincing skills, shift comfort) to what the company needs.',
          ],
        ),

        _interviewCard(
          number: 'VIII',
          candidate: 'Arun',
          role: 'BA Graduate — Fresher',
          dialogues: [
            _dialogBubble(speaker: 'Interviewer', text: 'Can you tell me the name of Ashoka\'s father?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Arun',
              text: 'Sir, I can\'t remember now. It\'s been three years. I think it was Bindusar.',
              isInterviewer: false,
              note: 'Honest! Admitted uncertainty — correct approach.',
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'Are you comfortable with rotational shifts?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Arun',
              text: 'Yes sir. I truly believe one has to sacrifice something to achieve something better. Every job has pros and cons. I am comfortable.',
              isInterviewer: false,
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'We don\'t provide cabs in East Delhi. (Arun lives in East Delhi)', isInterviewer: true),
            _dialogBubble(
              speaker: 'Arun',
              text: 'Sir, do you provide cabs in South Delhi? I can relocate — my friend lives there and I can share his room.',
              isInterviewer: false,
              note: '⭐ Proactive problem-solving! Excellent response.',
            ),
          ],
          highlights: [
            'Honestly admitting "I can\'t remember" for history questions is better than guessing.',
            '"One has to sacrifice something to achieve something better" — great attitude answer.',
            'Proactively offering to relocate when cab issue arose — shows commitment and flexibility.',
          ],
        ),
      ],
    );
  }

  // ─── L6: Interview IX & X ─────────────────────────────────────────────────
  Widget buildInterview5Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Arpit के extempore practice और Saleem के "castles in the air" moment से सीखें।',
          'Learn from Arpit\'s extempore practice and Saleem\'s "castles in the air" moment.',
        ),
        const SizedBox(height: AppSpacing.lg),

        _infoBox(
          'Extempore क्या होता है?\n\n'
          'Interviewer एक word देता है और आपको बिना रुके उस पर बोलते रहना होता है।\n'
          'यह fluency, vocabulary और confidence को test करता है।',
          emoji: '🎤',
          color: AppColors.primary,
        ),

        _interviewCard(
          number: 'IX',
          candidate: 'Arpit Chauhan',
          role: 'Graduate — 6 Months Experience',
          dialogues: [
            _dialogBubble(speaker: 'Interviewer', text: 'Your hobby is playing cricket. How long is the cricket pitch?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Arpit',
              text: 'Sir, it is 22 yards.',
              isInterviewer: false,
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'Tell me about the position of Gully, cover, extra cover etc?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Arpit',
              text: 'Sir, not much idea of it.',
              isInterviewer: false,
              note: '⚠️ Lesson: Don\'t raise topics you can\'t explain fully.',
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'If you are not sure about something, never raise that topic. Now let\'s play Extempore — Black...', isInterviewer: true),
            _dialogBubble(
              speaker: 'Arpit',
              text: 'Sir, Black is my favorite color. I love to wear black clothes, particularly formal dresses. Black is a royal color...',
              isInterviewer: false,
              note: 'Great extempore! Kept speaking fluently.',
            ),
          ],
          highlights: [
            'Cricket pitch = 22 yards — useful fact!',
            'Never raise a topic in interview if you can\'t answer follow-up questions about it.',
            'Extempore tests fluency — keep talking naturally without stopping.',
          ],
        ),

        _interviewCard(
          number: 'X',
          candidate: 'Saleem',
          role: 'B.Com Graduate — Fresher',
          dialogues: [
            _dialogBubble(speaker: 'Interviewer', text: 'Tell me one strength and one weakness?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Saleem',
              text: 'Ma\'am, my strength is dedication. My weakness is poor computer skills — but I have joined computer coaching to improve.',
              isInterviewer: false,
              note: 'Perfect! Weakness + effort to overcome it.',
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'Give me reasons to hire you?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Saleem',
              text: 'Ma\'am, my dedication and positive attitude make me productive. I am confident I\'ll live up to your expectations.',
              isInterviewer: false,
            ),
            _dialogBubble(
              speaker: 'Interviewer',
              text: 'Saying is not enough — you must apply. Or else it\'s just like castles in the air.',
              isInterviewer: true,
              note: '"Castles in the air" = empty words without action.',
            ),
          ],
          highlights: [
            'Strength + Weakness + Effort to overcome weakness = perfect answer.',
            '"Give reasons to hire you" — connect skills to company benefits.',
            '"Castles in the air" = unrealistic dreams or empty promises without action.',
          ],
        ),
      ],
    );
  }

  // ─── L7: Interview XI & XII (Telephonic) ──────────────────────────────────
  Widget buildInterview6Content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'Telephonic interview और Sarita के movie narration जैसे unique moments से सीखें।',
          'Learn from telephonic interview etiquette and Sarita\'s excellent movie narration.',
        ),
        const SizedBox(height: AppSpacing.lg),

        _infoBox(
          'Telephonic Interview Tips:\n'
          '1. "Is it a convenient time to talk?" — always confirmed first\n'
          '2. शांत जगह पर रहें, background noise न हो\n'
          '3. Clearly और slowly बोलें\n'
          '4. Notes ready रखें — यह telephonic है',
          emoji: '📞',
          color: AppColors.primary,
        ),

        _interviewCard(
          number: 'XI',
          candidate: 'Priya Khanna',
          role: 'Graduate Fresher — Telephonic Round',
          dialogues: [
            _dialogBubble(
              speaker: 'Sadhvi (HR)',
              text: 'Hi Priya, I am Sadhvi from HR of Intellicon BPO. It\'s a telephonic interview. Is it a convenient time to talk to you?',
              isInterviewer: true,
              note: 'Always confirm convenience first!',
            ),
            _dialogBubble(speaker: 'Priya', text: 'Yes ma\'am.', isInterviewer: false),
            _dialogBubble(speaker: 'Sadhvi', text: 'Do you know about our company?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Priya',
              text: 'Ma\'am, to be honest with you I don\'t have much idea. I\'ve just heard that your company deals in UK outbound sales process.',
              isInterviewer: false,
              note: '"To be honest" — great honest phrase.',
            ),
            _dialogBubble(speaker: 'Sadhvi', text: 'Are you comfortable in outbound sales?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Priya',
              text: 'Yes ma\'am. I\'ve no problems at all. I can work in any campaign.',
              isInterviewer: false,
            ),
          ],
          highlights: [
            '"Is it a convenient time?" — always asked/confirmed in telephonic interviews.',
            '"To be honest with you, I don\'t have much idea" — honest admission respected.',
            'Showing flexibility for any campaign/process shows positive attitude.',
          ],
        ),

        _interviewCard(
          number: 'XII',
          candidate: 'Sarita',
          role: 'Graduation in Social Work',
          dialogues: [
            _dialogBubble(speaker: 'Interviewer', text: 'Which is your favorite movie?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Sarita',
              text: 'Titanic.',
              isInterviewer: false,
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'Can you narrate the story?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Sarita',
              text: 'Titanic is an Oscar winning movie — a ship sunk in Atlantic Ocean in 1912. Love story of Jack (ordinary) and Rose (rich). Jack sacrifices his life to save Rose. Leonardo DiCaprio played Jack, Kate Winslet played Rose.',
              isInterviewer: false,
              note: '⭐ Excellent narration — structured and complete.',
            ),
            _dialogBubble(speaker: 'Interviewer', text: 'If I say you work without salary for 3 months, will that be okay?', isInterviewer: true),
            _dialogBubble(
              speaker: 'Sarita',
              text: 'Ma\'am, considering my need of money, it would be difficult. However, if this is company policy, I\'ll manage somehow.',
              isInterviewer: false,
              note: 'Honest + flexible = elegant answer.',
            ),
          ],
          highlights: [
            'When asked about favorite movie — narrate it in a structured, engaging way.',
            'Sarita\'s "3 months no salary" answer: honest about difficulty but flexible — perfect balance.',
            '"Your response is elegant" — interviewer appreciated the balanced, honest answer.',
          ],
        ),
      ],
    );
  }

  // ─── L8: Key Phrases & Smart Answers ─────────────────────────────────────
  Widget buildPhrasesContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इंटरव्यू में ये phrases और smart answers ज़रूर याद रखें।',
          'Remember these key phrases and smart answers for your interview.',
        ),
        const SizedBox(height: AppSpacing.lg),

        _sectionHeader('ज़रूरी Phrases', sub: '10 phrases'),
        Container(
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            boxShadow: AppShadows.card,
          ),
          child: Column(
            children: Chapter44Data.keyPhrases.asMap().entries.map((e) {
              final i = e.key;
              final p = e.value;
              return Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  border: i < Chapter44Data.keyPhrases.length - 1
                      ? const Border(bottom: BorderSide(color: AppColors.lockedBg))
                      : null,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p['phrase']!,
                              style: AppTextStyles.labelLarge.copyWith(
                                  color: accentColor, fontSize: 13)),
                          Text(p['use']!,
                              style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                        ],
                      ),
                    ),
                    commonWidgets.ttsButton(p['phrase']!),
                  ],
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: AppSpacing.lg),
        _sectionHeader('Smart Q&A', sub: '8 questions'),
        ...Chapter44Data.mockQA.asMap().entries.map((e) {
          final i = e.key;
          final qa = e.value;
          return Container(
            margin: const EdgeInsets.only(bottom: AppSpacing.sm),
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
              boxShadow: AppShadows.card,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(color: accentColor, shape: BoxShape.circle),
                      child: Center(
                        child: Text('Q${i + 1}',
                            style: const TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 10)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(qa['q']!,
                          style: AppTextStyles.labelLarge.copyWith(color: AppColors.textPrimary)),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.07),
                    borderRadius: BorderRadius.circular(AppRadius.sm),
                    border: Border.all(color: AppColors.success.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(qa['a']!,
                            style: AppTextStyles.bodyMedium.copyWith(
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                                color: AppColors.success)),
                      ),
                      commonWidgets.ttsButton(qa['a']!, color: AppColors.success),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ],
    );
  }

  // ─── L9: Mock Interview Practice ──────────────────────────────────────────
  Widget buildMockContent() {
    final doList = [
      'Knock and say "May I come in sir/ma\'am?"',
      'Wait to be offered a seat — say "May I sit?" or "Thank you"',
      'Maintain eye contact throughout',
      'Say "Here it is" when handing resume',
      'Smile naturally — be confident',
      'End with "Thank you. It was a pleasure talking to you."',
      'If you don\'t know something — honestly say so',
      'Mention efforts to overcome your weakness',
    ];
    final dontList = [
      'Don\'t say "I am doing nothing" to "How are you doing?"',
      'Don\'t say "Take this" while giving resume',
      'Don\'t raise topics you can\'t fully explain',
      'Don\'t lie about your experience or qualifications',
      'Don\'t say negative things about previous employers',
      'Don\'t talk about salary first — wait for them to ask',
      'Don\'t use very casual language like "yeah", "ok"',
      'Don\'t look at your phone during interview',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        commonWidgets.buildLessonIntro(
          'इस पाठ में Do\'s और Don\'ts याद करें और mock interview practice करें।',
          'Learn the Do\'s and Don\'ts and practice mock interviews.',
        ),
        const SizedBox(height: AppSpacing.lg),

        // Do's
        commonWidgets.sectionCard(
          title: '✅ Do\'s — ये करें',
          subtitle: '8 points',
          color: AppColors.success,
          child: Column(
            children: doList.asMap().entries.map((e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                          color: AppColors.success, shape: BoxShape.circle),
                      child: Center(
                        child: Text('${e.key + 1}',
                            style: const TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 10)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(e.value,
                          style: AppTextStyles.bodyMedium.copyWith(fontSize: 13)),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: AppSpacing.md),

        // Don'ts
        commonWidgets.sectionCard(
          title: '❌ Don\'ts — ये मत करें',
          subtitle: '8 points',
          color: AppColors.error,
          child: Column(
            children: dontList.asMap().entries.map((e) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                          color: AppColors.error, shape: BoxShape.circle),
                      child: Center(
                        child: Text('${e.key + 1}',
                            style: const TextStyle(
                                fontFamily: 'Nunito',
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 10)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(e.value,
                          style: AppTextStyles.bodyMedium.copyWith(fontSize: 13)),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),

        const SizedBox(height: AppSpacing.lg),
        _infoBox(
          '"Practice makes a man perfect."\n\nदोस्तों के साथ mock interview करें। एक interviewer बने, एक candidate — फिर role switch करें।',
          emoji: '🎭',
          color: AppColors.primary,
        ),
      ],
    );
  }

  // ─── L10: Chapter Quiz Intro ──────────────────────────────────────────────
  Widget buildChapterQuizIntro() {
    final topics = [
      {'emoji': '💡', 'title': 'Interview Tips', 'hi': 'आत्मविश्वास, ईमानदारी, तैयारी'},
      {'emoji': '🎙️', 'title': 'Interview I–IV', 'hi': 'Rahul, Aditya, Pooja, Renu'},
      {'emoji': '🎙️', 'title': 'Interview V–VI', 'hi': 'Priya, Pankaj — Common mistakes'},
      {'emoji': '🎙️', 'title': 'Interview VII–VIII', 'hi': 'Puneet, Arun — Problem solving'},
      {'emoji': '🎙️', 'title': 'Interview IX–X', 'hi': 'Arpit (Extempore), Saleem'},
      {'emoji': '📞', 'title': 'Interview XI–XII', 'hi': 'Telephonic, Movie narration'},
      {'emoji': '✨', 'title': 'Key Phrases & Smart Answers', 'hi': '10 phrases + 8 Q&A'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xl),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [accentColor, accentColor.withOpacity(0.7)],
            ),
            borderRadius: BorderRadius.circular(AppRadius.xl),
          ),
          child: Column(
            children: [
              const Text('🏆', style: TextStyle(fontSize: 56)),
              const SizedBox(height: AppSpacing.md),
              const Text('अध्याय 44 — फ़ाइनल क्विज़',
                  style: TextStyle(fontFamily: 'Nunito', color: Colors.white70, fontSize: 14)),
              const SizedBox(height: 4),
              const Text('Written Interviews — Final Quiz',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800)),
              const SizedBox(height: AppSpacing.md),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  commonWidgets.quizStatBadge('10', 'प्रश्न'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('100', 'XP'),
                  const SizedBox(width: AppSpacing.md),
                  commonWidgets.quizStatBadge('12', 'Interviews'),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('क्विज़ में शामिल टॉपिक', style: AppTextStyles.headingMedium),
        const SizedBox(height: AppSpacing.md),
        ...topics.map((t) => Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(AppRadius.md),
                boxShadow: AppShadows.card,
              ),
              child: Row(
                children: [
                  Text(t['emoji']!, style: const TextStyle(fontSize: 20)),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(t['title']!, style: AppTextStyles.labelLarge),
                        Text(t['hi']!, style: AppTextStyles.bodyMedium.copyWith(fontSize: 12)),
                      ],
                    ),
                  ),
                  const Icon(Icons.check_circle_rounded, color: AppColors.success, size: 18),
                ],
              ),
            )),
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