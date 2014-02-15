<!-- file input {$input.id}-->
{if isset($input)}
{if isset($input.label)}
<label for="{$input.id}">{$input.label}</label>
{/if}
<input name="{$input.id}" id="{$input.id}" type="file" />
{/if}
<!-- /file input {$input.id}-->
