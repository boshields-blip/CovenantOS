<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../modules/01_the_word/06_living_the_covenant/come_to_the_table/GUEST_FAMILY_GUIDE.md';
</script>

<ContentLayout
  title="Guest Family Guide"
  module="The Word"
  moduleHref="/the-word/living-the-covenant"
  prevHref="/the-word/living-the-covenant/come-to-the-table/host-guide"
  prevLabel="Host Guide"
  nextHref="/the-word/living-the-covenant/come-to-the-table/canonical-arc"
  nextLabel="Canonical Arc"
>
  <FormationSubnav activeHref="/the-word/living-the-covenant/come-to-the-table" />
  <Content />
</ContentLayout>
