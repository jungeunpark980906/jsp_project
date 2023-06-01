//화면에서 등록한 댓글내용을 컨트롤러로 전송 -> DB저장
async function postCommentToServer(cmtData){
	//async function : 비동기통신을 하는 함수입니다
	try{
		const url = "/cmt/post"; //주소
		const config = {
			method: 'post', //post형식
			headers:{ //설정 객체를 보내는 부분
				'content-Type': 'application/json; charset=utf-8' //json형식, 문자인코딩
			},
			body:JSON.stringify(cmtData)//cmtData 객체를 json으로 변경해서 본문에 넣을 예정
		};
		const resp = await fetch(url, config); //응답받고자하는 데이터
		const result = await resp.text(); // isOk=controller에서 보내는 결과(되면1, 안되면0)를 text형태로
		return result;
	}catch(error){
		console.log(error);
	}
	
}


//미리 보낼 데이터를 만들어서 함수로 전달
//cmtData 만들기~!
document.getElementById('cmtAddBtn').addEventListener('click',()=>{
	//댓글 추가 버튼을 클릭하면 cmtData를 가져와!
	const cmtText = document.getElementById('cmtText').value;
	console.log(cmtText);
	
	if(cmtText == null || cmtText == ""){ //내용이 없는 경우
		alert("댓글을 입력해라");
		return false; //return만 쓰면 안되니까 false;
	}else{
		let cmtData = { //객체로 담아서 가져갈예정
			bno : bnoVal, //board(게시글)의 번호 (detail.jsp에서 보내줄 예정)
			writer : document.getElementById('cmtWriter').value,
			content : cmtText 
		};
		postCommentToServer(cmtData).then(result=>{  
		//postCommentToServer: 비동기함수 = 서버에 댓글 데이터를 전송하는 역할
		//.then() 메서드는 비동기 작업을 하고 나서 실행됨 
		//result는 postCommentToServer(cmtData)의 결과
					if(result > 0){
				alert('댓글이 등록되었동');
				document.getElementById('cmtText').value=""; //저장한 댓글내용 지우기	
			}
			//댓글 표시
		});
		
	}
	
})

//댓글가져오기
//= 컨트롤러에가서 bno에 해당하는 리스트를 가져와 달라고 요청해야함!!
async function getCommentListFromServer(bno){
	//통신은 무조건 try-catch문은 사용하는게 좋아요
	try{
		const resp = await fetch('/cmt/list/'+bno); //cmt/list/1모양으로 가져가도록 설정
		const cmtList = await resp.json(); //댓글 객체가 리턴
		return cmtList;
	}catch(error){
		console.log(error);
	}
	
}
getCommentListFromServer(bnoVal).then(result=>{
	console.log(result);
})



//통신 완료후 가져온 리스트를 콘솔에 찍어본 작업
function printCommentList(bno){
	getCommentListFromServer(bno).then(result=>{
		console.log(result);
		if(result.length >0){ //등록된 댓글이 있음.
			spreadCommentList(result);
		}else {
			let div = document.getElementById('accordionFlushExample');
			div.innerText="comment가 없습니다.";
		}
	})
}

function spreadCommentList(result){ //댓글 List
	console.log(result);
	let div = document.getElementById('accordionFlushExample');
	div.innerHTML="";
	for(let i=0; i<result.length; i++){
	let html = `<div class="accordion-item">`;
	html += `<h2 class="accordion-header" id="heading${i}">`;
	html += `<button class="accordion-button" type="button" data-bs-toggle="collapse" `;
	html += `data-bs-target="#collapse${i}" aria-expanded="true" aria-controls="collapse${i}">`
	html += `${result[i].cno}, ${result[i].writer} </button></h2>`;
	html += `<div id="collapse${i}" class="accordion-collapse collapse show" `;
	html += `aria-labelledby="heading${i}" data-bs-parent="#accordionExample">`;
	html += `<div class="accordion-body">`;
	html += `<button type="button" data-cno="${result[i].cno}" data-writer="${result[i].writer}" class="btn btn-sm btn-outline-warning cmtModBtn">%</button>`;
	html += `<button type="button" data-cno="${result[i].cno}" class="btn btn-sm btn-outline-danger cmtDelBtn">X</button>`;
	html += `<input type="text" class="form-control" id="cmtText1" value="${result[i].content}">`;
	html += `${result[i].reg_date}`;
	html += `</div></div></div>`;
	div.innerHTML += html;  //누적해서 담기
	}
	
}

async function removeCommentFromServer(cnoVal){
	try{
		const url = '/cmt/remove?cnoVal='+cnoVal;
		const config={
			method:'post'
		}
		const resp = await fetch(url, config);
		const result = await resp.text();  //isOk 
		return result;
		
	}catch(error){
		console.log(error);
	}
	
}

async function updateCommentFromServer(cnoVal, cmtText1, writer){
	try{
		const url = "/cmt/modify";
		const config={
			method: "post",
			headers: {
				'Content-Type' : 'application/json; charset=utf-8'
			},
			body: JSON.stringify({cno:cnoVal, content:cmtText1, writer:writer})
		}
		const resp = await fetch(url, config);
		const result = await resp.text();  //isOk
		return result;
		
	}catch(error){
		console.log(error);
	}
}



document.addEventListener('click', (e)=>{ //e 내가 클릭한 객체
	if(e.target.classList.contains('cmtModBtn')){
	//수정작업
		let cnoVal = e.target.dataset.cno;
		console.log(cnoVal);
		//기존 위치에서 값을 읽어들여 내용을 DB에 저장 한 후 변경
		//현재 수정하고자 하는 값 input box의 value 값을 찾기위한 작업
		let div = e.target.closest('div');  //closest => 타겟을 기준으로 가장 가까운 값 찾기
		let cmtText1 = div.querySelector('#cmtText1').value;
		let writer = e.target.dataset.writer;
		
		//비동기 통신
		updateCommentFromServer(cnoVal, cmtText1, writer).then(result=>{
			if(result > 0){
				alert("댓글 수정 성공~!!!");
				console.log(result);
				printCommentList(bnoVal);
			}else{
				alert("수정불가입니다.");
			}
		})
	}
	if(e.target.classList.contains('cmtDelBtn')){
	//삭제작업	
		let cnoVal = e.target.dataset.cno;
		console.log(cnoVal);
		removeCommentFromServer(cnoVal).then(result =>{
			if(result > 0){
				alert('댓글 삭제 완료~!!');
				printCommentList(bnoVal);
				console.log(bnoVal);
			}
		})
	
	}
	
})
