<!-- checkbox input {$input.id}-->
{if isset($input)}
{if ((isset($input.checkbox[0])) and (is_array($input.checkbox[0])))}
<fieldset{if $data.jqm} data-role="controlgroup"{/if}{if ($input.horizontal)} data-type="horizontal"{/if}>
{if isset($input.legend)}
<legend>{$input.legend}</legend>
{/if}
{foreach $input.checkbox as $key => $checkbox}
<input name="{$input.id}" id="{$input.id}-{$key}" value="{$checkbox.value}"{if ($checkbox.checked)} checked="checked"{/if} type="checkbox">
<label for="{$input.id}-{$key}">{$checkbox.label}</label>
{/foreach}
</fieldset>
{else}
<input name="{$input.id}" id="{$input.id}" value="{$input.checkbox.value}"{if ($input.checkbox.checked)} checked="checked"{/if} type="checkbox">
<label for="{$input.id}">{$input.label}</label>
{/if}
{/if}
<!-- /checkbox input {$input.id}-->
