   M S B A M L   `   `   `  ����F  BwpfKozhuhov, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null)clr-namespace:wpfKozhuhovwpfKozhuhov  5      ;"clr-namespace:wpfKozhuhov.CommandswpfKozhuhov.Commands  5      5clr-namespace:wpfKozhuhov.ModelwpfKozhuhov.Model  5      I)clr-namespace:wpfKozhuhov.ValidationRuleswpfKozhuhov.ValidationRules  5	          wpfKozhuhov.PageEmployee   5      R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      +localclr-namespace:wpfKozhuhov     5      6command"clr-namespace:wpfKozhuhov.Commands     5      0coreclr-namespace:wpfKozhuhov.Model     5      :rule)clr-namespace:wpfKozhuhov.ValidationRules     5	      -   5          N� Title$  PageEmployee��5       J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5           Command$
 Undo��5      6O     5   
   -   5        $	 New��5      6M     5   
   -   5        '   !wpfKozhuhov.Commands.DataCommands   Edit# Z 5      6o     5   
   -   5        $
 Save��5      6O     5   
   -   5        $
 Find��5      6O     5   
   -   5           Delete# Z 5      6s     5   
   -   5        $ Refresh��5      6+    � 	Resources 5         DataTemplate �� StringFormat  EditingDateTemplate(  "System.Windows.Controls.DatePicker   SelectedDate �� Mode	 �� UpdateSourceTrigger!   wpfKozhuhov.Model.ListTitle  
_listTitle  
errorStyle
 �� 
TargetType �� Property �� Value �� Triggers P� Property P� Value �� RelativeSource �� Path��%t  &	        &	 �     &	 �     &	     �� 5   
   .R�5      �� $��Center=�5      $��Center=�63   ��5      �� *	BirstDate+$ {0:dd.}{0:MM.}{0:yyyy}��5   3   5      �� 5    
   .R�5!         6   �� *	BirstDate+$ TwoWay=�$	 PropertyChanged=�5"        5$   
   6   �� 5&   
   "
 ��6#   .�5'      ��  � ��$ -2q�6(    5(      P� 5)       �@=�HasError . . �5*      ��  � ��
 �  ��63   �� 5+       � ��$ 1q�68   �� 5,       �@�ToolTip 5-      ��  �� *Self+$) #(Validation.Errors)[0].ErrorContent�5/      51      52      .��54      ��   _backgroundResurs#��[ 6   .+�55   
   �  � ShowGridLines .   � ColumnDefinitions 57      �� 58      6%   �� 59      6%    � RowDefinitions 5;      �� 5<      6"   �� 5=      $��70 �6    6.   �� 5>      6"   �� 5?      6"   .+�5B      o� $��0��6   $��0��6    $��2��60   .@�5C      m� $��Обновить��6    m� Command$ Refresh��6-   .@�5D      �� -	   5        $��Refresh��5D      $��
5, 2, 5, 2q�6,   $��Refresh��6@    � ToolTip$? 9Обновить данные по сотрудникам��6R   .��5E      �� $��Images\refresh.png��6    5F      5G      m� 5H      $��Действие��6   .@�5I      m� $��Отменить��6   $
 Undo��61   6B   �� 5J      m� 5K      $��Создать��6   $	 New��60   6@   m� 5L      $ ��Редактировать��6   $ command:DataCommands.Edit��66   6\   m� 5M      $��Сохранить��6   $
 Save��62   6C   m� 5N      $��
Найти��6   $
 Find��6.   6?   �� 5O      m� 5P      $��Удалить��6   $! command:DataCommands.Delete��60   6X   5Q      m� 5R      $��
Отчет��6   6,   5S      c� 5U      -
   5        $��_toolBar��5U      $��5q�6&   $��Center=�61   $��1��6N   $��0��6[   $��2��6k   $��50��6   .@�5V      �� -   5        $
��undo��5V      $ 
Назад��6%   $
��Undo��65   $��2q�6D   .��5W      �� $��Images/undo.png��6   $��30��65   6C   5X      �� 5Y      -   5        $��create��5Y      $< 6Добавление нового сотрудника��6'   $	��New��6N   $��2q�6\   .��5Z      �� $��Images/new.png��6   $��30��64   6B   5[      �� 5\      -   5        $
��edit��5\      $  Редактировать��6%   $��command:DataCommands.Edit��6=   $��2q�6a   .��5]      �� $��Images/edit.png��6   $��30��65   6C   5^      �� 5_      -   5        $
��find��5_      $ 
Назад��6%   $
��Find��65   $��2q�6D   .��5`      �� $��Images/find.png��6   $��30��65   6C   5a      �� 5b      -   5        $
��save��5b      $ Сохранить��6%   $
��Save��69   $��2q�6H   .��5c      �� $��Images/save.png��6   $��30��65   6C   5d      �� 5e      -   5        $��edit_remove��5e      $ Удаление��6,   $!��command:DataCommands.Delete��6?   $��2q�6e   .��5f      �� $��Images/delete.png��6   $��30��67   6E   5g      5h      �� 5j      -   5        $��
BorderFind��5j      
����  �$��1q�6:   $	��200��6N   $��60��6Z   $��1��6f   $��1��6s   $��Right=�6�   $��5q�6�   ._�5k      �  .  $	��200��6-   $��60��69    5l      �� 5m      $��70 �6+   68   �� 5n      6-   �� 5o      $��25 �6+   68    5q      �� 5r      6*   �� 5s      6*   �� 5t      6*   .+�5w      �� $��NoWrap=�6    $%��Поиск сотрудника��66   
���   �$
��Bold"�6a   $��0��6s   $��14(�6�   $��0��6�   $��3��6�   $��Center=�6�   �� 5x      -   5        $��	tbSurname��5x       $��Фамилия��61   
���   �$��12(�6S   $��0��6a   $��1��6q   $
��Bold"�6~   $��1q�6�   �� 5y      -   5        $��tbTitle��5y       $��Должность��6/   
���   �$��12(�6S   $
��Bold"�6a   $��0��6s   $��2��6�   $��1q�6�   �� 5z      -   5        $��tboxSurname��5z      $��1��6W   $��1��6g   $��5,0,10,0q�6t   �� 5{      -   5        $��cbTitle��5{       �� DisplayMemberPath$ Title1��5|      $��1��6Z   $��2��6j   $��5,0,10,0q�6w   ��5{   .   ��  �� Source# [ 5|   w   �� 5}      -   5        $��bFindSurname��5}   4   $��25��6   $��25��6)   $$ Поиск по фамилии��6H   {�. $��2��6�   $��1��6�   .��5~      �� $��20��6    $��20��6,   $��Images/find.png��67    J� RenderTransformOrigin$ -0.368, -0.263&�6P   5      �� 5�      -   5        $��bFindPosition��5�   4   $��25��6   $��25��6)   $( "Поиск по должности��6I   {�. $��2��6�   $��2��6�   $��0q�6�   .��5�      �� $��20��6    $��20��6,   $��Images/find.png��67   $ -0.368, -0.263&�6P   5�      5�      5�      �� 5�      $��5q�6   $��Center=�6#   $��15(�6@   $��2��6N   $��0��6[   $��2��6k   %#Список сотрудников6�   &   System.Windows.Controls.DataGrid  5�      -   5        $��DataGridEmployee��5�      $��
0,3,3,-373q�5�   
   $��Right=�5�      $	��900��5�         AutoGenerateColumns .     RowBackground �	#FFE6D3EF   AlternatingRowBackground �	#FC96CFD4
����  �$��3q�5�   &      	RowHeight$ 25Q�5�         
IsReadOnly .  � Cursor$
 Hand��5�      $��3��5�      $��0��6    $��2��60   ��5�      ��     Columns  5�      0  *System.Windows.Controls.DataGridTextColumn  5�      ,  &System.Windows.Controls.DataGridColumn!   Header$! Фамилия��6)   1  +System.Windows.Controls.DataGridBoundColumn"   Binding" 6:   �� *	Surname+$ TwoWay=�$	 PropertyChanged=�  5�      $! Имя��6)   " 66   �� *Name+$ TwoWay=�$	 PropertyChanged=�  5�      $! Отчество��6)   " 6;   �� *
Patronymic+$ TwoWay=�$	 PropertyChanged=�4	  .System.Windows.Controls.DataGridComboBoxColumn	  5�      $! Длжность��6-   # 	  DisplayMemberPath$# Title1��5�   )   $ 	  SelectedValuePath$$ Id��5�   )   % 	  ItemsSource% 5�   )   �� # [ & 	  SelectedValueBinding& 5�   )   �� $ TitleID�$ TwoWay=�$	 PropertyChanged=�5�   )   4
  .System.Windows.Controls.DataGridTemplateColumn
  5�      $! Дата рождения��6-   ' 
  CellTemplate#' [  5�   )   ( 
  CellEditingTemplate#( [ 5�   )     5�      $! Телефон��6)   " 6:   �� *	Telephone+$ TwoWay=�$	 PropertyChanged=�  5�      $! Email��6)   )   EditingElementStyle#) [ 68   " 5�      �� 5�      $ Email�6&   $ TwoWay=�63   $	 PropertyChanged=�6A   * �� ValidatesOnExceptions* . + �� ValidationRules+ 5�   "   +   %wpfKozhuhov.ValidationRules.EmailRule  5�   &   5�      5�      !,   RowValidationErrorTemplate, 5�      �� 5�      .R�5�      � $��0, -2, 0, -2q�6    5�      ��  �� *FindAncestor+- �� AncestorType)  #System.Windows.Controls.DataGridRow"-  $) #(Validation.Errors)[0].ErrorContent�.+�5�      A� $��0��6&   
���  ��#��z��6E   #��z��6h   �� 5�      $��!��6(   #��z��61   $
��Bold"�6W   
�������$��Center=�6|   5�      5�      5�      5�      5�      5�      