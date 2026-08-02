<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../modules/01_the_word/04_knowing_your_own_way/README.md';
</script>

<ContentLayout
  title="Knowing Your Own Way"
  module="The Word"
  moduleHref="/the-word"
  prevHref="/the-word/walking-the-text/the-two-and-the-one"
  prevLabel="The Two and the One"
  nextHref="/the-word/knowing-your-own-way/the-seven-questions"
  nextLabel="The Seven Questions"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/knowing-your-own-way.png")}
      alt="A burning lamp beside branching paths that wind through hills toward sunrise."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
