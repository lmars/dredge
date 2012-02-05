$(function() {
  $('section#models a.btn').click(function() {
    var model = $(this).text().toLowerCase();

    $.getJSON('/results/' + model, function(data) {
      $('section#results table thead').empty();
      $('section#results table tbody').empty();

      var headers = [];

      $.each(data[0][model], function(header, v) {
        headers.push('<th>' + header + '</th>');
      });

      $('<tr/>', { html: headers.join('') }).appendTo('section#results table thead');

      $.each(data, function(i, result) {
        var cells = [];

        $.each(result[model], function(attribute, value) {
          cells.push('<td>' + value + '</td>');
        });

        $('<tr/>', { html: cells.join('') }).appendTo('section#results table tbody');
      });

      $('section#results table').removeClass('hide');
    });
  });
});
