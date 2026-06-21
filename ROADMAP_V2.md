# LingoWave — v2 Roadmap (toward an interactive, Duolingo-style app)

> **How we work this roadmap:** You say "implement Step N." I build it, run
> `flutter analyze` + a build, and verify what I can. You test on a device and
> we ship that version. Then we move to the next step. **Every step is a
> self-contained, releasable increment** — never a half-feature.

---

## 0. Current State (context — read this first)

**What LingoWave is today (v1.x — PRODUCTION READY):**
- Flutter app (Android-first), Hindi → English learning.
- **Content:** 45 chapters (`lib/data/chapterN_data.dart`) + per-chapter UI
  (`lib/widgets/lesson/chapterN_widgets.dart`). Grammar, vocab, tenses, modals,
  voice, phrasal verbs, idioms, conversations, interviews, A–Z dictionary, test
  papers. **This deep content is the app's biggest asset — v2 builds ON it.**
- **Lesson flow:** Home → ChapterDetail → Lesson → Quiz (MCQ) → Score.
- **Models:** `lib/models/lesson_model.dart` (LessonType enum = the lesson
  catalog; LessonModel, ChapterModel, QuizQuestion).
- **Gamification:** XP, coins, streaks, levels, leaderboard, coin-based chapter
  unlock, confetti.
- **Monetization (LIVE, production keys wired):**
  - Premium: RevenueCat **lifetime ₹499** (`goog_…` key, entitlement `premium`).
  - Ads: AdMob banner + interstitial (every 3rd lesson) + rewarded — all real units.
- **Services:** `api_service` (REST → Railway backend), `progress_service`
  (local SharedPreferences), `ad_service`, `subscription_service`,
  `notification_service` (FCM).
- **Backend:** NestJS + Postgres on Railway. All endpoints connected; contracts
  verified. `FIREBASE_SERVICE_ACCOUNT` set (push works).
- **State mgmt:** plain `StatefulWidget` + `setState` (no Riverpod/Provider yet).
- **Declared-but-unused deps we will activate in v2:** `speech_to_text`,
  `audioplayers`, `fl_chart`.

