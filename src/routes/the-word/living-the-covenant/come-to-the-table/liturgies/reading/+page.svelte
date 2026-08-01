<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../../modules/01_the_word/06_living_the_covenant/come_to_the_table/liturgies/reading.md';
</script>

<ContentLayout
  title="Reading Liturgy"
  module="The Word"
  moduleHref="/the-word/living-the-covenant"
  prevHref="/the-word/living-the-covenant/come-to-the-table/liturgies/opening"
  prevLabel="Opening Liturgy"
  nextHref="/the-word/living-the-covenant/come-to-the-table/liturgies/closing"
  nextLabel="Closing Liturgy"
>
  <FormationSubnav activeHref="/the-word/living-the-covenant/come-to-the-table" />
  <Content />
</ContentLayout>
