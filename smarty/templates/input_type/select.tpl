<!-- select input {$input.id}-->
{if isset($input)}
{if isset($input.label)}
<label for="{$input.id}">{$input.label}</label>
{/if}
<select{if $input.multiple} multiple="multiple"{/if}{if $data.jqm} data-native-menu="false"{/if} name="{$input.id}" id="{$input.id}">
{foreach $input.option as $option}
<option value="{$option.value}">{$option.html}</option>
{/foreach}
</select>
{/if}
<!-- /select input {$input.id}-->
