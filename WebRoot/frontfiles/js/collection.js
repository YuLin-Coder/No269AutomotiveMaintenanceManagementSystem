//替换空格
function toReplace(strs) {
	if (strs.length > 0) {
		alert(strs.replace(new RegExp("\uff0c", "gm"), ","));
	}
}
var http_request = false;
function send_request(productId, productName) {
	http_request = false;
	if (productId == "") {
		return false;
	} else {
		     
//	     alert(productName);
//       alert(productId);
		var pro = escape(productName);
		var url = "product!toCollect.action?productId=" + productId + "&productName=" + pro + "&rodom=" + new Date().getTime();
//			var url="product!toCollect.action?productName="+pro+"&productId="+productId;
		if (window.XMLHttpRequest) {
			http_request = new XMLHttpRequest();
			if (http_request.overrideMimeType) {
				http_request.overrideMimeType("text/xml");
			}
		} else {
			if (window.ActiveXObject) {
				try {
					http_request = new ActiveXObject("Msxml2.XMLHTTP");
				}
				catch (e) {
					try {
						http_request = new ActiveXObject("Microsoft.XMLHTTP");
					}
					catch (e) {
					}
				}
			}
		}
		if (!http_request) {
			window.alert("\u4f60\u6240\u8bf7\u6c42\u7684\u9875\u9762\u5f02\u5e38!");
			return false;
		}
		http_request.onreadystatechange = processResponse;
		http_request.open("GET", url, true);
		http_request.send(null);
	}
}
function processResponse() {
	if (http_request.readyState == 4) {
		if (http_request.status == 200) {
			var responseText = http_request.responseText;
			display(responseText);
		} else {
			alert("XXXX!");
		}
	}
}
function display(responseText) {
	alert(responseText);
			  //window.location.href="index.jsp";
}
	

//var http_request2= false;
//
//	function send_request2(intergral){
//	    alert(intergral);
//		http_request2= false;
//		if (intergral==""){
//			return false;
//		}
//
//		else{
//			var url="product!toIntegeral.action?intergral="+intergral;
//			if(window.XMLHttpRequest) {
//				http_request2= new XMLHttpRequest();
//				if (http_request2.overrideMimeType) {
//					http_request2.overrideMimeType("text/xml");
//				}
//			}
//			else if (window.ActiveXObject) {
//				try {
//					http_request2 = new ActiveXObject("Msxml2.XMLHTTP");
//				} catch (e) {
//					try {
//						http_request2 = new ActiveXObject("Microsoft.XMLHTTP");
//					} catch (e) {}
//				}
//			}
//			if (!http_request2) {
//				window.alert("你所请求的页面异常!");
//				return false;
//			}
//
//			http_request2.onreadystatechange = processResponse2;
//			http_request2.open("GET", url, true);
//			http_request2.send(null);
//		}
//	}
//
//	function processResponse2() {
//		if (http_request2.readyState == 4) {
//			if (http_request2.status == 200) {
//				var responseText2 = http_request2.responseText;
//				display2(responseText2);
//			} else {
//				alert("XXXX!");
//			}
//		}
//	}
//
//	function display2(responseText2){
//			if(responseText2=="12"){
//			   alert("12");
//			}else{
//			   window.location.href="/jsplib/tointegral_jsp/showIntegeralCart.jsp";
//			}
//	}
//	

