# COMX-35 Ports

Games and programs ported to, or recreated for, the **COMX-35**, the 1983 RCA CDP1802-based home computer. The collection has two parts:

- **InfoCom/** — a Z-machine (version 3) interpreter for the COMX-35, plus 18 Infocom text adventures prepared as story disks for it.
- **AI Generated/** — new COMX-35 versions of classic games and programs, written with AI assistance. Each project includes documentation where available.

Everything runs in the [Emma 02](https://www.emma02.hobby-site.com/) emulator, and on real COMX-35 hardware (PAL or NTSC) with a disk drive, or by tape through a cassette interface.

---

## Repository layout

```
Comx-35_Ports/
├── InfoCom/
│   ├── Engine/
│   │   └── zm3.comx
│   ├── Games/                         # Story disk images
│   │   ├── ballyhoo.img
│   │   ├── cutthroats.img
│   │   ├── deadline.img
│   │   ├── enchanter.img
│   │   ├── hhgg.img
│   │   ├── infidel.img
│   │   ├── leather_goddesses_of_phobos.img
│   │   ├── moonmist.img
│   │   ├── planetfall.img
│   │   ├── plundered_hearts.img
│   │   ├── seastalker.img
│   │   ├── starcross.img
│   │   ├── suspect.img
│   │   ├── suspended.img
│   │   ├── witness.img
│   │   ├── zork1.img
│   │   ├── zork2.img
│   │   └── zork_3.img
│   ├── GamesWithZM3/                   # Story images prepared for the ZM3 engine
│   │   ├── ballyhoo.img
│   │   ├── comx.cfg
│   │   ├── cutthroats.img
│   │   ├── deadline.img
│   │   ├── enchanter.img
│   │   ├── hhgg.img
│   │   ├── infidel.img
│   │   ├── leather_goddesses_of_phobos.img
│   │   ├── moonmist.img
│   │   ├── planetfall.img
│   │   ├── plundered_hearts.img
│   │   ├── seastalker.img
│   │   ├── starcross.img
│   │   ├── suspect.img
│   │   ├── suspended.img
│   │   ├── witness.img
│   │   ├── zork1.img
│   │   ├── zork2.img
│   │   └── zork3.img
│   └── HFE Format/                     # HFE disk images
│       ├── ballyhoo.hfe
│       ├── cutthroats.hfe
│       ├── deadline.hfe
│       ├── enchanter.hfe
│       ├── hhgg.hfe
│       ├── infidel.hfe
│       ├── leather_goddesses_of_phobos.hfe
│       ├── moonmist.hfe
│       ├── planetfall.hfe
│       ├── plundered_hearts.hfe
│       ├── seastalker.hfe
│       ├── starcross.hfe
│       ├── suspect.hfe
│       ├── suspended.hfe
│       ├── witness.hfe
│       ├── zork1.hfe
│       ├── zork2.hfe
│       └── zork3.hfe
├── AI Generated/
│   ├── Crater Run/
│   │   ├── CRATER.ASM
│   │   ├── CRATER.comx
│   │   ├── CRATER.img
│   │   ├── CRATER RUN Guide.pdf
│   │   └── Crater.asm
│   ├── Lattern/
│   │   ├── LANTERN.comx
│   │   ├── LATERN.comx
│   │   └── Lantern_Deep_Players_Guide.pdf
│   ├── Life/
│   │   ├── Life.comx
│   │   └── Life_User_Guide.pdf
│   ├── Manic Miner/
│   │   ├── MANIC.comx
│   │   └── Manic_Miner_COMX_Guide.pdf
│   ├── Oregon Trail/
│   │   ├── OT1978.comx
│   │   └── OT1990.comx
│   ├── Star Legion/
│   │   ├── LEGION.ASM
│   │   ├── LEGION.comx
│   │   ├── LEGION.img
│   │   ├── Legion.comx
│   │   └── STAR LEGION Guide.pdf
│   ├── Super Trek/
│   │   ├── SSTREK.BAS
│   │   ├── SSTREK.comx
│   │   └── SSTREK_Instructions.pdf
│   ├── The Hobbit/
│   │   ├── HOBBIT.comx
│   │   ├── HOBBIT.img
│   │   └── The_Hobbit_COMX_Guide.pdf
│   └── Trek/
│       ├── TREK.ASM
│       ├── TREK.comx
│       ├── TREK.img
│       ├── TREK Guide.pdf
│       ├── Trek Guide.pdf
│       └── Trek.comx
└── README.md
```

`.comx` files are in the standard COMX-35 program format used by Emma 02. They can be loaded in the emulator, from disk, or by tape with `PLOAD`.

---

## AI Generated projects

### Crater Run (`AI Generated/Crater Run/`)

A COMX-35 recreation of the arcade-style moon rover game. The directory includes assembly source, a `.comx` program, a disk image, and the `CRATER RUN Guide.pdf` player guide.

### LANTERN DEEP (`AI Generated/Lattern/`)

A machine-code cave platformer. Explore 8 wide by 29 deep rooms of ledges, ladders, an underground river and a balloon ride. Collect gold and light lanterns while avoiding hazards.

- Controls are the cursor keys, joystick or WASD.
- `M` toggles music, `E` toggles sound effects, and `Esc`/`Q` quits to BASIC.
- **To run:** load `LANTERN.comx` and type `RUN`.
- See `Lantern_Deep_Players_Guide.pdf` for the full guide.

### COMX-35 Color Life (`AI Generated/Life/`)

Conway's Game of Life on a 40 × 23 grid, with colors indicating how long each cell has remained alive.

- **To run:** load `Life.comx`, then type `CALL(@4500)`.
- `PRINT PEEK(@4500)` should return 248 if the program loaded correctly.
- **Keys:** `1` new random pattern · `2` cycle background color · `0` show/hide generation counter · `3` color on/off · `RESET` back to BASIC.
- See `Life_User_Guide.pdf` for the full guide.

### Manic Miner (`AI Generated/Manic Miner/`)

A COMX-35 recreation of **Manic Miner**. The directory contains the executable `MANIC.comx` and `Manic_Miner_COMX_Guide.pdf`.

### The Oregon Trail (`AI Generated/Oregon Trail/`)

Two COMX-35 BASIC versions:

- **`OT1978.comx`** recreates the 1978 classic text version.
- **`OT1990.comx`** recreates the 1990 MECC DOS version 2.0.

**To run:** load the file and type `RUN`.

### Star Legion (`AI Generated/Star Legion/`)

A COMX-35 space strategy and exploration program. The directory includes assembly source (`LEGION.ASM`), executable (`LEGION.comx`), disk image (`LEGION.img`), and `STAR LEGION Guide.pdf`.

- **To run:** load `LEGION.comx` and type `RUN`, or use `LEGION.img` in a disk drive.
- See `STAR LEGION Guide.pdf` for gameplay instructions.

### Super Star Trek (`AI Generated/Super Trek/`)

A COMX-35 BASIC version of the 1978 **Super Star Trek**. It includes `SSTREK.comx`, the BASIC source `SSTREK.BAS`, and `SSTREK_Instructions.pdf`.

- **To run:** load `SSTREK.comx` and type `RUN`, or run it from BASIC after loading.
- See `SSTREK_Instructions.pdf` for the full command reference.

### The Hobbit (`AI Generated/The Hobbit/`)

A COMX-35 port of **The Hobbit**, including `HOBBIT.comx`, `HOBBIT.img`, and `The_Hobbit_COMX_Guide.pdf`.

### Trek (`AI Generated/Trek/`)

A COMX-35 version of **Trek**, with assembly source (`TREK.ASM`), executable (`TREK.comx`), disk image (`TREK.img`), and `TREK Guide.pdf`.

---

## Requirements

- **Emulator:** [Emma 02](https://www.emma02.hobby-site.com/) with a COMX-35 (PAL or NTSC) configuration.
- **Real hardware:** a COMX-35 with sufficient RAM; AI-generated disk programs may require a disk drive.
- `.comx` programs can also be loaded from tape with `PLOAD` through a cassette interface.

---

## Legal

The Infocom games are copyright their original rights holders (Infocom / Activision). The Oregon Trail is a trademark of its respective owner, and Super Star Trek is based on the 1978 public BASIC source. Other included games and recreated brands remain the property of their respective owners.
