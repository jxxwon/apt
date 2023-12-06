function loginChk(){
	const id = document.getElementById('id').value;
	
	if(id == "" || id.trim().length == 0){
		alert('아이디를 입력하세요.');
		return;
	}
	
	const pw = document.getElementById('pw').value;
	if(pw == "" || pw.trim().length == 0){
		alert('비밀번호를 입력하세요.');
		return;
	}
	
	let f = document.getElementById('f');
	f.submit();
}