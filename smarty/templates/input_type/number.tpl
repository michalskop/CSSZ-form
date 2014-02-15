<!-- number input {$input.id}-->
{if isset($input)}
{if isset($input.label)}
<label for="{$input.id}">{$input.label}</label>
{/if}
<input name="{$input.id}" id="{$input.id}" type="number"{if isset($input.value)} value="{$input.value}"{/if}{if isset($input.min)} min="{$input.min}"{/if}{if isset($input.max)} max="{$input.max}"{/if}{if isset($input.step)} step="{$input.step}"{/if}{if isset($input.placeholder)} placeholder="{$input.placeholder}"{/if} />
{/if}
<!-- /number input {$input.id}-->
