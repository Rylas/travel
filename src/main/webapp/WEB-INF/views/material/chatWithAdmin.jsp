<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/css/chatWithAdmin.css">
<div id="chat-button" class="chat-button">
    <i class="fa-solid fa-comments"></i>
</div>

<div id="chat-window" class="chat-window" style="display:none;">
    <div class="chat-header">
        <h5>Admin Chat</h5>
        <button id="close-chat" class="close-chat">&times;</button>
    </div>
    <div class="chat-body" id="chat-body">
        <p class="welcome-message">Welcome! How can I help you today?</p>
        <!-- Chat messages will go here -->
    </div>
    <div class="chat-footer">
        <input type="text" placeholder="Type your message..." name="chatContent" id="chatContent"/>
        <button class="send-btn" id="sendBtn">Send</button>
    </div>
</div>

<!-- Ensure jQuery is loaded before your script -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1.3.0/dist/sockjs.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/stompjs@2.3.3/lib/stomp.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
    $(document).ready(function() {
        // let stompClient = null;

    });
    let userID;
    let sender;
    let userRole;
    <%
        if (session.getAttribute("user") != null) {
    %>
    userID = ${sessionScope.user.userID};
    sender = "${sessionScope.user.userID}-${sessionScope.user.firstName}-${sessionScope.user.lastName}";
    userRole = "${sessionScope.user.role.roleName}";
    <%
        } else {
    %>
    userID = null;
    userRole = null;
    <%
        }
    %>

    var stompClient = null;

    function connect() {
        var socket = new SockJS('/ws');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function(frame) {
            console.log('Connected: ' + frame);

            stompClient.subscribe('/topic/messages/' + userID, function(message) {
                showMessage(JSON.parse(message.body));
                console.log(message)
            });
        });
    }

    // function sendMessage() {
    //     var content = document.getElementById('message').value;
    //
    //     stompClient.send("/app/chat/admin", {}, JSON.stringify({'text': content}));
    // }
    //
    // function showMessage(message) {
    //     var response = document.getElementById('response');
    //     var p = document.createElement('p');
    //     p.appendChild(document.createTextNode(message.from + ": " + message.text));
    //     response.appendChild(p);
    // }

    function loadChatRooms() {
        fetch('/api/chat/rooms/' + userID)
            .then(response => response.json())
            .then(chatRooms => {

                chatRooms.forEach(chatRoom => {
                    chatRoom.messages.forEach(message => {
                        showMessage(message);
                    });
                });
            });
    }

    $('#sendBtn').click(function() {
        sendMessage();
        $('#chatContent').val('');
    });

    $('#chatContent').keypress(function(e) {
        if (e.which === 13) {
            sendMessage();
            $('#chatContent').val('');
        }
    });

    function sendMessage() {
        const content = document.getElementById('chatContent').value;

        stompClient.send("/app/chat/admin", {}, JSON.stringify({
            'content': content,
            'userID': userID,
            'role': userRole,
            'timestamp': new Date().toISOString()
        }));

        const timestamp = new Date().toLocaleTimeString();

        const messageDiv = $('<div>').addClass('message');
        const senderDiv = $('<div>').addClass('sender').text(userID);
        const contentDiv = $('<div>').addClass('content').text(content);
        const timestampDiv = $('<div>').addClass('timestamp').text(timestamp);
        $('#chat-body').scrollTop($('#chat-body')[0].scrollHeight);
        messageDiv.addClass('user');
        messageDiv.append(senderDiv).append(contentDiv).append(timestampDiv);
        $('#chat-body').append(messageDiv);
        $('#chat-body').scrollTop($('#chat-body')[0].scrollHeight);

    }

    function showMessage(message) {
        const messageDiv = $('<div>').addClass('message');
        const senderDiv = $('<div>').addClass('sender').text(message.userID);
        const contentDiv = $('<div>').addClass('content').text(message.content);
        const timestampDiv = $('<div>').addClass('timestamp').text(message.timestamp);

        if (userID === message.userID) {
            messageDiv.addClass('user');
            messageDiv.append(senderDiv).append(contentDiv).append(timestampDiv);
        } else {
            messageDiv.addClass('admin');
            messageDiv.append(senderDiv).append(contentDiv).append(timestampDiv);
        }

        $('#chat-body').append(messageDiv);
        $('#chat-body').scrollTop($('#chat-body')[0].scrollHeight);
    }

    document.getElementById('chat-button').addEventListener('click', function() {
        document.getElementById('chat-window').style.display = 'block';
    });

    document.getElementById('close-chat').addEventListener('click', function() {
        document.getElementById('chat-window').style.display = 'none';
    });


    window.onload = function() {
        connect();
        loadChatRooms();
    }
</script>
