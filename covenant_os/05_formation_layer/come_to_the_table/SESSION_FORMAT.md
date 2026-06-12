# Session Format — Come to the Table

## The canonical session

Every Come to the Table session follows the same seven-movement shape. The movements are simple enough to hold without notes once the practice is familiar, and short enough that the whole liturgy fits inside a normal meal.

**Total target time: ~10–15 minutes**, embedded in the meal — not added on top of it.

---

## The seven movements

| # | Movement | Target time | What happens |
|---|---|---|---|
| 1 | **Gather** | ~1 min | Everyone is seated. The host names the passage and author in one sentence. Phones are away. |
| 2 | **Bless the meal** | ~1 min | A short, said-aloud blessing of the food. Children are invited to say it with the host. Use [liturgies/opening.md](./liturgies/opening.md) or your own household blessing. |
| 3 | **Read** | 1–3 min | The passage is read aloud, slowly, from a real Bible. See [liturgies/reading.md](./liturgies/reading.md) for guidance on how. |
| 4 | **Notice** | 2–4 min | "What did you hear?" Round the table: every voice gets one turn before any voice gets a second turn. The youngest band speaks first. |
| 5 | **Know** | 2–4 min | The host adds one thing about the passage — author, language, setting, or covenantal frame. One thing only. See [AUTHORS_AND_LANGUAGES.md](./AUTHORS_AND_LANGUAGES.md). |
| 6 | **Live** | 2–3 min | "In light of who God is here, how do we live this week?" One concrete, household-sized response is named. |
| 7 | **Bless and send** | ~1 min | A short closing blessing as plates are cleared. See [liturgies/closing.md](./liturgies/closing.md). |

---

## Notes on each movement

### 1. Gather

The host gathers attention simply: *"Tonight we are reading from [book], chapter [x]. It was written by [author]."* That is enough. No lengthy introduction. The passage itself will introduce itself.

If younger children are restless, Gather is the right moment for them to be settled — held, given a task, or greeted by name. Their presence is important even before they are attentive.

### 2. Bless the meal

The blessing is said aloud and said together when possible. It should be short and sayable by a child. If the household has an established blessing, use it. If not, [liturgies/opening.md](./liturgies/opening.md) is available.

The meal blessing is not the same as the passage. It is a recognition that the food itself is a gift from the Creator about whom the passage will speak. The continuity between the blessing and the reading matters.

### 3. Read

The passage is read from a physical Bible when possible. This is an intentional signal: the words belong to a book, the book has a history, the book was carried by people who read it before us.

Read slowly. Pause at the end of a sentence. Read it a second time if young children are present. Older children may read — this is encouraged. See [liturgies/reading.md](./liturgies/reading.md) for more guidance.

Do not quote or paraphrase the passage. Read it. The exact words matter.

### 4. Notice

*"What did you hear?"*

This is the most important question of the session and the one most easily distorted by performance pressure. The goal is not correct answers. It is attentive presence. Every person at the table belongs inside this movement.

The host begins with the youngest band. Even a very young child can say a word they heard ("light," "shepherd," "water") without being asked to explain it. That is enough.

The host's job in Notice is:
- Start with the youngest.
- Welcome whatever is said.
- Ask "what made you think of that?" when something interesting surfaces.
- Do not correct or redirect wrong answers — redirect with curiosity.
- Keep it moving; do not let one voice take the floor.

See [AGE_BANDS.md](./AGE_BANDS.md) for how to invite each age into this movement.

### 5. Know

The host adds one piece of information about the passage. One. Not a short lecture. Not several interesting notes. One.

This is the rotating "Know" slot, and it rotates through seven categories over successive sessions: author, audience, language note, genre, covenantal frame, philosophy point, and living tradition.

The discipline of *one* is important. Over years, one thing per week accumulates into a rich formation. Trying to say five things produces glazed eyes and nothing retained.

### 6. Live

*"In light of who God is here, how do we live this week?"*

This movement turns from hearing and knowing to acting. The response should be:
- **Concrete** — not "be kinder" but "when your brother takes your toy this week, try putting it back instead of taking it."
- **Household-sized** — something the whole table can do or remember together.
- **Short** — one invitation, named once, perhaps written on a card or put somewhere visible.

The session file's `live_invitation` field is a suggested phrasing. The host may adapt it freely.

### 7. Bless and send

The closing blessing is brief. It marks the end of the session and releases the household into the rest of the evening. It need not be elaborate. See [liturgies/closing.md](./liturgies/closing.md).

---

## The canonical shape and session files

Every file in `sessions/` follows this same seven-movement shape. The session files do not contain the full liturgy text — they contain the session-specific data: the passage reference, the author, the notice prompts, the Know slot category, and the live invitation.

The host reads the session file once in preparation and then leads from memory and the Bible, not from a script.

---

## What to do if a movement stalls

- **Silence in Notice:** Let it breathe for a few seconds, then gently re-invite the youngest person: *"[Name], what's one word you heard?"*
- **A tangent that will not end:** Acknowledge it briefly — *"That's worth thinking about"* — and name the transition: *"Let me share one more thing and then we'll get to Live."*
- **The Know slot lands flat:** That is fine. Move to Live. Not every session will feel generative. Presence matters more than insight.
- **Running long:** Move directly from Notice to Live if needed. Movement 5 can be skipped without breaking the session. Movements 4 and 6 are the irreducible core.
