This package contains the ProFontWindows pcf fonts for X Windows.

To install the fonts, you might need to have the root access privileges.

Instructions for installing the fonts:
1) Copy the pcf fonts to /usr/lib/X11/fonts/misc directory.
2) Run makefontdir in /usr/lib/X11/fonts/misc directory.
3) If you are already in X you should run xset fp rehash to make X server aware of the new fonts. You may also or instead have to restart the font server (using e.g. /etc/init.d/xfs restart under RedHat 7.1) 
4) You can verify the fonts is installed by xlsfonts -fn *prof*, which will return:
-windows-profontwindows-medium-r-normal--0-0-72-72-c-0-microsoft-cp1252
-windows-profontwindows-medium-r-normal--10-100-72-72-c-50-microsoft-cp1252
-windows-profontwindows-medium-r-normal--11-110-72-72-c-60-microsoft-cp1252
-windows-profontwindows-medium-r-normal--12-120-72-72-c-60-microsoft-cp1252
-windows-profontwindows-medium-r-normal--15-150-72-72-c-70-microsoft-cp1252
-windows-profontwindows-medium-r-normal--17-170-72-72-c-140-microsoft-cp1252
-windows-profontwindows-medium-r-normal--22-220-72-72-c-120-microsoft-cp1252
-windows-profontwindows-medium-r-normal--29-290-72-72-c-160-microsoft-cp1252
5) Pick up any of the font and test it with a text editor such as gvim like:
gvim -fn -windows-profontwindows-medium-r-normal--0-0-72-72-c-0-microsoft-cp1252

Have fun!


Contact: zhichao_h@yahoo.com

========================================================================================

To get the full original Distribution, other ProFont builds
and more information
go to <http://tobiasjung.name/profont/>


DISCLAIMER
See LICENSE file


Tobias Jung
January 2014
profont@tobiasjung.name
