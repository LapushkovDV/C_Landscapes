/*************************************************************************************************\
* ������������: ������ ��ꥪ� ࠡ��� ��।�                                                     *
* ������/�����: ��।� ��室��� ᮮ�饭��                                                      *
* �ਬ�砭��:  ����⠭��                                                                          *
*                                                                                                 *
* ��� ࠡ���  |�����         |���    |�ᯮ���⥫�              |�஥��                           *
* ----------------------------------------------------------------------------------------------- *

\*************************************************************************************************/

#ifnDef _LANDSCAPES_INC_INCLUDED_
#define _LANDSCAPES_INC_INCLUDED_
const
 coPackageStatus_Draft             = 0; // �୮���. ���� ����ன�� � ⥪�饩 ��⥬�
 coPackageStatus_Active            = 1; // ��⨢��. ���� ᡮ� ������ � ⥪�饩 ��⥬�
 coPackageStatus_Done              = 2; // ��⮢�. ���� ������ �����祭, ��⮢� � ��।�� � ��㣮� ������
 coPackageStatus_SendToDst         = 3; // ��ࠢ���� � ��㣮� ������.
 coPackageStatus_SendToDstErr      = 4; // �訡�� ��ࠢ�� � ��㣮� ������.
 coPackageStatus_Cancel            = 5; // �⬥���� � ⥪�饩 ��⥬�.
 coPackageStatus_IncomingMsg       = 6; // ����祭� �室�饥 ᮮ�饭��
 coPackageStatus_IncomingMsgCheck  = 7; // �室�饥 ᮮ�饭�� ��ࠡ�⠭�, ���� �஢�ઠ
 coPackageStatus_IncomingMsgErr    = 8; // �室�饥 ᮮ�饭�� ��ࠡ�⠭� � �訡����
end;

/*
���� ᬥ�� �����, ��ਠ���:

 coPackageStatus_Draft
   |-> coPackageStatus_Active
   |-> coPackageStatus_Cancel

 coPackageStatus_Active
   |-> coPackageStatus_Draft
   |-> coPackageStatus_Done
   |-> coPackageStatus_Cancel

 coPackageStatus_Done
   |-> coPackageStatus_SendToDst
   |-> coPackageStatus_SendToDstErr (��⮬���᪨ ����� ���� ����⪠ ��ࠢ��)
   |-> coPackageStatus_Cancel

 coPackageStatus_SendToDstErr
   |-> coPackageStatus_Done
   |-> coPackageStatus_Cancel

 coPackageStatus_Cancel
   |-> coPackageStatus_Draft

 coPackageStatus_IncomingMsg
   |-> coPackageStatus_IncomingMsgCheck
   |-> coPackageStatus_IncomingMsgErr (��⮬���᪨ �� ������������� �訡�� �� ��ࠡ�⪥ �����)


 coPackageStatus_IncomingMsgCheck
   |-> coPackageStatus_Done
   |-> coPackageStatus_Cancel
*/
#end