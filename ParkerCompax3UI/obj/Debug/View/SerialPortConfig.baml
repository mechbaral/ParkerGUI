   M S B A M L   `   `   `  ����J  FParkerCompax3UI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:ParkerCompax3UI.ViewParkerCompax3UI.View  5      +    %ParkerCompax3UI.View.SerialPortConfig   5      \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      4local"clr-namespace:ParkerCompax3UI.View     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      c _System.Windows.Interactivity, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bi:http://schemas.microsoft.com/expression/2010/interactivity  5      h dMicrosoft.Expression.Interactions, Version=4.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35Bei9http://schemas.microsoft.com/expression/2010/interactions  5	      .��5      � $��5q�6     � ColumnDefinitions  5   
   �� 5      $
��Auto �6   �� 5      $
��Auto �6   �� 5      $
��Auto �6   .+�5   
   �� $��0��6   $
��Left=�6%   .+�5      �� $	��0,2q�6    �� Orientation$ 
Horizontal=�6&   .+�5      �� $	��135��6   $��Enable The Port: ��6$   $
��Bold"�6@   �� 5      $	��150��5      $��Center=�5      ��5      �� *SelectedPortName+ d� 	IsChecked 5      �� *IsSerialPortEnabled+ �� FallbackValue$
 True��5      �� 5)      $	��0,2q�6   $ 
Horizontal=�6&   .+�5*      �� $	��135��6   $��Maximum Velocity :��6$   $
��Bold"�6A   �� 5+      $	��100��6   $��Center=�6&   ��5,      �� *ReceiverName+$ 15�� �� Mode$ TwoWay=��� 5-      $��35��6   $
��m/s:��6#   $
��Bold"�62   5.      �� 5/      $	��0,2q�6   $ 
Horizontal=�6&   .+�50      �� $	��135��6   $��Max. Travel Distance :��6$   $
��Bold"�6E   �� 51      $	��100��6   $��Center=�6&   ��52      �� *ReceiverName+$	 200��$ TwoWay=��� 53      $��35��6   $��mm��6#   $
��Bold"�60   54      �� 55      $ Vertical=�6   .+�56      �� $
��Auto��6   $��Operation Mode��6%   $
��Bold"�6>   $��Center=�6P   �� 57      -   5        $��ControlMode��57      .��58      �� $	��0,2q�6!   $ 
Horizontal=�6.   $��Center=�6G   .+�59      	� -   5         	�Name$ PositionControl��59   '   $��5q�6A   $��Position��6L    	� 	GroupName$ ControlMode��6_   $
 TrueY�6w   .  (System.Windows.Interactivity.Interaction   Triggers 5:      9  3Microsoft.Expression.Interactivity.Core.DataTrigger  5;   "      Value$
 True��6j   D  >Microsoft.Expression.Interactivity.Core.PropertyChangedTrigger	   Binding	 61   �� *	IsChecked+
 �� ElementName$
 UpRadioButton��.  (System.Windows.Interactivity.TriggerBase   Actions. 5<   &   B  <Microsoft.Expression.Interactivity.Core.ChangePropertyAction     PropertyName$ SelectedDirection��6c   8  2System.Windows.Interactivity.TargetedTriggerAction   TargetObject 6>   �� $ OneWay=�6c   5=   #   5?      	� 5@      -   5        $ VelocityControl��5@   '   $��5q�6A   $��Velocity��6L   $ ControlMode��6_    5A        5B   "   $
 True��6j   	 61   �� *	IsChecked+$
 UpRadioButton��. 5C   &     $ SelectedDirection��6c    6>   �� $ OneWay=�6c   5D   #   5F      	� 5G      -   5        $ ForceControl��5G   '   $��5q�6>   $��Force��6I   $ ControlMode��6Y    5H        5I   "   $
 True��6j   	 61   �� *	IsChecked+$
 UpRadioButton��. 5J   &     $ SelectedDirection��6c    6>   �� $ OneWay=�6c   5K   #   5M      5N      5O      5P      5R      �� 5T   
   $��1��5U      $
��10,0q�5V      $
��Left=�5W      #��["�5X      �� 5Z   
   $��2��6   $
��Left=�6%   .+�5[      �� $	��0,2q�6   $ 
Horizontal=�6&   .+�5\      �� $	��100��6   $��
Port name:��6$   $
��Bold"�69   �� 5]      $	��150��6   $��Center=�6'   ��5^      �� *PortNameList+ �� SelectedItem 5_      �� *SelectedPortName+5`      �� 5a      $	��0,2q�6   $ 
Horizontal=�6&   .+�5b      �� $	��100��6   $��
Baud rate:��6$   $
��Bold"�69   �� 5c      $	��150��6   $��Center=�6'   ��5d      �� *BaudRateList+ 5e      �� *SelectedBaudRate+5f      �� 5g      $	��0,2q�6   $ 
Horizontal=�6&   .+�5h      �� $	��100��6   $��
Data bits:��6$   $
��Bold"�69   �� 5i      $	��150��6   $��Center=�6'   ��5j      �� *DataBitsList+ 5k      �� *SelectedDataBits+5l      �� 5m      $	��0,2q�6   $ 
Horizontal=�6&   .+�5n      �� $	��100��6   $��Parity:��6$   $
��Bold"�66   �� 5o      $	��150��6   $��Center=�6'   ��5p      �� *
ParityList+ 5q      �� *SelectedParity+5r      �� 5s      $	��0,2q�6   $ 
Horizontal=�6&   .+�5t      �� $	��100��6   $��
Stop bits:��6$   $
��Bold"�69   �� 5u      $	��150��6   $��Center=�6'   ��5v      �� *StopBitsList+ 5w      �� *SelectedStopBits+5x      �� 5y      $	��0,2q�6   $ 
Horizontal=�6&   .+�5z      �� $	��100��6   $��
Handshake:��6$   $
��Bold"�69   �� 5{      $	��150��6   $��Center=�6'   ��5|      �� *HandshakeList+ 5}      �� *SelectedHandshake+5~      5      5�      5�      