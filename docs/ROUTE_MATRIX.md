# Route Matrix

Status: Draft | Owner: @boshields-blip | Last updated: 2026-07-31

---

This matrix is the canonical route-to-content map for the static web build. Reference routes are valid direct-link destinations but are never surfaced in primary navigation.

## Global

| Route | Content Source File | Nav Label | Route Type | Notes |
|---|---|---|---|---|
| `/` | `docs/INTRODUCTION.md` | Home | content-page | Homepage is The Covenant Map; hero copy is supported by the three module landing summaries. |

## The Word

| Route | Content Source File | Nav Label | Route Type | Notes |
|---|---|---|---|---|
| `/the-word` | `modules/01_the_word/README.md` | The Word | module-landing | Five-region module entry for The Word with no global nav bar. |
| `/the-word/introduction` | `modules/01_the_word/INTRODUCTION.md` | Introduction | content-page | Suggested first read inside The Word. |
| `/the-word/foundational-layer` | `modules/01_the_word/01_foundational_layer/README.md` | Foundational Layer | content-page | Layer overview page. |
| `/the-word/foundational-layer/covenantal-philosophy` | `modules/01_the_word/01_foundational_layer/covenantal_philosophy.md` | Covenantal Philosophy | content-page | Primary first-principles page for The Word. |
| `/the-word/diagnostic-engine` | `modules/01_the_word/02_diagnostic_engine/README.md` | Diagnostic Engine | content-page | Landing page for the seven-category diagnostic pathway. |
| `/the-word/diagnostic-engine/categories/metaphysics` | `modules/01_the_word/02_diagnostic_engine/categories/01_metaphysics.md` | Metaphysics | content-page | Category page; also available through the guided walk and side-drawer cross-references. |
| `/the-word/diagnostic-engine/categories/epistemology` | `modules/01_the_word/02_diagnostic_engine/categories/02_epistemology.md` | Epistemology | content-page | Category page; also available through the guided walk and side-drawer cross-references. |
| `/the-word/diagnostic-engine/categories/anthropology` | `modules/01_the_word/02_diagnostic_engine/categories/03_anthropology.md` | Anthropology | content-page | Category page; also available through the guided walk and side-drawer cross-references. |
| `/the-word/diagnostic-engine/categories/ethics` | `modules/01_the_word/02_diagnostic_engine/categories/04_ethics.md` | Ethics | content-page | Category page; also available through the guided walk and side-drawer cross-references. |
| `/the-word/diagnostic-engine/categories/social-political` | `modules/01_the_word/02_diagnostic_engine/categories/05_social_political.md` | Social/Political | content-page | Category page; also available through the guided walk and side-drawer cross-references. |
| `/the-word/diagnostic-engine/categories/identity-meaning` | `modules/01_the_word/02_diagnostic_engine/categories/06_identity_meaning.md` | Identity and Meaning | content-page | Category page; also available through the guided walk and side-drawer cross-references. |
| `/the-word/diagnostic-engine/categories/eschatology` | `modules/01_the_word/02_diagnostic_engine/categories/07_eschatology.md` | Eschatology | content-page | Category page; also available through the guided walk and side-drawer cross-references. |
| `/the-word/diagnostic-engine/philosophy-modules` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/README.md` | Philosophy Modules | content-page | Index for named rival philosophy modules. |
| `/the-word/diagnostic-engine/philosophy-modules/consumerism` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/consumerism.md` | Consumerism | content-page | Referenceable analysis page linked from diagnostic categories and comparison panels. |
| `/the-word/diagnostic-engine/philosophy-modules/expressive-individualism` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/expressive_individualism.md` | Expressive Individualism | content-page | Referenceable analysis page linked from diagnostic categories and comparison panels. |
| `/the-word/diagnostic-engine/philosophy-modules/materialism` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/materialism.md` | Materialism | content-page | Referenceable analysis page linked from diagnostic categories and comparison panels. |
| `/the-word/diagnostic-engine/philosophy-modules/postmodernism` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/postmodernism.md` | Postmodernism | content-page | Referenceable analysis page linked from diagnostic categories and comparison panels. |
| `/the-word/diagnostic-engine/philosophy-modules/progressivist-utopianism` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/progressivist_utopianism.md` | Progressivist Utopianism | content-page | Referenceable analysis page linked from diagnostic categories and comparison panels. |
| `/the-word/diagnostic-engine/philosophy-modules/technocratic-rationalism` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/technocratic_rationalism.md` | Technocratic Rationalism | content-page | Referenceable analysis page linked from diagnostic categories and comparison panels. |
| `/the-word/diagnostic-engine/philosophy-modules/therapeutic-anthropology` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/therapeutic_anthropology.md` | Therapeutic Anthropology | content-page | Referenceable analysis page linked from diagnostic categories and comparison panels. |
| `/the-word/diagnostic-engine/western-christianity-diagnostic-map` | `modules/01_the_word/02_diagnostic_engine/western_christianity_diagnostic_map.md` | Western Diagnostic Map | content-page | Reference map page for the diagnostic engine. |
| `/the-word/diagnostic-engine/walk` | `content/data/diagnostic_walk.json` | Diagnostic Walk | tool | Guided seven-category reflection tool driven by canonical JSON sourced from the category files. |
| `/the-word/diagnostic-engine/reference/philosophy-module-template` | `modules/01_the_word/02_diagnostic_engine/philosophy_modules/_template.md` | Philosophy Module Template | reference | Reference-only contributor template; never surfaced in navigation. |
| `/the-word/berean-tool` | `modules/01_the_word/03_berean_tool/README.md` | Berean Tool | content-page | Landing page for the Berean discernment workflow. |
| `/the-word/berean-tool/how-to-use` | `modules/01_the_word/03_berean_tool/how_to_use.md` | How to Use | content-page | Instruction page immediately upstream of the tool. |
| `/the-word/berean-tool/profile-builder` | `modules/01_the_word/03_berean_tool/schemas/berean_input.schema.json` | Profile Builder | tool | Interactive structured builder driven by the existing input schema and output profile schema. |
| `/the-word/berean-tool/system-design` | `modules/01_the_word/03_berean_tool/system_design.md` | System Design | content-page | System rationale and architecture page. |
| `/the-word/berean-tool/tradition-influence-map` | `modules/01_the_word/03_berean_tool/tradition_influence_map.md` | Tradition Influence Map | content-page | Supporting reference page for tradition streams. |
| `/the-word/berean-tool/sample-profiles/composite-example` | `modules/01_the_word/03_berean_tool/sample_profiles/composite_example.md` | Composite Example | content-page | Worked example profile. |
| `/the-word/berean-tool/reference/berean-profile-template` | `modules/01_the_word/03_berean_tool/berean_profile_template.md` | Berean Profile Template | reference | Reference-only template page; available by direct link, not nav-surfaced. |
| `/the-word/berean-tool/reference/berean-input-schema` | `modules/01_the_word/03_berean_tool/schemas/berean_input.schema.json` | Berean Input Schema | reference | Reference-only schema route; not nav-surfaced. |
| `/the-word/berean-tool/reference/berean-profile-schema` | `modules/01_the_word/03_berean_tool/schemas/berean_profile.schema.json` | Berean Profile Schema | reference | Reference-only schema route; not nav-surfaced. |
| `/the-word/language-module` | `modules/01_the_word/04_language_module/README.md` | Language Module | content-page | Landing page for covenantal vocabulary formation. |
| `/the-word/language-module/linguistic-foundations` | `modules/01_the_word/04_language_module/linguistic_foundations.md` | Linguistic Foundations | content-page | Core theory page for the language layer. |
| `/the-word/language-module/linguistic-scanner-design` | `modules/01_the_word/04_language_module/linguistic_scanner_design.md` | Linguistic Scanner Design | content-page | Design page for scanning and interpretive flow. |
| `/the-word/language-module/two-major-distortions` | `modules/01_the_word/04_language_module/two_major_distortions.md` | Two Major Distortions | content-page | Essay page tied to the language layer. |
| `/the-word/language-module/worldly-vs-covenantal-dictionary` | `modules/01_the_word/04_language_module/worldly_vs_covenantal_dictionary.md` | Worldly vs Covenantal Dictionary | content-page | Dictionary page; Hebrew word cards appear inline where applicable. |
| `/the-word/language-module/reference/language-diagnostic-schema` | `modules/01_the_word/04_language_module/schemas/language_diagnostic.schema.json` | Language Diagnostic Schema | reference | Reference-only schema route; not nav-surfaced. |
| `/the-word/formation` | `modules/01_the_word/05_formation_layer/README.md` | Formation | content-page | Formation landing; sub-navigation appears only inside this subtree. |
| `/the-word/formation/reformation-pathway` | `modules/01_the_word/05_formation_layer/reformation_pathway.md` | Re-formation Pathway | content-page | Overview page linking the formation practices back to lower layers. |
| `/the-word/formation/come-to-the-table` | `modules/01_the_word/05_formation_layer/come_to_the_table/README.md` | Come to the Table | content-page | Formation practice landing page inside the gated sub-navigation subtree. |
| `/the-word/formation/come-to-the-table/philosophy` | `modules/01_the_word/05_formation_layer/come_to_the_table/PHILOSOPHY.md` | Philosophy | content-page | Sub-nav only within /the-word/formation/. |
| `/the-word/formation/come-to-the-table/session-format` | `modules/01_the_word/05_formation_layer/come_to_the_table/SESSION_FORMAT.md` | Session Format | content-page | Sub-nav only within /the-word/formation/. |
| `/the-word/formation/come-to-the-table/host-guide` | `modules/01_the_word/05_formation_layer/come_to_the_table/HOST_GUIDE.md` | Host Guide | content-page | Sub-nav only within /the-word/formation/. |
| `/the-word/formation/come-to-the-table/guest-family-guide` | `modules/01_the_word/05_formation_layer/come_to_the_table/GUEST_FAMILY_GUIDE.md` | Guest Family Guide | content-page | Sub-nav only within /the-word/formation/. |
| `/the-word/formation/come-to-the-table/canonical-arc` | `modules/01_the_word/05_formation_layer/come_to_the_table/CANONICAL_ARC.md` | Canonical Arc | content-page | Sub-nav only within /the-word/formation/. |
| `/the-word/formation/come-to-the-table/age-bands` | `modules/01_the_word/05_formation_layer/come_to_the_table/AGE_BANDS.md` | Age Bands | content-page | Sub-nav only within /the-word/formation/. |
| `/the-word/formation/come-to-the-table/authors-and-languages` | `modules/01_the_word/05_formation_layer/come_to_the_table/AUTHORS_AND_LANGUAGES.md` | Authors and Languages | content-page | Sub-nav only within /the-word/formation/. |
| `/the-word/formation/come-to-the-table/berean-at-the-table` | `modules/01_the_word/05_formation_layer/come_to_the_table/BEREAN_AT_THE_TABLE.md` | Berean at the Table | content-page | Sub-nav only within /the-word/formation/. |
| `/the-word/formation/come-to-the-table/seasonal-liturgy` | `modules/01_the_word/05_formation_layer/come_to_the_table/SEASONAL_LITURGY.md` | Seasonal Liturgy | content-page | Sub-nav only within /the-word/formation/. |
| `/the-word/formation/come-to-the-table/liturgies/opening` | `modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/opening.md` | Opening Liturgy | content-page | Liturgy page; reached from the formation sub-nav and side-drawer references. |
| `/the-word/formation/come-to-the-table/liturgies/reading` | `modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/reading.md` | Reading Liturgy | content-page | Liturgy page; reached from the formation sub-nav and side-drawer references. |
| `/the-word/formation/come-to-the-table/liturgies/closing` | `modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/closing.md` | Closing Liturgy | content-page | Liturgy page; reached from the formation sub-nav and side-drawer references. |
| `/the-word/formation/come-to-the-table/liturgies/seasonal/spring` | `modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/seasonal/spring.md` | Spring Seasonal Overlay | content-page | Seasonal liturgy overlay; sub-nav only within /the-word/formation/. |
| `/the-word/formation/come-to-the-table/liturgies/seasonal/summer` | `modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/seasonal/summer.md` | Summer Seasonal Overlay | content-page | Seasonal liturgy overlay; sub-nav only within /the-word/formation/. |
| `/the-word/formation/come-to-the-table/liturgies/seasonal/fall` | `modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/seasonal/fall.md` | Fall Seasonal Overlay | content-page | Seasonal liturgy overlay; sub-nav only within /the-word/formation/. |
| `/the-word/formation/come-to-the-table/liturgies/seasonal/winter` | `modules/01_the_word/05_formation_layer/come_to_the_table/liturgies/seasonal/winter.md` | Winter Seasonal Overlay | content-page | Seasonal liturgy overlay; sub-nav only within /the-word/formation/. |
| `/the-word/formation/harvest-and-hymn` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/README.md` | Harvest & Hymn | content-page | Formation practice landing page inside the gated sub-navigation subtree. |
| `/the-word/formation/harvest-and-hymn/philosophy` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/PHILOSOPHY.md` | Philosophy | content-page | Sub-nav only within /the-word/formation/. |
| `/the-word/formation/harvest-and-hymn/seasonal-rhythm` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/SEASONAL_RHYTHM.md` | Seasonal Rhythm | content-page | Sub-nav only within /the-word/formation/. |
| `/the-word/formation/harvest-and-hymn/gathering-format` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/GATHERING_FORMAT.md` | Gathering Format | content-page | Sub-nav only within /the-word/formation/. |
| `/the-word/formation/harvest-and-hymn/elder-guide` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/ELDER_GUIDE.md` | Elder Guide | content-page | Sub-nav only within /the-word/formation/. |
| `/the-word/formation/harvest-and-hymn/family-preparation` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/FAMILY_PREPARATION.md` | Family Preparation | content-page | Sub-nav only within /the-word/formation/. |
| `/the-word/formation/harvest-and-hymn/workshops` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/WORKSHOPS.md` | Workshops | content-page | Sub-nav only within /the-word/formation/. |
| `/the-word/formation/harvest-and-hymn/liturgies/spring` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/liturgies/spring.md` | Spring Liturgy | content-page | Seasonal liturgy page; sub-nav only within /the-word/formation/. |
| `/the-word/formation/harvest-and-hymn/liturgies/summer` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/liturgies/summer.md` | Summer Liturgy | content-page | Seasonal liturgy page; sub-nav only within /the-word/formation/. |
| `/the-word/formation/harvest-and-hymn/liturgies/fall` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/liturgies/fall.md` | Fall Liturgy | content-page | Seasonal liturgy page; sub-nav only within /the-word/formation/. |
| `/the-word/formation/harvest-and-hymn/liturgies/winter` | `modules/01_the_word/05_formation_layer/harvest_and_hymn/liturgies/winter.md` | Winter Liturgy | content-page | Seasonal liturgy page; sub-nav only within /the-word/formation/. |

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
| `/the-compact/formation-questions` | `modules/03_the_compact/FORMATION_QUESTIONS.md` | Compact Builder | tool | Local-only reflection and print/export tool sourced from the capstone formation questions and structured by `content/data/compact_builder.json`. |
