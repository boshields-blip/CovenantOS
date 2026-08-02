<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import { withBase } from '$lib/paths';
  import Content from '../../../../modules/02_the_household/LAND_AND_INHERITANCE.md';
</script>

<ContentLayout
  title="Land and Inheritance"
  module="The Household"
  moduleHref="/the-household"
  prevHref="/the-household/the-ordered-household"
  prevLabel="The Ordered Household"
  nextHref="/the-household/hebraic-word-studies"
  nextLabel="Hebraic Word Studies"
>
  <figure class="lead-figure">
    <img
      src={withBase("/images/land-and-inheritance.png")}
      alt="An old oak on a boundary line at dusk, a stone water tower rising beside a homestead — generational rootedness in a place."
      loading="eager"
    />
  </figure>
  <Content />
</ContentLayout>
