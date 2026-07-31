<script>
  import ContentLayout from '$lib/ContentLayout.svelte';

  const formationQuestionsHref =
    'https://github.com/boshields-blip/CovenantOS/blob/main/modules/03_the_compact/FORMATION_QUESTIONS.md';
</script>

<ContentLayout
  title="Compact Builder"
  module="The Compact"
  moduleHref="/the-compact"
  prevHref="/the-compact/hebraic-word-studies"
  prevLabel="Hebraic Word Studies"
>
  <div class="reflective-prompt">
    <p>
      The Compact Builder is a guided reflection tool. It will be available soon. In the meantime, you can
      <a href={formationQuestionsHref}>read the formation questions directly</a>.
    </p>
  </div>
</ContentLayout>
