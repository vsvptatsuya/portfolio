<?php
/**
 * 
 */
// 全てのエラー出力をオフにする
//error_reporting(0);

//デフォルトのリダイレクト先定義
define('_DEFAULET_REDIRECT_URL', 'http://www.pointy.jp/');

//Cookieが有効なドメイン
define('_COOKIE_TARGET_DOMAIN', 'pointy.jp');

//Cookieの有効期限(90日後)
define('_COOKIE_LIFE_TIME', 60*60*24*90);

//ログの出力先定義
define('_LOG_FNAME', dirname(__FILE__) .'/logs/accesslog_' .date('Ym') .'.log');

$para = array();
$para = $_REQUEST;

//ログメッセージ初期化
$log_msg = array();


//パラメータチェック==>ログ記載
if (!empty($_SERVER['QUERY_STRING'])) {
	$log_msg['QUERY_STRING'] = $_SERVER['QUERY_STRING'];
}
//リファラーチェック==>ログ記載
if (!empty($_SERVER['HTTP_REFERER'])) {
	$log_msg['HTTP_REFERER'] = $_SERVER['HTTP_REFERER'];
}
//IPチェック==>ログ記載
if (!empty($_SERVER['REMOTE_ADDR'])) {
	$log_msg['REMOTE_ADDR'] = $_SERVER['REMOTE_ADDR'];
}
//ブラウザチェック==>ログ記載
if (!empty($_SERVER['HTTP_USER_AGENT'])) {
	$log_msg['HTTP_USER_AGENT'] = $_SERVER['HTTP_USER_AGENT'];
}


if (empty($_COOKIE['agency_cd']) && !empty($para['agency_cd'])) {
	if (preg_match('/^[0-9]{4}+$/', $para['agency_cd'])) {
		//Cookie未セットの場合はセット
		//有効期限90日、対象ドメイン「pointy.jp」
		if (!setcookie('agency_cd', $para['agency_cd'], time() + _COOKIE_LIFE_TIME, '/', _COOKIE_TARGET_DOMAIN)) {
			$log_msg['COKKIE_WRITE_STATUS'] = 'NG';
		} else {
			$log_msg['COKKIE_WRITE_STATUS'] = 'OK';
			$log_msg['COKKIE_WRITE_CONTENTS'] = array(
				 'KEY' => 'agency_cd'
				,'VAL' => $para['agency_cd']
				,'EXP' => date('D d M Y h:i:s e', time() + _COOKIE_LIFE_TIME)
				,'DOM' => _COOKIE_TARGET_DOMAIN
			);
		}
	}
}

if (!empty($_COOKIE['agency_cd'])) {
	$log_msg['COKKIE_SETTINGS'] = 'agency_cd=' .$_COOKIE['agency_cd'];
}

//リダイレクト先URL有効性チェック
/*
$header = FALSE;
$header = @get_headers($para['r']);
$log_msg['get_headers'] = $header;
if (empty($header) || !isset($header[0])) {
	if (strpos($para['r'], 'my.pointy.jp/myorder/OrderApply/addContractor') === FALSE) {
		$para['r'] = _DEFAULET_REDIRECT_URL;
	}
} else if (strpos($header[0], '200') === FALSE) {
	if (strpos($para['r'], 'my.pointy.jp/myorder/OrderApply/addContractor') === FALSE) {
		$para['r'] = _DEFAULET_REDIRECT_URL;
	}
}
*/
$default_opts = array(
	'http' => array(
		 'method'        => "HEAD"// HEADを投げてみる
		,'header'        => "Accept-language: jp\n"// HTTPヘッダは\nで区切る
		                   ."User-Agent: neko" // デフォルト値はphp.iniで指定できる
		,'max_redirects' => 5 // リダイレクトは5回まで
	)
);
stream_context_get_default($default_opts);
$header = FALSE;
$header = @get_headers($para['r']);
$log_msg['get_headers'] = $header;

$url_ok_flg = FALSE;

if (empty($header) || !is_array($header)) {
	//何もしない
} else {
	foreach ($header as $val) {
		if (strcmp($val, 'HTTP/1.1 200 OK') == 0) {
			$url_ok_flg = TRUE;
			break;
		}
	}
}

if (!$url_ok_flg) {
	if (strpos($para['r'], 'my.pointy.jp/myorder/OrderApply/addContractor') === FALSE) {
		$para['r'] = _DEFAULET_REDIRECT_URL;
	}
}


$log_msg['REDIRECT_URL'] = $para['r'];

//ログ記載
writeLog(PHP_EOL .print_r($log_msg, TRUE));

//リダイレクト
//header('Location: ' .$para['r']);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<title>pointy | リダイレクトページ</title>
<script type="text/javascript">

var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-39456180-1']);
_gaq.push(['_setDomainName', 'pointy.jp']);
_gaq.push(['_trackPageview']);

(function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();

</script>
</head>
<body onload="javascript: document.getElementById('form1').submit();">
<form id="form1" method="POST" action="<?php echo htmlspecialchars($para['r']);?>">
<?php
if (preg_match('/^[0-9]{4}+$/', $para['agency_cd'])) {
	echo '<input type="hidden" name="agency_cd" value="' .htmlspecialchars($para['agency_cd']) .'" />' .PHP_EOL;
}
?>
</form>
<noscript>
<p>ページは自動的に切り替わります。切り替わらない場合は<a href="<?php echo _DEFAULET_REDIRECT_URL;?>">こちら</a>をクリックしてください。</p>
</noscript>
</body>
</html>
<?php

//----------------------------------------------------------->以下関数
/**
 * ファイルへの書き出し
 * 
 * @param    str    $message   メッセージ
 * @param    str    $fname     パス付きファイル名　※圧縮保存する場合でも拡張子を「.gz」にしないこと
 * @param    bool   $pack      TRUE:圧縮する　FALSE:圧縮しない
 * @return   bool              true:正常終了　false：異常終了
 */
function execWriteLog($message, $fname, $pack = TRUE)
{
	if ($pack) {
		$fname .= ".gz";
	}

	if (!file_exists($fname)) {
		@touch($fname);
		@chmod($fname, 0666);
	}

	$message = str_replace("'", "'\''", $message);

	// ログファイルは記述都度圧縮する
	if ($pack) {
		$f = @exec("echo '" .$message ."' | gzip -c >> " .$fname, $dammy_array, $ret);
	} else {
		$f = @exec("echo '" .$message ."' | cat >> " .$fname, $dammy_array, $ret);
	}

	return TRUE;
}


/**
 * ログファイルへの書き出し
 * 
 * @param    str    $message         ログメッセージ
 * @param    str    $rank            ログレベル
 * @param    str    $log_fname       パス付きログファイル名
 * @param    bool   $pack            TRUE:圧縮する　FALSE:圧縮しない
 * @return   bool                    true:正常終了　false：異常終了
 */
function writeLog($message, $rank = '[INFO]' , $log_fname = _LOG_FNAME, $pack = FALSE)
{
	$message = date('Y-m-d H:i:s') .' ' .$rank .' ' .$message;

	return execWriteLog($message, $log_fname, $pack);
}

?>