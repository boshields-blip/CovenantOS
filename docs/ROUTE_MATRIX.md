# Route Matrix

Status: Draft | Owner: @boshields-blip | Last updated: 2026-08-01

---

> **The Word was restructured on 2026-08-01.** The module is now six movements — The Land of the Text, The Language of the Land, Walking the Text, Knowing Your Own Way, The Streams of the Traditions, and Living the Covenant. The Diagnostic Engine and Berean Tool routes are retired. See `docs/WORD_REDESIGN.md` for the full rationale and map.


This matrix is the canonical route-to-content map for the static web build. Reference routes are valid direct-link destinations but are never surfaced in primary navigation.

## Global

| Route | Content Source File | Nav Label | Route Type | Notes |
|---|---|---|---|---|
| `/` | `docs/INTRODUCTION.md` | Home | content-page | Homepage is The Covenant Map; hero copy is supported by the three module landing summaries. |

## The Word

Restructured into six movements (see `docs/WORD_REDESIGN.md`). The former Diagnostic Engine, Berean Tool, Foundational Layer, and Language Module route trees are retired; their content is absorbed, reframed, or removed per the redesign.

| Route | Content Source File | Nav Label | Route Type |
|---|---|---|---|
| `/the-word` | landing component | The Word | module-landing |
| `/the-word/introduction` | `modules/01_the_word/INTRODUCTION.md` | Introduction | content-page |
| `/the-word/the-land-of-the-text` | `01_the_land_of_the_text/README.md` | The Land of the Text | content-page |
| `/the-word/the-land-of-the-text/the-hebraic-mind` | `01_the_land_of_the_text/THE_HEBRAIC_MIND.md` | The Hebraic Mind | content-page |
| `/the-word/the-land-of-the-text/the-ancient-near-eastern-world` | `01_the_land_of_the_text/THE_ANCIENT_NEAR_EASTERN_WORLD.md` | The Ancient Near Eastern World | content-page |
| `/the-word/the-land-of-the-text/the-covenant-story` | `01_the_land_of_the_text/THE_COVENANT_STORY.md` | The Covenant Story | content-page |
| `/the-word/the-language-of-the-land` | `02_the_language_of_the_land/README.md` | The Language of the Land | content-page |
| `/the-word/the-language-of-the-land/hebrew-word-pictures` | `02_the_language_of_the_land/HEBREW_WORD_PICTURES.md` | Hebrew Word Pictures | content-page |
| `/the-word/the-language-of-the-land/thinking-in-blocks` | `02_the_language_of_the_land/THINKING_IN_BLOCKS.md` | Thinking in Blocks | content-page |
| `/the-word/the-language-of-the-land/appendix-modern-language` | `02_the_language_of_the_land/APPENDIX_MODERN_LANGUAGE.md` | How Modern Language Re-Trains Us | reference |
| `/the-word/walking-the-text` | `03_walking_the_text/README.md` | Walking the Text | content-page |
| `/the-word/walking-the-text/reading-in-context` | `03_walking_the_text/READING_IN_CONTEXT.md` | Reading in Context | content-page |
| `/the-word/walking-the-text/the-walk` | `03_walking_the_text/THE_WALK.md` | The Walk | content-page |
| `/the-word/knowing-your-own-way` | `04_knowing_your_own_way/README.md` | Knowing Your Own Way | content-page |
| `/the-word/knowing-your-own-way/the-seven-questions` | `04_knowing_your_own_way/THE_SEVEN_QUESTIONS.md` | The Seven Questions | content-page |
| `/the-word/knowing-your-own-way/the-cultural-currents` | `04_knowing_your_own_way/THE_CULTURAL_CURRENTS.md` | The Cultural Currents | content-page |
| `/the-word/knowing-your-own-way/the-examination` | `content/data/knowing_your_own_way.json` | The Examination | tool |
| `/the-word/the-streams-of-the-traditions` | `05_the_streams_of_the_traditions/README.md` | The Streams of the Traditions | content-page |
| `/the-word/the-streams-of-the-traditions/the-traditions` | `05_the_streams_of_the_traditions/THE_TRADITIONS.md` | The Traditions | content-page |
| `/the-word/the-streams-of-the-traditions/the-household-covenant-tradition` | `05_the_streams_of_the_traditions/THE_HOUSEHOLD_COVENANT_TRADITION.md` | The Household-Covenant Tradition | content-page |
| `/the-word/the-streams-of-the-traditions/explore` | `content/data/streams.json` | Explore the Streams | tool |
| `/the-word/living-the-covenant` | `06_living_the_covenant/README.md` | Living the Covenant | content-page |
| `/the-word/living-the-covenant/reformation-pathway` | `06_living_the_covenant/reformation_pathway.md` | Re-formation Pathway | content-page |
| `/the-word/living-the-covenant/come-to-the-table/**` | `06_living_the_covenant/come_to_the_table/*` | Come to the Table | content-page (subtree retained from former Formation) |
| `/the-word/living-the-covenant/harvest-and-hymn/**` | `06_living_the_covenant/harvest_and_hymn/*` | Harvest & Hymn | content-page (subtree retained from former Formation) |


