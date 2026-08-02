<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../modules/01_the_word/06_living_the_covenant/README.md';
</script>

<ContentLayout
  title="Living the Covenant"
  module="The Word"
  moduleHref="/the-word"
  prevHref="/the-word/the-streams-of-the-traditions/the-household-covenant-tradition"
  prevLabel="The Household-Covenant Tradition"
  nextHref="/the-word/living-the-covenant/reformation-pathway"
  nextLabel="Re-formation Pathway"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/living-the-covenant.png")}
      alt="A household sharing bread around an outdoor table beside a hearth."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
