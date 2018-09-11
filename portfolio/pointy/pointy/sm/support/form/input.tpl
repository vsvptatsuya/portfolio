<!doctype html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,user-scalable=no,maximum-scale=1" />
<title>サポート・よくある質問｜無料通話アプリ・IP電話ならポイントの貯まる「ポインティ-pointy-」</title>
<meta name="description" content="IP電話「ポインティ-pointy-」に関するサポート・よくある質問・解約についてを掲載しています。「ポインティ」の操作マニュアルもダウンロードしていただけます。" />
<meta name="keywords" content="無料通話,IP電話,格安,ポインティ,サポート" />

    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="../../js/retina-1.1.0.min.js"></script>
    <script src="../../js/heightLine.js"></script>
    <script src="../../js/smoothScroll.js"></script>
    <script src="../../js/pointysp.js"></script>
    <link rel="stylesheet" href="../../css/default.css">
    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/sec.css">
    
</head>
<body>
    <header id="header" class="clearfix">
        <p>ビジネスにかける人を応援する通話アプリ！</p>
        <div class="logo"><a href="http://www.pointy.jp/sm/"> <img src="../../images/logo01.png"></a></div>
        <div class="tab_mypage"><a href="https://my.pointy.jp/mypage/" target="_blank">マイページ</a></div>
        <div class="tab_moushikomi">
            <form name="signup" id="member" method="post" action="https://my.pointy.jp/myorder/OrderApply/addContractor" target="_blank">
            <input type="hidden" name="agency_cd" id="hid" value="3011" />
            <input type="submit" value="お申し込み" onclick="javascript: _gaq.push(['_trackPageview', '/click/SimPrice/entryBtnHead']);" />
        </form>
        </div>
        
    </header>

    <section id="content" class="support clearfix">
    <div id="pankuzu">
	<ol>
    	<li><a href="http://www.pointy.jp/sm">トップ</a></li><li>&gt;</li><li>お問い合わせ</li>
    </ol>
    </div>    
    <div class="contents clearfix">
    	
        <h1 class="title"><img src="../../images/otoiawase.jpg"></h1>
    <!--// article //-->
<div id="article" class="otoiawase">
  <br />
  <p class="style1">
<a href="http://www.pointy.jp/support/pointyOperationManual.pdf" target="_blank" style="display:inline-block;">操作マニュアル</a>、およびFAQを読んでも解決しない場合は、こちらから、ご質問ください。</p><br /><br />
  <div class="postBody">

    <div><span style="color:#FF0000;">*</span><span style="">印は入力必須です。</span></div>
<?php if (isset($err_flg) && !empty($err_flg)) {?>
    <div style="color: #FF0000; font-weight:bold; "> 入力内容に誤りがあります。</div>
<?php }?>
<?php if (!empty($agree_err)) {?>
    <div style="color: #FF0000;">利用規約およびプライバシーポリシーに同意願います。</div>
<?php }?>
    <form id="mailform" method="post" action="<?php echo $_SERVER["REQUEST_URI"];?>">
      <table>
        <tr>
          <th><span>お名前</span><span style="color: #FF0000;">&nbsp;*</span></th>
          <td>
            <input type="text" name="contact_name" size="15" class="mfp" value="<?php echo isset($p['contact_name']) ? h($p['contact_name']) : '';?>" />
<?php if (!empty($contact_name_err)) {?>
            
            <div style="font-weight: bold; color: #FF0000;"><?php echo h($contact_name_err);?></div>
<?php }?>
          </td>
        </tr>
        <tr>
          <th><span>E-mail</span><span style="color:#FF0000;">&nbsp;*</span></th>
          <td>
            <input type="text" name="email" size="40" class="mfp" value="<?php echo isset($p['email']) ? h($p['email']) : '';?>" />
<?php if (!empty($email_err)) {?>
            <div style="font-weight: bold; color: #FF0000; font-size: 10pt;"><?php echo h($email_err);?></div>
<?php }?>
          </td>
        </tr>
        <tr>
          <th><span>E-mail(確認)</span><span style="color: #FF0000; font-size: 10pt">&nbsp;*</span></th>
          <td>
            <input type="text" name="email_conf" size="40" class="mfp" oncopy="javascript: document.getElementById('copypaste_warn').style.display='block';return false" onpaste="javascript: document.getElementById('copypaste_warn').style.display='block';return false" oncontextmenu="javascript: document.getElementById('copypaste_warn').style.display='block';return false" />
            <div id="copypaste_warn" style="color: #FF0000;">コピー・ペーストはできません。</div>
          </td>
        </tr>
        <tr>
          <th><span>電話番号</span></th>
          <td>
            <input type="text" name="tel" size="40" class="mfp" value="<?php echo isset($p['tel']) ? h($p['tel']) : '';?>" /><br />
            <span style="margin-left: 5px; font-size: 10pt;">pointyご利用中の方はpointyの電話番号を入力してください</span>
<?php if (!empty($tel_err)) {?>
            <div style="font-weight: bold; color: #FF0000; font-size: 10pt;"><?php echo h($tel_err);?></div>
<?php }?>
          </td>
        </tr>
        <tr>
		  <th><span>件名</span><span style="color: #FF0000; font-size: 10pt">&nbsp;*</span></th>
          <td>
            <input type="text" name="title" size="15" class="mfp" value="<?php echo isset($p['title']) ? h($p['title']) : '';?>" />
<?php if (!empty($title_err)) {?>
            <div style="font-weight: bold; color: #FF0000; font-size: 10pt;"><?php echo h($title_err);?></div>
<?php }?>
          </td>
        </tr>
        <tr>
          <th><span>内容</span><span style="color: #FF0000; font-size: 10pt">&nbsp;*</span></th>
          <td>
            <textarea name="body" wrap="hard" class="mfp"><?php echo isset($p['body']) ? h($p['body']) : '';?></textarea>
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
        <input type="submit" value="" id="button_mfp_goconfirm" class="btn hover" />
      </div>
      <input type="hidden" name="mode" id="mode" value="confirm" />
    </form>
  </div>
</div>
<!--// article End //-->
        
    	
        
        
    </div>
        
    </section>
    
        <div class="footer_nav">
            <a href="http://www.pointy.jp/sm/company/"><img src="../../images/fnav01.jpg"> </a>
            <a href="http://www.pointy.jp/sm/support/form/"><img src="../../images/fnav02.jpg"></a> 
            <a href="http://www.pointy.jp/sm/privacy/"><img src="../../images/fnav03.jpg"> </a>
            <a href="http://www.pointy.jp/sm/sitemap.html"><img src="../../images/fnav04.jpg"> </a>
        </div>
          
        
        <div class="aligncenter"> 
        <form>
            <input type="hidden" name="agency_cd" id="hid" value="3011" />
            <input type="image" src="../../images/banner_moushikomi@2x.png" width="308" height="60" class="hover" onclick="javascript: _gaq.push(['_trackPageview', '/click/Top/entryBtnHead']);" alt="お申し込みはこちら" />
        </form>
        </div>
        
        
        
        <div class="backtotop"><a href="#header">このページのトップへ</a></div>
        <footer id="footer">
            <address>アクセリア株式会社COPYRIGHT ©ACCELIA INC, ALL RIGHT RESERVED.</address>
        </footer>
    </body>
    </html>