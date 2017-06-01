
        $(function () {
            var unslider = $('#content').unslider({
                animation: 'horizontal',//滚动模式，horizontal：由左向右滚动，vertical：由上向下滚动，fade：淡出淡入，默认：horizontal
                autoplay: true,   //自动滚动
                infinite: true,   //无限循环
                arrows: false,    //next|prve 箭头，默认：true
                delay: 3000,      //滚动时间间隔
                speed: 750,       // 滚动速度
                //nav: true,         // 导航滑块,默认：true
                nav: function (index, label) { return Nav(index, label) }, //自定义导航滑块,这个需要修改.unslider-nav ol li 样式
                index: 0,   //开始位置first或last，默认：first
                keys: true,        // 是否支持键盘控制，默认：true
            });
        });
        function Nav(index, label) {
            /* 如果返回文字 */
            if (index == 0) return '1';
            else if (index == 1) return '2';
            else if (index == 2) return '3';
            else if (index == 3) return '4';
            else if (index == 4) return '5';
            /* 如果返回数字 */
            // return index + 1;
        }
		
function add_favorite(a, title, url) {
url = url || a.href;
title = title || a.title;
try{ // IE
window.external.addFavorite(url, title);
} catch(e) {
try{ // Firefox
window.sidebar.addPanel(title, url, "");
} catch(e) {
if (/Opera/.test(window.navigator.userAgent)) { // Opera
a.rel = "sidebar";
a.href = url;
return true;
}
alert('加入收藏失败，请使用 Ctrl+D 进行添加');
}
}
return false;
}
function set_homepage(a, url) {
var tip = '您的浏览器不支持此操作\n请使用浏览器的“选项”或“设置”等功能设置首页';
if (/360se/i.test(window.navigator.userAgent)) {
alert(tip);
return false;
}
url = url || a.href;
try {
a.style.behavior = 'url(#default#homepage)';
a.setHomePage(url);
} catch(e) {
alert(tip);
}
return false;
}


function closed(){
   var a = document.getElementById("advertise");
   a.style.display="none";
}