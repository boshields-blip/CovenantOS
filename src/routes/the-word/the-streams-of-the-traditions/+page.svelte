<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../modules/01_the_word/05_the_streams_of_the_traditions/README.md';
</script>

<ContentLayout
  title="The Streams of the Traditions"
  module="The Word"
  moduleHref="/the-word"
  prevHref="/the-word/knowing-your-own-way/the-cultural-currents"
  prevLabel="The Cultural Currents"
  nextHref="/the-word/the-streams-of-the-traditions/the-traditions"
  nextLabel="The Traditions"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/the-streams-of-the-traditions.png")}
      alt="Many streams winding through a shared landscape beneath a rising sun."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
