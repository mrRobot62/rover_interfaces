string source           # z. B. "ads1115" oder "esp32"
int32 address           # I2C-Adresse des Slaves (optional)
int32 error             # 0=kein Fehler, <> 0 Fehler
float64[] fvalues       # gelesene Float  Messwerte
int32[] ivalues         # gelesene Integer Values