// 게임화면 모듈
bird.screens["game-screen"] = (function () {
  // 모듈들을 불러와서 변수에 넣어준다 : 아마 쉽게 쓰려고?
  var board = bird.board; // 게임판 세팅
  var display = bird.display; // 그림 세팅
  var firstRun = true;
  var dom = bird.dom;

  // function drawImage() {
  //   const canvas = document.getElementById('canvas');
  //   const ctx = canvas.getContext('2d');
  //   const image = document.getElementById('source'); //여기서 source 로 받을게 아니라, 리퀘스트 보내야한다.
  //   ctx.drawImage(image, 0, 0, 100, 100, 0, 0, 90, 90);
  // }

  function setup() {
    /* 그냥 여기 간단하게 게임 구현 하자. */
    //drawImage();
    dom.bind("#game-screen button.answer", "click", function() {
      console.log("next버튼이 클릭되었습니다.");
      /* 여기서 입력받고 리퀘스트 들어간다. */
    });
  }

  function run() {
    if(firstRun) {
      setup();
      firstRun = false;
    }
  }

  return {
    run : run
  };

})();
