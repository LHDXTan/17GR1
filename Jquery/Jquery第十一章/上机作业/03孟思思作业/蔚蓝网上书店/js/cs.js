	var uName = document.getElementById("nickName");
		if(uName.validity.valueMissing == true) {
			uName.setCustomValidity("昵称不能为空");
		} else if(uName.validity.patternMismatch == true) {
			uName.setCustomValidity("昵称必须是4~20位的英文和数字");
		} else {
			uName.setCustomValidity("");
		}