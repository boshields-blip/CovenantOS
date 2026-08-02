<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../modules/01_the_word/03_walking_the_text/README.md';
</script>

<ContentLayout
  title="Walking the Text"
  module="The Word"
  moduleHref="/the-word"
  prevHref="/the-word/the-language-of-the-land/appendix-modern-language"
  prevLabel="How Modern Language Re-Trains Us"
  nextHref="/the-word/walking-the-text/reading-in-context"
  nextLabel="Reading in Context"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/walking-the-text.png")}
      alt="A traveler following a path through grain fields toward a stone gateway."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
