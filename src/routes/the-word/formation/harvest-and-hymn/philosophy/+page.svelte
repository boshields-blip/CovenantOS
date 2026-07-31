<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../modules/01_the_word/05_formation_layer/harvest_and_hymn/PHILOSOPHY.md';
</script>

<ContentLayout
  title="Philosophy"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/harvest-and-hymn"
  prevLabel="Harvest & Hymn"
  nextHref="/the-word/formation/harvest-and-hymn/seasonal-rhythm"
  nextLabel="Seasonal Rhythm"
>
  <FormationSubnav activeHref="/the-word/formation/harvest-and-hymn" />
  <Content />
</ContentLayout>
