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
  <p class="style1">　以下の内容で送信します。よろしければ送信ボタンを押してください。</p><br /><br />
  <div class="postBody">
    <form id="mailform" method="post" action="<?php echo $_SERVER["REQUEST_URI"];?>">
     
      <table>
        <tr>
<!--
          <th><img src="images/item01.png" width="47" height="16" alt="お名前" /></th>
-->
          <th><span style="font-size: 12pt;">お名前</span><span style="color: #FF0000; font-size: 10pt">&nbsp;*</span></th>
          <td><?php echo isset($p['contact_name']) ? h($p['contact_name']) : '';?></td>
        </tr>
        <tr>
<!--
          <th><img src="images/item02.png" width="47" height="16" alt="E-mail" /></th>
-->
          <th><span style="font-size: 12pt;">E-mail</span><span style="color: #FF0000; font-size: 10pt">&nbsp;*</span></th>
          <td><?php echo isset($p['email']) ? h($p['email']) : '';?></td>
        </tr>
        <tr>
          <th><span style="font-size: 12pt;">電話番号</span></th>
          <td><?php echo isset($p['tel']) ? h($p['tel']) : '';?></td>
        </tr>
        <tr>
<!--
          <th><img src="images/item03.png" width="47" height="16" alt="件名" /></th>
-->
          <th><span style="font-size: 12pt;">件名</span><span style="color: #FF0000; font-size: 10pt">&nbsp;*</span></th>
          <td><?php echo isset($p['title']) ? h($p['title']) : '';?></td>
        </tr>
        <tr>
<!--
          <th><img src="images/item04.png" width="47" height="16" alt="内容" /></th>
-->
          <th><span style="font-size: 12pt;">内容</span><span style="color: #FF0000; font-size: 10pt">&nbsp;*</span></th>
          <td><?php echo isset($p['body']) ? nl2br(h($p['body'])) : '';?></td>
        </tr>
      </table>

      <div class="submit">
        <div class="left"><a class="hover" href="javascript: window.history.back();"><img src="../../images/otoiawase_back.jpg" alt="戻る" /></a></div>
        <div class="right"><input type="submit" value="" id="button_mfp_goconfirm" class="btn hover"  /></div>
      </div>
      <input type="hidden" name="mode" id="mode" value="send" />
      <input type="hidden" name="contact_name" id="contact_name" value="<?php echo isset($p['contact_name']) ? h($p['contact_name']) : '';?>" />
      <input type="hidden" name="email" id="email" value="<?php echo isset($p['email']) ? h($p['email']) : '';?>" />
      <input type="hidden" name="tel" id="tel" value="<?php echo isset($p['tel']) ? h($p['tel']) : '';?>" />
      <input type="hidden" name="title" id="title" value="<?php echo isset($p['title']) ? h($p['title']) : '';?>" />
      <input type="hidden" name="body" id="body" value="<?php echo isset($p['body']) ? h($p['body']) : '';?>" />
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
