<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../modules/01_the_word/06_living_the_covenant/harvest_and_hymn/PHILOSOPHY.md';
</script>

<ContentLayout
  title="Philosophy"
  module="The Word"
  moduleHref="/the-word/living-the-covenant"
  prevHref="/the-word/living-the-covenant/harvest-and-hymn"
  prevLabel="Harvest & Hymn"
  nextHref="/the-word/living-the-covenant/harvest-and-hymn/seasonal-rhythm"
  nextLabel="Seasonal Rhythm"
>
  <FormationSubnav activeHref="/the-word/living-the-covenant/harvest-and-hymn" />
  <Content />
</ContentLayout>
