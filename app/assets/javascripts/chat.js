/**
 * Created by Nathan on 10/18/15.
 */
//<p><%= message.user.name %> : <%=message.message %></p>

//Quick and Dirty way to go about updating the Chat on homepage
$(document).ready(function(e){
    $("#new_message").submit(function(e){
        LoadChat();
        //$("#message_message").val("");
    });

    $("#new_message").on("ajax:success", function(e, data, status, xhr){
        $("#message_message").val("");
        alert("This work?");
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
}, 10000);