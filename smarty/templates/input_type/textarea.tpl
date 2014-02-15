<!-- textarea input {$input.id}-->
{if isset($input)}
{if isset($input.label)}
<label for="{$input.id}">{$input.label}</label>
{/if}
<textarea name="{$input.id}" id="{$input.id}"{if isset($input.cols)} cols="{$input.cols}"{/if}{if isset($input.rows)} cols="{$input.rows}"{/if} >{if isset($input.value)}{$input.value}{/if}</textarea>
{/if}
<!-- /textarea input {$input.id}-->
