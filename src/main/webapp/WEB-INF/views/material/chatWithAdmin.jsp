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
<script>
    $(document).ready(function() {
        let stompClient = null;
        let userID;
        <%
            if (session.getAttribute("user") != null) {
        %>
        userID = ${sessionScope.user.userID};
        <%
            } else {
        %>
        userID = null;
        <%
            }
        %>
        function connect() {
            const socket = new SockJS('/ws');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function(frame) {
                console.log('Connected: ' + frame);
                stompClient.subscribe('/topic/messages', function(message) {
                    showMessage(JSON.parse(message.body));
                });
            });
        }

        function loadChatRooms() {
            fetch('/api/chat/rooms/' + userID)
                .then(response => response.json())
                .then(chatRooms => {
                    chatRooms.forEach(chatRoom => {
                        chatRoom.messages.forEach(message => {
                            showMessage(message, chatRoom.role);
                        });
                    });
                });
        }

        $('#sendBtn').click(function() {
            const content = $('#chatContent').val();

            stompClient.send("/app/chat", {}, JSON.stringify({'content': content, 'userID': userID, 'senderID': userID}));
            $('#chatContent').val('');
        });

        function showMessage(message, role) {
            const messageDiv = $('<div>').addClass('message');
            const senderDiv = $('<div>').addClass('sender').text(message.userID);
            const contentDiv = $('<div>').addClass('content').text(message.content);
            const timestampDiv = $('<div>').addClass('timestamp').text(message.timestamp);

            if (role === "user") {
                messageDiv.addClass('user');
                messageDiv.append(senderDiv).append(contentDiv);
            } else {
                messageDiv.addClass('admin');
                messageDiv.append(senderDiv).append(contentDiv).append(timestampDiv);
            }

            $('#chat-body').append(messageDiv);
            $('#chat-body').scrollTop($('#chat-body')[0].scrollHeight); // Scroll to the bottom
        }

        document.getElementById('chat-button').addEventListener('click', function() {
            document.getElementById('chat-window').style.display = 'block';
        });

        document.getElementById('close-chat').addEventListener('click', function() {
            document.getElementById('chat-window').style.display = 'none';
        });

        connect();
        loadChatRooms();
    });
</script>
