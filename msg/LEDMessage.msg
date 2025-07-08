int32 pattern
string ledtype
int32 timeout
int32 duration
int32 duration_on
int32 duration_off
float32 brightness
int32 ledmask

# Neue Felder
int32[3] color     # RGB: z.B. [255, 100, 0]
string callback    # Name des Musters oder Methode, z. B. "blink"