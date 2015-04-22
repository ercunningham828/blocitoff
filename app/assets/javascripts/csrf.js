$(function() {

  // $.ajaxSetup({
  //   headers: {
  //     'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  //   }
  // });
var userId = 1;
var listId = 1;
var url = 'api/users/' + userId + '/lists/' + listId;

  $.ajax({
    url: url,
    type: "DELETE",
    beforeSend: function(xhr) {
      xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
    },
    // data: '',
    success: function(response) {
      alert('test');
      console.log(response);
    }
  });

});