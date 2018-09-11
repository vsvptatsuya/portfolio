<?php
//ini_set('display_errors', 'On');

//サーバ名定義
define('_SERVER_NAME', 'www.pointy.jp');

if (strcmp($_SERVER["SERVER_NAME"], _SERVER_NAME) != 0 || empty($_SERVER["HTTPS"]) || 
    (!empty($_SERVER["HTTPS"]) && strcmp(strtolower($_SERVER["HTTPS"]), "on") != 0)) {
	//SSLページへリダイレクト
	header("Location: " ."https://" ._SERVER_NAME .$_SERVER["REQUEST_URI"]);
}

if (count($_POST) > 0) {

	//パラメータ受取
	$p = array();
	$p = $_POST;

	if (strcmp($p['mode'], 'confirm') == 0) {//入力値チェック
		$err_flg = FALSE;

		if (empty($p['contact_name'])) {
			$contact_name_err = '必須入力です。';
			$err_flg = TRUE;
		}

		if (!empty($p['email'])) {
			if (!preg_match("/^([a-zA-Z0-9])+([a-zA-Z0-9\._-])*@([a-zA-Z0-9_-])+([a-zA-Z0-9\._-]+)+$/", $p['email'])) {
				$email_err = 'メールアドレスの形式が不正です。';
				$err_flg = TRUE;
			} else if (strcmp($p['email'], $p['email_conf']) != 0) {
				$email_err = 'E-mailとE-mail(確認)が一致しません。';
				$err_flg = TRUE;
			}
		} else {
			$email_err = '必須入力です。';
			$err_flg = TRUE;
		}

//--->2013/04/01 Accelia NEMORI upd 電話番号の必須解除
/*
		if (empty($p['tel'])) {
			$tel_err = '必須入力です。';
			$err_flg = TRUE;
		} else if (!preg_match("/^[0-9]{2,4}-[0-9]{2,4}-[0-9]{3,4}$/", $p['tel'])) {
			$tel_err = '電話番号の形式が不正です。050-0000-0000のような形式で入力してください。';
			$err_flg = TRUE;
		}
*/
		if (!empty($p['tel']) && !preg_match("/^[0-9]{2,4}-[0-9]{2,4}-[0-9]{3,4}$/", $p['tel'])) {
			$tel_err = '電話番号の形式が不正です。050-0000-0000のような形式で入力してください。';
			$err_flg = TRUE;
		}

//<---

		if (empty($p['title'])) {
			$title_err = '必須入力です。';
			$err_flg = TRUE;
		}

		if (empty($p['body'])) {
			$body_err = '必須入力です。';
			$err_flg = TRUE;
		}

		if (empty($p['agree'])) {
			$agree_err = TRUE;
			$err_flg = TRUE;
		}

		if (!$err_flg) {
			include_once 'confirm.tpl';
		} else {
			include_once 'input.tpl';
		}
	} else if ($p['mode'] == 'send') {

		//メール本文編集
		$mail_body  = '';
		$mail_body .= $p['contact_name'] .'さま' .PHP_EOL;
		$mail_body .= PHP_EOL;
		$mail_body .= 'pointyお客さまサポートセンターです。' .PHP_EOL;
		$mail_body .= PHP_EOL;
		$mail_body .= '以下の内容でホームページよりお問合せを受け付けました。' .PHP_EOL;
		$mail_body .= '担当者より折り返しご連絡差し上げますのでしばらくお待ちくださいませ。' .PHP_EOL;
		$mail_body .= ' ' .PHP_EOL;
		$mail_body .= '----------------------------------------------------------------------' .PHP_EOL;
		$mail_body .= 'お名前：' .$p['contact_name'] .PHP_EOL;
		$mail_body .= 'E-mail：' .$p['email'] .PHP_EOL;
		$mail_body .= '電話番号：' .$p['tel'] .PHP_EOL;
		$mail_body .= '件名：' .$p['title'] .PHP_EOL;
		$mail_body .= '内容：' .PHP_EOL;
		$mail_body .=  $p['body'] .PHP_EOL;
		$mail_body .= '----------------------------------------------------------------------' .PHP_EOL;
		$mail_body .= ' ' .PHP_EOL;
		$mail_body .= ' ' .PHP_EOL;
		$mail_body .= '送信日時: ' .date('Y/m/d H:i:s') .PHP_EOL;

		//デフォルト言語・文字コード設定
		mb_language("Japanese");
		mb_internal_encoding('UTF-8');
		mb_http_output('UTF-8');
/*
		//$headers  = "MIME-Version: 1.0 \n";
		$headers  = "";
		$headers .= "From: " .
		       "".mb_encode_mimeheader (mb_convert_encoding('pointyお客さまサポート', "ISO-2022-JP", "AUTO")) ."" .
		       "<manzoku@pointy.jp> \n";
		$headers .= "Reply-To: " .
		       "".mb_encode_mimeheader (mb_convert_encoding('pointyお客さまサポート', "ISO-2022-JP", "AUTO")) ."" .
		       "<manzoku@pointy.jp> \n";
		$headers .= "Bcc: " .
		       "".mb_encode_mimeheader (mb_convert_encoding('pointyお客さまサポート', "ISO-2022-JP", "AUTO")) ."" .
		       "<manzoku@pointy.jp> \n";
		$headers .= "Content-Type: text/plain;charset=ISO-2022-JP \n";

		$subject = '【pointy】ホームページよりお問い合わせを受け付けました';
		$subject = mb_convert_encoding($subject, 'iso-2022-jp', 'UTF-8');
		$mail_body = mb_convert_encoding($mail_body, 'iso-2022-jp', 'UTF-8');
		$mail_body = str_replace("\r\n", "\n", $mail_body);
		$mail_body = str_replace("\r", "\n", $mail_body);

		mb_send_mail($p['email'], $subject, $mail_body, $headers);
*/
		require_once(dirname(__FILE__) .'/qdmail.php');

		$Qdmail = NULL;
		$Qdmail = new Qdmail();
/*
		$Qdmail->smtp(true);

		$param = array(
			 'host'     => 'localhost'			//メールサーバー
			,'port'     => 25					//これはSMTPAuthの例。認証が必要ないなら　25　でＯＫ。
			,'from'     => 'manzoku@pointy.jp'	//Return-path: になります。
			,'protocol' => 'SMTP'				//認証が必要ないなら、'SMTP'
			,'user'     => ''					//SMTPサーバーのユーザーID
			,'pass'     => ''					//SMTPサーバーの認証パスワード
		);
		$Qdmail->smtpServer($param);
*/
		$Qdmail->reset();												//リセット
		$Qdmail->to($p['email']);										//送信先
		$Qdmail->subject('お問い合わせを受け付けました');				//件名

		$Qdmail->from('manzoku@pointy.jp', 'pointyお客さまサポート');	//送信元
		$Qdmail->bcc('manzoku@pointy.jp', 'pointyお客さまサポート');	//Bcc
		$Qdmail->replyto('manzoku@pointy.jp', 'pointyお客さまサポート');//REPLYTO
		$Qdmail->mtaOption('-f manzoku@pointy.jp');						//Return-Path

		$Qdmail->text($mail_body);										//本文
		$Qdmail->send();												//メールを送信

		header('Location: http://' ._SERVER_NAME .$_SERVER["REQUEST_URI"] .'thanks.html');

	} else {
		include_once 'input.tpl';
	}
} else {
	include_once 'input.tpl';
}

function h($str)
{
	return htmlspecialchars($str);
}
?>
<!--
<?php print_r($p); ?>
-->