## The Household

| Route | Content Source File | Nav Label | Route Type | Notes |
|---|---|---|---|---|
| `/the-household` | `modules/02_the_household/README.md` | The Household | module-landing | Module landing with stepping-stone pathway and contextual banner when deep-linked directly. |
| `/the-household/oikonomia` | `modules/02_the_household/OIKONOMIA.md` | Oikonomia | content-page | Suggested entry point for Module 2. |
| `/the-household/household-flow-model` | `modules/02_the_household/HOUSEHOLD_FLOW_MODEL.md` | Household Flow Model | tool | Narrative page with the animated circular household flow diagram and consumer economy toggle. |
| `/the-household/agrarian-rhythms` | `modules/02_the_household/AGRARIAN_RHYTHMS.md` | Agrarian Rhythms | content-page | Embodied stewardship page. |
| `/the-household/household-vs-consumer-economy` | `modules/02_the_household/HOUSEHOLD_VS_CONSUMER_ECONOMY.md` | Household vs Consumer Economy | content-page | Comparison panel-heavy page. |
| `/the-household/land-and-inheritance` | `modules/02_the_household/LAND_AND_INHERITANCE.md` | Land and Inheritance | content-page | Inheritance-focused page. |
| `/the-household/hebraic-word-studies` | `modules/02_the_household/HEBRAIC_WORD_STUDIES.md` | Hebraic Word Studies | content-page | Word-study page using inline Hebrew word cards. |

## The Compact

| Route | Content Source File | Nav Label | Route Type | Notes |
|---|---|---|---|---|
| `/the-compact` | `modules/03_the_compact/README.md` | The Compact | module-landing | Module landing with stepping-stone pathway and contextual banner when deep-linked directly. |
| `/the-compact/covenant-vs-contract` | `modules/03_the_compact/COVENANT_VS_CONTRACT.md` | Covenant vs. Contract | content-page | Suggested entry point for Module 3. |
| `/the-compact/subsidiarity` | `modules/03_the_compact/SUBSIDIARITY.md` | Subsidiarity | content-page | Authority-ordering page. |
| `/the-compact/commons-and-shared-life` | `modules/03_the_compact/COMMONS_AND_SHARED_LIFE.md` | Commons and Shared Life | content-page | Commons formation page. |
| `/the-compact/peoplehood` | `modules/03_the_compact/PEOPLEHOOD.md` | Peoplehood | content-page | Peoplehood and belonging page. |
| `/the-compact/local-market-and-social-fabric` | `modules/03_the_compact/LOCAL_MARKET_AND_SOCIAL_FABRIC.md` | Local Market and Social Fabric | content-page | Local trade and social fabric page. |
| `/the-compact/hebraic-word-studies` | `modules/03_the_compact/HEBRAIC_WORD_STUDIES.md` | Hebraic Word Studies | content-page | Word-study page using inline Hebrew word cards. |
| `/the-compact/formation-questions` | `modules/03_the_compact/FORMATION_QUESTIONS.md` | Compact Builder | tool | Local-only reflection and print/export tool whose copy is authored in the capstone formation questions and consumed through the structured mirror at `content/data/compact_builder.json`. |


## Addendum — the seeing arc (2026-08-01)

| Route | Content Source File | Nav Label | Route Type |
|---|---|---|---|
| `/the-word/walking-the-text/to-see` | `modules/01_the_word/03_walking_the_text/TO_SEE.md` | To See | content-page |
| `/the-word/walking-the-text/the-two-and-the-one` | `modules/01_the_word/03_walking_the_text/THE_TWO_AND_THE_ONE.md` | The Two and the One | content-page |
| `/the-household/the-household-hollowed` | `modules/02_the_household/THE_HOUSEHOLD_HOLLOWED.md` | The Household Hollowed | content-page |
| `/the-household/the-ordered-household` | `modules/02_the_household/THE_ORDERED_HOUSEHOLD.md` | The Ordered Household | content-page |
| `/the-compact/seeing-the-neighbor` | `modules/03_the_compact/SEEING_THE_NEIGHBOR.md` | Seeing the Neighbor | content-page |
