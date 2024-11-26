#declare tableeventtable (table)
TableEvent table #table;
cmSetDefault: {
  if curtable = tnLS_BR {
    putcommand(cmDefault);
  }

}
cmInsertRecord: {
  Insert Current #table;
}
cmUpdateRecord: {
  Update Current #table;
}
cmDeleteRecord: {
  if curtable = tnLS_BR {
      if isExistLS_pkg_BR then  {
       message('� ������ ����஥�� ������, 㤠����� ����������',error);
       stop;abort;exit
     }
  }

 if message('�������?',YesNo)<>cmYes  {
   abort; exit;
  }
  delete Current #table;
}
end; //TableEvent table #table
#end

Window wnLS_BR_Edit '������஢���� ������' ;
Show at (,,,);
//---------------------------------------------
Screen scrLS_BR_Edit (,,Sci178Esc);
Table LS_BR;
Fields
  LS_BR.code         : NoProtect, #colorneed(TRIM(LS_BR.code)='');
  LS_BR.name         : NoProtect, #colorneed(TRIM(LS_BR.name)='');
  LS_BR.description  : NoProtect;
  LS_BR.httpaddress  : NoProtect, nopickbutton, #colorneed(TRIM(LS_BR.httpaddress)='');
  LS_BR.port         : NoProtect;
  LS_BR.isCurrentSys : NoProtect;
  LS_BR.login        : NoProtect, #colorneed(TRIM(LS_BR.login)='');
  LS_BR.password     : NoProtect, #colorneed(TRIM(LS_BR.password)='');
  LS_BR_Reciept.Name  : Protect, PickButton;
  LS_BR.WhenActive   : NoProtect;
<<
`���` .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@`������������`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
`���ᠭ��`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
`����`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@`����`.@@@@@
 [.] ⥪��� ��⥬�`
` �����`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@`��஫�`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
`������-�����⥫�`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

`��᫥���� ��⨢�����`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
>>
end;
end;//Screen ScrQRY_getParameter

browse brLS_BR;
 table LS_BR;
  Fields
  LS_BR.code         '���' : [3] , Protect, nopickbutton, #colorneed(TRIM(LS_BR.code)='');
  LS_BR.name         '������������' : [3] , Protect, nopickbutton, #colorneed(TRIM(LS_BR.name)='');
  LS_BR.description  '���ᠭ��' : [3] , Protect, nopickbutton;
  LS_BR.httpaddress  '����' : [3] , Protect, nopickbutton, #colorneed(TRIM(LS_BR.httpaddress)='');
  LS_BR.port         '����' : [3] , Protect, nopickbutton;
  LS_BR.isCurrentSys '������ ��⥬�' : [3] , Protect, nopickbutton;
//  LS_BR.login        '���' : [3] , Protect, nopickbutton, #colorneed(TRIM(LS_BR.login)='');
//  LS_BR.password     '���' : [3] , Protect, nopickbutton, #colorneed(TRIM(LS_BR.password)='');
  LS_BR_Reciept.Name  '������-�ਥ����' : [3] , Protect, nopickbutton;
  LS_BR.WhenActive   '��᫥���� ����' : [3] , Protect, nopickbutton;
end;

#tableeventtable(LS_BR)
