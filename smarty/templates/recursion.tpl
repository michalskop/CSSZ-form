{* define the function *}
{function name=recursion level=0}
  <div class="ui-field-contain fieldcontain">
  <legend>{$data['legend']}</legend>
  {foreach $data.children as $input}
    {if (isset($input.children)) and (is_array($input.children))}
      {recursion data=$input level=$level+1}
    {else}
      {* this does not work for me: https://github.com/fulopattila122/smarty3-include-if-exists *}
      {* {include_if_exists file="input_type/`$input.type`.tpl"} *}
      {if in_array($input.type, array('text','search','password','textarea','color','url', 'number','select','radio','checkbox','flip','submit','file','button','hidden'))}
        {include file="input_type/`$input.type`.tpl"}
      {/if}
    {/if}
  {/foreach}
  </div> <!-- /fieldcontain with legend {$data['legend']} -->
{/function}

{* run the array through the function *}
<form id="{$data.id}" name="{$data.id}"{if isset($data.action)} action="{$data.action}"{/if}{if isset($data.method)} method="{$data.method}"{/if}{if isset($data.enctype)} enctype="{$data.enctype}"{/if}{if isset($data.onsubmit)} onsubmit="{$data.onsubmit}"{/if} data-ajax="false" >
{recursion data=$data}
</form>
