<!-- submit input {$input.id}-->
{if isset($input)}
{if isset($input.label)}
<label for="{$input.id}">{$input.label}</label>
{/if}
<input name="{$input.id}" id="{$input.id}"{if $data.jqm} class="ui-shadow ui-btn ui-corner-all"{/if} type="submit" value="{$input.value}" />
{/if}
<!-- /submit input {$input.id}-->
