# COMX-35 Ports

Games and programs ported to, or recreated for, the **COMX-35**, the 1983 RCA CDP1802-based home computer. The collection has two parts:

- **InfoCom/** — a Z-machine (version 3) interpreter for the COMX-35, plus 18 Infocom text adventures prepared as story disks for it.
- **AI Generated/** — new COMX-35 versions of classic games and programs, written with AI assistance. Each project includes documentation where available.

Everything runs in the [Emma 02](https://www.emma02.hobby-site.com/) emulator, and on real COMX-35 hardware (PAL or NTSC) with a disk drive, or by tape through a cassette interface.

---

`.comx` files are in the standard COMX-35 program format used by Emma 02. They can be loaded in the emulator, from disk, or by tape with `PLOAD`.

---

## AI Generated projects

### Cave Rescue (`AI Generated/Cave Rescue/`)

An original cave-rescue action game based on H.E.R.O for the COMX-35. The directory includes assembly source (`CAVE.ASM`), executable (`CAVE.comx`), disk image (`CAVE.img`), and `CAVE_RESCUE_Guide.pdf`.

- **To run:** load `CAVE.comx` and call `@4500`.
- See `CAVE_RESCUE_Guide.pdf` for the player guide.

### Crater Run (`AI Generated/Crater Run/`)

A COMX-35 recreation of the arcade-style moon rover game like Moon Buggy. The directory includes assembly source, a `.comx` program, a disk image, and the `CRATER RUN Guide.pdf` player guide.

### Fortress Raid (`AI Generated/Fortress Raid/`)

An original altitude shooter similar to Zaxxon for the COMX-35. The directory includes assembly source (`FORTRAID.ASM`), executable (`FORTRAID.comx`), disk image (`FORTRAID.img`), and `FORTRESS RAID Guide.pdf`.

- **To run:** load `FORTRAID.comx` and call `@4500`.

### Gambit (`AI Generated/Gambit/`)

An original chess program for the COMX-35. The directory includes assembly source (`GAMBIT.ASM`), executable (`GAMBIT.comx`), disk image (`GAMBIT.img`), and `GAMBIT_Guide.pdf`.

- **To run:** load `GAMBIT.comx` and call `@4500`.
- See `GAMBIT_Guide.pdf` for the player guide.

### Grand Circuit (`AI Generated/Grand Circuit/`)

A COMX-35 racing game inspired by Formula 1, with qualifying and Grand Prix modes, a 2-player mode, live timing, track selection, pit stops, and 7 weather types.

- **Files:** assembly source (`CIRCUIT.ASM`), executable (`CIRCUIT.comx`), disk image (`CIRCUIT.img`), and `GRAND CIRCUIT Guide.pdf`.
- **To run:** load `CIRCUIT.comx` and call `@4500`.
- See `GRAND CIRCUIT Guide.pdf` for the player guide.

### LANTERN DEEP (`AI Generated/Lattern/`)

A machine-code cave platformer similar to Pitfall. Explore 8 wide by 29 deep rooms of ledges, ladders, an underground river and a balloon ride. Collect gold and light lanterns while avoiding hazards.

- Controls are the cursor keys, joystick or WASD.
- `M` toggles music, `E` toggles sound effects, and `Esc`/`Q` quits to BASIC.
- **To run:** load `LANTERN.comx` and type `RUN`.
- See `Lantern_Deep_Players_Guide.pdf` for the full guide.

### Lily Leap (`AI Generated/Lily Leap/`)

A colorful arcade Frogger like game for the COMX-35 in which the player leaps between lily pads, avoiding hazards and gathering collectibles.

- **Files:** assembly source (`LILY LEAP.ASM`), executable (`LILY LEAP.comx`), disk image (`LILY LEAP.img`), and `LILY LEAP Guide.pdf`.
- **To run:** load `LILY LEAP.comx` and call `@4500`.
- See `LILY LEAP Guide.pdf` for the player guide.

### COMX-35 Color Life (`AI Generated/Life/`)

Conway's Game of Life on a 40 × 23 grid, with colors indicating how long each cell has remained alive.

- **To run:** load `Life.comx`, then type `CALL(@4500)`.
- `PRINT PEEK(@4500)` should return 248 if the program loaded correctly.
- **Keys:** `1` new random pattern · `2` cycle background color · `0` show/hide generation counter · `3` color on/off · `RESET` back to BASIC.
- See `Life_User_Guide.pdf` for the full guide.

### Manic Miner (`AI Generated/Manic Miner/`)

A COMX-35 recreation of **Manic Miner**. The directory contains the executable `MANIC.comx` and `Manic_Miner_COMX_Guide.pdf`.

### Orbital War (`AI Generated/Orbital War/`)

A COMX-35 space strategy game. The directory includes the assembly source, executable, disk image, and player guide.

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

### TAIL WIND (`AI Generated/Tail Wind/`)

A COMX-35 flight-themed game similar to 1942. The directory includes assembly source (`TAIL WIND.ASM`), executable programs (`TAIL WIND.comx` and `TailWind.comx`), a disk image (`TAIL WIND.img`), and `TAIL WIND Guide.pdf`.

- **To run:** load `TAIL WIND.comx` and follow the instructions in `TAIL WIND Guide.pdf`.

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

The Infocom games are copyright their original rights holders (Infocom / Activision). The Oregon Trail is a trademark of its respective owner, and Super Star Trek is based on the 1978 public BASIC source. The remaining projects are fan recreations or original software; their rights belong to their respective creators and rights holders.