**Known limitations v2 addresses (why it's a "course" app, not yet a "platform"):**
1. No speaking practice (only TTS playback, no speech-to-text scoring).
2. Exercises are read-content + MCQ only — no varied interactive types.
3. No "practice your mistakes" / spaced repetition.
4. No listening-comprehension exercises.
5. No progress charts.

**v2 design principles:**
- **Ship incrementally** — each step is its own Play release.
- **Reuse existing content** — don't block on a full content rewrite.
- **Free vs Premium** — new practice modes are great upsell hooks; keep a
  generous free tier (ads) and put "unlimited practice / no hearts limit /
  advanced review" behind premium where it makes sense.
- **Backend-light first** — prefer local (SharedPreferences/Hive) for new state;
  add backend endpoints only when cross-device sync is worth it.

---

## The Steps (ordered by impact-to-effort)

### ⭐ Step 1 — Speaking Practice (Speech-to-Text)  →  ships as **v2.0**
**Why first:** Single biggest leap toward "Duolingo feel," small & self-contained,
and it activates the unused `speech_to_text` dependency. An *English-speaking*
app that can't hear you speak is the most-felt gap.

**What I'll build:**
- A reusable `SpeakingExercise` widget: shows a target sentence (EN + Hindi
  meaning + TTS "listen" button), a mic button, live transcription, and a
  similarity score (word-overlap / Levenshtein) with pass/retry feedback.
- A "🎤 Speaking Practice" entry — start as an **optional step at the end of a
  lesson** (after the quiz) and/or a standalone practice button on a chapter.
- Mic permission handling (`RECORD_AUDIO` in manifest) + graceful fallback if
  unsupported/denied.
- Award XP/coins for good attempts (reuse existing systems).

**Files:** new `lib/home/speaking_exercise.dart`; hook into `lib/home/score_screen.dart`
or `chapter_detail_screen.dart`; `AndroidManifest.xml` (RECORD_AUDIO);
maybe a small helper in a new `lib/services/speech_service.dart`.
**Backend:** none (local XP/coins).
**Free/Premium:** free (a few/day), unlimited for premium — optional.
**Test:** open speaking practice → tap mic → say the sentence → see score; deny
permission → graceful message; premium hides ad.
**Effort:** ~3–5 days. **Done when:** user can speak a sentence and get scored,
on a real device.

---

### Step 2 — Interactive Exercise Engine  →  ships as **v2.1**
**Why:** Replaces plain MCQ with varied, tappable exercises — the core of the
"interactive" feel.

**What I'll build:**
- A reusable exercise framework (`Exercise` base + types):
  1. **Tap-to-build** (word bank → build the sentence)
  2. **Fill-in-the-blank** (type or tap the missing word)
  3. **Match pairs** (English ↔ Hindi tap-matching)
  4. **Listen-and-choose** (TTS plays, pick the right option)
- An exercise *session* runner (progress bar, correct/wrong feedback, hearts-lite
  optional) that can be generated from existing `QuizQuestion` data so we don't
  rewrite content.
- Keep MCQ as one type; mix types within a session.

**Files:** new `lib/exercises/` (models + widgets + session runner); adapt
`lib/home/quiz_screen.dart` to use the new runner; extend `lesson_model.dart`
(exercise types) without breaking existing `QuizQuestion`.
**Backend:** none.
**Test:** play a lesson → see 3–4 different exercise types → correct/wrong feedback works.
**Effort:** ~1–2 weeks. **Done when:** a lesson plays as a mixed interactive session.

---

### Step 3 — "Practice Your Mistakes" (Mistakes Review)  →  ships as **v2.2**
**Why:** Retention. Lets users re-drill what they got wrong — high value, modest effort.

**What I'll build:**
- Record every wrong answer (question id + chapter + timestamp) locally.
- A "🔁 Practice Mistakes" tile on Home that builds a session from missed items
  (using the Step-2 engine); items leave the pool once answered right twice.
- Small badge/count of pending mistakes.

**Files:** new `lib/services/review_service.dart` (local store); Home tile;
reuse the Step-2 session runner.
**Backend:** optional later (cross-device); local first.
**Test:** get items wrong → they appear in Practice Mistakes → answer right → they clear.
**Effort:** ~1 week. **Done when:** wrong answers resurface and can be cleared.

---

### Step 4 — Spaced Repetition (proper SRS)  →  ships as **v2.3**
**Why:** Turns review into real long-term learning ("strengthen skills" daily).

**What I'll build:**
- A lightweight SM-2/Leitner scheduler over vocab + key sentences (interval,
  ease, due-date per item, stored locally via Hive — activate the unused dep).
- A daily "Review" goal + reminder (reuse `notification_service`).
- Due-item count on Home; review session uses the Step-2 engine.

**Files:** `lib/services/srs_service.dart` (+ Hive boxes); Home review card;
notification hook.
**Backend:** optional sync later.
**Test:** answer items → they reschedule → due items resurface on the right day
(can fast-forward via a debug date).
**Effort:** ~1 week. **Done when:** items resurface on an SRS schedule.

---

### Step 5 — Path UI + Hearts + Sound/Animation polish  →  ships as **v2.4**
**Why:** The visual "Duolingo" identity + a monetizable hearts system.

**What I'll build:**
- Redesign Home into a **vertical path / skill-tree** of nodes (reuse chapter
  data; each node = a lesson/checkpoint).
- **Hearts/lives** (lose on wrong, refill over time / via rewarded ad / premium =
  unlimited) — strong free-to-premium hook.
- Sound effects (correct/wrong/level-up) via `audioplayers`, richer animations,
  a simple mascot/level-up celebration.

**Files:** rework `home_screen.dart` home tab; new `lib/widgets/path/`; `ad_service`
hook for heart-refill ad; sounds in `assets/audio/`.
**Backend:** none (hearts local) — or backend if you want anti-cheat.
**Test:** path renders & navigates; hearts deplete/refill; premium = unlimited; sounds play.
**Effort:** ~1–2 weeks. **Done when:** Home is a path with working hearts + feedback SFX.

---

### Step 6 — Listening Comprehension  →  ships as **v2.5**
**Why:** Adds the "listening" skill (currently only one-way TTS playback).

**What I'll build:**
- Listening exercise types in the Step-2 engine: "listen → type what you heard,"
  "listen → pick the meaning," dictation. Uses TTS (and any `assets/audio`).
- Adjustable playback speed (normal/slow).

**Files:** extend `lib/exercises/`; TTS/audio helper.
**Test:** listening exercises play and grade correctly.
**Effort:** ~3–5 days. **Done when:** at least 2 listening exercise types work.

---

### Step 7 — Progress Analytics / Charts  →  ships as **v2.6**
**Why:** Motivation + activates the unused `fl_chart`.

**What I'll build:**
- A real Progress tab: streak calendar, weekly XP chart, accuracy %, words/
  sentences learned, SRS retention. Pull from local + backend stats.

**Files:** rework `home_screen.dart` progress tab; charts via `fl_chart`.
**Test:** charts render with real data.
**Effort:** ~3–5 days. **Done when:** progress tab shows graphs from real data.

---

### Step 8 (ongoing) — Content restructure into bite-sized units
**Why:** The path UX works best with short 3–5 min lessons. Some 45-chapter
content is long-form; we gradually split it into micro-lessons.
**Note:** This is partly *content* work (your call on splits), done incrementally
alongside the steps above — not a blocking one-time rewrite.

---

## Cross-cutting (handled as we go, not separate releases)
- **State management:** if `setState` gets unwieldy around Step 2–4, introduce
  Riverpod (already a dependency) incrementally.
- **Backend sync:** mistakes/SRS start local; add endpoints only when
  cross-device sync is worth it.
- **Free vs Premium balance:** revisit each step so premium stays compelling
  (unlimited hearts, unlimited speaking/review, no ads) without gating core learning.
- **QA:** before each release — `flutter analyze` clean, build succeeds, manual
  test of the new flow + a regression pass on the lesson→quiz→score core.

---

## Quick reference — order & rough effort
| Step | Feature | Ships as | Effort |
|---|---|---|---|
| 1 | Speaking practice (STT) | v2.0 | 3–5 days |
| 2 | Interactive exercise engine | v2.1 | 1–2 wks |
| 3 | Practice your mistakes | v2.2 | ~1 wk |
| 4 | Spaced repetition (SRS) | v2.3 | ~1 wk |
| 5 | Path UI + hearts + polish | v2.4 | 1–2 wks |
| 6 | Listening comprehension | v2.5 | 3–5 days |
| 7 | Progress charts | v2.6 | 3–5 days |
| 8 | Content micro-lessons | ongoing | variable |

**Recommended start:** Step 1 (Speaking) right after the v1 launch.

---

_Last updated for v1 production launch. Tell me "implement Step 1" when ready._
