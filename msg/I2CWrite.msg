#-------------------------
# I2C V01 Version
#-------------------------
# grundlegendes Kommando was an den ESP
# verwendet wird
string command

#
# Liste der PINS die angesprochen werden
int32[] pins
#
# List der States die ein Pin annehmen soll
int32[] states
#
#
int32 cmd
#
#
int32 subcmd
#
# Liste von 5 Werten. Publisher
# senden float, Wert wird mit 100 Multipliziert
# um uint16 Wert zu erhalten
float64[] data