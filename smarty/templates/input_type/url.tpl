<!-- url input {$input.id}-->
{if isset($input)}
{if isset($input.label)}
<label for="{$input.id}">{$input.label}</label>
{/if}
<input name="{$input.id}" id="{$input.id}" type="url"{if isset($input.value)} value="{$input.value}"{/if}{if isset($input.placeholder)} placeholder="{$input.placeholder}"{/if} />
{/if}
<!-- /url input {$input.id}-->
