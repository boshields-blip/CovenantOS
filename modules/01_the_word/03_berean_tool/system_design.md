# Berean Tool System Design

**Status:** Draft | **Author:** Brandon O'Shields

---

> **Guiding principle:** The Berean Tool is a clarity tool, not a weapon.

## Framing principle

This system is explicitly philosophical and educational. It is **not** moralistic, accusatory, or punitive. It asks what formative streams seem to shape a teacher's emphases, instincts, and blind spots — not whether that teacher is sincere, saved, or morally suspect.

The tool functions most faithfully when it is used to understand rather than prosecute — including, and especially, when used on oneself.

## Two modes

### Self-assessment mode (primary)

In this mode, the user applies the Berean diagnostic to their own formation: their tradition, their education, their mentors, and their own speech and instincts. This is the recommended starting mode.

Self-assessment mode produces a profile structured identically to a teacher profile, but answers the category questions in first person. It is the most formatively honest use of the tool because it begins with confession rather than critique.

### Teacher analysis mode (secondary)

In this mode, the user analyzes the philosophical formation of a specific teacher, pastor, or tradition. This mode requires particular discipline to maintain the spirit of genuine inquiry:

- Gather public information only; do not speculate about private character or motives.
- Name strengths before drifts, always.
- Use the tool to understand, not to compile a case.
- End with a section on what the reader can genuinely receive from this teacher.

## Inputs

The tool uses three input groups.

### 1. Background inputs

- Teacher name (or "self" for self-assessment mode)
- Formal education and seminary lineage
- Denominational or ecclesial tradition
- Stated mentors and influences
- Ministry context and historical setting

### 2. Teaching inputs

- Books, sermons, lectures, interviews, articles
- Recurring themes and keywords
- Favored metaphors, pronouns, and identity language
- Explicit doctrinal claims and recurring omissions
- Topics or categories that receive disproportionate emphasis or disproportionate silence

### 3. Behavioral inputs

- Notable pastoral instincts
- Patterns of institutional emphasis
- Conflict posture
- Audience positioning
- Practical ministry habits if publicly evident

Behavioral inputs should be used cautiously. The aim is not amateur psychoanalysis but careful observation of public formative signals. Inferences about motives are out of scope.

## Three layers of analysis

### 1. Tradition pathway

This layer asks what broad ecclesial stream has most likely shaped the subject. For example, evangelical revivalism, Reformed scholasticism, charismatic renewal, or mainline Protestantism each carry recurring philosophical instincts beneath their doctrinal convictions.

### 2. Educational lineage pathway

This layer asks what seminaries, mentors, or intellectual genealogies likely reinforced those assumptions. Schools often transmit philosophical habits beneath formal doctrine — habits the subject may not even know they have inherited.

### 3. Teaching corpus pathway

This layer analyzes the subject's own words, categories, emphases, and patterns. This layer matters most, because teachers are never reducible to institutions; they often exceed or even resist their inheritance.

## Output structure

A Berean profile always begins with strengths. A complete profile should include:

1. Subject summary
2. Strengths to honor (always first)
3. Identified influences
4. Seven-category analysis in canonical order — with strengths observed in each category named alongside drifts
5. What the reader can receive from this teacher
6. Formation considerations (formerly "distortions to watch for")
7. Formation recommendations
8. Reflection questions for the reader

## Charitable engagement standard

Every analysis should be able to pass this question: *If this teacher read this profile, would they recognize it as a fair and generous reading?*

That does not mean flattery. It means that the analysis takes the teacher's best case seriously, names their real gifts first, distinguishes between their doctrinal convictions and their philosophical drifts, and avoids imputing motives where only patterns are visible.

## Required interpretive cautions

- Individuals are more than their school or tribe.
- A tradition map names common inheritances, not deterministic outcomes.
- Real people often blend multiple streams.
- Apparent drifts may coexist with real wisdom and faithful fruit.
- The same teacher may be more covenantal in some categories and less so in others.
- The point is clarity for discernment and formation, not tribal sorting.

## Intended use case

In a later implementation, users would:

1. Submit structured inputs using the form defined by [schemas/berean_input.schema.json](/the-word/berean-tool/reference/berean-input-schema).
2. Receive a structured profile output following [schemas/berean_profile.schema.json](/the-word/berean-tool/reference/berean-profile-schema).
3. Review the profile with a group using the reflection questions in [how_to_use.md](/the-word/berean-tool/how-to-use).
4. Compare the analysis against the covenantal contrasts in [../01_foundational_layer/covenantal_philosophy.md](/the-word/foundational-layer/covenantal-philosophy).

The system should always frame its results as provisional, charitable, and open to correction.
