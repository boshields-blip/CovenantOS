<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../modules/01_the_word/05_formation_layer/harvest_and_hymn/ELDER_GUIDE.md';
</script>

<ContentLayout
  title="Elder Guide"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/harvest-and-hymn/gathering-format"
  prevLabel="Gathering Format"
  nextHref="/the-word/formation/harvest-and-hymn/family-preparation"
  nextLabel="Family Preparation"
>
  <FormationSubnav activeHref="/the-word/formation/harvest-and-hymn" />
  <Content />
</ContentLayout>
