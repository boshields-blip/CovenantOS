<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../modules/01_the_word/06_living_the_covenant/harvest_and_hymn/ELDER_GUIDE.md';
</script>

<ContentLayout
  title="Elder Guide"
  module="The Word"
  moduleHref="/the-word/living-the-covenant"
  prevHref="/the-word/living-the-covenant/harvest-and-hymn/gathering-format"
  prevLabel="Gathering Format"
  nextHref="/the-word/living-the-covenant/harvest-and-hymn/family-preparation"
  nextLabel="Family Preparation"
>
  <FormationSubnav activeHref="/the-word/living-the-covenant/harvest-and-hymn" />
  <Content />
</ContentLayout>
