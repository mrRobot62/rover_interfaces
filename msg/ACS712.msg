#------------------------------------------------
# Der ACS712 ist zwar über den ADS1115 angeschlossen
# arbeitet aber im rover Projekt eigenständig
# und wird vom SensorNode instanziiert
#
# Vorteil: läuft selbständig und modular und 
# integriert sich in die ros2-Architektur
#------------------------------------------------
float32 current