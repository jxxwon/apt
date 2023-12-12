/* 검색조건 */
function searchCondition(){
	const select = document.getElementById('select');
	const status = document.getElementById('status');
	const search  = document.getElementById('search');

	if(select.value === "아이디"){
		status.style.display='none';
		search.style.display='inline-block';
	} else{
		status.style.display='inline-block';
		search.style.display='none';
	}
	
}
