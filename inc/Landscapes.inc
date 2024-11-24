/*************************************************************************************************\
* Наименование: Базовый объект работы очереди                                                     *
* Контур/Модуль: Очередь исходящих сообщений                                                      *
* Примечание:  константы                                                                          *
*                                                                                                 *
* Вид работы  |Номер         |Дата    |Исполнитель              |Проект                           *
* ----------------------------------------------------------------------------------------------- *

\*************************************************************************************************/

#ifnDef _LANDSCAPES_INC_INCLUDED_
#define _LANDSCAPES_INC_INCLUDED_
const
 coPackageStatus_Draft             = 0; // черновик. Идет настройка в текущей системе
 coPackageStatus_Active            = 1; // Активно. Идет сбор данных в текущей системе
 coPackageStatus_Done              = 2; // Готово. Сбор данных закончен, готова к передаче в другой контур
 coPackageStatus_SendToDst         = 3; // Отправлено в другой контур.
 coPackageStatus_SendToDstErr      = 4; // Ошибка отправки в другой контур.
 coPackageStatus_Cancel            = 5; // Отменено в текущей системе.
 coPackageStatus_IncomingMsg       = 6; // Получено входящее сообщение
 coPackageStatus_IncomingMsgCheck  = 7; // Входящее сообщение обработано, идет проверка
 coPackageStatus_IncomingMsgErr    = 8; // Входящее сообщение обработано с ошибками
end;

/*
Ручные смены статуса, варианты:

 coPackageStatus_Draft
   |-> coPackageStatus_Active
   |-> coPackageStatus_Cancel

 coPackageStatus_Active
   |-> coPackageStatus_Draft
   |-> coPackageStatus_Done
   |-> coPackageStatus_Cancel

 coPackageStatus_Done
   |-> coPackageStatus_SendToDst
   |-> coPackageStatus_SendToDstErr (автоматически когда идет попытка отправки)
   |-> coPackageStatus_Cancel

 coPackageStatus_SendToDstErr
   |-> coPackageStatus_Done
   |-> coPackageStatus_Cancel

 coPackageStatus_Cancel
   |-> coPackageStatus_Draft

 coPackageStatus_IncomingMsg
   |-> coPackageStatus_IncomingMsgCheck
   |-> coPackageStatus_IncomingMsgErr (автоматически при возникновении ошибок при обработке пакета)


 coPackageStatus_IncomingMsgCheck
   |-> coPackageStatus_Done
   |-> coPackageStatus_Cancel
*/
#end
