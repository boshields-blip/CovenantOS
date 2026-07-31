<script>
  import ContentLayout from '$lib/ContentLayout.svelte';
  import FormationSubnav from '$lib/FormationSubnav.svelte';
  import Content from '../../../../../../modules/01_the_word/05_formation_layer/come_to_the_table/GUEST_FAMILY_GUIDE.md';
</script>

<ContentLayout
  title="Guest Family Guide"
  module="The Word"
  moduleHref="/the-word/formation"
  prevHref="/the-word/formation/come-to-the-table/host-guide"
  prevLabel="Host Guide"
  nextHref="/the-word/formation/come-to-the-table/canonical-arc"
  nextLabel="Canonical Arc"
>
  <FormationSubnav activeHref="/the-word/formation/come-to-the-table" />
  <Content />
</ContentLayout>
