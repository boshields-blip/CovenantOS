<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../modules/01_the_word/05_formation_layer/harvest_and_hymn/WORKSHOPS.md';
</script>

<ContentLayout
  title="Workshops"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/harvest-and-hymn/family-preparation"
  prevLabel="Family Preparation"
  nextHref="/the-word/formation/harvest-and-hymn/liturgies/spring"
  nextLabel="Spring Liturgy"
>
  <FormationSubnav activeHref="/the-word/formation/harvest-and-hymn" />
  <Content />
</ContentLayout>
