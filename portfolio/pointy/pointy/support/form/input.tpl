<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>サポート・よくある質問｜無料通話アプリ・IP電話ならポイントの貯まる「ポインティ-pointy-」</title>
<meta name="description" content="IP電話「ポインティ-pointy-」に関するサポート・よくある質問・解約についてを掲載しています。「ポインティ」の操作マニュアルもダウンロードしていただけます。" />
<meta name="keywords" content="無料通話,IP電話,格安,ポインティ,サポート" />

<link rel="stylesheet" href="../../css/style.css" type="text/css" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="../../js/pointy.js"></script>
<script type="text/javascript" src="../../js/jquery.easing.js"></script>
<script type="text/javascript" src="../../js/jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="../../js/script.js"></script>
<script type="text/javascript">
(function(){
    var ua = navigator.userAgent.toUpperCase();
    var url = document.location.pathname;
    var spDir = '/sm/support/form/';
    (ua.indexOf('IPHONE') != -1 || (ua.indexOf('ANDROID') != -1 && ua.indexOf('MOBILE') != -1))?
        isSP() :
        isPC();
    function isSP(){
        if(url.match(spDir)){
            return false;
        }else{
            location.href = spDir;
        }
    }
    function isPC(){
        if(!url.match(spDir)){
            return false;
        }else{
            location.href = '/';
        }
    }
}());
</script>
</head>

<body>

<div id="headertop">
	<h1>「ポインティ-pointy-」お問い合わせ</h1>
</div>
<div id="header">
	<div id="header_btn">
        <form name="signup" id="member" method="post" action="https://my.pointy.jp/myorder/OrderApply/addContractor" target="_blank">
            <input type="hidden" name="agency_cd" id="hid" value="3011" />
            <input type="image" src="../../images/moushikomi.jpg" class="hover" onclick="javascript: _gaq.push(['_trackPageview', '/click/Top/entryBtnHead']);" />
        </form>
        <a class="hover" href="https://my.pointy.jp/mypage/" target="_blank"><img src="../../images/mypage.jpg" width="167" height="38" alt="マイページ" /></a>
    </div>
    
    
	<p>
    	<a href="http://www.pointy.jp/"><img src="../../images/pointy_logo.jpg" width="110" height="55" alt="ポインティ" /></a>
    	<img src="../../images/pointy_text01.jpg" width="303" height="55" alt="ビジネスにかける人を応援する通話アプリ！" />
	</p>
</div>
<div id="gnav" class="clearfix">
	<ul>
    	<li class="hover"><a href="http://www.pointy.jp/details/"><img src="../../images/navi01a.jpg" alt="pointyとは" /></a></li>
    	<li class="hover"><a href="http://www.pointy.jp/price/"><img src="../../images/navi02a.jpg"  alt="おトクな料金" /></a></li>
    	<li class="hover"><a href="http://www.pointy.jp/point/"><img src="../../images/navi03a.jpg" alt="おトクなポイント制度" /></a></li>
    	<li class="hover"><a href="http://www.pointy.jp/support/"><img src="../../images/navi05a.jpg" alt="サポート" /></a></li>
    	<li class="hover"><a href="http://www.pointy.jp/type/"><img src="../../images/navi06a.jpg" alt="推奨機種" /></a></li>
    	<li class="hover"><a href="http://www.pointy.jp/sim/"><img src="../../images/navi04a.jpg" alt="SIMカード" /></a></li>
    	<li class="hover"><a href="http://www.pointy.jp/support/form"><img src="../../images/navi07a_cu.jpg" alt="お問い合わせ" /></a></li>
    </ul>
</div>

<div id="pankuzu">
	<ol>
    	<li><a href="http://www.pointy.jp/">無料通話アプリ・IP電話ならポイントの貯まる「ポインティ-pointy-」</a></li><li>&gt;</li><li>お問い合わせ</li>
    </ol>
</div>

<div id="wrap" class="otoiawase clearfix">
	
    <div class="contents_l clearfix">
    	<img src="../../images/header_otoiawase.jpg" width="686" height="100" alt="お問い合わせ" />
<!--// article //-->
<div id="article" class="contact">
  <br />
  <p class="style1">
