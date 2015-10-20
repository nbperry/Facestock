/**
 * Created by Nathan on 10/18/15.
 */

//Quick and Dirty way to go about updating the Chat on homepage
$(document).ready(function(e){

    //Attach an on ajax:success event handler to the chat message form
    $("#new_message").on("ajax:success", function(e, data, status, xhr){
        LoadChat();
        $("#message_message").val("");
    });
});


function LoadChat(){
    $.get( "/messages", function( data ) {

        $("#chatMessages").text("");
        for (var key in data) {
            var message=data[key]
            var outputLine = "<p class=\"well well-sm\">" + message.user.name + ": " + message.message + "</p>"

            $( "#chatMessages" ).append( outputLine );

        }
    });
}

setInterval(function() {
    LoadChat()
}, 1300);