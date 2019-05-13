// 스플래시 화면 모듈
bird.screens["ranking-screen"] = (function() {

  var firstRun = true;

  function setup() {
    console.log("score page up");

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
