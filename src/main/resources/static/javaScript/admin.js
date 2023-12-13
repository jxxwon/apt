/*검색조건 - display*/
document.addEventListener('DOMContentLoaded', function(){
	let select = document.getElementById('select');
	if(select){
		select.addEventListener('change', function(){
			let status = document.getElementById('status');
			let search  = document.getElementById('search');
		
			if(select.value === "id"){
				status.style.display='none';
				search.style.display='inline-block';
			} else{
				status.style.display='inline-block';
				search.style.display='none';
			}
		})
	}
});

/*검색*/
document.addEventListener('DOMContentLoaded', function(){
	let searchBtn = document.getElementById('searchBtn');
	let search = document.getElementById('search');
	if(searchBtn){
		searchBtn.addEventListener('click', function(){
			let select = document.getElementById('select');
			let status = document.getElementById('status');

			if(select.value === "status"){
				search.disabled = 'true';
			} else{
				status.disabled = 'true';
			}
		});
	}
});

/*회원관리 - 목록버튼*/
document.addEventListener('DOMContentLoaded', function(){
	let userListBtn = document.getElementById('userListBtn');
	if(userListBtn){
		userListBtn.addEventListener('click', function(){
			location.href = '/admin/userManage';
		})
	}
});

/*회원관리 -승인/반려버튼*/
document.addEventListener('DOMContentLoaded', function(){
    let userAuthBtn = document.getElementById('userAuthBtn');
    let userRejectBtn = document.getElementById('userRejectBtn');

    function submitForm(action) {
        let f = document.getElementById('f');
        
        let existingActionInput = f.querySelector('input[name="action"]');
        if (existingActionInput) {
            existingActionInput.remove();
        }

        let actionInput = document.createElement('input');
        actionInput.type = 'hidden';
        actionInput.name = 'action';
        actionInput.value = action;
        f.appendChild(actionInput);
        
        f.submit();
    }

    if (userAuthBtn) {
        userAuthBtn.addEventListener('click', function(){
			if(confirm('승인하시겠습니까?')){
	            submitForm('userAuth');
				alert('승인되었습니다.');
			} else{
				alert('승인을 취소하였습니다.');
			}
        });
    }

    if (userRejectBtn) {
        userRejectBtn.addEventListener('click', function(){
			if(confirm('반려하시겠습니까?')){
	            submitForm('userReject');
	            alert('반려되었습니다.');
			} else{
				alert('반려를 취소하였습니다.');
			}
        });
    }
});