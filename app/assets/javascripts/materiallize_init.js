$(document).on('turbolinks:load', function(){
  $('.sidenav').sidenav();
  $('.datepicker').datepicker({
    format: 'yyyy-mm-dd',
    // i18n: {
    //         months: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
    //         monthsShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
    //         weekdaysAbbrev: ['日','月','火','水','木','金','土'],
    //         weekdaysShort: ['日','月','火','水','木','金','土']
    //     },
    autoClose: true,
    showMonthAfterYear: true,
    showClearBtn: true
  });

  $('.dropdown-trigger').dropdown();
  $('.modal').modal();
  $('.chips').chips();
  
  $('.chips-initial').chips({
    data: [{
      tag: 'Apple',
    }, {
      tag: 'Microsoft',
    }, {
      tag: 'Google',
    }],
  });
  $('.chips-placeholder').chips({
    placeholder: 'Enter a tag',
    secondaryPlaceholder: '+Tag',
  });
  $('.chips-autocomplete').chips({
    autocompleteOptions: {
      data: {
        'Apple': null,
        'Microsoft': null,
        'Google': null
      },
      limit: Infinity,
      minLength: 1
    }
  });
});
