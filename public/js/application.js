$(document).ready(function() {
	$('#join').on('click', function(event){
		event.preventDefault();
		var url = $(this).attr('href');
		$(this).hide();
		$('#main_content').fadeOut(1000);
		$.get(url, function(form_data){
			$('#sign_up_form').append(form_data).hide().fadeIn(1000);
		});
	});

  var question = '<div class="question"><input type="text" name="survey_data[][question]" placeholder="survey question"><br><div class=\'option\'><input class="option" type="text" name="survey_data[][options][][text]" placeholder="option"><a class="delete" href=\'#\'>Delete</a></div><div class=\'option\'><input class="option" type="text" name="survey_data[][options][][text]" placeholder="option"><a class="delete" href=\'#\'>Delete</a></div><div class=\'buttons\'><button><a class="add_option" href="#">Add Option</a></button><button><a class="add_question" href="#">Add Question</a></button><button><a class="delete_question" href="#">Delete Question</a></button></div></div>'
  var option = '<div class=\'option\'><input type="text" name="survey_data[][options][][text]" placeholder="option"><a class="delete" href=\'#\'>Delete</a></div><div class=\'buttons\'><button><a class="add_option" href="#">Add Option</a><div class=\'buttons\'></button><button><a class="add_question" href="#">Add Question</a></button><button><a class="delete_question" href="#">Delete Question</a></button></div></div>';

  $('.questions').on('click', '.add_option', function(event){
    event.preventDefault();
    $(this).closest('.question').append(option).hide().fadeIn(550);
    $(this).closest('.buttons').remove();
  });

  $('.questions').on('click', '.add_question', function(event){
      event.preventDefault();
      $(this).closest('.questions').append(question).hide().fadeIn(550);
    });

   $('.questions').on('click','.delete_question',function(event){
    event.preventDefault;
    $(this).closest('.question').remove();
  });

  $('.questions').on('click','.delete',function(event){
    event.preventDefault;
    $(this).closest('.option').remove();
  });
});

