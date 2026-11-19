# COMX-35 Ports

Games and programs ported to, or recreated for, the **COMX-35**, the 1983 RCA CDP1802-based home computer. The collection has two parts:

- **InfoCom/** – a Z-machine (version 3) interpreter for the COMX-35, plus 18 Infocom text adventures prepared as story disks for it.
- **AI/** – new COMX-35 versions of classic games and programs, written with AI assistance. Each one comes with a player's guide.

Everything runs in the [Emma 02](https://www.emma02.hobby-site.com/) emulator, and on real COMX-35 hardware (PAL or NTSC) with a disk drive, or by tape through a cassette interface.

---

## Repository layout

```
Comx-35_Ports/
├── InfoCom/
│   ├── Engine/
│   │   └── zm3.comx              ZM3 Z-machine interpreter v1.0
│   └── Games/
│   │   └── *.img                 18 Infocom story disks (ZM3 disk format)
│   └── HFE/
│       └── *.hfe                 HFE disk format for GreaseWeazle
└── AI/
    ├── Lattern/                  LANTERN DEEP – cave platformer
    │   ├── LANTERN.comx
    │   └── Lantern_Deep_Players_Guide.pdf
    ├── Life/                     Color Life – Conway's Game of Life
    │   ├── Life.comx
    │   └── Life_User_Guide.pdf
    ├── OregonTrail/
    │   ├── OT1978.comx           Oregon Trail (1978 BASIC)
    │   └── OT1990.comx           Oregon Trail (1990 MECC DOS v2.0)
    └── SuperTrek/
        ├── SSTREK.comx           Super Star Trek
        ├── SSTREK.BAS            BASIC source listing
        └── SSTREK_Instructions.pdf
```

`.comx` files are in the standard COMX-35 program format used by Emma 02. They can be loaded in the emulator, from disk, or by tape with `PLOAD`.

---

## Infocom: the ZM3 interpreter

`InfoCom/Engine/zm3.comx` is **ZM3 v1.0**, a Z-machine interpreter written for the COMX-35. It plays Infocom's version 3 story files, which covers most of the classic Infocom catalogue. It provides:

- the full v3 instruction set, with checks for illegal opcodes and division by zero
- a status line showing score and moves
- `[MORE]` paging for long text output
- save and restore to numbered slots

Each story is packaged as a 140 KB disk image (`.img`) with a `ZM3D` header, followed by the original story file. The interpreter checks that a story disk is present, that it is a version 3 story, and that it fits in memory.

### Playing

1. Load `zm3.comx` (in Emma 02, or from DOS on a real COMX with the disk drive).
2. Insert one of the story `.img` files from `InfoCom/Games/` as the story disk.
3. Start the interpreter. It reads the story from the disk and begins the game.

### Included stories

| Title | File |
|---|---|
| Ballyhoo | `ballyhoo.img` |
| Cutthroats | `cutthroats.img` |
| Deadline | `deadline.img` |
| Enchanter | `enchanter.img` |
| The Hitchhiker's Guide to the Galaxy | `hhgg.img` |
| Infidel | `infidel.img` |
| Leather Goddesses of Phobos | `leather_goddesses_of_phobos.img` |
| Moonmist | `moonmist.img` |
| Planetfall | `planetfall.img` |
| Plundered Hearts | `plundered_hearts.img` |
| Seastalker | `seastalker.img` |
| Starcross | `starcross.img` |
| Suspect | `suspect.img` |
| Suspended | `suspended.img` |
| The Witness | `witness.img` |
| Zork I: The Great Underground Empire | `zork1.img` |
| Zork II: The Wizard of Frobozz | `zork2.img` |
| Zork III: The Dungeon Master | `zork_3.img` |

---

## AI ports and recreations

### LANTERN DEEP (`AI/Lattern/`)

A machine-code cave platformer. The cave is 8 rooms wide and 29 rooms deep, with ledges, ladders, an underground river and a balloon ride. You collect gold and light lanterns, which become your restart points, while avoiding scorpions, bats, birds and electric eels. There is no game over: getting caught or taking a hard fall costs points.

- The room layout follows a 1984 C64 cartridge game owned by the author. The code, graphics and music are new.
- Runs on PAL and NTSC machines. It times the video frame at start-up so the game runs at the same speed on both, and `P` on the title screen switches the timing by hand.
- Controls are the cursor keys, the joystick or WASD. `M` toggles music, `E` toggles sound effects, `Esc`/`Q` quits to BASIC.
- **To run:** load `LANTERN.comx` and type `RUN` (starts with `10 CALL(@4401)`). Needs 32 KB RAM.
- See `Lantern_Deep_Players_Guide.pdf` for the full guide.

### COMX-35 Color Life (`AI/Life/`)

Conway's Game of Life on a 40 × 23 grid. Each cell is colored by how long it has been alive: green when newborn, then yellow, red, magenta and cyan, and white once stable. You can watch gliders move and still lifes settle.

- **To run:** load `Life.comx`, then type `CALL(@4500)`. `PRINT PEEK(@4500)` should return 248 if the program loaded correctly.
- **Keys:** `1` new random pattern · `2` cycle background color · `0` show/hide generation counter · `3` color on/off · `RESET` back to BASIC.
- See `Life_User_Guide.pdf` for the full guide.

### The Oregon Trail (`AI/OregonTrail/`)

Two COMX-35 BASIC versions:

- **`OT1978.comx`**: after the 1978 classic text version. You buy oxen, food, ammunition, clothing and supplies with $700, pick a marksmanship level and set out on the trail.
- **`OT1990.comx`**: a recreation of the **1990 MECC DOS version 2.0**. It has the main menu, occupations (banker, carpenter or farmer), a named wagon party, a choice of departure month from Independence, Missouri in 1848, and the Oregon Top Ten.

**To run:** load the file and type `RUN`.

### Super Star Trek (`AI/SuperTrek/`)

A COMX-35 BASIC version of the 1978 *Super Star Trek*. You command the Enterprise across an 8 × 8 galaxy of quadrants and must destroy the Klingon fleet before the deadline stardate, using `NAV`, `SRS`, `LRS`, phasers, torpedoes, shields, the library computer and starbases. It uses COMX `SHAPE` redefinitions for its custom characters. The BASIC source is included as `SSTREK.BAS`.

- **To run:** in Emma 02, press RUN and choose `SSTREK.comx`, or `LOAD` it and type `run`.
- **Emma 02 tip:** turn Caps Lock **off** and type in lowercase, since Emma sends lowercase as COMX capitals. With Caps Lock on you'll get graphics characters and `ERR CODE 27`.
- See `SSTREK_Instructions.pdf` for the full command reference.

---

## Requirements

- **Emulator:** [Emma 02](https://www.emma02.hobby-site.com/) with a COMX-35 (PAL or NTSC) configuration and the disk drive enabled for the Infocom stories.
- **Real hardware:** a COMX-35 with the standard 32 KB of RAM. The Infocom stories need the COMX disk drive (FDC card). `.comx` programs can also be loaded from tape with `PLOAD` through a cassette interface.

---

## Legal

The Infocom games are copyright their original rights holders (Infocom / Activision). The Oregon Trail is a trademark of its respective owner, and *Super Star Trek* is based on the 1978 public BASIC program. The ports in this repository are unofficial, non-commercial hobby projects for the COMX-35 retro-computing community. They are not affiliated with or endorsed by any of these companies.
