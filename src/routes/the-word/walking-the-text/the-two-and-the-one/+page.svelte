<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../../modules/01_the_word/03_walking_the_text/THE_TWO_AND_THE_ONE.md';
</script>

<ContentLayout
  title="The Two and the One"
  module="The Word"
  moduleHref="/the-word"
  prevHref="/the-word/walking-the-text/to-see"
  prevLabel="To See"
  nextHref="/the-word/knowing-your-own-way"
  nextLabel="Knowing Your Own Way"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/the-two-and-the-one.png")}
      alt="Two trees grown from one root, trunks distinct but intertwined into a single canopy — difference in union."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
