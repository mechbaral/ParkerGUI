   M S B A M L   `   `   `  ����J  FParkerCompax3UI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullE'clr-namespace:ParkerCompax3UI.ViewModelParkerCompax3UI.ViewModel  5	      &     ParkerCompax3UI.View.CylinderOne   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      R NOxyPlot.Wpf, Version=1.0.0.0, Culture=neutral, PublicKeyToken=75e952ba404cdbb0 oxyhttp://oxyplot.org/wpf  5      :d2http://schemas.microsoft.com/expression/blend/2008  5      c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      h dMicrosoft.Expression.Interactions, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bei9http://schemas.microsoft.com/expression/2010/interactions  5      3local'clr-namespace:ParkerCompax3UI.ViewModel  5	        � 	Resources  5         BlueLightGradientBrush �� 
StartPoint �� EndPoint � Offset � Color&   System.Windows.Controls.DataGrid �� 
TargetType �� Property �� Value  	CellStyle*  $System.Windows.Controls.DataGridCell �� 
TargetType  ButtonStyle	 �� Triggers
 P� Property P� Value��%X  &	        '  �     7   &	 �    &	 T    �� 5   
   $	 0,0&�6=   $	 0,1&�6N   .��5      � $ 0Q�6   $ 	#FFEAF3FF��6&   � 5      $ 0.654Q�6   $ 	#FFC0DEFF��6*   � 5      $ 1Q�6   $ 	#FFC0D9FB��6&   5      �� 5   
   "  6   .�5      ��  � ��$ 5q�6'   �� 5       � ��8   6+   �� 5       � �� �	#FFA6CCF26,   �� 5       �@ RowBackground
 �����6.   �� 5        �@ AlternatingRowBackground �#FDFFD069   �� 5        �@ HorizontalGridLinesBrush
 ���� 69   �� 5       �@ VerticalGridLinesBrush �#FFD3D067   �� 5       �@ RowHeaderWidth$ 0Q�6/   5      �� 5   
   "  6"   .�5      ��  � �� 5      �� 5       "  6&   .R�5!      � #��z��6   .+�5"      �� $��Center=�6/   $��Center=�6L   5#      5$      5&      5'      �� 5(   
   " ��6$   .�5)      ��  � ��
 ��� �6:   �� 5*       � ��
 �����6;   	 5+      P� 5,      
 �@J�IsMouseOver . . �5-      ��  � ��
 �   �6:   5.      50      51      .��52      �  � ShowGridLines .  � ColumnDefinitions 53   
   �� 54      �� 55       � RowDefinitions 57   
   �� 58      $
��Auto �6   �� 59      .+�5<   
   ��  �� Orientation$ 
Horizontal=�6   $��0��6.   $��0��6>   $
��Left=�6K   $��Center=�6f   .+�5=      �� $ Vertical=�6   .+�5>      ]� ��.  $	��Top=�62   $��0,0,0,0q�6G   $��Center=�6X   .+�5?      �� $��
Data Table��6$   $
��Wrap=�67   $��Cambria)�6L   $��20(�6a   $
��Bold"�6o   ��5@      �� 5B   "    �� Color$
 Teal��62   5D      5E        5F         AutoGenerateColumns .     CanUserAddRows .  $��5q�5I   L      CanUserResizeColumns .     CanUserSortColumns .  $	��Top=�5L         	CellStyle# [ 5M      $��Cambria)�5N      $��15(�5O         MinRowHeight$ 30Q�5P       �� SelectedIndex 5G      �� *SelectedDataIndex+ �� Mode$ TwoWay=���5I      ��  �� Path$ SettingDataList�   ColumnHeaderStyle 5Q      �� 5R      =  7System.Windows.Controls.Primitives.DataGridColumnHeader"  6$   .�5S   "   ��  � ��$
 Bold"�6@   �� 5T   "    � ��$ Center=�6H   �� 5U   "    � ��$ Center=�6O   �� 5V   "    � ��$ 45��6;   5W         Columns 5Y      0  *System.Windows.Controls.DataGridTextColumn  5Z      ,  &System.Windows.Controls.DataGridColumn   Header$ 	Set Value��6�   1  +System.Windows.Controls.DataGridBoundColumn   Binding 61   �� *
SetValue+ �� NotifyOnTargetUpdated .  �� UpdateSourceTrigger$ PropertyChanged=�$ TwoWay=�6�     5[      $ 
Delay Time��6�    61   �� *	DelayTime+ . $ PropertyChanged=�$ TwoWay=�6�     5\      $ 	Keep Time��6�    61   �� *
KeepTime+ . $ PropertyChanged=�$ TwoWay=�6�   .  (System.Windows.Interactivity.Interaction    Triggers  5^      /  )System.Windows.Interactivity.EventTrigger  5_      !   	EventName$! CurrentCellChanged��6-   .	  (System.Windows.Interactivity.TriggerBase" 	  Actions." 5`   "   >
  8Microsoft.Expression.Interactivity.Core.CallMethodAction
  # 
  
