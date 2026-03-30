import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import '../theme/app_theme.dart';
import '../models/lesson_model.dart';
import '../widgets/common_widgets.dart';

class ScoreScreen extends StatefulWidget {
  final int score, total, xpEarned;
  final ChapterModel chapter;
  final LessonModel lesson;
  final Color accentColor;
  const ScoreScreen({super.key, required this.score, required this.total, required this.chapter, required this.lesson, required this.accentColor, required this.xpEarned});
  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> with TickerProviderStateMixin {
  late ConfettiController _cc;
  late AnimationController _ma, _sa;
  late Animation<double> _mf, _ss;
  late Animation<Offset> _ms;

  // ✅ Updated: added ch16, ch17, ch18 chapter quiz types
  static const _quizTypes = [
    LessonType.chapterQuiz,
    LessonType.ch2ChapterQuiz,
    LessonType.ch3ChapterQuiz,
    LessonType.ch4ChapterQuiz,
    LessonType.ch5ChapterQuiz,
    LessonType.ch6ChapterQuiz,
    LessonType.ch7ChapterQuiz,
    LessonType.ch8ChapterQuiz,
    LessonType.ch9ChapterQuiz,
    LessonType.ch10ChapterQuiz,
    LessonType.ch11ChapterQuiz,
    LessonType.ch12ChapterQuiz,
    LessonType.ch13ChapterQuiz,
    LessonType.ch14ChapterQuiz,
    LessonType.ch15ChapterQuiz,
    LessonType.ch16ChapterQuiz, // ✅ added
    LessonType.ch17ChapterQuiz, // ✅ added
    LessonType.ch18ChapterQuiz, // ✅ added
    LessonType.ch19ChapterQuiz, // ✅ added
    LessonType.ch20ChapterQuiz, // ✅ added
    LessonType.ch21ChapterQuiz, // ✅ added
    LessonType.ch22ChapterQuiz, // ✅ added
    LessonType.ch23ChapterQuiz, // ✅ added
    LessonType.ch24ChapterQuiz, // ✅ added
    LessonType.ch25ChapterQuiz, // ✅ added
    LessonType.ch26ChapterQuiz, // ✅ added
    LessonType.ch27ChapterQuiz, // ✅ added
    LessonType.ch28ChapterQuiz, // ✅ added
    LessonType.ch29ChapterQuiz,
    LessonType.ch30ChapterQuiz, // ✅ added
    LessonType.ch31ChapterQuiz, // ✅ added
    LessonType.ch32ChapterQuiz, // ✅ added
    LessonType.ch33ChapterQuiz,
    LessonType.ch34ChapterQuiz,
    LessonType.ch35ChapterQuiz,
    LessonType.ch36ChapterQuiz,
    LessonType.ch37ChapterQuiz,
    LessonType.ch38ChapterQuiz,
    LessonType.ch39ChapterQuiz,
    LessonType.ch40ChapterQuiz,
    LessonType.ch41ChapterQuiz,
    LessonType.ch42ChapterQuiz, // ✅ added
    LessonType.ch43ChapterQuiz, // ✅ added
    LessonType.ch44ChapterQuiz, 
    LessonType.ch45ChapterQuiz, 
  ];

  @override
  void initState() {
    super.initState();
    _cc = ConfettiController(duration: const Duration(seconds:3));
    _ma = AnimationController(vsync:this, duration:const Duration(milliseconds:500));
    _sa = AnimationController(vsync:this, duration:const Duration(milliseconds:700));
    _mf = CurvedAnimation(parent:_ma, curve:Curves.easeOut);
    _ms = Tween<Offset>(begin:const Offset(0,0.2),end:Offset.zero).animate(CurvedAnimation(parent:_ma,curve:Curves.easeOut));
    _ss = Tween<double>(begin:0.3,end:1.0).animate(CurvedAnimation(parent:_sa,curve:Curves.elasticOut));
    _ma.forward();
    Future.delayed(const Duration(milliseconds:200),()=>_sa.forward());
    if(_ip||_ipa) Future.delayed(const Duration(milliseconds:300),()=>_cc.play());
  }

  @override
  void dispose() { _cc.dispose(); _ma.dispose(); _sa.dispose(); super.dispose(); }

  bool get _ip  => widget.score == widget.total;
  bool get _ipa => widget.score >= (widget.total*0.6).ceil();
  bool get _isCQ => _quizTypes.contains(widget.lesson.type);

  // ✅ Updated: last chapter is now 45
  bool get _isLastChapter => widget.chapter.id == 45;

  String get _next {
    switch (widget.chapter.id) {
      case 1:  return 'Few Basics of English';
      case 2:  return 'Pronunciation (उच्चारण)';
      case 3:  return 'Vocabulary & Pronunciation';
      case 4:  return 'WH Family';
      case 5:  return 'Parts of Speech (शब्द भेद)';
      case 6:  return 'Noun (संज्ञा)';
      case 7:  return 'Pronoun (सर्वनाम)';
      case 8:  return 'Adjective (विशेषण)';
      case 9:  return 'Verbs (क्रियाएँ)';
      case 10: return 'Adverbs (क्रिया विशेषण)';
      case 11: return 'Interjection (विस्मयादिबोधक)';
      case 12: return 'Articles (A/An, The)';
      case 13: return 'Prepositions (सम्बन्ध सूचक अव्यय)';
      case 14: return 'Determiners (निर्धारक)';
      case 15: return 'Simple Sentences (सरल वाक्य)';
      case 16: return 'There (देअर)';
      case 17: return 'Position Sense (स्थिति का ज्ञान)';
      case 18: return 'Tense (काल)';
      case 19: return 'It (इट)';
      case 20: return 'Modals (मोडाल्स)';
      case 21: return 'Conjunctions (समुच्चय बोधक अव्यय)';
      case 22: return 'Imperative Sentences (आज्ञा सूचक वाक्य)';
      case 23: return 'Let (करने देना)';
      case 24: return 'Causative Verbs (Get & Make)';
      case 25: return 'Active & Passive Voice';
      case 26: return 'Special Cases (विशेष प्रकार के वाक्य)';
      case 27: return 'Fillers (अटकाव के शब्द)';
      case 28: return 'Question Tags (है ना? नहीं क्या?)';
      case 29: return 'Phrasal Verbs (फ्रेजल वर्ब्स)';
      case 30: return 'Prepositional Phrases (पूर्वसर्ग वाक्यांश)';
      case 31: return 'Confusing Similar Words';
      case 32: return 'One Word Substitutions (पूरा वाक्य सिर्फ एक शब्द में)';
      case 33: return 'Special & Complex Sentences';
      case 34: return 'Extensive Translation (विस्तृत अनुवाद)';
      case 35: return 'Objective Exercises (लक्ष्य आधारित अभ्यास)';
      case 36: return 'Sentence Correction Exercises (वाक्य सुधार अभ्यास)';
        case 37: return 'Mixed Practice Exercise (मिश्रित अभ्यास)';
      case 38: return 'Mixed Test Papers (मिश्रित टेस्ट पेपर्स)';
       case 39: return 'Translation Exercises (अनुवाद अभ्यास)';
         case 40: return 'Written Conversations';
       case 41: return 'Few English Passages';
        case 42: return 'Idioms & Proverbs';
        case 43: return 'Written Interviews (इंटरव्यू की तैयारी)';
        case 44: return 'English–Hindi Dictionary (शब्दकोश)';
        case 45: return 'अगला अध्याय जल्द आ रहा है!';
      default: return 'अगला अध्याय';
    }
  }

  String get _msg => _ip?'परफेक्ट! कमाल! 🎉':_ipa?'बहुत अच्छा! 👏':'फिर से कोशिश करें 💪';
  String get _em  => _ip?'🏆':_ipa?'🌟':'📚';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(children: [
        SafeArea(child: FadeTransition(opacity:_mf, child: SlideTransition(position:_ms, child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(children: [
            const SizedBox(height:AppSpacing.xl),
            ScaleTransition(scale:_ss, child: Column(children: [
              Container(
                width:110, height:110,
                decoration:BoxDecoration(
                  gradient:LinearGradient(colors:_ip
                    ?[AppColors.accentGold,const Color(0xFFFF8E53)]
                    :_ipa
                      ?[AppColors.success,AppColors.success.withOpacity(0.7)]
                      :[widget.accentColor,widget.accentColor.withOpacity(0.7)]),
                  shape:BoxShape.circle,
                  boxShadow:[BoxShadow(
                    color:(_ip?AppColors.accentGold:_ipa?AppColors.success:widget.accentColor).withOpacity(0.4),
                    blurRadius:30,
                    offset:const Offset(0,10),
                  )],
                ),
                child:Center(child:Text(_em,style:const TextStyle(fontSize:52))),
              ),
              const SizedBox(height:AppSpacing.md),
              Text('पाठ ${widget.lesson.id}: ${widget.lesson.title}',
                  style:AppTextStyles.bodyMedium.copyWith(color:widget.accentColor)),
              const SizedBox(height:AppSpacing.xs),
              Text(_msg, style:AppTextStyles.displayLarge, textAlign:TextAlign.center),
            ])),

            const SizedBox(height:AppSpacing.xl),

            // Score card
            Container(
              padding:const EdgeInsets.all(AppSpacing.lg),
              decoration:BoxDecoration(
                color:AppColors.surface,
                borderRadius:BorderRadius.circular(AppRadius.xl),
                boxShadow:AppShadows.card,
              ),
              child:Column(children:[
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.end,
                  children:[
                    Text('${widget.score}',
                        style:AppTextStyles.displayLarge.copyWith(
                          fontSize:64,
                          color:_ip?AppColors.accentGold:_ipa?AppColors.success:AppColors.accent,
                        )),
                    Padding(
                      padding:const EdgeInsets.only(bottom:12),
                      child:Text('/${widget.total}',
                          style:AppTextStyles.headingLarge.copyWith(color:AppColors.textSecondary)),
                    ),
                  ],
                ),
                Text('सही उत्तर', style:AppTextStyles.bodyMedium),
                const SizedBox(height:AppSpacing.lg),
                const Divider(),
                const SizedBox(height:AppSpacing.md),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceAround,
                  children:[
                    _st('⚡','+${widget.xpEarned}','XP कमाए',AppColors.accentGold),
                    _st('✅','${widget.score}','सही',AppColors.success),
                    _st('❌','${widget.total-widget.score}','गलत',AppColors.error),
                  ],
                ),
              ]),
            ),

            // ✅ Chapter quiz unlock banner — uses _isLastChapter instead of id==15
            if(_isCQ && _ipa)...[
              const SizedBox(height:AppSpacing.md),
              Container(
                padding:const EdgeInsets.all(AppSpacing.md),
                decoration:BoxDecoration(
                  color:AppColors.success.withOpacity(0.06),
                  borderRadius:BorderRadius.circular(AppRadius.lg),
                  border:Border.all(color:AppColors.success.withOpacity(0.3)),
                ),
                child:Row(children:[
                  Text(_isLastChapter ? '🎓' : '🔓',
                      style:const TextStyle(fontSize:28)),
                  const SizedBox(width:AppSpacing.md),
                  Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
                    Text(
                      _isLastChapter
                        ? 'शाबाश! सभी अध्याय पूरे!'
                        : 'अध्याय ${widget.chapter.id+1} अनलॉक हो गया!',
                      style:AppTextStyles.labelLarge.copyWith(color:AppColors.success),
                    ),
                    Text(_next, style:AppTextStyles.bodyMedium),
                  ])),
                ]),
              ),
            ],

            // Regular lesson unlock banner
            if(!_isCQ && _ipa)...[
              const SizedBox(height:AppSpacing.md),
              Container(
                padding:const EdgeInsets.all(AppSpacing.md),
                decoration:BoxDecoration(
                  color:widget.accentColor.withOpacity(0.06),
                  borderRadius:BorderRadius.circular(AppRadius.lg),
                  border:Border.all(color:widget.accentColor.withOpacity(0.25)),
                ),
                child:Row(children:[
                  const Text('🎯',style:TextStyle(fontSize:24)),
                  const SizedBox(width:AppSpacing.md),
                  Expanded(child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
                    Text('अगला पाठ खुल गया!',
                        style:AppTextStyles.labelLarge.copyWith(color:widget.accentColor)),
                    Text('अध्याय में आगे बढ़ते रहें।',style:AppTextStyles.bodyMedium),
                  ])),
                ]),
              ),
            ],

            const SizedBox(height:AppSpacing.xl),

            // ✅ Buttons — uses _isLastChapter instead of id==15
            Column(children:[
              if(_ipa) PrimaryButton(
                label: _isCQ
                  ? (_isLastChapter ? 'होम पर जाएं' : 'अध्याय ${widget.chapter.id+1} शुरू करें')
                  : 'होम पर जाएं',
                onTap: ()=>Navigator.popUntil(context,(r)=>r.isFirst),
                color: AppColors.success,
                emoji: (_isCQ && !_isLastChapter) ? '🚀' : '🏠',
              ),
              const SizedBox(height:AppSpacing.md),
              GestureDetector(
                onTap:()=>Navigator.pop(context),
                child:Container(
                  width:double.infinity,
                  padding:const EdgeInsets.symmetric(vertical:14),
                  decoration:BoxDecoration(
                    color:AppColors.surface,
                    borderRadius:BorderRadius.circular(AppRadius.full),
                    border:Border.all(color:AppColors.locked,width:2),
                  ),
                  child:Text(
                    _ipa?'दोबारा करें':'फिर से कोशिश करें',
                    textAlign:TextAlign.center,
                    style:AppTextStyles.labelLarge.copyWith(color:AppColors.textSecondary),
                  ),
                ),
              ),
            ]),
            const SizedBox(height:AppSpacing.lg),
          ]),
        )))),

        Align(
          alignment:Alignment.topCenter,
          child:ConfettiWidget(
            confettiController:_cc,
            blastDirectionality:BlastDirectionality.explosive,
            numberOfParticles:30,
            maxBlastForce:30,
            minBlastForce:10,
            emissionFrequency:0.15,
            gravity:0.3,
            colors:const[AppColors.accent,AppColors.accentGold,AppColors.success,AppColors.primary,Colors.pink,Colors.cyan],
          ),
        ),
      ]),
    );
  }

  Widget _st(String e, String v, String l, Color c) => Column(children:[
    Text(e, style:const TextStyle(fontSize:20)),
    const SizedBox(height:4),
    Text(v, style:AppTextStyles.headingLarge.copyWith(color:c)),
    Text(l, style:AppTextStyles.labelSmall),
  ]);
}