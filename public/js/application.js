$(document).ready(function() {
  newBookListener();
  addBookListener();
});

var newBookListener = function() {
  $(".new-book-button").on("click", function() {
    event.preventDefault();

    var aTag = $(this);
    var url_from_a_tag = aTag.attr('href');

    $.ajax({
      url: url_from_a_tag
    })
    .done(function(response){
      $('#book-form-holder').html(response);
      $('#add-book-button').hide();
    });
  });
};

var addBookListener = function () {
  $("#book-form-holder").on("submit", ".create-new-book-form", function() {
    event.preventDefault();

    var form = $(this);
    var url_from_form = form.attr("action");
    var method_from_form = form.attr("method");
    var data_from_form = form.serialize();

    $.ajax({
      url: url_from_form,
      method: method_from_form,
      data: data_from_form
    }).done(function(response) {
      console.log(response);
    })
  });
};



