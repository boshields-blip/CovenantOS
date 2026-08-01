<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../../modules/01_the_word/06_living_the_covenant/harvest_and_hymn/liturgies/fall.md';
</script>

<ContentLayout
  title="Fall Liturgy"
  module="The Word"
  moduleHref="/the-word/living-the-covenant"
  prevHref="/the-word/living-the-covenant/harvest-and-hymn/liturgies/summer"
  prevLabel="Summer Liturgy"
  nextHref="/the-word/living-the-covenant/harvest-and-hymn/liturgies/winter"
  nextLabel="Winter Liturgy"
>
  <FormationSubnav activeHref="/the-word/living-the-covenant/harvest-and-hymn" />
  <Content />
</ContentLayout>
