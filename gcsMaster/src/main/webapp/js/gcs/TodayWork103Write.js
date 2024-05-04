document.addEventListener("DOMContentLoaded", function() {
  var canvas = document.getElementById('labelingCanvas');
  var ctx = canvas.getContext('2d');
  var rect = {};
  var labels = [];
  var selectedLabel = document.getElementById('label-select');
  var labelList = document.getElementById('label-list');
  var image = document.getElementById('image');
  var currentIndex = 0;
  var images = ['example.jpg', 'example2.jpg']; // Images array for navigation

  // Set canvas size to match image
  canvas.width = image.width;
  canvas.height = image.height;

  function drawRect(x, y, width, height) {
    ctx.strokeStyle = '#FF0000';
    ctx.lineWidth = 2;
    ctx.strokeRect(x, y, width, height);
  }

  function drawLabels() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    ctx.drawImage(image, 0, 0);
    labels.forEach(function(label) {
      drawRect(label.x, label.y, label.width, label.height);
    });
  }

  function updateLabelList() {
    labelList.innerHTML = '';
    labels.forEach(function(label, index) {
      var li = document.createElement('li');
      li.textContent = 'Label ' + (index + 1) + ': ' + label.label;
      labelList.appendChild(li);
    });
  }

  function saveLabels() {
    localStorage.setItem('labels', JSON.stringify(labels));
    alert('Labels saved.');
  }

  function loadLabels() {
    var storedLabels = localStorage.getItem('labels');
    if (storedLabels) {
      labels = JSON.parse(storedLabels);
      drawLabels();
      updateLabelList();
      alert('Labels loaded.');
    } else {
      alert('No saved labels found.');
    }
  }

  image.onload = function() {
    canvas.width = image.width;
    canvas.height = image.height;
    drawLabels();
  };

  canvas.addEventListener('mousedown', function(e) {
    var rectCanvas = canvas.getBoundingClientRect();
    var mouseX = e.clientX - rectCanvas.left;
    var mouseY = e.clientY - rectCanvas.top;

    rect.startX = mouseX;
    rect.startY = mouseY;
    rect.width = 0;
    rect.height = 0;
    drawLabels();
  });

  canvas.addEventListener('mousemove', function(e) {
    if (e.buttons === 1) {
      var rectCanvas = canvas.getBoundingClientRect();
      var mouseX = e.clientX - rectCanvas.left;
      var mouseY = e.clientY - rectCanvas.top;

      rect.width = mouseX - rect.startX;
      rect.height = mouseY - rect.startY;
      drawLabels();
    }
  });

  canvas.addEventListener('mouseup', function() {
    labels.push({
      x: rect.startX,
      y: rect.startY,
      width: rect.width,
      height: rect.height,
      label: selectedLabel.value
    });
    updateLabelList();
  });

  document.getElementById('add-label-btn').addEventListener('click', function() {
    labels.push({
      x: 0,
      y: 0,
      width: 50,
      height: 50,
      label: selectedLabel.value
    });
    drawLabels();
    updateLabelList();
  });

  document.getElementById('delete-label-btn').addEventListener('click', function() {
    labels.pop();
    drawLabels();
    updateLabelList();
  });

  document.getElementById('prev-image-btn').addEventListener('click', function() {
    currentIndex = (currentIndex - 1 + images.length) % images.length;
    image.src = images[currentIndex];
    labels = [];
    updateLabelList();
  });

  document.getElementById('next-image-btn').addEventListener('click', function() {
    currentIndex = (currentIndex + 1) % images.length;
    image.src = images[currentIndex];
    labels = [];
    updateLabelList();
  });

  document.getElementById('save-btn').addEventListener('click', saveLabels);
  document.getElementById('load-btn').addEventListener('click', loadLabels);
});
