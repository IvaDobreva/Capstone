// bird.game 모듈 구현.
// 게임의 핵심함수 showScreen이 포함.
// 게임 기능의 중심.
bird.game = (function() {
  var dom = bird.dom,
  $ = dom.$;


  // 현재 활성화된 스크린을 보이지 않게 하고 지정된 ID를 가진 스크린을 보이게 한다.
  // 스크린 왔다 갔다 하게 하는 부분.
  function showScreen(screenId) {

    var activeScreen = $("#game .screen.active")[0];
    // $이 Sizzle.
    // screen 에는 해당 html 코드가 통째로 들어간다.
    var screen = $("#" + screenId)[0];
    
    if (activeScreen) {
      dom.removeClass(activeScreen, "active");
    }

    console.log(bird.screens);
    console.log(screenId);
    // 화면 모듈을 실행한다.
    bird.screens[screenId].run();

    // 화면을 출력한다.
    dom.addClass(screen, "active");
  }

  function setup(){

  }

  //공용 메서드 정의
  return {
    showScreen : showScreen
  };

})();
