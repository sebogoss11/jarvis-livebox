jv_plugin_livebox_reboot () {
 say "je redemmare la Livebox"
 say "La Livebox serra redemmaré dans moins de 3 minutes"
 #appel 
 python3 "plugins_installed/jarvis-livebox/sysbus/sysbus.py" 'NMC:reboot'
 sleep 180
 say "La Livebox a terminée de redemmarer."
 say "Je dois redemmarer"
 #Si vous utilisez un raspberry
 #reboot #rafraichir l'interface réseau
}

jv_plugin_livebox_get_phone_number (){
    numero=$(python3 'plugins_installed/jarvis-livebox/sysbus/sysbus.py' '-info' | grep 'directoryNumber' | tr -s ' +33' '0' | cut -d ':' -f2)
	say "Votre numero de téléphone est: ${numero}"
}

jv_plugin_livebox_wifi_enable () {
	python3 'plugins_installed/jarvis-livebox/sysbus/sysbus.py' '-wifion' 
    say "Activation du wifi de la Livebox"        
}

jv_plugin_livebox_wifi_disable () {
	python3 'plugins_installed/jarvis-livebox/sysbus/sysbus.py' '-wifioff' 
    say "Désactivation du wifi de la Livebox"
}

jv_plugin_livebox_get_ipv4 () {
	ip=$(python3 'plugins_installed/jarvis-livebox/sysbus/sysbus.py' '-info' | grep 'IPv4Address' | tr -s ' +33' '0' | cut -d ':' -f2)
    say "L IP de la Livebox est: $ip"
}

jv_plugin_livebox_get_password (){
	password=$(python3 'plugins_installed/jarvis-livebox/sysbus/sysbus.py' '-wifi' | cut -d ' ' -f4 | head -1)
    say "Le mot de passe de la Livebox est: $password"
}

jv_plugin_livebox_enable_wifi_share () {
    say "Début de l'apparainage."
    python3 'plugins_installed/jarvis-livebox/sysbus/sysbus.py' 'DECT:startPairing' 

}