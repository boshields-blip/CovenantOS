<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../../modules/01_the_word/05_formation_layer/harvest_and_hymn/liturgies/summer.md';
</script>

<ContentLayout
  title="Summer Liturgy"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/harvest-and-hymn/liturgies/spring"
  prevLabel="Spring Liturgy"
  nextHref="/the-word/formation/harvest-and-hymn/liturgies/fall"
  nextLabel="Fall Liturgy"
>
  <FormationSubnav activeHref="/the-word/formation/harvest-and-hymn" />
  <Content />
</ContentLayout>
