// 캔버스 디스플레이 모듈
// 이 모듈은 처음 초기화할때 setup 함수를 호출한다.
bird.display = (function() {

  var dom = bird.dom;
  var $ = dom.$;
  var canvas, ctx;
  var imageSize;
  var firstRun = true;

  function setup() {
    var boardElement = $("#game-screen .image-board")[0];
    imageSize = bird.settings.imageSize; //loader 에 세팅된 이미지사이즈 100을 불러준다.

    canvas = document.createElement("canvas");
    ctx = canvas.getContext("2d");
    dom.addClass(canvas, "board");
    canvas.width = imageSize; //받아온 이미즈 사이즈대로 이미지판을 그린다. 
    canvas.height = imageSize;

    boardElement.appendChild(canvas);
  }

  function initialize(callback) {
    if (firstRun) {
      setup();
      firstRun = false;
    }
    callback();
  }

  return {
    initialize : initialize
  }

})();
