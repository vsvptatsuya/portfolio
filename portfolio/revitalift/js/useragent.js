var ua = navigator.userAgent;  //userAgentを取得して格納
var start,end;  //切り取り開始点と終了点
var ver;    //ブラウザバージョンを格納する変数

//最初にInternet Explorerか調べます
start = ua.indexOf("MSIE");

//「MSIE」の文字列があれば、バージョンを取得する
if ( start != -1 ){
	//バージョン番号の後に「;」があるのでそれを検索
	end = ua.indexOf(";",start);

	//「MSIE」＋半角スペースの5文字を加えた位置から切り取る
	ver = ua.substring(start+5,end);

	//バージョンが8以上の場合はリダイレクト
	if(ver > 8 ){
		location.href='index.html';
	}
}else{
		location.href='index.html';
}