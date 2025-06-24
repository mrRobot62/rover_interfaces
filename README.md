# ROVER Interfaces
In diesem Projekt werden die Topic-Interfaces beschrieen die im Rover-Projekt verwendet werden.

# led_node
Dieser Node ist dafür verantwortlich die LED-Ringe (4 Stüch á 7 LEDs) geziehlt anzusteuern. Die Reihenfolge der LED-Ringe ist wie folgt
- Ring 1 = Links hinten (LH)
- Ring 2 = Links vorne (LV)
- Ring 3 = Rechts vorne (RV)
- Ringe 4 = Rechts hinten (RH)

Ein Ring selbst besteht aus 7 WS2812 LEDS im Kreis angeordnet (6 LEDs) und eine LED mittig.
LED0 ist die in der Mitte
LED1 auf 9Uhr
LED2 auf 10Uhr
LED3 auf 14Uhr
LED4 auf 15Uhr
LED5 auf 16Uhr
lED6 auf 20Uhr

## LEDMessage
besteht aus
- pattern : beschreibt welches Muster angezeigt werden soll (siehe LEDPattern(Enum)
- ledtype : Default "WS2812"
- timeout : Angabe in Millisekunden (ms). Zeit gibt an, wie lange ein Pattern aktiv (ON) ist bevor es ausgeschaltet wird (OFF)
- duration_on : Angabe in Millisekunden wie lange die ON-Phase ist (bei Blinkpattern)
- duration_off : Angabe in Millisekunden, wie lange die OFF-Pahse ist (bei Blinkpattern)
- ledmask : Binär Muster welche LEDs ON/OFF geschaltet werden sollen. Überschreibt das gewählte LEDPattern

