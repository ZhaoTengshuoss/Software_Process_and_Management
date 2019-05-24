<%@page import="oracle.DaoFactory"%>
<%@page import="Dao.IUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="model.User"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户登录</title>
<script id="jqbb" src="js1/jquery.min.js"></script>
<style type="text/css">
body { background-color: #fff ;
}
@charset "utf-8";
	/* track base Css */
.container {

    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    width: 350px;
    margin: 50px auto;
    overflow:auto;
}
.red {
	color:red;
}
#ehong-code-input {
	width:42px;
	letter-spacing:2px;
	margin:0px 8px 0px 0px;
}
.ehong-idcode-val {
	position:relative;
	padding:1px 4px 1px 4px;
	top:0px;
	*top:-3px;
	letter-spacing:4px;
	display:inline;
	cursor:pointer;
	font-size:16px;
	font-family:"Courier New",Courier,monospace;
	text-decoration:none;
	font-weight:bold;
}
.ehong-idcode-val0 {
	border:solid 1px #A4CDED;
	background-color:#ECFAFB;
}
.ehong-idcode-val1 {
	border:solid 1px #A4CDED;
	background-color:#FCEFCF;
}
.ehong-idcode-val2 {
	border:solid 1px #6C9;
	background-color:#D0F0DF;
}
.ehong-idcode-val3 {
	border:solid 1px #6C9;
	background-color:#DCDDD8;
}
.ehong-idcode-val4 {
	border:solid 1px #6C9;
	background-color:#F1DEFF;
}
.ehong-idcode-val5 {
	border:solid 1px #6C9;
	background-color:#ACE1F1;
}
.ehong-code-val-tip {
	font-size:12px;
	color:#1098EC;
	top:0px;
	*top:-3px;
	position:relative;
	margin:0px 0px 0px 4px;
	cursor:pointer;
}
.login-body {
    background: url("image/bg.png") repeat fixed;
}
.container header {
    margin-top: 60px;
    height: 35px;
    line-height: 35px;
    font-size: 30px;
    font-weight: 100;
    text-align: center;
}

</style>
</head>

<body class="login-body" style="margin-top: 130px;">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js1/jquery-latest.js"></script>
<script src="js1/bootstrap.min.js"></script>
<div class="container">
    <div class="col-md-6 col-md-offset-3">
     <header >课程信息管理系统</header>
        <form action="login1.jsp" >
            <div class="form-group has-feedback">
                <label for="username">用户名</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon">
                    <img src="image/u.PNG" style="width:14px;height:16px"></img>
                    </span></span>
                    <input id="username" name="username" class="form-control" placeholder="请输入用户名" maxlength="20" type="text">
                </div>

                <span style="color:red;display: none;" class="tips"></span>
               
                <span style="display: none;" class=" glyphicon glyphicon-remove form-control-feedback">
                  <img src="image/error.PNG" style="width:15px;height:16px;margin-top:8px"></img>
                </span>
                <span style="display: none;" class="glyphicon glyphicon-ok form-control-feedback">
                 <img src="image/ok.PNG" style="width:15px;height:16px;margin-top:8px"></img>
                </span>
            </div>

            <div class="form-group has-feedback">
                <label for="password">密码</label>
                <div class="input-group">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-lock">
                      <img src="image/pas.PNG" style="width:14px;height:16.5px"></img>
                    </span></span>
                    <input id="password" name="password" class="form-control" placeholder="请输入密码" maxlength="20" type="password">
                </div>

                <span style="color:red;display: none;" class="tips"></span>
                 <span style="display: none;" class=" glyphicon glyphicon-remove form-control-feedback">
                  <img src="image/error.PNG" style="width:15px;height:16px;margin-top:8px"></img>
                </span>
                <span style="display: none;" class="glyphicon glyphicon-ok form-control-feedback">
                 <img src="image/ok.PNG" style="width:15px;height:16px;margin-top:8px"></img>
                </span>
            </div>
            <div class="row">
                <div class="col-xs-7">
                    <div class="form-group has-feedback">
                        <label for="idcode-btn">验证码</label>
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-qrcode">
                              <img src="image/code.PNG" style="width:14px;height:16.5px"></img>
                            </span></span>
                            <input id="idcode-btn" class="form-control" placeholder="请输入验证码" maxlength="4" type="text">
                        </div>
                        <span style="color:red;display: none;" class="tips"></span>
                        <span style="display: none;" class=" glyphicon glyphicon-remove form-control-feedback">
                  <img src="image/error.PNG" style="width:15px;height:16px;margin-top:8px"></img>
                </span>
                <span style="display: none;" class="glyphicon glyphicon-ok form-control-feedback">
                 <img src="image/ok.PNG" style="width:15px;height:16px;margin-top:8px"></img>
                </span>
                    </div>
                </div>
                <div class="col-xs-5" style="padding-top: 30px">
                    <div id="idcode" style="background: transparent;"></div>
                </div>
            </div>
            <div class="form-group">
                <input class="form-control btn btn-primary" id="submit" value="立&nbsp;&nbsp;即&nbsp;&nbsp;登&nbsp;&nbsp;录" type="submit">
            </div>

            <div class="form-group">
                <input value="重置" id="reset" class="form-control btn btn-danger" type="reset">
            </div>
             <p style="text-align:center;font-size:20px"><a href="registerInput.jsp" >没有账号，去注册一个</a></p>
        </form>
    </div>
