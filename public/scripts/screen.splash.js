// 스플래시 화면 모듈
bird.screens["splash-screen"] = (function() {

  // 어떠한 화면에서 함수를 사용하는 법 : bird.game모듈의 showScreen함수를 활용하기 위해 game 변수에 빼준다.
  var game = bird.game;
  var dom = bird.dom;
  var firstRun = true;

  // setup 함수는 dom module이 제공하는 bind함수(클릭 이벤트 관련)를 사용한다.
  function setup() {
    // setup할때 bind 함수 실행해놓습니다. 클릭되면 main-menu로 넘어가겠다는 의지입니다.
    dom.bind("#splash-screen", "click", function() {
      game.showScreen("main-menu");
    });
  }

  function run() {
    if(firstRun) {
      setup();
      firstRun = false;
    }
  }

  // 실제 화면 내에서 실행시키는 함수들입니다.
  return {
    run : run
  };

})();
