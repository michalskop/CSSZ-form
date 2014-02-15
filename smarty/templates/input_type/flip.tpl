<!-- flip input {$input.id}-->
{if isset($input)}
{if isset($input.label)}
<label>{$input.label}</label>
{/if}
<select name="{$input.id}" id="{$input.id}" data-role="slider">
    <option value="{$input.flip[0].value}"{if $input.flip[0].selected} selected="selected"{/if}>{$input.flip[0].html}</option>
    <option value="{$input.flip[1].value}"{if $input.flip[1].selected} selected="selected"{/if}>{$input.flip[1].html}</option>
</select>
{/if}
<!-- /flip input {$input.id}-->
