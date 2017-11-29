
if [[ $EUID -ne 0 ]]; then
    echo -e "ROOT er nødvendigt! Anullerer..."
    exit 1
else
	echo -e "----Starter uninstaller Script-----
 		      Jeg kan ikke holdes ansvarlig for 
			          tab af filer osv. 
			          af Magnus Joerck
				      
					  www.mjoerck.com
	"
	
    sleep 5
	
	echo "Lukker office programmer"
	
	osascript -e 'tell application "Remote Desktop Connection" to quit' 
	osascript -e 'tell application "Microsoft Document Connection" to quit'
	osascript -e 'tell application "Microsoft Messenger" to quit'
	osascript -e 'tell application "Microsoft Communicator" to quit'
	osascript -e 'tell application "Microsoft Outlook" to quit'
	osascript -e 'tell application "Microsoft Excel" to quit'
	osascript -e 'tell application "Microsoft PowerPoint" to quit'
	osascript -e 'tell application "Microsoft Word" to quit'
	osascript -e 'tell application "Microsoft Office Reminders" to quit'
	osascript -e 'tell application "Microsoft AU Daemon" to quit'
	osascript -e 'tell application "Microsoft Database Daemon" to quit'	
	
	echo "Tryk Ctrl + c for at anullere fjernelsen"
	
	sleep 5
	
    echo "Fjerner Office 2011 applikationer..."
    rm -rf "/Applications/Microsoft Messenger.app"
    rm -rf "/Applications/Microsoft Office 2011"
    rm -rf "/Applications/Remote Desktop Connection.app"

    rm -rf $(whoami)/Library/Preferences/com.microsoft.Excel.plist
    rm -rf $(whoami)/Library/Preferences/com.microsoft.office.plist
    rm -rf $(whoami)/Library/Preferences/com.microsoft.office.setupassistant.plist
    rm -rf $(whoami)/Library/Preferences/com.microsoft.outlook.databasedaemon.plist
    rm -rf $(whoami)/Library/Preferences/com.microsoft.outlook.office_reminders.plist
    rm -rf $(whoami)/Library/Preferences/com.microsoft.Outlook.plist
    rm -rf $(whoami)/Library/Preferences/com.microsoft.PowerPoint.plist
    rm -rf $(whoami)/Library/Preferences/com.microsoft.Word.plist
    rm -rf $(whoami)/Library/Preferences/com.microsoft.autoupdate2.plist
    rm -rf $(whoami)/Library/Preferences/ByHost/com.microsoft*
    rm -rf "$(whoami)/Library/Application Support/Microsoft/Office"

    rm /Library/LaunchDaemons/com.microsoft.office.licensing.helper.plist
    rm /Library/Preferences/com.microsoft.office.licensing.plist
    rm /Library/PrivilegedHelperTools/com.microsoft.office.licensing.helper

    rm -rf /Library/Application Support/Microsoft
    rm -rf /Library/Fonts/Microsoft
    rm -rf /Library/Receipts/Office2011_*
	
    pkgutil --pkgs=.\+microsoft\.office.\+ | while read -r package ; do
        pkgutil --forget $package
    done
    pkgutil --pkgs=.\+microsoft\.rdc.\+ | while read -r package ; do
        pkgutil --forget $package
    done
    pkgutil --pkgs=.\+microsoft\.mau.\+ | while read -r package ; do
        pkgutil --forget $package
    done
    pkgutil --pkgs=.\+microsoft\.merp.\+ | while read -r package ; do
        pkgutil --forget $package
    done
    pkgutil --pkgs=.\+microsoft\.msgr.\+ | while read -r package ; do
        pkgutil --forget $package
    done
    pkgutil --forget com.microsoft.package.Frameworks
    pkgutil --forget com.microsoft.pkg.licensing

    echo "Ikoner i docken skal fjernes manuelt!."
fi