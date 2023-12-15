/*마이페이지 - 회원정보수정*/
document.addEventListener('DOMContentLoaded', function(){
	let confirmBtn = document.getElementById('confirmBtn');
	if(confirmBtn){
		confirmBtn.addEventListener('click', function(){
			let confirmPw = document.getElementById('confirmPw').value;
			if(confirmPw == "" || confirmPw.trim().length === 0){
				alert('비밀번호를 입력하세요.');
			} else{
				let f = document.getElementById('f');
				f.submit();
			}
		})
	}
});

/*마이페이지 - 회원정보 수정 : 비밀번호 변경*/
document.addEventListener('DOMContentLoaded', function(){
	let newPw = document.getElementById('newPw');
	if(newPw){
		let confirmNewPw = document.getElementById('confirmNewPw');
		confirmNewPw.addEventListener('keyup', function(){
		let confirmNewPwP = document.getElementById('confirmNewPwP');
		confirmNewPwP.style.color = 'red';
		confirmNewPwP.style.fontWeight = 'bold';
		confirmNewPwP.innerHTML = "새 비밀번호와 새 비밀번호 확인은 일치해야 합니다.";
			if(newPw.value !== confirmNewPw.value){
				confirmNewPwP.style.display = 'block';
				if(newPw.value ===""){
					confirmNewPwP.style.display='none'
				}
			} else {
				confirmNewPwP.style.display='none'
			}
		})
	}
});

/*회원정보수정 - 이메일인증*/
document.addEventListener('DOMContentLoaded', function(){
	let sendEmailBtn = document.getElementById('sendEmailBtn');
	if(sendEmailBtn){
		sendEmailBtn.addEventListener('click', function(){
			const pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
			const email = document.getElementById('email').value;
			const emailP = document.getElementById('emailP');
			emailP.style.fontWeight = 'bold';
		    if(pattern.test(email) === false) {
				emailP.style.display = 'block';
				emailP.style.color = 'red';
				emailP.innerHTML = "올바른 이메일 형식이 아닙니다.";
			} else {
				xhr = new XMLHttpRequest();
				xhr.open('post', 'sendEmail');
				var sendData = email;
				xhr.send(sendData);
				
				xhr.onreadystatechange = emailresProc;	
			}
		});
	}
});
	
function emailresProc(){
	if(xhr.readyState !== 4) return;
	if(xhr.status === 200){ 
		emailP.innerHTML = xhr.responseText;
		
		if(xhr.responseText != "인증번호가 전송되었습니다."){
			emailP.style.color = 'red';
		} else{
			emailP.style.color = 'blue';
		}
	} else {
		console.log('에러 : ' + xhr.status);
	}
}

/*인증번호 확인*/
document.addEventListener('DOMContentLoaded', function(){
	let authNumBtn = document.getElementById('authNumBtn');
	if(authNumBtn){
		authNumBtn.addEventListener('click', function(){
			const authP = document.getElementById('authP');
			authP.style.display = 'block';
			authP.style.fontWeight = 'bold';
			authP.style.color = 'red';
			let authNum = document.getElementById('authNum');
			if(authNum.value == ""){
				authP.innerHTML = '인증번호를 입력해주세요.';
			} else {
				xhr.open('post', 'authEmail');
		    	xhr.send(authNum.value);
		    	xhr.onreadystatechange = authEmailResProc;
			}
		})
	}
});
    
function authEmailResProc(){
	if(xhr.readyState === 4 && xhr.status === 200){
		authP.innerHTML = xhr.responseText;
		authP.style.color='red';

		if(authP.innerHTML === "인증되었습니다."){
			authP.style.color='blue';
		}
	}
}

/*회원정보 수정버튼*/
document.addEventListener('DOMContentLoaded', function(){
	let updateInfoBtn = document.getElementById('updateInfoBtn');
	if(updateInfoBtn){
		updateInfoBtn.addEventListener('click', function(){
			let phone = document.getElementById('phone');
			let email = document.getElementById('email');
			let authNum = document.getElementById('authNum');
			
			if(phone.value === "" || phone.value.trim().length === 0){
				alert('휴대폰 번호를 입력해주세요.');
				return;
			}
			if(email.value === "" || email.value.trim().length === 0){
				alert('이메일을 입력해주세요.');
				return;
			}
			if(authNum.value === "" || authNum.value.trim().length === 0){
				alert('인증번호를 입력해주세요.');
				return;
			}
			let authP = document.getElementById('authP');
			if(authP.innerHTML !== '인증되었습니다.'){
				alert('이메일 인증 후 회원정보 수정이 가능합니다.');
				return;
			}
			let f = document.getElementById('f');
			f.submit();
		})
	}
})