<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../modules/01_the_word/05_formation_layer/harvest_and_hymn/GATHERING_FORMAT.md';
</script>

<ContentLayout
  title="Gathering Format"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/harvest-and-hymn/seasonal-rhythm"
  prevLabel="Seasonal Rhythm"
  nextHref="/the-word/formation/harvest-and-hymn/elder-guide"
  nextLabel="Elder Guide"
>
  <FormationSubnav activeHref="/the-word/formation/harvest-and-hymn" />
  <Content />
</ContentLayout>
