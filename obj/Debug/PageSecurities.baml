   M S B A M L   `   `   `  ����F  BwpfKozhuhov, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:wpfKozhuhovwpfKozhuhov  5      ;"clr-namespace:wpfKozhuhov.CommandswpfKozhuhov.Commands  5      5clr-namespace:wpfKozhuhov.ModelwpfKozhuhov.Model  5      I)clr-namespace:wpfKozhuhov.ValidationRuleswpfKozhuhov.ValidationRules  5	           wpfKozhuhov.PageSecurities   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      +localclr-namespace:wpfKozhuhov     5      6command"clr-namespace:wpfKozhuhov.Commands     5      0coreclr-namespace:wpfKozhuhov.Model     5      :rule)clr-namespace:wpfKozhuhov.ValidationRules     5	      -   5          N� Title$  PageSecurities��5       J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5           Command$
 Undo��5      6O     5   
   -   5        $	 New��5      6M     5   
   -   5        '   !wpfKozhuhov.Commands.DataCommands   Edit# Z 5      6o     5   
   -   5        $
 Save��5      6O     5   
   -   5        $
 Find��5      6O     5   
   -   5           Delete# Z 5      6s     5   
   -   5        $ Refresh��5      6+    � 	Resources 5         DataTemplate �� StringFormat  EditingDateTemplate(  "System.Windows.Controls.DatePicker   SelectedDate �� Mode	 �� UpdateSourceTrigger!   wpfKozhuhov.Model.ListTable  
_listTable  
errorStyle
 �� 
TargetType �� Property �� Value �� Triggers P� Property P� Value �� RelativeSource �� Path��%j  &	        &	 �     &	 �     &	     �� 5   
   .R�5      �� $��Center=�5      $��Center=�63   ��5      �� *date+$ {0:dd.}{0:MM.}{0:yyyy}��5   3   5      �� 5   
   .R�5         6   �� *date+$ TwoWay=�$	 PropertyChanged=�5         5"   
   6   �� 5$   
   "
 ��6#   .�5%      ��  � ��$ -2q�6(    5&      P� 5'       �@=�HasError . . �5(      ��  � ��
 �  ��63   �� 5)       � ��$ 1q�68   �� 5*       �@�ToolTip 5+      ��  �� *Self+$) #(Validation.Errors)[0].ErrorContent�5-      5/      50      .��52      ��   _backgroundSecurities#��[ 6   .+�53   
   �  � ShowGridLines .   � ColumnDefinitions 55      �� 56      6%   �� 57      6%    � RowDefinitions 59      �� 5:      6"   �� 5;      $��70 �6    6.   �� 5<      6"   �� 5=      6"   .+�5@      o� $��0��6   $��0��6    $��2��60   .@�5A      m� $��Обновить��6    m� Command$ Refresh��6-   .@�5B      �� -	   5        $��Refresh��5B      $��
5, 2, 5, 2q�6,   $��Refresh��6@    � ToolTip$? 9Обновить данные по сотрудникам��6R   .��5C      �� $��Images\refresh.png��6    5D      5E      m� 5F      $��Действие��6   .@�5G      m� $��Отменить��6   $
 Undo��61   6B   �� 5H      m� 5I      $��Создать��6   $	 New��60   6@   m� 5J      $ ��Редактировать��6   $ command:DataCommands.Edit��66   6\   m� 5K      $��Сохранить��6   $
 Save��62   6C   m� 5L      $��
Найти��6   $
 Find��6.   6?   �� 5M      m� 5N      $��Удалить��6   $! command:DataCommands.Delete��60   6X   5O      m� 5P      $��
Отчет��6   6,   5Q      c� 5S      -
   5        $��_toolBar��5S      $��5q�6&   $��Center=�61   $��1��6N   $��0��6[   $��2��6k   $��50��6   .@�5T      �� -   5        $
��undo��5T      $ 
Назад��6%   $
��Undo��65   $��2q�6D   .��5U      �� $��Images/undo.png��6   $��30��65   6C   5V      �� 5W      -   5        $��create��5W      $6 0Добавление новое вложение��6'   $	��New��6K   $��2q�6Y   .��5X      �� $��Images/new.png��6   $��30��64   6B   5Y      �� 5Z      -   5        $
��edit��5Z      $  Редактировать��6%   $��command:DataCommands.Edit��6=   $��2q�6a   .��5[      �� $��Images/edit.png��6   $��30��65   6C   5\      �� 5]      -   5        $
��find��5]      $ 
Назад��6%   $
��Find��65   $��2q�6D   .��5^      �� $��Images/find.png��6   $��30��65   6C   5_      �� 5`      -   5        $
��save��5`      $ Сохранить��6%   $
��Save��69   $��2q�6H   .��5a      �� $��Images/save.png��6   $��30��65   6C   5b      �� 5c      -   5        $��edit_remove��5c      $ Удаление��6,   $!��command:DataCommands.Delete��6?   $��2q�6e   .��5d      �� $��Images/delete.png��6   $��30��67   6E   5e      5f      �� 5h      -   5        $��
BorderFind��5h      
����  �$��1q�6:   $	��200��6N   $��60��6Z   $��1��6f   $��1��6s   $��Right=�6�   $��5q�6�   ._�5i      �  .  $	��200��6-   $��60��69    5j      �� 5k      $��70 �6+   68   �� 5l      6-   �� 5m      $��25 �6+   68    5o      �� 5p      6*   �� 5q      6*   �� 5r      6*   .+�5u      �� $��NoWrap=�6    $%��Поиск сотрудника��66   
���   �$
��Bold"�6a   $��0��6s   $��14(�6�   $��0��6�   $��3��6�   $��Center=�6�   �� 5v      -   5        $��	tbSurname��5v       $��Название��61   
���   �$��12(�6T   $��0��6b   $��1��6r   $
��Bold"�6   $��1q�6�   �� 5w      -   5        $��tbTitle��5w       $��Вид��6/   
���   �$��12(�6M   $
��Bold"�6[   $��0��6m   $��2��6}   $��1q�6�   �� 5x      -   5        $��tboxSurname��5x      $��1��6W   $��1��6g   $��5,0,10,0q�6t   �� 5y      -   5        $��cbTitle��5y       �� DisplayMemberPath$
 name��5z      $��1��6X   $��2��6h   $��5,0,10,0q�6u   ��5y   .   ��  �� Source# [ 5z   u   �� 5{      -   5        $��	bFindName��5{   4   $��25��6   $��25��6)   $&  Поиск по названию��6E   {�. $��2��6�   $��1��6�   .��5|      �� $��20��6    $��20��6,   $��Images/find.png��67    J� RenderTransformOrigin$ -0.368, -0.263&�6P   5}      �� 5~      -   5        $��bFindPosition��5~   4   $��25��6   $��25��6)   $ Поиск по виду��6I   {�. $��2��6�   $��2��6�   $��0q�6�   .��5      �� $��20��6    $��20��6,   $��Images/find.png��67   $ -0.368, -0.263&�6P   5�      5�      5�      �� 5�      $��5q�6   $��Center=�6#   $��15(�6@   $��2��6N   $��0��6[   $��2��6k   %#Список сотрудников6�   &   System.Windows.Controls.DataGrid  5�      -   5        $��DataGridSecuritie��5�      $��
3,3,0,-291q�5�   
   $
��Left=�5�      $	��850��5�         AutoGenerateColumns .     RowBackground �	#FFE6D3EF   AlternatingRowBackground �	#FC96CFD4
����  �$��3q�5�   &      	RowHeight$ 25Q�5�         
IsReadOnly .  � Cursor$
 Hand��5�      $��3��5�      $��0��6    $��2��60   ��5�      ��     Columns  5�      0  *System.Windows.Controls.DataGridTextColumn  5�      ,  &System.Windows.Controls.DataGridColumn!   Header$! Название��6)   1  +System.Windows.Controls.DataGridBoundColumn"   Binding" 6;   �� *name+$ TwoWay=�$	 PropertyChanged=�4	  .System.Windows.Controls.DataGridComboBoxColumn	  5�      $$! Вид ценных бумаг��6-   # 	  DisplayMemberPath$
# name��5�   )   $ 	  SelectedValuePath$$ Id��5�   )   % 	  ItemsSource% 5�   )   �� # [ & 	  SelectedValueBinding& 5�   )   �� $ SecuritieID�$ TwoWay=�$	 PropertyChanged=�5�   )     5�      $$! Код ценных бумаг��6)   " 6C   �� *SecuritieID+$ TwoWay=�$	 PropertyChanged=�4
  .System.Windows.Controls.DataGridTemplateColumn
  5�      $! Дата вложения��6-   ' 
  CellTemplate#' [  5�   )   ( 
  CellEditingTemplate#( [ 5�   )     5�      $! 
Сумма��6)   )   EditingElementStyle#) [ 68   " 5�      �� 5�      $	 sum�6&   $ TwoWay=�61   $	 PropertyChanged=�6?   * �� ValidatesOnExceptions* . + �� ValidationRules+ 5�   "   )   #wpfKozhuhov.ValidationRules.sumForm  5�   &   5�      5�      !,   RowValidationErrorTemplate, 5�      �� 5�      .R�5�      � $��0, -2, 0, -2q�6    5�      ��  �� *FindAncestor+- �� AncestorType)  #System.Windows.Controls.DataGridRow"-  $) #(Validation.Errors)[0].ErrorContent�.+�5�      A� $��0��6&   
���  ��#��z��6E   #��z��6h   �� 5�      $��!��6(   #��z��61   $
��Bold"�6W   
�������$��Center=�6|   5�      5�      5�      5�      5�      5�      