<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../modules/01_the_word/02_the_language_of_the_land/README.md';
</script>

<ContentLayout
  title="The Language of the Land"
  module="The Word"
  moduleHref="/the-word"
  prevHref="/the-word/the-land-of-the-text/the-covenant-story"
  prevLabel="The Covenant Story"
  nextHref="/the-word/the-language-of-the-land/hebrew-word-pictures"
  nextLabel="Hebrew Word Pictures"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/the-language-of-the-land.png")}
      alt="A scribe writing on a scroll beside an oil lamp, ink pot, and grain."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
