<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../modules/02_the_household/OIKONOMIA.md';
</script>

<ContentLayout
  title="Oikonomia"
  module="The Household"
  moduleHref="/the-household"
  nextHref="/the-household/household-flow-model"
  nextLabel="Household Flow Model"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/baker.png")}
      alt="Floured hands lifting a round loaf from a stone hearth oven — the craftsman's labor becoming the household's provision."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
