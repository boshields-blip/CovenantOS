<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../modules/01_the_word/01_the_land_of_the_text/README.md';
</script>

<ContentLayout
  title="The Land of the Text"
  module="The Word"
  moduleHref="/the-word"
  prevHref="/the-word"
  prevLabel="The Word"
  nextHref="/the-word/the-land-of-the-text/the-hebraic-mind"
  nextLabel="The Hebraic Mind"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/the-land-of-the-text.png")}
      alt="An open scroll unfolding into cultivated fields and a distant horizon."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
