   M S B A M L   `   `   `  ����J  FParkerCompax3UI, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null;"clr-namespace:ParkerCompax3UI.ViewParkerCompax3UI.View  5   	   %    ParkerCompax3UI.View.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   4local"clr-namespace:ParkerCompax3UI.View     5   	   $	��720��5	   	   $
��1280��5
   	     � WindowStartupLocation$  CenterScreen=�5   	    � WindowState$ 	Maximized=�6.    � Title 5   	   �� *
AppTitle+ �� FallbackValue$ AppTitle��.��5      �  � RowDefinitions 5   
   �� 5      $
��Auto �6   �� 5      $��* �6   �� 5      $
��Auto �6   .+�5   
   "   ParkerCompax3UI.View.TopMenu  $��0��6    � DataContext 6%   �� *	TopMenuVM+� 5   
   $��1��6   .+�5      �� .��5      ��  �� TabStripPlacement$
 Left=�6   $��0q�66    �� SelectedIndex$ 1��6A    � 	Resources 5      	 �� 
TargetType
 �� Property �� Value �� 
TargetType ��Name �� Triggers P� Property P� Value �� 
TargetName��%E  '��       �� 5      "	 ��6    .�5      �� 
 � �� 5   "   �� 5   &   " ��66   .R�5   *   � $��Panel��6/   .+�5   .   �� $ ContentSite��6?   $��Center=�5   1   $
��Left=�5   1   $��Header��5   1   $��10,22.8q�5    1   $��15(�5!   1   $��Cambria)�5"   1   
�������5#   1   5%   +    5&   *   P� 5'   .    �@��
IsSelected . . �5(   2   �� $ Panel��69   
 � ��
 �W�.�6b   5)   /   P� 5*   .    �@��
IsSelected .  . �5+   2   �� $ Panel��69   
 � ��
 ���F�6b   5,   /   5.   '   50      51      52      .@�53      �� $
��Home��6   .��54      � {�6   �� *IsEnabledHomeVM+.+�55         ParkerCompax3UI.View.Home   6)   �� *HomeVM+56      57      �� 58      $��Cylinder One��6   .��59      � {�6   �� *IsEnabledCylinderOneVM+.+�5:      &    ParkerCompax3UI.View.CylinderOne   60   �� *CylinderOneVM+5;      5<      �� 5=      $��Cylinder Two��6   .��5>      � {�6   �� *IsEnabledCylinderTwoVM+.+�5?      &    ParkerCompax3UI.View.CylinderTwo   60   �� *CylinderTwoVM+5@      5A      �� 5B      $��Cylinder Three��6   .��5C      � {�6   �� *IsEnabledCylinderThreeVM+.+�5D      (   "ParkerCompax3UI.View.CylinderThree   62   �� *CylinderThreeVM+5E      5F      �� 5G      $��Cylinder Four��6   .��5H      � {�6   �� *IsEnabledCylinderFourVM+.+�5I      '   !ParkerCompax3UI.View.CylinderFour   61   �� *CylinderFourVM+5J      5K      �� 5L      $��Settings��6   .��5M      � {�6   �� *IsEnabledSerialPortVM+.+�5N      +   %ParkerCompax3UI.View.SerialPortConfig   65   �� *SerialPortConfigVM+5O      5P      5Q      5R      5S      � 5T   
   $��2��6   .+�5U      ��  �� Orientation$ 
Horizontal=�6   .+�5V      �� $��5q�5W       �� Padding$ 3q�5X      $��Consolas)�5Y      ��5Z      �� *BottomStatusText+$ BottomStatusText��5[      5\      5]      5^      