/*로그인*/
document.addEventListener('DOMContentLoaded', function() {
    let loginBtn = document.getElementById('loginBtn');
    if (loginBtn) {
        loginBtn.addEventListener('click', function() {
            const id = document.getElementById('id').value;

            if (id == "" || id.trim().length == 0) {
                alert('아이디를 입력하세요.');
                return;
            }

            const pw = document.getElementById('pw').value;
            if (pw == "" || pw.trim().length == 0) {
                alert('비밀번호를 입력하세요.');
                return;
            }

            let f = document.getElementById('f');
            f.submit();
        });
    }
});

/*회원가입 - 동 선택에 따른 호수 변화*/
document.addEventListener('DOMContentLoaded', function(){
	let complex = document.getElementById('complex');
	if(complex){
		let unit = document.getElementById('unit');
		
		complex.addEventListener('change', function(){
			unit.disabled = false;
			unit.innerHTML = '<option selected>호수 선택</option>';
			
			const complexOptions = {
		        "101": ["101", "102", "201", "202", "301", "302", "401", "402", "501", "502"],
		        "102": ["101", "102", "103", "201", "202", "203", "301", "302", "303", "401", "402", "403", "501", "502", "503", "601", "602", "603", "701", "702", "703"],
		        "103": ["101", "102", "103", "104", "301", "302"],
		        "104": ["101", "102", "103", "104", "301", "302"],
			}
			 if (complexOptions.hasOwnProperty(complex.value)) {
		        complexOptions[complex.value].forEach(optionValue => {
		            unit.options.add(new Option(optionValue));
		        });
		    }
		});
	}
});

/*아이디 체크 관련*/
document.addEventListener('DOMContentLoaded', function(){
	let idChkBtn = document.getElementById('idChkBtn');
	let complex = document.getElementById('complex');
    let unit = document.getElementById('unit');
	
	if(idChkBtn){
		idChkBtn.addEventListener('click', function(){
			if(complex.value === "동 선택"){
				alert('동을 선택하세요.');
			} else if(unit.value === "호수 선택"){
				alert('호수를 선택하세요.');
			} else{
				idChkSend();
			}
		});
	}
});

var xhr;

function idChkSend(){
	xhr = new XMLHttpRequest();
	xhr.open('post', 'idChk');
	var sendData = complex.value + "-" + unit.value;
	xhr.send(sendData);
	
	xhr.onreadystatechange = idChkresProc;	
}

function idChkresProc(){
	if(xhr.readyState !== 4) return;
	if(xhr.status === 200){ 
		let idLbl = document.getElementById('idLbl');
		idLbl.style.display = 'block';
		idLbl.style.fontWeight = 'bold';
		idLbl.innerHTML = xhr.responseText;
		
		if(xhr.responseText != "가입 가능한 세대입니다."){
			idLbl.style.color = 'red';
		} else{
			idLbl.style.color = 'blue';
		}
	} else {
		console.log('에러 : ' + xhr.status);
	}
}

/*비밀번호 체크*/
document.addEventListener('DOMContentLoaded', function(){
	let pwLbl = document.getElementById('pwLbl');
	if(pwLbl){
		let pw = document.getElementById('pw');
		let confirmPw = document.getElementById('confirmPw');
		confirmPw.addEventListener('keyup', function(){
			if(pw.value !== confirmPw.value){
				pwLbl.style.display = 'block';
				pwLbl.style.color = 'red';
				pwLbl.style.fontWeight = 'bold';
				pwLbl.innerHTML="비밀번호와 비밀번호 확인은 일치해야 합니다.";
			} else {
				pwLbl.style.display = 'none';
			}
		})
	}
});

/*인증메일 전송*/
document.addEventListener('DOMContentLoaded', function(){
	let sendEmailBtn = document.getElementById('sendEmailBtn');
	if(sendEmailBtn){
		sendEmailBtn.addEventListener('click', function(){
			const pattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-za-z0-9\-]+/;
			const email = document.getElementById('email').value;
			const emailLbl = document.getElementById('emailLbl');
			emailLbl.style.display = 'block';
			emailLbl.style.fontWeight = 'bold';
		    if(pattern.test(email) === false) {
				emailLbl.style.color = 'red';
				emailLbl.innerHTML = "올바른 이메일 형식이 아닙니다.";
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
		emailLbl.innerHTML = xhr.responseText;
		
		if(xhr.responseText != "인증번호가 전송되었습니다."){
			emailLbl.style.color = 'red';
		} else{
			const authNum = document.getElementById('authNum');
			authNum.disabled = false;
			emailLbl.style.color = 'blue';
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
			const authLbl = document.getElementById('authLbl');
			authLbl.style.display = 'block';
			authLbl.style.fontWeight = 'bold';
			authLbl.style.color = 'red';
			if(authNum.value == ""){
				authLbl.innerHTML = '인증번호를 입력해주세요.';
			} else {
				xhr.open('post', 'authEmail');
		    	xhr.send(document.getElementById('authNum').value);
		    	xhr.onreadystatechange = authEmailResProc;
			}
		})
	}
});
    
function authEmailResProc(){
	if(xhr.readyState === 4 && xhr.status === 200){
		authLbl.innerHTML = xhr.responseText;
		authLbl.style.color='red';
		document.getElementById('regBtn').disabled=true;

		if(authLbl.innerHTML === "인증되었습니다."){
			authLbl.style.color='blue';
			document.getElementById('regBtn').disabled=false;
		}
	}
}

/*회원가입 마지막*/
document.addEventListener('DOMContentLoaded', function(){
	let regBtn = document.getElementById('regBtn');
	if(regBtn){
		regBtn.addEventListener('click', function(){
			let name = document.getElementById('name').value;
			let pw = document.getElementById('pw');
			let confirmPw = document.getElementById('confirmPw');
			const phone = document.getElementById('phone').value;
			const regPhone = /01[016789]-[^0][0-9]{2,3}-[0-9]{3,4}/;
			
			let f = document.getElementById('f');
			if(document.getElementById('idLbl').innerHTML != '가입 가능한 세대입니다.'){
				alert('아이디를 확인해주세요.');
			} else if(pw.value.trim().length == 0 || pw.value == ""){
				alert('비밀번호를 입력해주세요.');
			} else if(confirmPw.value.trim().length == 0 || confirmPw.value == ""){
				alert('비밀번호 확인을 입력해주세요.');
			} else if(name.trim().length == 0 || name == ""){
				alert('이름을 입력해주세요.');
			} else if(document.getElementById('authLbl').innerHTML != '인증되었습니다.'){
				alert('이메일 인증을 진행해주셔야 합니다.');
			} else if(phone.trim().length == 0 || phone == ""){
				alert('휴대폰번호를 입력해주세요.');
			}else if(regPhone.test(phone)==false){
				alert('휴대폰번호를 형식에 맞게 입력해주세요.')
			} else {
				alert('회원가입이 완료되었습니다.\n관리자의 승인을 기다려주세요.');
				f.submit();
			}
		});
	}
});
