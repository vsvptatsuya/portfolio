var ua = navigator.userAgent;  //userAgent���擾���Ċi�[
var start,end;  //�؂���J�n�_�ƏI���_
var ver;    //�u���E�U�o�[�W�������i�[����ϐ�

//�ŏ���Internet Explorer�����ׂ܂�
start = ua.indexOf("MSIE");

//�uMSIE�v�̕����񂪂���΁A�o�[�W�������擾����
if ( start != -1 ){
	//�o�[�W�����ԍ��̌�Ɂu;�v������̂ł��������
	end = ua.indexOf(";",start);

	//�uMSIE�v�{���p�X�y�[�X��5�������������ʒu����؂���
	ver = ua.substring(start+5,end);

	//�o�[�W������8�ȏ�̏ꍇ�̓��_�C���N�g
	if(ver > 8 ){
		location.href='index.html';
	}
}else{
		location.href='index.html';
}