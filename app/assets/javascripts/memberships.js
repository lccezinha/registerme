var findAvaliables = function(id) {
  $.get("avaliables", { id: id }, function(response){
    $(".courses select").html("");
    $.each(response, function(index, course){
      $(".courses select").append($('<option />', { value: course.id, text: course.name }))
    })
  })
}

$(document).ready(function(){
  $(".students select").change(function(){
    var student_id = $(this).val();
    findAvaliables(student_id);
  })
})