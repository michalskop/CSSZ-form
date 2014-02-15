<!-- hidden input {$input.id}-->
{if isset($input)}
<input name="{$input.id}" id="{$input.id}" value="{if isset($input.value)}{$input.value}{/if}" type="hidden" />
{/if}
<!-- /hidden input {$input.id}-->
