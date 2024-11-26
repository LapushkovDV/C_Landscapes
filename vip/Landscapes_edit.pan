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
       message('У контура настроены пакеты, удаление невозможно',error);
       stop;abort;exit
     }
  }

 if message('Удалить?',YesNo)<>cmYes  {
   abort; exit;
  }
  delete Current #table;
}
end; //TableEvent table #table
#end

Window wnLS_BR_Edit 'Редактирование контура' ;
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
`Код` .@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@`Наименование`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
`Описание`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
`Адрес`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@`Порт`.@@@@@
 [.] текущая система`
` Логин`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@`Пароль`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
`Контур-получатель`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

`Последняя активность`.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
>>
end;
end;//Screen ScrQRY_getParameter

browse brLS_BR;
 table LS_BR;
  Fields
  LS_BR.code         'Код' : [3] , Protect, nopickbutton, #colorneed(TRIM(LS_BR.code)='');
  LS_BR.name         'Наименование' : [3] , Protect, nopickbutton, #colorneed(TRIM(LS_BR.name)='');
  LS_BR.description  'Описание' : [3] , Protect, nopickbutton;
  LS_BR.httpaddress  'Адрес' : [3] , Protect, nopickbutton, #colorneed(TRIM(LS_BR.httpaddress)='');
  LS_BR.port         'Порт' : [3] , Protect, nopickbutton;
  LS_BR.isCurrentSys 'Текущая система' : [3] , Protect, nopickbutton;
//  LS_BR.login        'Код' : [3] , Protect, nopickbutton, #colorneed(TRIM(LS_BR.login)='');
//  LS_BR.password     'Код' : [3] , Protect, nopickbutton, #colorneed(TRIM(LS_BR.password)='');
  LS_BR_Reciept.Name  'Контур-приемник' : [3] , Protect, nopickbutton;
  LS_BR.WhenActive   'Последний опрос' : [3] , Protect, nopickbutton;
end;

#tableeventtable(LS_BR)
