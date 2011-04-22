// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function(){
	$("#myScroll").mbScrollable({
		width:810,
		elementsInPage:1,
		elementMargin:2,
		shadow:"#999 2px 2px 2px",
		height:"auto",
		controls:"#controls",
		slideTimer:600,
		autoscroll:true,
		scrollTimer:8000
	});

});