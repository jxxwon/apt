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
	let userDeleteBtn = document.getElementById('userDeleteBtn');

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
	if(userDeleteBtn){
		userDeleteBtn.addEventListener('click', function(){
			if(confirm('해당 회원을 탈퇴시키겠습니까?')){
				submitForm('userDelete');
				alert('탈퇴되었습니다.')
			}else{
				alert('탈퇴를 취소하였습니다.');
			}
		})
	}
    
});

/*관리비 - 세대별 관리비 등록*/
document.addEventListener('DOMContentLoaded',function(){
	let costRegBtn = document.getElementById('costRegBtn');
	if(costRegBtn){
		costRegBtn.addEventListener('click',function(){
			location.href = "/admin/costRegister";
		})
	}
});

/*관리비 관리 - 검색조건 변경*/
document.addEventListener('DOMContentLoaded', function () {
    let complex = document.getElementById('complex');
    let unit = document.getElementById('unit');

    if (complex && unit) {
        complex.addEventListener('change', function () {
            const complexOptions = {
                "101": ["101", "102", "201", "202", "301", "302", "401", "402", "501", "502"],
                "102": ["101", "102", "103", "201", "202", "203", "301", "302", "303", "401", "402", "403", "501", "502", "503", "601", "602", "603", "701", "702", "703"],
                "103": ["101", "102", "103", "104", "301", "302"],
                "104": ["101", "102", "103", "104", "301", "302"],
            }

            // 초기화
            unit.innerHTML = '<option value="all">호수 선택</option>';

            if (complexOptions.hasOwnProperty(complex.value)) {
                complexOptions[complex.value].forEach(optionValue => {
                    // '호'를 붙여서 옵션 추가
                    let displayText = optionValue + '호';
                    let option = new Option(displayText, optionValue);
                    
                    // Set the 'selected' attribute if the optionValue matches the unit variable
                    if (optionValue === "${unit}") {
                        option.selected = true;
                    }

                    unit.options.add(option);
                });
            }
        });
    }
});

/*관리비 등록 - 검색버튼*/
document.addEventListener('DOMContentLoaded', function(){
	let costRegSearchBtn = document.getElementById('costRegSearchBtn');
	if(costRegSearchBtn){
		costRegSearchBtn.addEventListener('click', function(){
			let year = document.getElementById('year').value;
			let month = document.getElementById('month').value;
			let complex = document.getElementById('complex').value;
			let unit = document.getElementById('unit').value;
			
			if(year === 'all'){
				alert('연도를 선택하세요.');
				return;
			}
			if(month === 'all'){
				alert('월을 선택하세요.');
				return;
			}
			if(complex === 'all'){
				alert('동을 선택하세요.');
				return;
			}
			if(unit === 'all'){
				alert('호수를 선택하세요.');
				return;
			}
			let costRegSearchForm = document.getElementById('costRegSearchForm');
			costRegSearchForm.submit();
		})
	}
})
/*관리비 등록 - 목록버튼*/
document.addEventListener('DOMContentLoaded', function(){
	let costListBtn = document.getElementById('costListBtn');
	if(costListBtn){
		costListBtn.addEventListener('click', function(){
			location.href='/admin/costManage';
		})
	}
})