</div>
<% 
IUserDao userDao=DaoFactory.getDaoImpl();
List<User> users =userDao.find_users_u();
int i=0;
for(User user :users)
{
	i++;
%>
<input type="hidden" name="users" value="<%=user.getUsername()%>"></input>
<%
}
%>
<input type="hidden" id="length" name="length" value="<%=i%>"></input>
<script>
var settings = {
    e: 'idcode',
    codeType: {
        name: 'follow',
        len: 4
    }, //len是修改验证码长度的
    codeTip: '换个验证码?',
    inputID: 'idcode-btn' //验证元素的ID
};

var _set = {
    storeLable: 'codeval',
    store: '#ehong-code-input',
    codeval: '#ehong-code'
}
$.idcode = {
    getCode: function(option) {
        _commSetting(option);
        return _storeData(_set.storeLable, null);
    },
    setCode: function(option) {
        _commSetting(option);
        _setCodeStyle("#" + settings.e, settings.codeType.name, settings.codeType.len);

    },
    validateCode: function(option) {
        _commSetting(option);
        var inputV;
        if (settings.inputID) {
            inputV = $('#' + settings.inputID).val();

        } else {
            inputV = $(_set.store).val();
        }
        if (inputV.toUpperCase() == _storeData(_set.storeLable, null).toUpperCase()) { //修改的不区分大小写
            return true;
        } else {
            _setCodeStyle("#" + settings.e, settings.codeType.name, settings.codeType.len);
            return false;
        }
    }
};

function _commSetting(option) {
    $.extend(settings, option);
}

function _storeData(dataLabel, data) {
    var store = $(_set.codeval).get(0);
    if (data) {
        $.data(store, dataLabel, data);
    } else {
        return $.data(store, dataLabel);
    }
}

function _setCodeStyle(eid, codeType, codeLength) {
    var codeObj = _createCode(settings.codeType.name, settings.codeType.len);
    var randNum = Math.floor(Math.random() * 6);
    var htmlCode = ''
    if (!settings.inputID) {
        htmlCode = '<span><input id="ehong-code-input" type="text" maxlength="4" /></span>';
    }
    htmlCode += '<div id="ehong-code" class="ehong-idcode-val ehong-idcode-val';
    htmlCode += String(randNum);
    htmlCode += '" href="#" onblur="return false" onfocus="return false" oncontextmenu="return false" onclick="$.idcode.setCode()">' + _setStyle(codeObj) + '</div>' + '<span id="ehong-code-tip-ck" class="ehong-code-val-tip" onclick="$.idcode.setCode()">' + settings.codeTip + '</span>';
    $(eid).html(htmlCode);
    _storeData(_set.storeLable, codeObj);
}

function _setStyle(codeObj) {
    var fnCodeObj = new Array();
    var col = new Array('#BF0C43', '#E69A2A', '#707F02', '#18975F', '#BC3087', '#73C841', '#780320', '#90719B', '#1F72D8', '#D6A03C', '#6B486E', '#243F5F', '#16BDB5');
    var charIndex;
    for (var i = 0; i < codeObj.length; i++) {
        charIndex = Math.floor(Math.random() * col.length);
        fnCodeObj.push('<font color="' + col[charIndex] + '">' + codeObj.charAt(i) + '</font>');
    }
    return fnCodeObj.join('');
}

function _createCode(codeType, codeLength) {
    var codeObj;
    if (codeType == 'follow') {
        codeObj = _createCodeFollow(codeLength);
    } else if (codeType == 'calc') {
        codeObj = _createCodeCalc(codeLength);
    } else {
        codeObj = "";
    }
    return codeObj;
}

function _createCodeCalc(codeLength) {
    var code1, code2, codeResult;
    var selectChar = new Array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
    var charIndex;
    for (var i = 0; i < codeLength; i++) {
        charIndex = Math.floor(Math.random() * selectChar.length);
        code1 += selectChar[charIndex];

        charIndex = Math.floor(Math.random() * selectChar.length);
        code2 += selectChar[charIndex];
    }
    return [parseInt(code1), parseInt(code2), parseInt(code1) + parseInt(code2)];
}

