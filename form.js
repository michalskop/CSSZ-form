
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
