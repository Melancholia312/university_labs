window.onload = function(){
    let result = {};
    let step = 0; 

    function showQuestion (questionNumber){
        document.querySelector(".question").innerHTML = quiz[step]['quest'];
        let answer = '';
        for(let key in quiz[step]['answ']){
            answer += `<li data-v="${key}" class="answer-variant">${quiz[step]['answ'][key]}<li/>`
        }
        document.querySelector(".answer").innerHTML = answer;
    }

    document.onclick = function (event){
        event.stopPropagation();
console.log(event);
        if(event.target.classList.contains('answer-variant') && step < quiz.length){
            if(result[event.target.dataset.v] != undefined){
                result[event.target.dataset.v]++;
            }else{
                result[event.target.dataset.v] = 0;
            }
            step++;
            if(step == quiz.length){
                document.querySelector('.question').remove();
                document.querySelector('.answer').remove();
                showResult();
            }else{
                showQuestion(step);
            }
        }
        console.log(result);
    }

    function showResult(){
        let key = Object.keys(result).reduce(function(a,b){
            return result[a] > result[b] ? a : b; 
        });
        console.log(key);

        let div = document.createElement('div');
        div.classList.add('result');
        div.innerHTML = answers[key]['res'];
        document.querySelector('main').appendChild(div);
    }

    showQuestion(step);
}