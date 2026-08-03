<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../modules/03_the_compact/SEEING_THE_NEIGHBOR.md';
</script>

<ContentLayout
  title="Seeing the Neighbor"
  module="The Compact"
  moduleHref="/the-compact"
  prevHref="/the-compact/local-market-and-social-fabric"
  prevLabel="Local Market and Social Fabric"
  nextHref="/the-compact/hebraic-word-studies"
  nextLabel="Hebraic Word Studies"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/seeing-the-neighbor.png")}
      alt="A traveler kneeling to a wounded man at the roadside while others pass on the far side — sight that stops."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