MethodName$!# DataGrid_CurrentCellChanged��66   $ 
  TargetObject$ 6_   �� 5a      5c      �� 5d      $��Write To PLC��6   $��5q�60   $��5q�6;   #��[ 6G   $��20(�6l     5e        5f      $! Click��6)   ." 5g      
  $# WriteDataToPLC_Click��62   $ 6T   �� 5h      5j      5k      �� 5l      $ Vertical=�6   $��57,0,0,0q�60   .+�5m      �� $��0,75,0,0q�6   $ 
Horizontal=�6/   $��Center=�6H   .+�5n      �� $��50��6   $��25��6)   $��10,0,0,0q�65   ��6G   �� *CurrentValueArray[0]+�� 5o      $��50��6   $��25��6)   $��	10,0,10,0q�65   �� 5p      $��50��6   $��25��6)   �� 5q      $ 
Horizontal=�6!   $��10,0,0,0q�6:   .+�5r      �� $	��100��6    $��50��6.   $��30��69   �� 5s      $	��100��6    $��50��6.   $��30��69   �� 5t      $	��100��6    $��50��6.   $��30��69   5u      �� 5v      $��Accept��6   $��5q�6.   #��[ 6:   $��25��6_   $��10(�6k   5w      �� 5x      $��0,0,0,0q�6   $ 
Horizontal=�6.   $��Center=�6G   .+�5y      �� $��50��6   $��25��6)   $��10,0,0,0q�65   �� 5z      $��50��6   $��25��6)   $��	10,0,10,0q�65   �� 5{      $��50��6   $��25��6)   �� 5|      $ 
Horizontal=�6!   $��10,0,0,0q�6:   .+�5}      �� $	��100��6    $��50��6.   $��30��69   �� 5~      $	��100��6    $��50��6.   $��30��69   �� 5      $	��100��6    $��50��6.   $��30��69   5�      �� 5�      $��Accept��6   $��5q�6.   #��[ 6:   $��25��6_   $��10(�6k   5�      �� 5�      $��0,0,0,0q�6   $ 
Horizontal=�6.   $	��Top=�6G   .+�5�      �� $��50��6   $��25��6)   $��10,0,0,0q�65   �� 5�      $��50��6   $��25��6)   $��	10,0,10,0q�65   �� 5�      $��50��6   $��25��6)   �� 5�      $ 
Horizontal=�6!   $��10,0,0,0q�6:   .+�5�      �� $	��100��6    $��50��6.   $��30��69   �� 5�      $	��100��6    $��50��6.   $��30��69   �� 5�      $	��100��6    $��50��6.   $��30��69   5�      �� 5�      $��Accept��6   $��5q�6.   $��25��6:   #��[ 6F   $��10(�6k   5�      �� 5�      $��0,0,0,0q�6   $ 
Horizontal=�6.   $	��Top=�6G   .+�5�      �� $��50��6   $��25��6)   $��10,0,0,0q�65   �� 5�      $��50��6   $��25��6)   $��	10,0,10,0q�65   �� 5�      $��50��6   $��25��6)   �� 5�      $ 
Horizontal=�6!   $��10,0,0,0q�6:   .+�5�      �� $	��100��6    $��50��6.   $��30��69   �� 5�      $	��100��6    $��50��6.   $��30��69   �� 5�      $	��100��6    $��50��6.   $��30��69   5�      �� 5�      $��Accept��6   $��5q�6.   $��25��6:   #��[ 6F   $��10(�6k   5�      �� 5�      $��0,0,0,0q�6   $ 
Horizontal=�6.   $	��Top=�6G   .+�5�      �� $��50��6   $��25��6)   $��10,0,0,0q�65   �� 5�      $��50��6   $��25��6)   $��	10,0,10,0q�65   �� 5�      $��50��6   $��25��6)   �� 5�      $ 
Horizontal=�6!   $��10,0,0,0q�6:   .+�5�      �� $	��100��6    $��50��6.   $��30��69   �� 5�      $	��100��6    $��50��6.   $��30��69   �� 5�      $	��100��6    $��50��6.   $��30��69   5�      �� 5�      $��Accept��6   $��5q�6.   $��25��6:   #��[ 6F   $��10(�6k   5�      �� 5�      $��0,0,0,0q�6   $ 
Horizontal=�6.   $	��Top=�6G   .+�5�      �� $��50��6   $��25��6)   $��10,0,0,0q�65   �� 5�      $��50��6   $��25��6)   $��	10,0,10,0q�65   �� 5�      $��50��6   $��25��6)   �� 5�      $ 
Horizontal=�6!   $��10,0,0,0q�6:   .+�5�      �� $	��100��6    $��50��6.   $��30��69   �� 5�      $	��100��6    $��50��6.   $��30��69   �� 5�      $	��100��6    $��50��6.   $��30��69   5�      �� 5�      $��Accept��6   $��5q�6.   $��25��6:   #��[ 6F   $��10(�6k   5�      �� 5�      $��0,0,0,0q�6   $ 
Horizontal=�6.   $	��Top=�6G   .+�5�      �� $��50��6   $��25��6)   $��10,0,0,0q�65   �� 5�      $��50��6   $��25��6)   $��	10,0,10,0q�65   �� 5�      $��50��6   $��25��6)   �� 5�      $ 
Horizontal=�6!   $��10,0,0,0q�6:   .+�5�      �� $	��100��6    $��50��6.   $��30��69   �� 5�      $	��100��6    $��50��6.   $��30��69   �� 5�      $	��100��6    $��50��6.   $��30��69   5�      �� 5�      $��Accept��6   $��5q�6.   $��25��6:   #��[ 6F   $��10(�6k   5�      �� 5�      $��0,0,0,0q�6   $ 
Horizontal=�6.   $	��Top=�6G   .+�5�      �� $��50��6   $��25��6)   $��10,0,0,0q�65   �� 5�      $��50��6   $��25��6)   $��	10,0,10,0q�65   �� 5�      $��50��6   $��25��6)   �� 5�      $ 
Horizontal=�6!   $��10,0,0,0q�6:   .+�5�      �� $	��100��6    $��50��6.   $��30��69   �� 5�      $	��100��6    $��50��6.   $��30��69   �� 5�      $	��100��6    $��50��6.   $��30��69   5�      �� 5�      $��Accept��6   $��5q�6.   $��25��6:   #��[ 6F   $��10(�6l   5�      �� 5�      $��Accept Changes In All��6   $��	10,10,0,0q�69   $��5q�6L   #��[ 6X   $��20(�6}   5�      5�      � 5�      $��1��6   $��0��6#    5�      �� 5�      $��25 �6$   �� 5�      $��* �6$   .+�5�      �� $��Plot of the Data Points��6   $��Cambria)�6:   $��15(�6O   $
��Bold"�6]   $��Center=�6o   
���   �$��Center=�6�     OxyPlot.Wpf.Plot  5�      -   5        %  Name$% Plot1��5�      $��1��6*   $��1��6:   $��5q�6G   &   Series& 5�        OxyPlot.Wpf.LineSeries  5�        OxyPlot.Wpf.Series'   Title$' Setting Values��6R   (   MarkerStroke$( Black��6i   ��6)   �� *CoordinatePoints+6i     5�      $' Real Values��6W   $	( Red��6k   ��6)   �� *RealCoordinatePoints+6k   )   Axes) 5�        OxyPlot.Wpf.LinearAxis  5�        OxyPlot.Wpf.Axis*   Title$* Time in Seconds��6)   +   Position$+ Bottom=�6A   ,   FontSize$, 15Q�6S   -   Minimum$- 0Q�6b   .   Maximum$	. 300Q�6n   /   Font$/ Cambria��6|     5�      $* 	Set Value��6)   $
+ Left=�6;   $- 0Q�6L   $	. 300Q�6X   $, 15Q�6f   0   TicklineColor$0 	#FF190000��6t   1   	TickStyle$1  Outside=�6�   $/ Cambria��6�   5�      5�      �� 5�      $��0��6   $��1��6)   .+�5�      � .+�5�      �� $ 
Horizontal=�6   $
��Left=�66   .+�5�      �� $��Power ON��6!   $��5q�64   $��5q�6?   #��[ 6K   $��20(�6p     5�        5�   "   $! Click��61   ." 5�   &   
  $# PowerOnButton_Click��6:   $ 6[   �� 5�   #   5�      �� 5�      $��	Power OFF��6!   $��5q�65   $��5q�6@   #��[ 6L   $��20(�6q     5�        5�   "   $! Click��61   ." 5�   "   
  $# PowerOffButton_Click��66   $ 6X   �� 5�   #   5�      5�      �� 5�      $��Center=�6   $ 
Horizontal=�6:   .+�5�      �� $��Center=�6h   ��6    �� *PowerStatusOfMachine+2 �� FallbackValue$2 Machine_Status��6h   5�      �� 5�      $ 
Horizontal=�6   $��Right=�66   .+�5�      �� $��	Reset All��6!   $��5q�65   $��5q�6@   #��[ 6L   $��20(�6q     5�        5�   "   $! Click��61   ." 5�   &   
  $# ResetButton_Clicked��6:   $ 6[   �� 5�   #   5�      �� 5�      $��Return Home��6!   $��5q�67   $��5q�6B   #��[ 6N   $��20(�6s     5�        5�   "   $! Click��61   ." 5�   &   
  $# ReturnHome_Click��6:   $ 6X   �� 5�   #   5�      5�      5�      � 5�      $��50,50q�6   .+�5      �� $ 
Horizontal=�6   $
��Left=�66   .+�5     �� $��Start��6   $��5q�6-   $��15q�68   #��[ 6E   $��40(�6j     5       5     $! Click��6-   ." 5  "   
  $# StartButton_Clicked��66   $ 6W   �� 5     5     5     �� 5	     $ 
Horizontal=�6   $��Right=�66   .+�5
     �� $
��Stop��6   $��5q�6,   $��15q�67   #��[ 6D   $��40(�6i     5       5     $! Click��6-   ." 5  "   
  $# StopButton_Clicked��66   $ 6V   �� 5     5     5     5     � 5     $��0q�6   .+�5     �� $ 
Horizontal=�6   $
��Left=�66   .+�5     �� $��Save Raw Data��6   $��5q�65   $��10q�6@   #��[ 6M   $��30(�6r     5       5     $! Click��6-   ." 5  "   
  $# SaveRawData_Clicked��66   $ 6W   �� 5     5     5     �� 5     $ 
Horizontal=�6   $��Right=�66   .+�5     �� $��Save Plotted Data��6   $��5q�69   $��10q�6D   #��[ 6Q   $��30(�6v     5       5      $! Click��6-   ." 5!  "   
  $# SavePlottedData_Clicked��66   $ 6[   �� 5"     5$     5%     5&     5'     5(     5)     