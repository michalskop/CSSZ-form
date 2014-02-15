<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>{$data.title}</title>
	<link rel="shortcut icon" href="favicon.ico">
    <!--<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">-->
    <link rel="stylesheet" href="./jquery/fonts.htm">
	<link rel="stylesheet" href="./jquery/jquery.mobile-1.4.0.min.css">
	<link rel="stylesheet" href="./style.css">
	<script src="./jquery/jquery-1.10.2.min.js"></script>
	<script src="./jquery/jquery.mobile-1.4.0.min.js"></script>
	<script src="./jquery/jquery-deserialize-master/src/jquery.deserialize.js"></script>


	{block name=head}{/block}
</head>
<body>

<div data-role="page" id="page">
    {if (isset($data.submit_id))}
    <script>
    $( document ).on( "click",'#{$data.submit_id}',function() {
      $('#popupTextarea').val($('#{$data.id}').serialize());
      $('#popupData').popup('open');
    });
    $( document ).on( "click",'#popupClose',function() {
      $('#popupData').popup('close');
      //we need to repopulate the form, the close event gets us back to empty form
      location.search = '?' + $('#{$data.id}').serialize();
      populate();
    });
  </script>
    {/if}
  <script>
    $( document ).on( "click",'#inputPopulate',function() {
      location.search = '?' + $('#inputTextarea').val();
      populate();
    });
    $( document ).on( "pagecreate", "#page", function( event ) {
      jQuery(function( $ ) {
          populate();
      });
      $('#divpopulate').hide();
    });
    $( document ).on( "click",'#buttonpopulate',function() {
      $('#divpopulate').show(500);
    });


    function populate() {
      //this populates form 
      $( '#{$data.id}' ).deserialize( location.search.substr( 1 ) );
        $('#{$data.id}').trigger('create');
        $('select').selectmenu('refresh');
        //$('select[multiple="multiple"]').selectmenu('refresh');
        //$('select[data-role=slider]').slider('refresh');
    }
  </script>
  <div data-role="header">
    {block name=header}{/block}
  </div> <!-- /header -->
  <div data-role="content">
    {block name=content}{/block}
    
    {if $data.populate}
    <button id="buttonpopulate" lass="ui-btn ui-btn-inline ui-icon-delete ui-btn-icon-left">Populate form with saved values</button>
    <div data-theme="e" id="divpopulate">
        <label for="inputTextarea">Populate form by saved text:</label>
        <textarea name="inputTextarea" id="inputTextarea" ></textarea>
         <button id="inputPopulate" class="ui-btn ui-corner-all ui-shadow ui-btn-e ui-btn-icon-left ui-icon-check">Populate</button>
    </div>
    {/if}
    
    {include file="recursion.tpl"}
    
    <div data-role="popup" id="popupData" data-theme="a" class="ui-corner-all" data-overlay-theme="a">
        <form>
            <div style="padding:10px 20px;">
                <h3>Save values</h3>
                <label for="popupTextarea">Copy this and save it for future:</label>
<textarea name="popupTextarea" id="popupTextarea" ></textarea>
                <button id="popupClose" class="ui-btn ui-corner-all ui-shadow ui-btn-b ui-btn-icon-left ui-icon-check">OK</button>
</div>
        </form>
    </div>
    
  </div> <!-- /content -->
  <div data-role="footer">
    {block name=footer}{/block}
  </div> <!-- /footer -->
</div> <!-- /page -->
</body>
</html>
