var rgbStart = [139,195,74]
var rgbEnd = [183,28,28]

$(function(){
	window.addEventListener('message', function(event) {
        if (event.data.action === "setValue") {
            if (event.data.key === "job") {setJobIcon(event.data.icon);}
            setValue(event.data.key, event.data.value);
        } else if (event.data.action === "updateStatus") {
            updateStatus(event.data.status);
        } else if (event.data.action === "setTalking") {
            setTalking(event.data.value);
        } else if (event.data.action === "setProximity") {
            setProximity(event.data.value);
        } else if (event.data.actions == "show") {
			$(".Container").show();
		} else if (event.data.actions == "hide") {
			$(".Container").hide();
		//} else if (event.data.actionns == "right") {
		//	$(".numm").css('left', '16.2%');
		//} else if (event.data.actionns == "left") {
		//	$(".numm").css('left', '2.0%');
		}
    });
});



function setValue(key, value){
	$('#'+key+' span').html(value)

}
function setJobIcon(value){
	$('#job img').attr('src', 'img/jobs/'+value+'.png')
}

function silentErrorHandler() {return true;}
window.onerror=silentErrorHandler;

$(document).ready(function() {
    window.addEventListener('message', function(event) {
        var data = event.data;
        if (event.data.action == "updateStatus") {
            updateStatus(event.data.st);
        }
    })
})

function updateStatus(status){
	var hunger = status[0]
	var thirst = status[1]
    $('#hunger').css('width', hunger+'%')
    $('#thirst').css('width', thirst+'%')
}

function setValueProg(key, value, color)
{
	if (color == '')
	{
		$('#'+key+' div').css('width', value+'%');
	}
	else
	{
		$('#'+key+' div').css('width', value+'%');
		$('#'+key+' div').css('background-color', color);
	}
		

}



//API Shit
function colourGradient(p, rgb_beginning, rgb_end)
{
    var w = p * 2 - 1;

    var w1 = (w + 1) / 2.0;
    var w2 = 1 - w1;

    var rgb = [parseInt(rgb_beginning[0] * w1 + rgb_end[0] * w2),
        parseInt(rgb_beginning[1] * w1 + rgb_end[1] * w2),
            parseInt(rgb_beginning[2] * w1 + rgb_end[2] * w2)];
    return rgb;
};




$(document).ready(function () {
    window.addEventListener('message', function (event) {
        var data = event.data;
        $("#armor").css("width", data.armor + "%");
        $("#life").css("width", data.life + "%");
    });
});