<a href="/support/Android_Manual.pdf" target="_blank">操作マニュアル</a>、およびFAQを読んでも解決しない場合は、こちらから、ご質問ください。</p><br /><br />
  <div class="postBody">

    <div><span style="color: #FF0000; font-size: 10pt">*</span><span style="font-size: 10pt;">印は入力必須です。</span></div>
<?php if (isset($err_flg) && !empty($err_flg)) {?>
    <div style="color: #FF0000; font-weight: bold; font-size: 10pt;margin-left: 10px;">入力内容に誤りがあります。</div>
<?php }?>
<?php if (!empty($agree_err)) {?>
    <div style="color: #FF0000; font-size: 10pt;margin-left: 20px;">利用規約およびプライバシーポリシーに同意願います。</div>
<?php }?>
    <form id="mailform" method="post" action="<?php echo $_SERVER["REQUEST_URI"];?>">
      <table>
        <tr>
          <th><span style="font-size: 12pt;">お名前</span><span style="color: #FF0000; font-size: 10pt">&nbsp;*</span></th>
          <td>
            <input type="text" name="contact_name" size="15" class="mfp" value="<?php echo isset($p['contact_name']) ? h($p['contact_name']) : '';?>" />
<?php if (!empty($contact_name_err)) {?>
            <div style="font-weight: bold; color: #FF0000; font-size: 10pt;"><?php echo h($contact_name_err);?></div>
<?php }?>
          </td>
        </tr>
        <tr>
          <th><span style="font-size: 12pt;">E-mail</span><span style="color: #FF0000; font-size: 10pt">&nbsp;*</span></th>
          <td>
            <input type="text" name="email" size="40" class="mfp" value="<?php echo isset($p['email']) ? h($p['email']) : '';?>" />
<?php if (!empty($email_err)) {?>
            <div style="font-weight: bold; color: #FF0000; font-size: 10pt;"><?php echo h($email_err);?></div>
<?php }?>
          </td>
        </tr>
        <tr>
          <th><span style="font-size: 12pt;">E-mail(確認)</span><span style="color: #FF0000; font-size: 10pt">&nbsp;*</span></th>
          <td>
            <input type="text" name="email_conf" size="40" class="mfp" oncopy="javascript: document.getElementById('copypaste_warn').style.display='block';return false" onpaste="javascript: document.getElementById('copypaste_warn').style.display='block';return false" oncontextmenu="javascript: document.getElementById('copypaste_warn').style.display='block';return false" />
            <div id="copypaste_warn" style="color: #FF0000; font-size: 10pt;">コピー・ペーストはできません。</div>
          </td>
        </tr>
        <tr>
          <th><span style="font-size: 12pt;">電話番号</span></th>
          <td>
            <input type="text" name="tel" size="40" class="mfp" value="<?php echo isset($p['tel']) ? h($p['tel']) : '';?>" /><br />
            <span style="margin-left: 5px; font-size: 10pt;">pointyご利用中の方はpointyの電話番号を入力してください</span>
<?php if (!empty($tel_err)) {?>
            <div style="font-weight: bold; color: #FF0000; font-size: 10pt;"><?php echo h($tel_err);?></div>
<?php }?>
          </td>
        </tr>
        <tr>
		  <th><span style="font-size: 12pt;">件名</span><span style="color: #FF0000; font-size: 10pt">&nbsp;*</span></th>
          <td>
            <input type="text" name="title" size="15" class="mfp" value="<?php echo isset($p['title']) ? h($p['title']) : '';?>" />
<?php if (!empty($title_err)) {?>
            <div style="font-weight: bold; color: #FF0000; font-size: 10pt;"><?php echo h($title_err);?></div>
<?php }?>
          </td>
        </tr>
        <tr>
          <th><span style="font-size:12pt;">内容</span><span style="color: #FF0000; font-size: 10pt">&nbsp;*</span></th>
          <td>
            <textarea name="body" rows="10" cols="60" wrap="hard" class="mfp"><?php echo isset($p['body']) ? h($p['body']) : '';?></textarea>
<?php if (!empty($body_err)) {?>
            <div style="font-weight: bold; color: #FF0000; font-size: 10pt;"><?php echo h($body_err);?></div>
<?php }?>
          </td>
        </tr>
        <tr>
        
          <td colspan="2" class="agree"><input type="checkbox" name="agree" id="agree" value="1" /><label for="agree">利用規約およびプライバシーポリシーの同意の上、上記を問い合わせます。</label>
          </td>
        </tr>
      </table>

      <div class="button_mfp_goconfirm">
        <input type="submit" value="" id="button_mfp_goconfirm" class="btn hover"  />
      </div>
      <input type="hidden" name="mode" id="mode" value="confirm" />
    </form>
  </div>
