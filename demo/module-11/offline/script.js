window.addEventListener("load",function() {
	document.getElementsByTagName("h1")[0].innerHTML="Пример off-line приложения";
},false);

var appCache = window.applicationCache;

appCache.addEventListener("error", function() {
	alert("Проблемы с обновлением кэша");
	document.getElementById("output").innerHTML+="<li>Проблемы с обновлением кэша</li>";
}, false);

appCache.addEventListener("updateready", function() {
	var refresh = confirm("Обновлённая версия готова.  Нажмите OK для обновления.");
	if (refresh) {
		location.reload();
	}
	document.getElementById("output").innerHTML+="<li>Обновлённая версия готова</li>";
}, false);

appCache.addEventListener("cached", function() {
	document.getElementById("output").innerHTML+="<li>приложение закэшировано</li>";
}, false);

appCache.addEventListener("checking", function() {
	document.getElementById("output").innerHTML+="<li>проверка кэша</li>";
}, false);

appCache.addEventListener("downloading", function() {
	document.getElementById("output").innerHTML+="<li>загрузка кэша</li>";
}, false);

appCache.addEventListener("noupdate", function() {
	document.getElementById("output").innerHTML+="<li>нет обновлений</li>";
}, false);

appCache.addEventListener("obsolete", function() {
	document.getElementById("output").innerHTML+="<li>не могу загрузить manifest</li>";
}, false);

appCache.addEventListener("progress", function() {
	document.getElementById("output").innerHTML+="<li>Используется ресурс из кэша</li>";
}, false);
