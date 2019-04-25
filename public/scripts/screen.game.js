// 게임화면 모듈
bird.screens["game-screen"] = (function () {
  // 모듈들을 불러와서 변수에 넣어준다 : 아마 쉽게 쓰려고?
  var board = bird.board; // 게임판 세팅
  var display = bird.display; // 그림 세팅
  var firstRun = true;
  var dom = bird.dom;



  var count = 0; //Counting number of words
  var cards = []; //Here list of answerd images will be kept
  var answers = [];
  var curr_score = 0; //current score

  function GetImage(count) {
    $.get("/game/getImage")
      .done(function( data) {
        $("#quiz-image").attr("src",data['image']);
        $("#counter").replaceWith("<h3 id=\'counter\'> Quiz : " + count + "/10</h3>");
        count = count + 1;
        answers = data['kor'];
        cards.push(data['image']);
      });
  }

  function getIdentity() {
    var name = "token";
    var ca = document.cookie.split('; ');
    for(var i = 0; i < ca.length; i++) {
      var c = ca[i].split("=");
      if(c[0] == name ) {
        return c[1];
      }
    }
  }

  GetImage(count);

  $('#next_btn').click(function(data){
    count = count + 1 ;
    GetImage(count);
    //check if the answer is right
    var answer = $('#answer').val();
    console.log(answers);
    for(var i=0; i < answers.length; i++) {
      if(answer == answers[i]) {
        curr_score += 1;
        console.log("answer is right");
      }
    }

    $('#answer').val(''); //Clear input field
    if(count == 10 ) {
      var token = getIdentity();
      window.location.replace("/");
      $.post('/user/score',  {score: curr_score, token: token},
      function(data) {
        console.log("answer: " + data['answer']);
      });
      curr_score = 0 ;
    }

  });

  function startGame() {
    gameState = {
      level : 0,
      score : 0,
      timer : 100, // setTimeout 함수가 참조.
      startTime : 0, // 현재 레벨을 시작한 시간.
      endTime : 0, // 게임이 종료될 때까지의 시간.
    };
  }


  function setup() {

    /* next 버튼 클릭 */
    dom.bind("#game-screen button.answer", "click", function() {

      /* getImage 구현.
      $.get("/game/getImage")
        .done(function(data) {
          count = count + 1;
          $("#quiz-image").attr("src",data['image']);

          $("#counter").replaceWith("<h3 id =\"counter\">Quiz : " + count + "/10</h3>")
          console.log(data['kor']);
        });*/
    });
  }

  function updateTimer() {
    gameState.timer = gameState.timer - 1;
    var progress = $("#game-screen .time .indicator")[0];
    progress.style.width = gameState.timer + "%";

    if(progress.style.width === "0%"){
      run();
    }
  }


  function run() {
    //Does not need first run check
    startGame();
    setInterval(updateTimer, 1000 / 10);
  }

  return {
    run : run
  };

})();