</div>
<!--// article End //--> 
<div>
  <div id="ssl">
    <div id="ss_gmo_img_wrapper_100-50_image_ja" class="left">
      <a href="https://jp.globalsign.com/" target="_blank"><img alt="SSL　グローバルサインのサイトシール" border="0" id="ss_img" src="//seal.globalsign.com/SiteSeal/images/gs_noscript_100-50_ja.gif" /></a>
    </div>
    <script type="text/javascript" src="//seal.globalsign.com/SiteSeal/gmogs_image_100-50_ja.js" defer="defer"></script>
    
  <div class="right"><!--本申し込み-->本サイトの通信は、2048bit&nbsp;SSLによって強力に暗号化されており、<br />
安全にご利用いただけます。
  </div></div>
</div>


        
    </div>
    
    
    <div class="contents_r clearfix">
        
        <div id="sec_banner">
        	<a class="hover" href="http://www.pointy.jp/sim/"><img src="../../images/simBanner.jpg" alt="pointy simカード" /></a>
            <form name="signup" id="member" method="post" action="https://my.pointy.jp/myorder/OrderApply/addContractor" target="_blank">
                <input type="hidden" name="agency_cd" id="hid" value="3011" />
                <input type="image" src="../../images/top_banner01.jpg" class="hover" onclick="javascript: _gaq.push(['_trackPageview', '/click/Top/entryBtnHead']);" alt="お申し込みはこちら" />
        	</form>
        	<a class="hover" href="http://www.pointy.jp/index.html#top04"><img src="../../images/top_banner02.jpg" width="240" height="65" alt="お申し込みの流れ" /></a>
        	<a class="hover" href="http://www.pointy.jp/support/Android_Manual.pdf" target="_blank"><img src="../../images/top_banner03.jpg" width="240" height="65" alt="操作マニュアルダウンロード" /></a>
        </div>
    	
        
        <div id="sec_qa" class="clearfix">
        	<img src="../../images/yokuarushitsumon.png" width="160" height="45" alt="よくあるご質問" />
            <ul>
            	<li><a href="http://www.pointy.jp/support/index.html#yokuaru01">● 複数の端末で使えますか？</a></li>
            	<li><a href="http://www.pointy.jp/support/index.html#yokuaru02">● 料金の支払い方法は？</a></li>
            	<li><a href="http://www.pointy.jp/support/index.html#yokuaru03">● ポイントに有効期限はありますか？</a></li>
            </ul>
        </div>
        
    </div>
    
    
    
    
    
    
    
<div id="backtotop" class="hover"><a href="#"><img src="../../images/backtotop.jpg" width="168" height="30" alt="トップへ戻る" /></a></div>

</div><!--wrap end-->

<div id="footer_outer">
    <div id="footer">
        <ul class="clearfix">
            <li><a href="http://www.pointy.jp/">無料通話アプリ・IP電話「ポインティ-pointy-」</a></li>
            <li><a href="http://www.pointy.jp/details/">ポインティとは？</a></li>
            <li><a href="http://www.pointy.jp/price/">おトクな料金</a></li>
            <li><a href="http://www.pointy.jp/point/">おトクなポイント制度</a></li>
            <li><a href="http://www.pointy.jp/support/">サポート・よくあるご質問</a></li>
            <li><a href="http://www.pointy.jp/type/">推奨機種</a></li>
            <li><a href="http://www.pointy.jp/sim/">SIMカード</a></li>
            <li><a href="http://www.pointy.jp/support/form/">お問い合わせ</a></li>
            <li><a href="http://www.pointy.jp/company/">企業情報</a></li>
            <li><a href="http://www.pointy.jp/privacy/">プライバシーポリシー</a></li>
            <li><a href="http://www.pointy.jp/sitemap.html">サイトマップ</a></li>
        </ul>
        
        <div class="footer_logo"><img src="../../images/accelia_logo.png" width="47" height="25" alt="アクセリア" /></div>
        <address>アクセリア株式会社　COPYRIGHT ©ACCELIA INC, ALL RIGHT RESERVED.</address>
        
    </div>
</div>

</body>
</html>
