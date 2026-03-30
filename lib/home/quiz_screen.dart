import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import '../theme/app_theme.dart';
import '../data/chapter1_data.dart';
import '../data/chapter2_data.dart';
import '../data/chapter3_data.dart';
import '../data/chapter4_data.dart';
import '../data/chapter5_data.dart';
import '../data/chapter6_data.dart';
import '../data/chapter7_data.dart';
import '../data/chapter8_data.dart';
import '../data/chapter9_data.dart';
import '../data/chapter10_data.dart';
import '../data/chapter11_data.dart';
import '../data/chapter12_data.dart';
import '../data/chapter13_data.dart';
import '../data/chapter14_data.dart';
import '../data/chapter15_data.dart';
import '../models/lesson_model.dart';
import '../data/chapter16_data.dart';
import '../data/chapter17_data.dart';
import '../data/chapter18_data.dart';
import '../data/chapter19_data.dart';
import '../data/chapter20_data.dart';
import '../data/chapter21_data.dart';
import '../data/chapter22_data.dart';
import '../data/chapter23_data.dart';
import '../data/chapter24_data.dart';
import '../data/chapter25_data.dart';
import '../data/chapter26_data.dart';
import '../data/chapter27_data.dart';
import '../data/chapter28_data.dart';
import '../data/chapter29_data.dart';
import '../data/chapter30_data.dart';
import '../data/chapter31_data.dart';
import '../data/chapter32_data.dart';
import '../data/chapter33_data.dart';
import '../data/chapter34_data.dart';
import '../data/chapter35_data.dart';
import '../data/chapter36_data.dart';
import '../data/chapter37_data.dart';
import '../data/chapter38_data.dart';
import '../data/chapter39_data.dart';
import '../data/chapter40_data.dart';
import '../data/chapter41_data.dart';
import '../data/chapter42_data.dart';
import '../data/chapter43_data.dart';
import '../data/chapter44_data.dart';
import '../data/chapter45_data.dart';


import '../widgets/common_widgets.dart';
import '../services/progress_service.dart';
import 'score_screen.dart';

