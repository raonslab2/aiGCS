class ChatApp {
  constructor() {
    this.wsLinks = [
      "ws://13.209.238.3:5010/websocket",
      "ws://127.0.0.1:5010/websocket",
      "ws://192.168.232.171:5010/websocket"
    ];
    this.socket = null;
  }

  initialize() {
    $(document).ready(() => {
      this.initLoad();

      // Menu tab
      $(".work-list-tap ul li").click(this.handleListItemClick.bind(this));

      // Handle select change
      $('#twStatus').change(function () {
        var selectedValue = $(this).val();
        console.log('Selected value:', selectedValue);
      });

      // Bookmark button toggle
      $('#btnBookmark').click(function () {
        if ($(this).hasClass('not-bookmarked')) {
          $(this).removeClass('not-bookmarked').addClass('bookmarked');
        } else {
          $(this).addClass('not-bookmarked').removeClass('bookmarked');
        }
      });
    });
  }

  setBookMark(tmDiv) {
    $.ajax({
      type: 'POST',
      url: '/gcs/TD0001/setBookMark.do',
      data: { "tmDiv": tmDiv },
      success: function (res) {},
      error: function (xhr, status, error) {
        alert("Registration failed." + error);
      }
    });
  }

  handleListItemClick() {
    $(".work-list-tap ul li").removeClass("selected");
    $(this).addClass("selected");

    var pageData = $(this).attr("page-data");
    this.selectList(pageData);
    console.log("Selected item's page-data:", pageData);
  }

  initLoad() {
    this.setCode("PROCESS", "twStatus");
    this.selectList(2);

    $("#message-window").on("click", "a", function () {
      var url = $(this).attr("href");
      window.open(url, "_blank");
      return false;
    });

    $(".message-input input[type='text']").keypress((event) => {
      if (event.key === "Enter") {
        var message = $(".message-input input[type='text']").val().trim();
        this.addMessage(message, 'sent');
      }
    });

    $("#msgSend").click(() => {
      var message = $(".message-input textarea").val().trim();
      this.addMessage(message, 'sent');
    });
  }

  setCode(coDiv, setDiv) {
    var selectElement = $('#' + setDiv);
    $.ajax({
      type: 'POST',
      url: '/gcs/TD0001/selectTwCode.do',
      data: { "coDiv": coDiv },
      success: function (res) {
        var option = $('<option>', {
          value: "",
          text: "Change status"
        });
        selectElement.append(option);
        res.list.forEach(function (row) {
          var option = $('<option>', {
            value: row.coCode,
            text: row.coCodeName
          });
          selectElement.append(option);
        });
      },
      error: function (xhr, status, error) {
        alert("Failed to load." + error);
      }
    });
  }

  selectList(searchDiv) {
    var formDataArray = $('#chatListForm').serializeArray();
    var additionalField = { name: 'searchDiv', value: searchDiv };
    formDataArray.push(additionalField);
    var formData = $.param(formDataArray);

    $.ajax({
      url: '/gcs/TD0001/selectTodayWork905.do',
      type: 'post',
      data: formData
    }).done((res) => {
      $('#resultList').children().remove();
      $('#chat-room-list').children().remove();
      $('#message-window').children().remove();
      $('.pagination').children().remove();
      $('.subTr').remove();
      if (res.totalCnt !== '0') {
        res.list.forEach((row, index) => {
          if (index == 0) {
            this.selectChat(row.twPk);
          }
          $('#chat-room-list').append(this.pageChatList(row, index));
        });
      }
    }).fail(() => {
      alert("Failed to load.");
    });
  }

  pageChatList(row, index) {
    var tmSelect = index == 0 ? "activiti" : "";
    var unread = row.tcCount;
    var formattedDate = unread == 0 ? 
      `<span class="unread-data unread-circle2" data-page=${row.twPk}></span>` :
      `<span class="unread-data unread-circle" data-page=${row.twPk}>${unread}</span>`;
    formattedDate += this.formatDate2(row.twRequestDate);
    var subject = row.twSubject.length > 20 ? row.twSubject.substring(0, 20) + ".." : row.twSubject;
    subject = subject.replace(/\n/g, '<br>');

    var data = `
      <div class="rawClass chat-room ${tmSelect}" data-page=${row.twPk}>
        <div class="room-info">
          <div class="room-info-member">${row.mbName}</div>
          <div class="room-info-subject">${subject}</div>
          <div class="time timeList">${formattedDate}</div>
        </div>
      </div>`;
    
    return $(data);
  }

  formatDate2(dateString) {
    var today = new Date();
    var date = new Date(dateString);
    if (date.toDateString() === today.toDateString()) {
      var hours = date.getHours();
      var minutes = date.getMinutes();
      var ampm = hours >= 12 ? 'PM' : 'AM';
      hours = hours % 12;
      hours = hours ? hours : 12;
      minutes = minutes < 10 ? '0' + minutes : minutes;
      return `${ampm} ${hours}:${minutes}`;
    }

    var yesterday = new Date(today);
    yesterday.setDate(today.getDate() - 1);
    if (date.toDateString() === yesterday.toDateString()) {
      return 'Yesterday';
    }

    var month = ("0" + (date.getMonth() + 1)).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);
    return `${month}-${day}`;
  }

  addMessage(message, sender) {
    var currentTime = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
    var messageClass = (sender === 'sent') ? 'sent' : 'received';
    var filteredMessage = this.filterHTMLTags(message);
    var messageWithLinks = filteredMessage.replace(/(\S*https?:\/\/\S*)/g, function (url) {
      var urlStartIndex = url.indexOf("http");
      var urlPart = url.substring(urlStartIndex);
      return urlStartIndex > 0 ? url.substring(0, urlStartIndex) + '<a href="' + urlPart + '" target="_blank">' + urlPart + '</a>' : '<a href="' + url + '" target="_blank">' + url + '</a>';
    });
    messageWithLinks = messageWithLinks.replace(/\n/g, '<br>');

    var userId = $("#userId").val();
    var newMessage = `
      <div class="message ${messageClass}">
        <p>${userId}</p>
        <div class="message-content">${messageWithLinks}</div>
        <span class="time">${currentTime}</span>
      </div>`;
    
    this.insertChatMsg(messageWithLinks);
    $("#message-window").append(newMessage);
    $("#message-window").scrollTop($("#message-window")[0].scrollHeight);
    $(".message-input textarea").val("");
    $(".message-input textarea").focus();

    var twPk = $("#twPk").val();
    var tmData = `{
      "DATA_STATE": {
        "dlName": "${userId}",
        "dlPk": "${twPk}",
        "dlAction": "${filteredMessage}"
      },
      "DATA_GUBUN": "USER",
      "DATA_MSG": "${filteredMessage}",
      "DATA_REQUEST": "CHAT"
    }`;
    this.socket.send(tmData);
  }

  insertChatMsg(msg) {
    var twPk = $("#twPk").val();
    $.ajax({
      url: '/gcs/TD0001/insertChatMsg.do',
      type: 'post',
      data: { "twPk": twPk, "msg": msg }
    }).done(function (res) {}).fail(function () {
      alert("Failed to insert message.");
    });
  }

  filterHTMLTags(text) {
    return text.replace(/</g, '&lt;').replace(/>/g, '&gt;');
  }

  selectChat(twPk) {
    $("#twPk").val(twPk);
    this.websocketConnect();
    this.callRelateView(twPk);
    this.callChatList(twPk);

    var element = document.querySelector('[data-page="' + twPk + '"].unread-circle');
    if (element) {
      element.innerText = '';
      element.classList.remove("unread-circle");
      element.classList.add("unread-circle2");
    }
  }

  callRelateView(twPk) {
    $("#chatTitle-window").empty();
    $.ajax({
      url: '/gcs/TD0001/selectTodayWork901Write.do',
      type: 'post',
      data: { "twPk": twPk }
    }).done((res) => {
      $("#twStatus").val(res.result.twStatus).prop("selected", true);
      $("#twCategory1").val(res.result.twCategory1);
      $("#twCategory2").val(res.result.twCategory2);
      $("#twRequestDate").val(res.result.twRequestDate);
      $("#twStartDateExp").val(res.result.twStartDateExp);
      $("#twEndDateExp").val(res.result.twEndDateExp);
      $("#twRequester").text(res.result.twRequester);
      $("#twWorker").text(res.result.twWorker);
      $("#twSubject").val(res.result.twSubject);

      var maxLength = 15;
      var title = res.result.twSubject.length > maxLength ? res.result.twSubject.substring(0, maxLength) + "..." : res.result.twSubject;
      $("#chatTitle").text(title);

      var tmUrl = "/gcs/TD0001/TodayWork901Write.do?twPk=" + twPk;
      $("#detailLink").html(`<a class="detailList" href="${tmUrl}" target='_blank'>VIEW</a>`);

      $('.file').empty();
      if (res.atachListCnt > 0) {
        res.attachList.forEach(function (row, index) {
          var filename = row.originalFilename;
          var filePath = row.savedFilePath.replace('C:', '').replace('D:', '').replace('E:', '').replace('F:', '');
          var downloadLink = $('<a>', {
            text: 'Down',
            href: filePath,
            download: filename,
            style: 'margin-left: 10px;'
          });
          $("#file" + (index + 1)).css({
            "color": "darkblue",
            "background-color": "#ADD8E6"
          }).text(" " + filename).append(downloadLink);
        });
      }
    }).fail(function () {
      alert("Failed to load.");
    });
  }

  callChatList(twPk) {
    $.ajax({
      url: '/gcs/TD0001/selectCallChatList.do',
      type: 'post',
      data: { "twPk": twPk }
    }).done((res) => {
      if (res.total > 0) {
        res.list.forEach((row) => {
          var messageClass = (row.messageType == 's') ? 'sent' : 'received';
          var messageWithLinks = row.chMessage.replace(/(\S*https?:\/\/\S*)/g, function (url) {
            var urlStartIndex = url.indexOf("http");
            var urlPart = url.substring(urlStartIndex);
            return urlStartIndex > 0 ? url.substring(0, urlStartIndex) + '<a href="' + urlPart + '" target="_blank">' + urlPart + '</a>' : '<a href="' + url + '" target="_blank">' + url + '</a>';
          });

          var formattedDate = this.formatDate(row.coUpdatetime);
          var newMessage = `
            <div class="message ${messageClass}" oncontextmenu="handleContextMenu(event)" contenteditable="true">
              <p>${row.chUserId}</p>
              <p class="messageWithLinks">${messageWithLinks}</p>
              <span class="time">${formattedDate}</span>
            </div>`;

          $("#message-window").append(newMessage);
          $("#message-window").scrollTop($("#message-window")[0].scrollHeight);
        });
      }
    }).fail(function () {
      alert("Failed to load.");
    });

    function handleContextMenu(event) {
      var messageWithLinks = event.currentTarget.querySelector('.messageWithLinks').textContent;
      navigator.clipboard.writeText(messageWithLinks)
        .then(() => {
          console.log('Text copied to clipboard:', messageWithLinks);
        })
        .catch(err => {
          console.error('Failed to copy text to clipboard:', err);
        });
    }

    var messageElement = document.querySelector('.messageWithLinks');
    if (messageElement) {
      messageElement.addEventListener('contextmenu', handleContextMenu);
    }
  }

  formatDate(dateString) {
    var date = new Date(dateString);
    var month = '' + (date.getMonth() + 1);
    var day = '' + date.getDate();
    var hours = date.getHours();
    var minutes = '' + date.getMinutes();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours = hours % 12;
    hours = hours ? hours : 12;
    hours = hours < 10 ? '0' + hours : hours;
    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;
    if (minutes.length < 2) minutes = '0' + minutes;
    return [month, day].join('-') + ' ' + ampm + ' ' + hours + ':' + minutes;
  }

  closeWebSocket() {
    if (this.socket !== undefined && this.socket.readyState === WebSocket.OPEN) {
      this.socket.close();
      console.log('Socket closed.');
    } else {
      console.log('Socket undefined.');
    }
  }

  websocketConnect() {
    this.closeWebSocket();
    this.socket = new WebSocket(this.wsLinks[0]);

    this.socket.onopen = () => {
      var userId = $("#userId").val();
      var twPk = $("#twPk").val();
      this.socket.send(`{"DATA_GUBUN":"USER","DATA_ID":"${userId}","TW_PK":"${twPk}","DATA_REQUEST":"OPEN"}`);
      console.log('Connected to WebSocket server');
    };

    this.socket.onmessage = (event) => {
      var list = JSON.parse(event.data);
      var receiveId = list.dlName;
      var userId = $("#userId").val();
      var messageClass = (receiveId == userId) ? 'sent' : 'received';
      var currentTime = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
      var filteredMessage = this.filterHTMLTags(list.dlAction);
      var subject = filteredMessage.replace(/\n/g, '<br>');
      var newMessage = `
        <div class="message ${messageClass}">
          <div>${receiveId}</div>
          <div class="message-content">${subject}</div>
          <div class="time">${currentTime}</div>
        </div>`;
      $("#message-window").append(newMessage);
      $("#message-window").scrollTop($("#message-window")[0].scrollHeight);
    };

    this.socket.onclose = function (e) {
      console.log('Socket is closed. Reconnect will be attempted in 1 second.', e.reason);
      setTimeout(function () {
        this.websocketConnect();
      }.bind(this), 1000);
    };

    this.socket.onerror = function (err) {
      console.error('Socket encountered error: ', err.message, 'Closing socket');
      setTimeout(function () {
        this.websocketConnect();
      }.bind(this), 5000);
    };
  }
}

const chatApp = new ChatApp();
chatApp.initialize();
