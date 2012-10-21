$(function(){
	$(".check-all").live("click", function() {
		$('.topic_checkbox').attr('checked','checked');
		return false;
	});

	$(".uncheck-all").live("click", function() {
		$('.topic_checkbox').removeAttr('checked');
		return false;
	});
});