class QuizScreen extends StatefulWidget {
  final ChapterModel chapter;
  final LessonModel lesson;
  final Color accentColor;
  const QuizScreen({super.key, required this.chapter, required this.lesson, required this.accentColor});
  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> with TickerProviderStateMixin {
  late List<QuizQuestion> _questions;
  int _currentIndex = 0, _selectedOption = -1, _score = 0;
  bool _answered = false;
  late ConfettiController _confettiController;
  late AnimationController _questionAnim, _feedbackAnim;
  late Animation<Offset> _questionSlide;
  late Animation<double> _questionFade, _feedbackScale;

  @override
  void initState() {
    super.initState();
    final id = widget.chapter.id;
    if      (id == 2)  _questions = Chapter2Data.questionsForLesson(widget.lesson.type);
    else if (id == 3)  _questions = Chapter3Data.questionsForLesson(widget.lesson.type);
    else if (id == 4)  _questions = Chapter4Data.questionsForLesson(widget.lesson.type);
    else if (id == 5)  _questions = Chapter5Data.questionsForLesson(widget.lesson.type);
    else if (id == 6)  _questions = Chapter6Data.questionsForLesson(widget.lesson.type);
    else if (id == 7)  _questions = Chapter7Data.questionsForLesson(widget.lesson.type);
    else if (id == 8)  _questions = Chapter8Data.questionsForLesson(widget.lesson.type);
    else if (id == 9)  _questions = Chapter9Data.questionsForLesson(widget.lesson.type);
    else if (id == 10) _questions = Chapter10Data.questionsForLesson(widget.lesson.type);
    else if (id == 11) _questions = Chapter11Data.questionsForLesson(widget.lesson.type);
    else if (id == 12) _questions = Chapter12Data.questionsForLesson(widget.lesson.type);
    else if (id == 13) _questions = Chapter13Data.questionsForLesson(widget.lesson.type);
    else if (id == 14) _questions = Chapter14Data.questionsForLesson(widget.lesson.type);
    else if (id == 15) _questions = Chapter15Data.questionsForLesson(widget.lesson.type);
    else if (id == 16) _questions = Chapter16Data.questionsForLesson(widget.lesson.type);
    else if (id == 17) _questions = Chapter17Data.questionsForLesson(widget.lesson.type);
    else if (id == 18) _questions = Chapter18Data.questionsForLesson(widget.lesson.type);
    else if (id == 19) _questions = Chapter19Data.questionsForLesson(widget.lesson.type);
    else if (id == 20) _questions = Chapter20Data.questionsForLesson(widget.lesson.type);
    else if (id == 21) _questions = Chapter21Data.questionsForLesson(widget.lesson.type);
    else if (id == 22) _questions = Chapter22Data.questionsForLesson(widget.lesson.type);
    else if (id == 23) _questions = Chapter23Data.questionsForLesson(widget.lesson.type);
    else if (id == 24) _questions = Chapter24Data.questionsForLesson(widget.lesson.type);
    else if (id == 25) _questions = Chapter25Data.questionsForLesson(widget.lesson.type);
    else if (id == 26) _questions = Chapter26Data.questionsForLesson(widget.lesson.type);
    else if (id == 27) _questions = Chapter27Data.questionsForLesson(widget.lesson.type);
    else if (id == 28) _questions = Chapter28Data.questionsForLesson(widget.lesson.type);
    else if (id == 29) _questions = Chapter29Data.questionsForLesson(widget.lesson.type);
    else if (id == 30) _questions = Chapter30Data.questionsForLesson(widget.lesson.type);
    else if (id == 31) _questions = Chapter31Data.questionsForLesson(widget.lesson.type);
    else if (id == 32) _questions = Chapter32Data.questionsForLesson(widget.lesson.type);
    else if (id == 33) _questions = Chapter33Data.questionsForLesson(widget.lesson.type);
    else if (id == 34) _questions = Chapter34Data.questionsForLesson(widget.lesson.type);
    else if (id == 35) _questions = Chapter35Data.questionsForLesson(widget.lesson.type);
    else if (id == 36) _questions = Chapter36Data.questionsForLesson(widget.lesson.type);
    else if (id == 37) _questions = Chapter37Data.questionsForLesson(widget.lesson.type);
    else if (id == 38) _questions = Chapter38Data.questionsForLesson(widget.lesson.type);
    else if (id == 39) _questions = Chapter39Data.questionsForLesson(widget.lesson.type);
    else if (id == 40) _questions = Chapter40Data.questionsForLesson(widget.lesson.type);
     else if (id == 41) _questions = Chapter41Data.questionsForLesson(widget.lesson.type);
     else if (id == 42) _questions = Chapter42Data.questionsForLesson(widget.lesson.type);
     else if (id == 43) _questions = Chapter43Data.questionsForLesson(widget.lesson.type);
    else if (id == 44) _questions = Chapter44Data.questionsForLesson(widget.lesson.type);
        else if (id == 45) _questions = Chapter45Data.questionsForLesson(widget.lesson.type);
    else               _questions = Chapter1Data.questionsForLesson(widget.lesson.type);
    if (_questions.isEmpty) _questions = Chapter1Data.questionsForLesson(LessonType.alphabets);

    _confettiController = ConfettiController(duration: const Duration(milliseconds: 800));
    _questionAnim = AnimationController(vsync: this, duration: const Duration(milliseconds: 350));
    _questionSlide = Tween<Offset>(begin: const Offset(0.15,0), end: Offset.zero).animate(CurvedAnimation(parent: _questionAnim, curve: Curves.easeOut));
    _questionFade = CurvedAnimation(parent: _questionAnim, curve: Curves.easeOut);
    _feedbackAnim = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    _feedbackScale = Tween<double>(begin: 0.8, end: 1.0).animate(CurvedAnimation(parent: _feedbackAnim, curve: Curves.elasticOut));
    _questionAnim.forward();
  }

  @override
  void dispose() { _confettiController.dispose(); _questionAnim.dispose(); _feedbackAnim.dispose(); super.dispose(); }

  void _selectOption(int index) {
    if (_answered) return;
    setState(() { _selectedOption = index; _answered = true; if (index == _questions[_currentIndex].correctIndex) { _score++; _confettiController.play(); }});
    _feedbackAnim.forward();
  }

  Future<void> _nextQuestion() async {
    if (_currentIndex < _questions.length - 1) {
      setState(() { _currentIndex++; _selectedOption = -1; _answered = false; });
      _feedbackAnim.reset(); _questionAnim.reset(); _questionAnim.forward();
    } else {
      final xp = _score * (widget.lesson.totalXP ~/ _questions.length);
      await ProgressService.completeLesson(chapterId: widget.chapter.id, lessonId: widget.lesson.id, xpEarned: xp, totalLessonsInChapter: widget.chapter.lessons.length);
      if (!mounted) return;
      Navigator.pushReplacement(context, PageRouteBuilder(
        pageBuilder: (_,__,___) => ScoreScreen(score: _score, total: _questions.length, chapter: widget.chapter, lesson: widget.lesson, accentColor: widget.accentColor, xpEarned: xp),
        transitionsBuilder: (_,a,__,c) => FadeTransition(opacity: a, child: c),
        transitionDuration: const Duration(milliseconds: 400),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = _questions[_currentIndex];
    final isCorrect = _answered && _selectedOption == q.correctIndex;
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Stack(children: [
        SafeArea(child: Column(children: [
          Padding(padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm), child: Row(children: [
            GestureDetector(onTap: () => Navigator.pop(context), child: Container(width:40,height:40,decoration:BoxDecoration(color:AppColors.surface,borderRadius:BorderRadius.circular(AppRadius.md),boxShadow:AppShadows.card),child:const Icon(Icons.close_rounded,color:AppColors.textSecondary,size:20))),
            const SizedBox(width:AppSpacing.md),
            Expanded(child:ClipRRect(borderRadius:BorderRadius.circular(AppRadius.full),child:LinearProgressIndicator(value:(_currentIndex+1)/_questions.length,minHeight:8,backgroundColor:AppColors.primaryLight,valueColor:AlwaysStoppedAnimation<Color>(widget.accentColor)))),
            const SizedBox(width:AppSpacing.md),
            Container(padding:const EdgeInsets.symmetric(horizontal:10,vertical:4),decoration:BoxDecoration(color:AppColors.accentGold.withOpacity(0.12),borderRadius:BorderRadius.circular(AppRadius.full),border:Border.all(color:AppColors.accentGold.withOpacity(0.3))),
              child:Row(children:[const Text('⚡',style:TextStyle(fontSize:12)),const SizedBox(width:3),Text('$_score/${_questions.length}',style:AppTextStyles.labelSmall.copyWith(color:AppColors.accentGold,fontWeight:FontWeight.w700))])),
          ])),
          Padding(padding:const EdgeInsets.symmetric(horizontal:AppSpacing.lg),child:Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
            Text('प्रश्न ${_currentIndex+1}/${_questions.length}',style:AppTextStyles.bodyMedium.copyWith(color:widget.accentColor,fontWeight:FontWeight.w600)),
            Row(children:List.generate(_questions.length,(i)=>AnimatedContainer(duration:const Duration(milliseconds:200),margin:const EdgeInsets.symmetric(horizontal:2),width:i==_currentIndex?18:8,height:8,decoration:BoxDecoration(color:i<_currentIndex?AppColors.success:i==_currentIndex?widget.accentColor:AppColors.locked,borderRadius:BorderRadius.circular(AppRadius.full))))),
          ])),
          const SizedBox(height:AppSpacing.md),
          Expanded(child:Padding(padding:const EdgeInsets.symmetric(horizontal:AppSpacing.lg),child:Column(children:[
            FadeTransition(opacity:_questionFade,child:SlideTransition(position:_questionSlide,child:Container(
              width:double.infinity,padding:const EdgeInsets.all(AppSpacing.lg),
              decoration:BoxDecoration(gradient:LinearGradient(begin:Alignment.topLeft,end:Alignment.bottomRight,colors:[widget.accentColor,widget.accentColor.withOpacity(0.8)]),borderRadius:BorderRadius.circular(AppRadius.xl),boxShadow:[BoxShadow(color:widget.accentColor.withOpacity(0.3),blurRadius:20,offset:const Offset(0,8))]),
              child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
                Text(q.questionHi,style:const TextStyle(fontFamily:'Nunito',fontSize:18,fontWeight:FontWeight.w700,color:Colors.white,height:1.4)),
                const SizedBox(height:AppSpacing.sm),
                Text(q.questionEn,style:const TextStyle(fontFamily:'Nunito',fontSize:13,color:Colors.white70,height:1.4)),
              ]),
            ))),
            const SizedBox(height:AppSpacing.lg),
            Expanded(child:ListView.builder(physics:const NeverScrollableScrollPhysics(),itemCount:q.options.length,itemBuilder:(context,i){
              final isSel=_selectedOption==i; final isCO=i==q.correctIndex;
              Color bc=AppColors.locked,bg=AppColors.surface,tc=AppColors.textPrimary; Widget? ti;
              if(_answered){if(isCO){bc=AppColors.success;bg=AppColors.success.withOpacity(0.08);tc=AppColors.success;ti=const Icon(Icons.check_circle_rounded,color:AppColors.success,size:22);}else if(isSel){bc=AppColors.error;bg=AppColors.error.withOpacity(0.06);tc=AppColors.error;ti=const Icon(Icons.cancel_rounded,color:AppColors.error,size:22);}}else if(isSel){bc=widget.accentColor;bg=widget.accentColor.withOpacity(0.08);tc=widget.accentColor;}
              return GestureDetector(onTap:()=>_selectOption(i),child:AnimatedContainer(
                duration:const Duration(milliseconds:200),margin:const EdgeInsets.only(bottom:AppSpacing.md),padding:const EdgeInsets.all(AppSpacing.md),
                decoration:BoxDecoration(color:bg,borderRadius:BorderRadius.circular(AppRadius.lg),border:Border.all(color:bc,width:2)),
                child:Row(children:[
                  Container(width:32,height:32,decoration:BoxDecoration(color:_answered?(isCO?AppColors.success:isSel?AppColors.error:AppColors.lockedBg):isSel?widget.accentColor:AppColors.lockedBg,shape:BoxShape.circle),child:Center(child:Text(['अ','ब','स','द'][i],style:TextStyle(fontFamily:'Nunito',fontSize:14,fontWeight:FontWeight.w800,color:(_answered&&(isCO||isSel))||(!_answered&&isSel)?Colors.white:AppColors.textSecondary)))),
                  const SizedBox(width:AppSpacing.md),
                  Expanded(child:Text(q.options[i],style:AppTextStyles.labelLarge.copyWith(color:tc))),
                  if(ti!=null)ti,
                ]),
              ));
            })),
          ]))),
          AnimatedSize(duration:const Duration(milliseconds:300),curve:Curves.easeOut,child:_answered?ScaleTransition(scale:_feedbackScale,child:Container(
            width:double.infinity,padding:const EdgeInsets.all(AppSpacing.lg),
            decoration:BoxDecoration(color:isCorrect?AppColors.success.withOpacity(0.08):AppColors.error.withOpacity(0.06),border:Border(top:BorderSide(color:isCorrect?AppColors.success.withOpacity(0.3):AppColors.error.withOpacity(0.3)))),
            child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
              Row(children:[Text(isCorrect?'✅':'❌',style:const TextStyle(fontSize:20)),const SizedBox(width:AppSpacing.sm),Text(isCorrect?'सही जवाब! शाबाश! 🎉':'गलत! सही उत्तर देखें:',style:AppTextStyles.headingMedium.copyWith(color:isCorrect?AppColors.success:AppColors.error))]),
              const SizedBox(height:AppSpacing.sm),Text(q.explanation,style:AppTextStyles.bodyMedium),
              const SizedBox(height:AppSpacing.md),
              PrimaryButton(label:_currentIndex<_questions.length-1?'अगला प्रश्न':'परिणाम देखें',onTap:_nextQuestion,color:isCorrect?AppColors.success:widget.accentColor,emoji:_currentIndex<_questions.length-1?'→':'🏆'),
            ]),
          )):const SizedBox.shrink()),
        ])),
        Align(alignment:Alignment.topCenter,child:ConfettiWidget(confettiController:_confettiController,blastDirectionality:BlastDirectionality.explosive,numberOfParticles:18,maxBlastForce:20,minBlastForce:8,emissionFrequency:0.3,colors:const[AppColors.accent,AppColors.accentGold,AppColors.success,AppColors.primary,Colors.pink])),
      ]),
    );
  }
}