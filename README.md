# Rover_Interfaces

Projekt zur Bereitstellung von spezfischen Rover-Nachrichten

## Subfolder `msg`
Messages in diesem Folder werden als Topics (publish/subsribe) verwendet

## Subfolder `srv` 
Messagers in diesem folder werden als Service-Messages verwendet

---

# ROS 2 – Service-Message (`.srv`) vs Topic-Message (`.msg`) im Rover-Projekt

## 🧭 Übersicht: Unterschiede zwischen `.msg` und `.srv`

| Kriterium          | Topic (`.msg`)                     | Service (`.srv`)                   |
| ------------------ | ---------------------------------- | ---------------------------------- |
| Kommunikationsart  | **Asynchron, ungerichtet**         | **Synchron, anfragebasiert**       |
| Beziehung          | Publisher ↔ Subscriber             | Client ↔ Server                    |
| Antwort notwendig? | Nein                               | Ja (Request → Response)            |
| Wiederholung       | Periodisch oder Event-getriggert   | Nur bei konkretem Aufruf           |
| Typische Beispiele | Sensorwerte, Steuerbefehle, Status | Konfiguration, Befehle mit Antwort |

---

## 🛠 Anwendungsfälle im Rover-Projekt

### ✅ Verwende **Topics (`.msg`)** für:

- **Sensoren**: Lidar, IMU, Kamera, Ultraschall etc. → liefern kontinuierliche Daten  
- **Motorsteuerung**: z. B. gewünschte Geschwindigkeit oder Richtung (`geometry_msgs/Twist`)  
- **Statusanzeigen**: Batteriestand, Temperatur, Diagnosen  
- **LED-Muster**: einfache visuelle Signale wie z. B. `LEDPattern.msg` via `/led`  

#### Beispiel:
```bash
ros2 topic pub /led rover/LEDPattern "{pattern: 3}"
```

---

### ✅ Verwende **Services (`.srv`)** für:

- **Einmalige Konfigurationen**  
  z. B. I2C-Adresse setzen, Mapping starten, Parameter setzen  
- **Lifecycle-Kommandos**  
  `configure`, `activate`, `shutdown`, etc.  
- **Gezielte Datenabfragen**  
  z. B. ein ADC-Wert bei Bedarf (nicht gestreamt)  
- **Zentralisierte Steuerung**  
  z. B. Ein- und Ausschalten von Subsystemen, Reset-Kommandos  

#### Beispiel:
```bash
ros2 service call /i2c_node/get_adc rover/GetADC "{channel: 1}"
```

---

## 🤖 Architektur-Tipp für dein Rover-Projekt

### 📌 Beispiel: Zentrale I2C-Kommunikation

#### Setup:
- `i2c_node`: Zentrale Komponente für alle I2C-Kommandos
- Andere Nodes kommunizieren ausschließlich über ROS 2 mit dem I2C-Node

#### Kommunikationsmuster:
- 📥 **Service (`.srv`)**: Für gezielte Schreib-/Leseoperationen
- 📤 **Topic (`.msg`)**: Für kontinuierlich erfasste Sensordaten

#### Beispielstruktur:
```
rover/
├── msg/
│   └── LEDPattern.msg
├── srv/
│   └── GetADC.srv
│   └── WriteI2C.srv
├── src/rover/
│   ├── nodes/
│   │   ├── led_node.py
│   │   ├── i2c_node.py
│   │   └── driver_controller.py
```

---

## 🧪 Debugging & Design-Hinweise

- ⚠ **Topics sind "fire-and-forget"**  
  → Es gibt keine Bestätigung, ob jemand zuhört oder die Nachricht verarbeitet  
- ✅ **Services bieten Rückmeldung**  
  → Du bekommst garantiert eine Antwort (oder Timeout)  
- 🔁 **Kombination möglich**  
  → z. B. per Service „Start Messung“ → Status als Topic publizieren

---

## 🧾 Fazit: Wann `.msg` vs `.srv`?

| Wenn du…                                        | Dann verwende…       |
| ----------------------------------------------- | -------------------- |
| regelmäßig Daten senden willst                  | **Topic (`.msg`)**   |
| eine Aktion gezielt mit Antwort auslösen willst | **Service (`.srv`)** |
| Status streamen möchtest                        | **Topic**            |
| eine gezielte Information brauchst              | **Service**          |

---