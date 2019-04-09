// 스플래시 화면 모듈
bird.screens["main-menu"] = (function() {

  var game = bird.game; // bird.game 모듈을 game 변수에 저장해준다.
  var dom = bird.dom;
  var firstRun = true;

  // setup 함수는 dom module이 제공하는 bind함수(클릭 이벤트 관련)를 사용한다.
  function setup() {
    // setup할때 bind 함수 실행해놓습니다. 클릭되면 main-menu로 넘어가겠다는 의지입니다.
    // 클릭을 받을때, #main-menu 라는 html속성 전체의 클릭을 받겠다는 의지입니다.
    dom.bind("#main-menu ul.menu", "click", function(e) {
      if (e.target.nodeName.toLowerCase() === "button") {
        var action = e.target.getAttribute("name");
        console.log(action);
        game.showScreen(action);
      }
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
