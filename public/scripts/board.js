
// 게임 보드 모듈. 한마디로 게임판.
bird.board = (function() {

  var settings;
  var baseScore; // 총 점수.
  var images;

  // 화면 세팅하는 함수.
  function fillBoard() {
    // DB로부터 10개의 이미지로 구성된 object를 받는다. (url, 정답, 포인트 )
    //images = [];
  }

  // 상태를 체크하는 함수 : ex) 시간이 다 되면 다음 문제로, 점수 계산 등등.
  function check() {

    /* 각 이미지 stage 마다 정답을 맞췄을 경우, 점수를 체크해서 users total score에 더해준다.  */
    /* 클릭 이벤트도 여기 추가해야 할듯. */

  }

  // 게임 보드 모듈을 초기화 하는 함수 : bird.board.initialize() 입력해서 사용.
  // 비동기 형식의 initialize() 함수?
  function initialize(callback) {
    settings = bird.settings;
    baseScore = settings.baseScore;
    fillBoard();
    callback();
  }

  // 디버깅을 위한 함수 : 게임 보드의 데이터를 콘솔에 출력.
  function print() {
    console.log("게임이 시작되었습니다. 이 이미지는 무엇을 의미할까요?");
  }

  // 외부에 노출되는 함수들.
  return {
    initialize : initialize,
    print : print,
  }


})();
