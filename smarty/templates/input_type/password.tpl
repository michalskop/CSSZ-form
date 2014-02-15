<!-- password input {$input.id}-->
{if isset($input)}
{if isset($input.label)}
<label for="{$input.id}">{$input.label}</label>
{/if}
<input name="{$input.id}" id="{$input.id}"{if isset($input.placeholder)} placeholder="{$input.placeholder}"{/if} value="{if isset($input.value)}{$input.value}{/if}" type="password" />
{/if}
<!-- /password input {$input.id}-->
