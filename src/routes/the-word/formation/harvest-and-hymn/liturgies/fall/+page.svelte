<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../../modules/01_the_word/05_formation_layer/harvest_and_hymn/liturgies/fall.md';
</script>

<ContentLayout
  title="Fall Liturgy"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/harvest-and-hymn/liturgies/summer"
  prevLabel="Summer Liturgy"
  nextHref="/the-word/formation/harvest-and-hymn/liturgies/winter"
  nextLabel="Winter Liturgy"
>
  <FormationSubnav activeHref="/the-word/formation/harvest-and-hymn" />
  <Content />
</ContentLayout>
