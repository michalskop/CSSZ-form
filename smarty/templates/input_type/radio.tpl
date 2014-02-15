<!-- radio input {$input.id}-->
{if isset($input)}
<fieldset{if $data.jqm} data-role="controlgroup"{/if}{if ($input.horizontal)} data-type="horizontal"{/if}>
{if isset($input.legend)}
<legend>{$input.legend}</legend>
{/if}
{foreach $input.radio as $key => $radio}
<input name="{$input.id}" id="{$input.id}-{$key}" value="{$radio.value}"{if ($radio.checked)} checked="checked"{/if} type="radio">
<label for="{$input.id}-{$key}">{$radio.label}</label>
{/foreach}
</fieldset>
{/if}
<!-- /radio input {$input.id}-->