function _createCodeFollow(codeLength) {
    var code = "";
    var selectChar = new Array('0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');

    for (var i = 0; i < codeLength; i++) {
        var charIndex = Math.floor(Math.random() * selectChar.length);
        if (charIndex % 2 == 0) {
            code += selectChar[charIndex].toLowerCase();
        } else {
            code += selectChar[charIndex];
        }
    }
    return code;
}
var regUsername = /^[a-zA-Z_][a-zA-Z0-9_]{2,19}$/;
var regPasswordSpecial = /[~!@#%&=;':",./<>_\}\]\-\$\(\)\*\+\.\[\?\\\^\{\|]/;
var regPasswordAlpha = /[a-zA-Z]/;
var regPasswordNum = /[0-9]/;
var password;
var check = [false, false, false];


var le=document.getElementById("length").value;
var no= new Array(le);
no=document.getElementsByName("users");
var flag=false; 




//校验成功函数
function success(Obj, counter) {
    Obj.parent().parent().removeClass('has-error').addClass('has-success');
    $('.tips').eq(counter).hide();
    $('.glyphicon-ok').eq(counter).show();
    $('.glyphicon-remove').eq(counter).hide();
    check[counter] = true;

}

// 校验失败函数
function fail(Obj, counter, msg) {
    Obj.parent().parent().removeClass('has-success').addClass('has-error');
    $('.glyphicon-remove').eq(counter).show();
    $('.glyphicon-ok').eq(counter).hide();
    $('.tips').eq(counter).text(msg).show();
    check[counter] = false;
}

// 用户名匹配
$('.container').find('input').eq(0).change(function() {

	if ($(this).val().length < 3) {
        fail($(this), 0, '用户名太短，不能少于3个字符');
    } else {
    	  /* success($(this), 0); */
    	 for (i=0;i<le;i++)
			{
			  if(no[i].value==($(this).val()))
			   {
			      flag=true;
			    }
			}
 	  if(flag)
 		  {success($(this), 0);}
 	  else
 		  {fail($(this),0,'该用户名不存在');}
 	  flag=false;
    }

});



// 密码匹配

// 匹配字母、数字、特殊字符至少两种的函数
function atLeastTwo(password) {
    var a = regPasswordSpecial.test(password) ? 1 : 0;
    var b = regPasswordAlpha.test(password) ? 1 : 0;
    var c = regPasswordNum.test(password) ? 1 : 0;
    return a + b + c;

}

$('.container').find('input').eq(1).change(function() {

    password = $(this).val();

    if ($(this).val().length < 8) {
        fail($(this), 1, '密码太短，不能少于8个字符');
    } else {


        if (atLeastTwo($(this).val()) < 2) {
            fail($(this), 1, '密码中至少包含字母、数字、特殊字符的两种')
        } else {
            success($(this), 1);
        }
    }
});


// 验证码
$.idcode.setCode();

$('.container').find('input').eq(2).change(function() {
    var IsBy = $.idcode.validateCode();
    if (IsBy) {
        success($(this), 2);
    } else {
        fail($(this), 2, '验证码输入错误');
    }
});

// 手机号码
var regPhoneNum = /^[0-9]{11}$/
$('.container').find('input').eq(4).change(function() {
    if (regPhoneNum.test($(this).val())) {
        success($(this), 4);
    } else {
        fail($(this), 4, '手机号码只能为11位数字');
    }
});

//短信验证码
var regMsg = /111111/;
$('.container').find('input').eq(5).change(function() {
    if (check[4]) {
        if (regMsg.test($(this).val())) {
            success($(this), 5);
        } else {
            fail($(this), 5, '短信验证码错误');
        }
    } else {
        $('.container').find('input').eq(4).parent().parent().removeClass('has-success').addClass('has-error');
    }

});


$('#loadingButton').click(function() {

    if (check[4]) {
        $(this).removeClass('btn-primary').addClass('disabled');

        $(this).html('<span class="red">59</span> 秒后重新获取');
        var secondObj = $('#loadingButton').find('span');
        var secondObjVal = secondObj.text();

        function secondCounter() {

            var secondTimer = setTimeout(function() {
                secondObjVal--;
                secondObj.text(secondObjVal);
                secondCounter();
            }, 1000);
            if (secondObjVal == 0) {
                clearTimeout(secondTimer);
                $('#loadingButton').text('重新获取校验码');
                $('#loadingButton').removeClass('disabled').addClass('btn-primary');

            }
        }

        secondCounter();
    } else {
        $('.container').find('input').eq(4).parent().parent().removeClass('has-success').addClass('has-error');
    }

})

$('#submit').click(function(e) {
    if (!check.every(function(value) {
            return value == true
        })) {
        e.preventDefault();
        for (key in check) {
            if (!check[key]) {
                $('.container').find('input').eq(key).parent().parent().removeClass('has-success').addClass('has-error')
            }
        }
    }
});

$('#reset').click(function() {
    $('input').slice(0, 3).parent().parent().removeClass('has-error has-success');
    $('.tips').hide();
    $('.glyphicon-ok').hide();
    $('.glyphicon-remove').hide();
    check = [false, false, false];
});
</script>
</body>
</html>