;=====================================================================
; LILYLEAP.ASM - LILY LEAP for the COMX-35 (1802 machine code, A18 syntax)
; An original frog-crossing game.  Start: CALL(@4500).
;=====================================================================
PAGE    EQU     0F800H
CRAM    EQU     0F400H
R3ON    EQU     000C0H
R3OFF   EQU     000D0H
R4OFF   EQU     00080H
R5NORM  EQU     08088H
R5CMEM  EQU     08089H
LDCELL  EQU     00089H
K_UP    EQU     00082H
K_RIGHT EQU     00083H
K_LEFT  EQU     00084H
K_DOWN  EQU     00085H
K_ESC   EQU     00081H
K_CR    EQU     00080H
BGBUF   EQU     0A000H
QBUF    EQU     0A700H
CSAVE   EQU     09C00H
LBUF    EQU     08800H
SAVESP  EQU     0AA00H
RND     EQU     0AA02H
LASTK   EQU     0AA04H
RPT     EQU     0AA05H
QN      EQU     0AA06H
QR      EQU     0AA07H
QRO     EQU     0AA08H
SNDT    EQU     0AA09H
SNDS    EQU     0AA0AH
SNDW    EQU     0AA0BH
NSDT    EQU     0AA0DH
MUST    EQU     0AA0EH
MUSP    EQU     0AA0FH
MUTE    EQU     0AA11H
GOVER   EQU     0AA12H
SCORE   EQU     0AA13H
HISC    EQU     0AA19H
FRM     EQU     0AA1FH
LASTD   EQU     0AA21H
FCNT    EQU     0AA22H
FRESH   EQU     0AA23H
VCAP    EQU     0AA24H
DIRECT  EQU     0AA25H
TMPA    EQU     0AA26H
TMPB    EQU     0AA27H
TMPC    EQU     0AA28H
LOFF    EQU     0AA29H
LCNT    EQU     0AA31H
LIV     EQU     0AA39H
DST     EQU     0AA41H
DTM     EQU     0AA49H
FX      EQU     0AA51H
FS      EQU     0AA52H
FD      EQU     0AA53H
OFX     EQU     0AA54H
OFS     EQU     0AA55H
FDRAW   EQU     0AA56H
FBEST   EQU     0AA57H
HOPCD   EQU     0AA58H
DEAD    EQU     0AA59H
DTYPE   EQU     0AA5AH
LIVES   EQU     0AA5BH
LEVEL   EQU     0AA5CH
TIME    EQU     0AA5DH
TSUB    EQU     0AA5EH
BAYS    EQU     0AA5FH
FLYB    EQU     0AA60H
FLYT    EQU     0AA61H
KEY     EQU     0AA62H
SCD     EQU     0AA63H
LVL0    EQU     0AA64H
ODEAD   EQU     0AA65H
DPH     EQU     0AA66H
        ORG     4500H
START   SEX     R2
        GLO     R1
        STXD
        GHI     R1
        STXD
        GLO     R4
        STXD
        GHI     R4
        STXD
        GLO     R5
        STXD
        GHI     R5
        STXD
        GLO     R6
        STXD
        GHI     R6
        STXD
        GLO     R7
        STXD
        GHI     R7
        STXD
        GLO     R8
        STXD
        GHI     R8
        STXD
        GLO     R9
        STXD
        GHI     R9
        STXD
        GLO     RA
        STXD
        GHI     RA
        STXD
        GLO     RB
        STXD
        GHI     RB
        STXD
        GLO     RC
        STXD
        GHI     RC
        STXD
        GLO     RD
        STXD
        GHI     RD
        STXD
        GLO     RE
        STXD
        GHI     RE
        STXD
        GLO     RF
        STXD
        GHI     RF
        STXD
        SEX     R3
        DIS
        BYTE    23H
        LDI     HIGH (SCALL)
        PHI     R4
        LDI     LOW (SCALL)
        PLO     R4
        LDI     HIGH (SRET)
        PHI     R5
        LDI     LOW (SRET)
        PLO     R5
        LDI     HIGH (QP1)
        PHI     R1
        LDI     LOW (QP1)
        PLO     R1
        LDI     HIGH (SAVESP)
        PHI     RA
        LDI     LOW (SAVESP)
        PLO     RA
        GLO     R2
        STR     RA
        INC     RA
        GHI     R2
        STR     RA
        LDI     0
        PHI     R7
        LBR     INIT
        SEP     R3
SCALL   PHI     RF
        SEX     R2
        GHI     R6
        STXD
        GLO     R6
        STXD
        GHI     R3
        PHI     R6
        GLO     R3
        PLO     R6
        LDA     R6
        PHI     R3
        LDA     R6
        PLO     R3
        GHI     RF
        BR      SCALL-1
        SEP     R3
SRET    PHI     RF
        SEX     R2
        GHI     R6
        PHI     R3
        GLO     R6
        PLO     R3
        INC     R2
        LDA     R2
        PLO     R6
        LDN     R2
        PHI     R6
        GHI     RF
        BR      SRET-1
VIDINIT SEX     R3
        OUT     3
        BYTE    R3OFF
        LDI     HIGH (R4OFF)
        PHI     RF
        LDI     LOW (R4OFF)
        PLO     RF
        SEX     RF
        OUT     4
        LDI     HIGH (R5NORM)
        PHI     RF
        LDI     LOW (R5NORM)
        PLO     RF
        OUT     5
        LDI     HIGH (PAGE)
        PHI     RF
        LDI     LOW (PAGE)
        PLO     RF
        OUT     7
        SEX     R2
        SEP     R5
VIDON   SEX     R3
        OUT     3
        BYTE    R3ON
        SEX     R2
        SEP     R5
VIDOFF  SEX     R3
        OUT     3
        BYTE    R3OFF
        SEX     R2
        SEP     R5
; WAITVB - return at the start of the non-display period
WAITVB
WV1     BN1     WV1
WV2     B1      WV2
        SEP     R5
CMEMON
        LDI     HIGH (PAGE+LDCELL)
        PHI     RA
        LDI     LOW (PAGE+LDCELL)
        PLO     RA
        GLO     RE
        STR     RA
        LDI     HIGH (R5CMEM)
        PHI     RF
        LDI     LOW (R5CMEM)
        PLO     RF
        SEX     RF
        OUT     5
        LDI     HIGH (LDCELL)
        PHI     RF
        LDI     LOW (LDCELL)
        PLO     RF
        OUT     6
        SEX     R2
        LDI     HIGH (CRAM)
        PHI     RB
        LDI     LOW (CRAM)
        PLO     RB
        SEP     R5
CMEMOFF
        LDI     HIGH (R5NORM)
        PHI     RF
        LDI     LOW (R5NORM)
        PLO     RF
        SEX     RF
        OUT     5
        SEX     R2
        SEP     R5
CHSAVE
        LDI     HIGH (CSAVE)
        PHI     RC
        LDI     LOW (CSAVE)
        PLO     RC
        LDI     0
        PLO     RE
CSV1
        SEP     R4
        WORD    CMEMON
        LDI     8
        PHI     RE
CSV2    LDA     RB
        STR     RC
        INC     RC
        GHI     RE
        SMI     1
        PHI     RE
        LBNZ    CSV2
        SEP     R4
        WORD    CMEMOFF
        INC     RE
        GLO     RE
        XRI     80H
        LBNZ    CSV1
        SEP     R5
CHREST
        LDI     HIGH (CSAVE)
        PHI     RC
        LDI     LOW (CSAVE)
        PLO     RC
        LBR     CHWR
CHLOAD
        LDI     HIGH (CHTAB)
        PHI     RC
        LDI     LOW (CHTAB)
        PLO     RC
CHWR    LDI     0
        PLO     RE
CLD1
        SEP     R4
        WORD    CMEMON
        LDI     8
        PHI     RE
CLD2    LDA     RC
        STR     RB
        INC     RB
        GHI     RE
        SMI     1
        PHI     RE
        LBNZ    CLD2
        SEP     R4
        WORD    CMEMOFF
        INC     RE
        GLO     RE
        XRI     80H
        LBNZ    CLD1
        SEP     R5
; CLRSCR - blank the page (display off)
CLRSCR
        LDI     HIGH (PAGE)
        PHI     RA
        LDI     LOW (PAGE)
        PLO     RA
        LDI     HIGH (960)
        PHI     RE
        LDI     LOW (960)
        PLO     RE
CS1     LDI     20H
        STR     RA
        INC     RA
        DEC     RE
        GLO     RE
        LBNZ    CS1
        GHI     RE
        LBNZ    CS1
        SEP     R5
; POS - RE.1 = row, RE.0 = col -> RD = page address (uses RA)
POS     GHI     RE
        SHL
        ADI     LOW ROWTAB
        PLO     RA
        LDI     HIGH ROWTAB
        ADCI    0
        PHI     RA
        LDA     RA
        PHI     RD
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        PLO     RD
        GHI     RD
        ADCI    0
        PHI     RD
        SEP     R5
; PRT - RC = text, RD = page address, RF.0 = OR mask (80H = PCB).  Writes directly (display off)
PRT     LDA     RC
        LBZ     PRX
        STR     R2
        GLO     RF
        OR
        STR     RD
        INC     RD
        LBR     PRT
PRX     SEP     R5
; RAND - D = next pseudo-random byte (16-bit LFSR)
RAND
        LDI     HIGH (RND)
        PHI     RA
        LDI     LOW (RND)
        PLO     RA
        LDA     RA
        PHI     R7
        LDN     RA
        PLO     R7
        GHI     R7
        SHR
        PHI     R7
        GLO     R7
        SHRC
        PLO     R7
        LBNF    RD1
        GHI     R7
        XRI     0B4H
        PHI     R7
RD1     DEC     RA
        GHI     R7
        STR     RA
        INC     RA
        GLO     R7
        STR     RA
        LDI     0
        PHI     R7
        GLO     R7
        SEP     R5
GETKEY  BN3     GKN
        LBR     GK1
GKN
        LDI     HIGH (LASTK)
        PHI     RA
        LDI     LOW (LASTK)
        PLO     RA
        LDN     RA
        LBZ     GKX
        B2      GKH
        LDI     0
        STR     RA
        LBR     GKX
GKH
        LDI     HIGH (RPT)
        PHI     RB
        LDI     LOW (RPT)
        PLO     RB
        LDN     RB
        SMI     1
        STR     RB
        LBNZ    GKX
        LDI     3
        STR     RB
        LDN     RA
        SEP     R5
GKX     LDI     0
        SEP     R5
GK1     SEX     R2
        INP     3
        PLO     R7
        SMI     61H
        LBNF    GK2
        GLO     R7
        SMI     7BH
        LBDF    GK2
        GLO     R7
        SMI     20H
        PLO     R7
GK2
        LDI     HIGH (LASTK)
        PHI     RA
        LDI     LOW (LASTK)
        PLO     RA
        LDI     0
        STR     RA
        GLO     R7
        SMI     82H
        LBNF    GK3
        SMI     4
        LBDF    GK3
        GLO     R7
        STR     RA
        LDI     HIGH (RPT)
        PHI     RB
        LDI     LOW (RPT)
        PLO     RB
        LDI     10
        STR     RB
GK3     GLO     R7
        SEP     R5
; SOUND - RC = tone word, D = frames, SNDS = sweep step
SOUND
        PLO     R7
        LDI     HIGH (SNDT)
        PHI     RA
        LDI     LOW (SNDT)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (SNDW)
        PHI     RA
        LDI     LOW (SNDW)
        PLO     RA
        GHI     RC
        STR     RA
        INC     RA
        GLO     RC
        STR     RA
        SEX     RC
        OUT     4
        SEX     R2
        SEP     R5
; NOISE - RC = noise word (high byte, low byte 80H), D = frames
NOISE
        PLO     R7
        LDI     HIGH (NSDT)
        PHI     RA
        LDI     LOW (NSDT)
        PLO     RA
        GLO     R7
        STR     RA
        SEX     RC
        OUT     5
        SEX     R2
        SEP     R5
SNDTICK
        LDI     HIGH (SNDT)
        PHI     RA
        LDI     LOW (SNDT)
        PLO     RA
        LDN     RA
        LBZ     ST3
        SMI     1
        STR     RA
        LBNZ    ST2
        LDI     HIGH (R4OFF)
        PHI     RF
        LDI     LOW (R4OFF)
        PLO     RF
        SEX     RF
        OUT     4
        SEX     R2
        LBR     ST3
ST2
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDN     RA
        LBZ     ST3
        STR     R2
        LDI     HIGH (SNDW)
        PHI     RA
        LDI     LOW (SNDW)
        PLO     RA
        LDN     RA
        ADD
        ANI     7FH
        STR     RA
        PHI     RF
        INC     RA
        LDN     RA
        PLO     RF
        SEX     RF
        OUT     4
        SEX     R2
ST3
        LDI     HIGH (NSDT)
        PHI     RA
        LDI     LOW (NSDT)
        PLO     RA
        LDN     RA
        LBZ     ST4
        SMI     1
        STR     RA
        LBNZ    ST4
        LDI     HIGH (R5NORM)
        PHI     RF
        LDI     LOW (R5NORM)
        PLO     RF
        SEX     RF
        OUT     5
        SEX     R2
ST4     SEP     R5
SILENCE
        LDI     HIGH (SNDT)
        PHI     RA
        LDI     LOW (SNDT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (NSDT)
        PHI     RA
        LDI     LOW (NSDT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (R4OFF)
        PHI     RF
        LDI     LOW (R4OFF)
        PLO     RF
        SEX     RF
        OUT     4
        LDI     HIGH (R5NORM)
        PHI     RF
        LDI     LOW (R5NORM)
        PLO     RF
        OUT     5
        SEX     R2
        SEP     R5
QPRET   LDI     0
        PHI     R7
        SEP     R3
QP1     PLO     R7
        GHI     RE
        SHL
        ADI     LOW ROWTAB
        PLO     RC
        LDI     HIGH ROWTAB
        ADCI    0
        PHI     RC
        LDA     RC
        PHI     RD
        LDN     RC
        STR     R2
        GLO     RE
        ADD
        PLO     RD
        GHI     RD
        ADCI    0
        PHI     RD
        GLO     RD
        PLO     RC
        GHI     RD
        ADI     0A8H
        PHI     RC
        GHI     R7
        LBZ     QP0
        GLO     R7
        STR     RC
QP0     GLO     R7
        LBNZ    QP2
        LDN     RC
        PLO     R7
QP2     LDI     HIGH DIRECT
        PHI     RA
        LDI     LOW DIRECT
        PLO     RA
        LDN     RA
        LBZ     QP3
        GLO     R7
        STR     RD
        LBR     QPRET
QP3
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        SMI     250
        LBDF    QPRET
        LDN     RA
        ADI     1
        STR     RA
        SMI     1
        PLO     RC
        SHL
        PLO     RA
        LDI     0
        RSHL
        PHI     RA
        GLO     RC
        STR     R2
        GLO     RA
        ADD
        PLO     RA
        GHI     RA
        ADCI    HIGH QBUF
        PHI     RA
        GHI     RD
        STR     RA
        INC     RA
        GLO     RD
        STR     RA
        INC     RA
        GLO     R7
        STR     RA
        LBR     QPRET
VBDRAW
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        LBZ     VBE
        PLO     R8
        STR     R2
        LDI     HIGH (VCAP)
        PHI     RA
        LDI     LOW (VCAP)
        PLO     RA
        LDN     RA
        SD
        LBNF    VBD2
        LDN     RA
        PLO     R8
VBD2
        LDI     HIGH (VCAP)
        PHI     RA
        LDI     LOW (VCAP)
        PLO     RA
        LDI     60
        STR     RA
        LDI     HIGH (QBUF)
        PHI     RA
        LDI     LOW (QBUF)
        PLO     RA
        LDI     0
        PLO     R9
VBQ     LDA     RA
        PHI     RD
        LDA     RA
        PLO     RD
        LDA     RA
        B1      VBQ2
        STR     RD
        INC     R9
        DEC     R8
        GLO     R8
        LBNZ    VBQ
        LBR     VBS
VBQ2    DEC     RA
        DEC     RA
        DEC     RA
VBS     GLO     RA
        PLO     RF
        GHI     RA
        PHI     RF
        GLO     R9
        STR     R2
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        SM
        LBZ     VBE
        PLO     R9
        PLO     R7
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        GLO     R7
        STR     RA
        GLO     RF
        PLO     RC
        GHI     RF
        PHI     RC
        LDI     HIGH (QBUF)
        PHI     RD
        LDI     LOW (QBUF)
        PLO     RD
        LDI     0
        PHI     R9
VBC     LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        DEC     R9
        GLO     R9
        LBNZ    VBC
        SEP     R5
VBE
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R5
PRQ     LDA     RB
        LBZ     PRQX
        STR     R2
        GLO     R8
        OR
        SEP     R1
        INC     RE
        LBR     PRQ
PRQX    SEP     R5
QFLUSH
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        LBZ     QFX
        PLO     R8
        LDI     HIGH (QBUF)
        PHI     RA
        LDI     LOW (QBUF)
        PLO     RA
QF1     LDA     RA
        PHI     RD
        LDA     RA
        PLO     RD
        LDA     RA
        STR     RD
        DEC     R8
        GLO     R8
        LBNZ    QF1
QFX
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (QR)
        PHI     RA
        LDI     LOW (QR)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (QRO)
        PHI     RA
        LDI     LOW (QRO)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R5
COPYMEM LDA     RC
        STR     RD
        INC     RD
        DEC     RE
        GLO     RE
        LBNZ    COPYMEM
        GHI     RE
        LBNZ    COPYMEM
        SEP     R5
FILL    PLO     R7
FL1     GLO     R7
        STR     RD
        INC     RD
        DEC     RE
        GLO     RE
        LBNZ    FL1
        GHI     RE
        LBNZ    FL1
        SEP     R5
WAITN   PLO     R9
WN1
        SEP     R4
        WORD    WAITVB
        SEP     R4
        WORD    SNDTICK
        DEC     R9
        GLO     R9
        LBNZ    WN1
        SEP     R5
BUILD
        GLO     R8
        ADI     LOW DST
        PLO     RA
        LDI     HIGH DST
        ADCI    0
        PHI     RA
        LDN     RA
        SHL
        PHI     R9
        GLO     R8
        SHR
        SHR
        PHI     RB
        GLO     R8
        SHL
        SHL
        SHL
        SHL
        SHL
        SHL
        ADI     LOW PATS
        PLO     RB
        GHI     RB
        ADCI    HIGH PATS
        PHI     RB
        GLO     R8
        ADI     HIGH LBUF
        PHI     RC
        LDI     0
        PLO     RC
BU1     LDA     RB
        PLO     R9
        SMI     18
        LBNF    BU2
        GHI     R9
        STR     R2
        GLO     R9
        ADD
        PLO     R9
BU2
        GLO     R9
        ADI     LOW TTOP
        PLO     RA
        LDI     HIGH TTOP
        ADCI    0
        PHI     RA
        LDN     RA
        STR     RC
        PLO     R7
        GLO     RC
        ADI     64
        PLO     RD
        GHI     RC
        PHI     RD
        GLO     R7
        STR     RD
        GLO     R9
        ADI     LOW TBOT
        PLO     RA
        LDI     HIGH TBOT
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     R7
        GLO     RC
        ADI     128
        PLO     RD
        GLO     R7
        STR     RD
        GLO     RD
        ADI     64
        PLO     RD
        GLO     R7
        STR     RD
        INC     RC
        GLO     RC
        ANI     7
        LBNZ    BU3
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD1
        LDN     RA
        LBZ     TKX1
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX1
TKD1    LDI     1
        STR     RA
TKX1
BU3     GLO     RC
        XRI     64
        LBNZ    BU1
        SEP     R5
LDRAW
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD2
        LDN     RA
        LBZ     TKX2
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX2
TKD2    LDI     1
        STR     RA
TKX2
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        SMI     150
        LBDF    LDX
        GLO     R8
        ADI     LOW LOFF
        PLO     RA
        LDI     HIGH LOFF
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     R9
        GLO     R8
        ADI     HIGH LBUF
        PHI     R9
        GLO     R8
        ADI     LOW LROWS
        PLO     RA
        LDI     HIGH LROWS
        ADCI    0
        PHI     RA
        LDN     RA
        SHL
        ADI     LOW ROWTAB
        PLO     RA
        LDI     HIGH ROWTAB
        ADCI    0
        PHI     RA
        LDA     RA
        PHI     RC
        LDN     RA
        PLO     RC
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        PLO     R7
        SHL
        PLO     RD
        LDI     0
        RSHL
        PHI     RD
        GLO     R7
        STR     R2
        GLO     RD
        ADD
        PLO     RD
        GHI     RD
        ADCI    HIGH QBUF
        PHI     RD
        LDI     0
        PHI     R8
        LDI     2
        PLO     RF
LD0     GLO     RC
        PLO     RB
        GHI     RC
        ADI     0A8H
        PHI     RB
        LDI     40
        PLO     RE
LD1     LDA     R9
        STR     R2
        LDN     RB
        XOR
        LBZ     LD2
        LDN     R2
        STR     RB
        GHI     RB
        ADI     58H
        STR     RD
        INC     RD
        GLO     RB
        STR     RD
        INC     RD
        LDN     R2
        STR     RD
        INC     RD
        GHI     R8
        ADI     1
        PHI     R8
LD2     INC     RB
        DEC     RE
        GLO     RE
        XRI     20
        LBNZ    LD3
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD3
        LDN     RA
        LBZ     TKX3
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX3
TKD3    LDI     1
        STR     RA
TKX3
LD3     GLO     RE
        LBNZ    LD1
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD4
        LDN     RA
        LBZ     TKX4
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX4
TKD4    LDI     1
        STR     RA
TKX4
        GLO     R9
        ADI     88
        PLO     R9
        GLO     RC
        ADI     40
        PLO     RC
        GHI     RC
        ADCI    0
        PHI     RC
        DEC     RF
        GLO     RF
        LBNZ    LD0
        GHI     R8
        STR     R2
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        ADD
        STR     RA
LDX     SEP     R5
EDRAW
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        SMI     150
        LBDF    EDX
        GLO     R8
        ADI     LOW LOFF
        PLO     RA
        LDI     HIGH LOFF
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     RE
        GLO     R8
        ADI     HIGH LBUF
        PHI     R9
        GLO     R8
        ADI     LOW LROWS
        PLO     RA
        LDI     HIGH LROWS
        ADCI    0
        PHI     RA
        LDN     RA
        SHL
        ADI     LOW ROWTAB
        PLO     RA
        LDI     HIGH ROWTAB
        ADCI    0
        PHI     RA
        LDA     RA
        ADI     0A8H
        PHI     RC
        LDN     RA
        PLO     RC
        GLO     R8
        SHL
        ADI     LOW EDGP
        PLO     RA
        LDI     HIGH EDGP
        ADCI    0
        PHI     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDA     RB
        PLO     RF
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        PLO     R7
        SHL
        PLO     RD
        LDI     0
        RSHL
        PHI     RD
        GLO     R7
        STR     R2
        GLO     RD
        ADD
        PLO     RD
        GHI     RD
        ADCI    HIGH QBUF
        PHI     RD
        LDI     0
        PHI     R8
ED1     LDA     RB
        STR     R2
        GLO     RE
        SD
        ANI     63
        PLO     R7
        SMI     40
        LBDF    ED4
        GLO     R7
        STR     R2
        GLO     RE
        ADD
        PLO     R9
        GLO     R7
        STR     R2
        GLO     RC
        ADD
        PLO     RA
        GHI     RC
        ADCI    0
        PHI     RA
        LDN     R9
        STR     R2
        LDN     RA
        XOR
        LBZ     ED2
        LDN     R2
        STR     RA
        GHI     RA
        ADI     58H
        STR     RD
        INC     RD
        GLO     RA
        STR     RD
        INC     RD
        LDN     R2
        STR     RD
        INC     RD
        GHI     R8
        ADI     1
        PHI     R8
ED2     GLO     R9
        ADI     128
        PLO     R9
        GLO     RA
        ADI     40
        PLO     RA
        GHI     RA
        ADCI    0
        PHI     RA
        LDN     R9
        STR     R2
        LDN     RA
        XOR
        LBZ     ED3
        LDN     R2
        STR     RA
        GHI     RA
        ADI     58H
        STR     RD
        INC     RD
        GLO     RA
        STR     RD
        INC     RD
        LDN     R2
        STR     RD
        INC     RD
        GHI     R8
        ADI     1
        PHI     R8
ED3
ED4     DEC     RF
        GLO     RF
        LBNZ    ED1
        GHI     R8
        STR     R2
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        ADD
        STR     RA
EDX     SEP     R5
LANES
        LDI     0
        PLO     R8
        LDI     HIGH (TMPB)
        PHI     RA
        LDI     LOW (TMPB)
        PLO     RA
        LDI     3
        STR     RA
LA1
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD5
        LDN     RA
        LBZ     TKX5
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX5
TKD5    LDI     1
        STR     RA
TKX5
        GLO     R8
        ADI     LOW LCNT
        PLO     RA
        LDI     HIGH LCNT
        ADCI    0
        PHI     RA
        LDN     RA
        SMI     1
        LBZ     LA2
        STR     RA
        LBR     LA5
LA2
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        SMI     140
        LBDF    LA5
        LDI     HIGH (TMPB)
        PHI     RA
        LDI     LOW (TMPB)
        PLO     RA
        LDN     RA
        LBZ     LA5
        SMI     1
        STR     RA
        GLO     R8
        ADI     LOW LIV
        PLO     RA
        LDI     HIGH LIV
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        GLO     R8
        ADI     LOW LCNT
        PLO     RA
        LDI     HIGH LCNT
        ADCI    0
        PHI     RA
        LDN     R2
        STR     RA
        GLO     R8
        ADI     LOW LDIRS
        PLO     RA
        LDI     HIGH LDIRS
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        GLO     R8
        ADI     LOW LOFF
        PLO     RA
        LDI     HIGH LOFF
        ADCI    0
        PHI     RA
        LDN     RA
        SM
        ANI     63
        STR     RA
        GLO     R8
        STXD
        SEP     R4
        WORD    EDRAW
        IRX
        LDX
        PLO     R8
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD6
        LDN     RA
        LBZ     TKX6
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX6
TKD6    LDI     1
        STR     RA
TKX6
        GLO     R8
        ADI     LOW LSLOT
        PLO     RA
        LDI     HIGH LSLOT
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        LDI     HIGH (FS)
        PHI     RA
        LDI     LOW (FS)
        PLO     RA
        LDN     RA
        XOR
        LBNZ    LA5
        LDI     HIGH (FDRAW)
        PHI     RA
        LDI     LOW (FDRAW)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    LA5
        GLO     R8
        SMI     4
        LBDF    LA5
        GLO     R8
        ADI     LOW LDIRS
        PLO     RA
        LDI     HIGH LDIRS
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        LDI     HIGH (FX)
        PHI     RA
        LDI     LOW (FX)
        PLO     RA
        LDN     RA
        ADD
        STR     RA
LA5     INC     R8
        GLO     R8
        XRI     8
        LBNZ    LA1
        LDI     1
        PLO     R8
        GLO     R8
        ADI     LOW DTM
        PLO     RA
        LDI     HIGH DTM
        ADCI    0
        PHI     RA
        LDN     RA
        SMI     1
        LBZ     DW1
        STR     RA
        LBR     DV1
DW1
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        SMI     90
        LBDF    DV1
        GLO     R8
        ADI     LOW DPH
        PLO     RA
        LDI     HIGH DPH
        ADCI    0
        PHI     RA
        LDN     RA
        ADI     1
        ANI     3
        STR     RA
        PLO     R9
        ADI     LOW DSTATE
        PLO     RC
        LDI     HIGH DSTATE
        ADCI    0
        PHI     RC
        LDN     RC
        STR     R2
        GLO     R8
        ADI     LOW DST
        PLO     RA
        LDI     HIGH DST
        ADCI    0
        PHI     RA
        LDN     R2
        STR     RA
        GLO     R9
        ADI     LOW DTIME
        PLO     RC
        LDI     HIGH DTIME
        ADCI    0
        PHI     RC
        LDN     RC
        STR     R2
        GLO     R8
        ADI     LOW DTM
        PLO     RA
        LDI     HIGH DTM
        ADCI    0
        PHI     RA
        LDN     R2
        STR     RA
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD7
        LDN     RA
        LBZ     TKX7
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX7
TKD7    LDI     1
        STR     RA
TKX7
        SEP     R4
        WORD    BUILD
        LDI     1
        PLO     R8
        SEP     R4
        WORD    LDRAW
        LDI     HIGH (FS)
        PHI     RA
        LDI     LOW (FS)
        PLO     RA
        LDN     RA
        XRI     2
        LBNZ    DV1
        LDI     HIGH (FDRAW)
        PHI     RA
        LDI     LOW (FDRAW)
        PLO     RA
        LDI     1
        STR     RA
DV1
        LDI     3
        PLO     R8
        GLO     R8
        ADI     LOW DTM
        PLO     RA
        LDI     HIGH DTM
        ADCI    0
        PHI     RA
        LDN     RA
        SMI     1
        LBZ     DW3
        STR     RA
        LBR     DV3
DW3
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        SMI     90
        LBDF    DV3
        GLO     R8
        ADI     LOW DPH
        PLO     RA
        LDI     HIGH DPH
        ADCI    0
        PHI     RA
        LDN     RA
        ADI     1
        ANI     3
        STR     RA
        PLO     R9
        ADI     LOW DSTATE
        PLO     RC
        LDI     HIGH DSTATE
        ADCI    0
        PHI     RC
        LDN     RC
        STR     R2
        GLO     R8
        ADI     LOW DST
        PLO     RA
        LDI     HIGH DST
        ADCI    0
        PHI     RA
        LDN     R2
        STR     RA
        GLO     R9
        ADI     LOW DTIME
        PLO     RC
        LDI     HIGH DTIME
        ADCI    0
        PHI     RC
        LDN     RC
        STR     R2
        GLO     R8
        ADI     LOW DTM
        PLO     RA
        LDI     HIGH DTM
        ADCI    0
        PHI     RA
        LDN     R2
        STR     RA
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD8
        LDN     RA
        LBZ     TKX8
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX8
TKD8    LDI     1
        STR     RA
TKX8
        SEP     R4
        WORD    BUILD
        LDI     3
        PLO     R8
        SEP     R4
        WORD    LDRAW
        LDI     HIGH (FS)
        PHI     RA
        LDI     LOW (FS)
        PLO     RA
        LDN     RA
        XRI     4
        LBNZ    DV3
        LDI     HIGH (FDRAW)
        PHI     RA
        LDI     LOW (FDRAW)
        PLO     RA
        LDI     1
        STR     RA
DV3
        SEP     R5
FROGCH
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBZ     FC1
        LDI     HIGH (DTYPE)
        PHI     RA
        LDI     LOW (DTYPE)
        PLO     RA
        LDN     RA
        LBZ     FC0
        LDI     HIGH (SQCH)
        PHI     RB
        LDI     LOW (SQCH)
        PLO     RB
        SEP     R5
FC0
        LDI     HIGH (SPCH)
        PHI     RB
        LDI     LOW (SPCH)
        PLO     RB
        SEP     R5
FC1
        LDI     HIGH (FD)
        PHI     RA
        LDI     LOW (FD)
        PLO     RA
        LDN     RA
        SHL
        SHL
        ADI     LOW FRCH
        PLO     RB
        LDI     HIGH FRCH
        ADCI    0
        PHI     RB
        SEP     R5
FROGPOS
        LDI     HIGH (FS)
        PHI     RA
        LDI     LOW (FS)
        PLO     RA
        LDN     RA
        SHL
        ADI     1
        PHI     RE
        LDI     HIGH (FX)
        PHI     RA
        LDI     LOW (FX)
        PLO     RA
        LDN     RA
        PLO     RE
        SEP     R5
FROGFIX
        LDI     HIGH (FDRAW)
        PHI     RA
        LDI     LOW (FDRAW)
        PLO     RA
        LDN     RA
        LBZ     FFX
        LDI     HIGH (FDRAW)
        PHI     RA
        LDI     LOW (FDRAW)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (OFS)
        PHI     RA
        LDI     LOW (OFS)
        PLO     RA
        LDN     RA
        XRI     0FFH
        LBZ     FF2
        LDI     HIGH (OFS)
        PHI     RA
        LDI     LOW (OFS)
        PLO     RA
        LDN     RA
        SHL
        ADI     1
        PHI     RE
        LDI     HIGH (OFX)
        PHI     RA
        LDI     LOW (OFX)
        PLO     RA
        LDN     RA
        PLO     RE
        LDI     0
        SEP     R1
        INC     RE
        LDI     0
        SEP     R1
        DEC     RE
        GHI     RE
        ADI     1
        PHI     RE
        LDI     0
        SEP     R1
        INC     RE
        LDI     0
        SEP     R1
FF2
        SEP     R4
        WORD    FROGPOS
        SEP     R4
        WORD    FROGCH
        LDA     RB
        SEP     R1
        INC     RE
        LDA     RB
        SEP     R1
        DEC     RE
        GHI     RE
        ADI     1
        PHI     RE
        LDA     RB
        SEP     R1
        INC     RE
        LDA     RB
        SEP     R1
        LDI     HIGH (FX)
        PHI     RA
        LDI     LOW (FX)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OFX)
        PHI     RA
        LDI     LOW (OFX)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (FS)
        PHI     RA
        LDI     LOW (FS)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OFS)
        PHI     RA
        LDI     LOW (OFS)
        PLO     RA
        GLO     R7
        STR     RA
FFX     SEP     R5
KINDAT  GHI     RE
        SHL
        ADI     LOW ROWTAB
        PLO     RA
        LDI     HIGH ROWTAB
        ADCI    0
        PHI     RA
        LDA     RA
        ADI     0A8H
        PHI     RC
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        PLO     RC
        GHI     RC
        ADCI    0
        PHI     RC
        LDN     RC
        ANI     7FH
        ADI     LOW KINDS
        PLO     RA
        LDI     HIGH KINDS
        ADCI    0
        PHI     RA
        LDN     RA
        SEP     R5
KILL
        PLO     R7
        LDI     HIGH (DTYPE)
        PHI     RA
        LDI     LOW (DTYPE)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDI     50
        STR     RA
        LDI     HIGH (FDRAW)
        PHI     RA
        LDI     LOW (FDRAW)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (DTYPE)
        PHI     RA
        LDI     LOW (DTYPE)
        PLO     RA
        LDN     RA
        LBZ     KL1
        LDI     HIGH (1088H)
        PHI     RC
        LDI     LOW (1088H)
        PLO     RC
        LDI     16
        SEP     R4
        WORD    NOISE
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     2
        STR     RA
        LDI     HIGH (3028H)
        PHI     RC
        LDI     LOW (3028H)
        PLO     RC
        LDI     16
        SEP     R4
        WORD    SOUND
        SEP     R5
KL1
        LDI     HIGH (0488H)
        PHI     RC
        LDI     LOW (0488H)
        PLO     RC
        LDI     24
        SEP     R4
        WORD    NOISE
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (1828H)
        PHI     RC
        LDI     LOW (1828H)
        PLO     RC
        LDI     20
        SEP     R4
        WORD    SOUND
        SEP     R5
CHECK
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    CKX
        LDI     HIGH (FX)
        PHI     RA
        LDI     LOW (FX)
        PLO     RA
        LDN     RA
        ANI     80H
        LBNZ    CKW
        LDI     HIGH (FX)
        PHI     RA
        LDI     LOW (FX)
        PLO     RA
        LDN     RA
        SMI     39
        LBDF    CKW
        LDI     HIGH (FS)
        PHI     RA
        LDI     LOW (FS)
        PLO     RA
        LDN     RA
        LBZ     CKX
        SMI     5
        LBZ     CKX
        LBDF    CKR
        SEP     R4
        WORD    FROGPOS
        SEP     R4
        WORD    KINDAT
        XRI     3
        LBZ     CKX
        INC     RE
        SEP     R4
        WORD    KINDAT
        XRI     3
        LBZ     CKX
CKW
        LDI     HIGH (FX)
        PHI     RA
        LDI     LOW (FX)
        PLO     RA
        LDN     RA
        ANI     80H
        LBZ     CKW1
        LDI     0
        LBR     CKW2
CKW1    LDI     38
CKW2    STR     RA
        LDI     0
        LBR     KILL
CKR
        LDI     HIGH (FS)
        PHI     RA
        LDI     LOW (FS)
        PLO     RA
        LDN     RA
        XRI     10
        LBZ     CKX
        SEP     R4
        WORD    FROGPOS
        SEP     R4
        WORD    KINDAT
        XRI     1
        LBZ     CKS
        INC     RE
        SEP     R4
        WORD    KINDAT
        XRI     1
        LBZ     CKS
        DEC     RE
        GHI     RE
        ADI     1
        PHI     RE
        SEP     R4
        WORD    KINDAT
        XRI     1
        LBZ     CKS
        INC     RE
        SEP     R4
        WORD    KINDAT
        XRI     1
        LBZ     CKS
CKX     SEP     R5
CKS     LDI     1
        LBR     KILL
ADDSC   STR     R2
        LDN     RB
        ADD
        STR     RB
AS1     SMI     10
        LBNF    ASX
        STR     RB
        DEC     RB
        GLO     RB
        XRI     LOW (SCORE-1)
        LBZ     ASX
        LDN     RB
        ADI     1
        STR     RB
        LBR     AS1
ASX
        LDI     HIGH (SCD)
        PHI     RA
        LDI     LOW (SCD)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R5
HOP
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    HPX
        LDI     HIGH (HOPCD)
        PHI     RA
        LDI     LOW (HOPCD)
        PLO     RA
        LDN     RA
        LBZ     HP0
        SMI     1
        STR     RA
        SEP     R5
HP0
        LDI     HIGH (KEY)
        PHI     RA
        LDI     LOW (KEY)
        PLO     RA
        LDN     RA
        LBZ     HPX
        PLO     R9
        LDI     HIGH (KEY)
        PHI     RA
        LDI     LOW (KEY)
        PLO     RA
        LDI     0
        STR     RA
        GLO     R9
        XRI     K_UP
        LBNZ    HP2
        LDI     HIGH (FD)
        PHI     RA
        LDI     LOW (FD)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (FS)
        PHI     RA
        LDI     LOW (FS)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBZ     HOME
        LBR     HPM
HP2     GLO     R9
        XRI     K_DOWN
        LBNZ    HP3
        LDI     HIGH (FD)
        PHI     RA
        LDI     LOW (FD)
        PLO     RA
        LDI     2
        STR     RA
        LDI     HIGH (FS)
        PHI     RA
        LDI     LOW (FS)
        PLO     RA
        LDN     RA
        XRI     10
        LBZ     HPT
        LDI     HIGH (FS)
        PHI     RA
        LDI     LOW (FS)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     HPM
HP3     GLO     R9
        XRI     K_LEFT
        LBNZ    HP4
        LDI     HIGH (FD)
        PHI     RA
        LDI     LOW (FD)
        PLO     RA
        LDI     3
        STR     RA
        LDI     HIGH (FX)
        PHI     RA
        LDI     LOW (FX)
        PLO     RA
        LDN     RA
        SMI     2
        LBNF    HPT
        STR     RA
        LBR     HPM
HP4     GLO     R9
        XRI     K_RIGHT
        LBNZ    HPX
        LDI     HIGH (FD)
        PHI     RA
        LDI     LOW (FD)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (FX)
        PHI     RA
        LDI     LOW (FX)
        PLO     RA
        LDN     RA
        ADI     2
        STR     R2
        SMI     39
        LBDF    HPT
        LDN     R2
        STR     RA
HPM
        LDI     HIGH (HOPCD)
        PHI     RA
        LDI     LOW (HOPCD)
        PLO     RA
        LDI     3
        STR     RA
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (2228H)
        PHI     RC
        LDI     LOW (2228H)
        PLO     RC
        LDI     3
        SEP     R4
        WORD    SOUND
        LDI     HIGH (FS)
        PHI     RA
        LDI     LOW (FS)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (FBEST)
        PHI     RA
        LDI     LOW (FBEST)
        PLO     RA
        LDN     RA
        SM
        LBZ     HPT
        LBNF    HPT
        LDN     R2
        STR     RA
        LDI     HIGH (SCORE+4)
        PHI     RB
        LDI     LOW (SCORE+4)
        PLO     RB
        LDI     1
        SEP     R4
        WORD    ADDSC
HPT
        LDI     HIGH (FDRAW)
        PHI     RA
        LDI     LOW (FDRAW)
        PLO     RA
        LDI     1
        STR     RA
HPX     SEP     R5
HOME
        LDI     HIGH (FDRAW)
        PHI     RA
        LDI     LOW (FDRAW)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (FX)
        PHI     RA
        LDI     LOW (FX)
        PLO     RA
        LDN     RA
        PLO     R9
        LDI     0
        PLO     R8
        LDI     2
        PLO     RB
HO1     GLO     R9
        ADI     1
        STR     R2
        GLO     RB
        SD
        LBNF    HO2
        GLO     RB
        ADI     3
        STR     R2
        GLO     R9
        SD
        LBDF    HO3
HO2     GLO     RB
        ADI     8
        PLO     RB
        INC     R8
        GLO     R8
        XRI     5
        LBNZ    HO1
        LDI     1
        LBR     KILL
HO3
        GLO     R8
        ADI     LOW BITS
        PLO     RA
        LDI     HIGH BITS
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        LDI     HIGH (BAYS)
        PHI     RA
        LDI     LOW (BAYS)
        PLO     RA
        LDN     RA
        AND
        LBZ     HO4
        LDI     1
        LBR     KILL
HO4
        GLO     R8
        ADI     LOW BITS
        PLO     RA
        LDI     HIGH BITS
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        LDI     HIGH (BAYS)
        PHI     RA
        LDI     LOW (BAYS)
        PLO     RA
        LDN     RA
        OR
        STR     RA
        GLO     RB
        ADI     1
        PLO     R7
        LDI     HIGH (FX)
        PHI     RA
        LDI     LOW (FX)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (FLYB)
        PHI     RA
        LDI     LOW (FLYB)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     R8
        ADI     1
        XOR
        LBNZ    HO5
        LDI     HIGH (FLYB)
        PHI     RA
        LDI     LOW (FLYB)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (FLYT)
        PHI     RA
        LDI     LOW (FLYT)
        PLO     RA
        LDI     200
        STR     RA
        LDI     HIGH (SCORE+3)
        PHI     RB
        LDI     LOW (SCORE+3)
        PLO     RB
        LDI     2
        SEP     R4
        WORD    ADDSC
HO5
        LDI     HIGH (SCORE+4)
        PHI     RB
        LDI     LOW (SCORE+4)
        PLO     RB
        LDI     5
        SEP     R4
        WORD    ADDSC
        LDI     HIGH (TIME)
        PHI     RA
        LDI     LOW (TIME)
        PLO     RA
        LDN     RA
        SHR
        PLO     R9
HO6     GLO     R9
        LBZ     HO7
        LDI     HIGH (SCORE+4)
        PHI     RB
        LDI     LOW (SCORE+4)
        PLO     RB
        LDI     1
        SEP     R4
        WORD    ADDSC
        DEC     R9
        LBR     HO6
HO7
        LDI     HIGH (FX)
        PHI     RA
        LDI     LOW (FX)
        PLO     RA
        LDN     RA
        PLO     RE
        LDI     1
        PHI     RE
        LDI     HIGH (FRCH)
        PHI     RB
        LDI     LOW (FRCH)
        PLO     RB
        LDI     1
        PHI     R7
        LDA     RB
        SEP     R1
        INC     RE
        LDI     1
        PHI     R7
        LDA     RB
        SEP     R1
        DEC     RE
        GHI     RE
        ADI     1
        PHI     RE
        LDI     1
        PHI     R7
        LDA     RB
        SEP     R1
        INC     RE
        LDI     1
        PHI     R7
        LDA     RB
        SEP     R1
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     254
        STR     RA
        LDI     HIGH (1A28H)
        PHI     RC
        LDI     LOW (1A28H)
        PLO     RC
        LDI     30
        SEP     R4
        WORD    SOUND
        LDI     HIGH (BAYS)
        PHI     RA
        LDI     LOW (BAYS)
        PLO     RA
        LDN     RA
        XRI     1FH
        LBZ     LEVELUP
        SEP     R4
        WORD    NEWFROG
        SEP     R5
LEVELUP
        LDI     HIGH (SCORE+2)
        PHI     RB
        LDI     LOW (SCORE+2)
        PLO     RB
        LDI     1
        SEP     R4
        WORD    ADDSC
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     4
        STR     RA
        SEP     R5
NEWFROG
        LDI     HIGH (FX)
        PHI     RA
        LDI     LOW (FX)
        PLO     RA
        LDI     19
        STR     RA
        LDI     HIGH (FS)
        PHI     RA
        LDI     LOW (FS)
        PLO     RA
        LDI     10
        STR     RA
        LDI     HIGH (FD)
        PHI     RA
        LDI     LOW (FD)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (FBEST)
        PHI     RA
        LDI     LOW (FBEST)
        PLO     RA
        LDI     10
        STR     RA
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (HOPCD)
        PHI     RA
        LDI     LOW (HOPCD)
        PLO     RA
        LDI     6
        STR     RA
        LDI     HIGH (KEY)
        PHI     RA
        LDI     LOW (KEY)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (FDRAW)
        PHI     RA
        LDI     LOW (FDRAW)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (TIME)
        PHI     RA
        LDI     LOW (TIME)
        PLO     RA
        LDI     60
        STR     RA
        LDI     HIGH (TSUB)
        PHI     RA
        LDI     LOW (TSUB)
        PLO     RA
        LDI     15
        STR     RA
        SEP     R4
        WORD    DRAWBAR
        SEP     R5
DRAWBAR
        LDI     HIGH (5893)
        PHI     RE
        LDI     LOW (5893)
        PLO     RE
        LDI     30
        PLO     R8
DB1     LDI     1
        PHI     R7
        LDI     152
        SEP     R1
        INC     RE
        DEC     R8
        GLO     R8
        LBNZ    DB1
        SEP     R5
CLOCK
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    CLX
        LDI     HIGH (TSUB)
        PHI     RA
        LDI     LOW (TSUB)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    CLX
        LDI     15
        STR     RA
        LDI     HIGH (TIME)
        PHI     RA
        LDI     LOW (TIME)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBZ     CLD
        ANI     1
        LBNZ    CLX
        LDI     HIGH (TIME)
        PHI     RA
        LDI     LOW (TIME)
        PLO     RA
        LDN     RA
        SHR
        ADI     5
        PLO     RE
        LDI     23
        PHI     RE
        LDI     1
        PHI     R7
        LDI     20H
        SEP     R1
        LDI     HIGH (TIME)
        PHI     RA
        LDI     LOW (TIME)
        PLO     RA
        LDN     RA
        SMI     12
        LBDF    CLX
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (0C28H)
        PHI     RC
        LDI     LOW (0C28H)
        PLO     RC
        LDI     3
        SEP     R4
        WORD    SOUND
CLX     SEP     R5
CLD     LDI     5
        PLO     RE
        LDI     23
        PHI     RE
        LDI     1
        PHI     R7
        LDI     20H
        SEP     R1
        LDI     1
        LBR     KILL
DYING
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBZ     DYX
        SMI     1
        STR     RA
        LBNZ    DYX
        LDI     HIGH (FDRAW)
        PHI     RA
        LDI     LOW (FDRAW)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (LIVES)
        PHI     RA
        LDI     LOW (LIVES)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        SEP     R4
        WORD    LIVESD
        LDI     HIGH (LIVES)
        PHI     RA
        LDI     LOW (LIVES)
        PLO     RA
        LDN     RA
        LBNZ    DY1
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R5
DY1
        SEP     R4
        WORD    NEWFROG
DYX     SEP     R5
LIVESD
        LDI     HIGH (5924)
        PHI     RE
        LDI     LOW (5924)
        PLO     RE
        LDI     1
        PLO     R8
LV1
        LDI     HIGH (LIVES)
        PHI     RA
        LDI     LOW (LIVES)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     R8
        SD
        LBNF    LV2
        LBZ     LV2
        LDI     17
        LBR     LV3
LV2     LDI     20H
LV3     SEP     R1
        INC     RE
        INC     R8
        GLO     R8
        XRI     5
        LBNZ    LV1
        SEP     R5
SCORED
        LDI     HIGH (SCD)
        PHI     RA
        LDI     LOW (SCD)
        PLO     RA
        LDN     RA
        LBZ     SDX
        LDI     0
        STR     RA
        LDI     HIGH (SCORE)
        PHI     RB
        LDI     LOW (SCORE)
        PLO     RB
        LDI     HIGH (6)
        PHI     RE
        LDI     LOW (6)
        PLO     RE
SD1     LDA     RB
        ADI     0B0H
        SEP     R1
        INC     RE
        GLO     RE
        XRI     12
        LBNZ    SD1
SDX     SEP     R5
FLY
        LDI     HIGH (FLYT)
        PHI     RA
        LDI     LOW (FLYT)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    FYX
        LDI     HIGH (FLYB)
        PHI     RA
        LDI     LOW (FLYB)
        PLO     RA
        LDN     RA
        LBZ     FY2
        SMI     1
        PLO     R8
        LDI     HIGH (FLYB)
        PHI     RA
        LDI     LOW (FLYB)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (FLYT)
        PHI     RA
        LDI     LOW (FLYT)
        PLO     RA
        LDI     160
        STR     RA
        GLO     R8
        ADI     LOW BITS
        PLO     RA
        LDI     HIGH BITS
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        LDI     HIGH (BAYS)
        PHI     RA
        LDI     LOW (BAYS)
        PLO     RA
        LDN     RA
        AND
        LBNZ    FYX
        LDI     0
        PHI     R9
        LBR     FY4
FY2
        SEP     R4
        WORD    RAND
        ANI     7
        PLO     R8
        SMI     5
        LBDF    FY3
        GLO     R8
        ADI     LOW BITS
        PLO     RA
        LDI     HIGH BITS
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        LDI     HIGH (BAYS)
        PHI     RA
        LDI     LOW (BAYS)
        PLO     RA
        LDN     RA
        AND
        LBNZ    FY3
        GLO     R8
        ADI     1
        PLO     R7
        LDI     HIGH (FLYB)
        PHI     RA
        LDI     LOW (FLYB)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (FLYT)
        PHI     RA
        LDI     LOW (FLYT)
        PLO     RA
        LDI     150
        STR     RA
        LDI     4
        PHI     R9
        LBR     FY4
FY3
        LDI     HIGH (FLYT)
        PHI     RA
        LDI     LOW (FLYT)
        PLO     RA
        LDI     30
        STR     RA
FYX     SEP     R5
FY4     GLO     R8
        SHL
        SHL
        SHL
        ADI     3
        PLO     RE
        LDI     1
        PHI     RE
        LDI     HIGH (BAYCH)
        PHI     RB
        LDI     LOW (BAYCH)
        PLO     RB
        GHI     R9
        STR     R2
        GLO     RB
        ADD
        PLO     RB
        GHI     RB
        ADCI    0
        PHI     RB
        LDI     1
        PHI     R7
        LDA     RB
        SEP     R1
        INC     RE
        LDI     1
        PHI     R7
        LDA     RB
        SEP     R1
        DEC     RE
        GHI     RE
        ADI     1
        PHI     RE
        LDI     1
        PHI     R7
        LDA     RB
        SEP     R1
        INC     RE
        LDI     1
        PHI     R7
        LDA     RB
        SEP     R1
        SEP     R5
FILLROW LDI     1
        PHI     R7
        GLO     R9
        SEP     R1
        INC     RE
        DEC     R8
        GLO     R8
        LBNZ    FILLROW
        SEP     R5
BOARD
        SEP     R4
        WORD    VIDOFF
        SEP     R4
        WORD    SILENCE
        LDI     HIGH (DIRECT)
        PHI     RA
        LDI     LOW (DIRECT)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R4
        WORD    CLRSCR
        LDI     HIGH (BGBUF)
        PHI     RD
        LDI     LOW (BGBUF)
        PLO     RD
        LDI     HIGH (960)
        PHI     RE
        LDI     LOW (960)
        PLO     RE
        LDI     20H
        SEP     R4
        WORD    FILL
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TX1)
        PHI     RB
        LDI     LOW (TX1)
        PLO     RB
        LDI     HIGH (0)
        PHI     RE
        LDI     LOW (0)
        PLO     RE
        LDI     128
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX2)
        PHI     RB
        LDI     LOW (TX2)
        PLO     RB
        LDI     HIGH (14)
        PHI     RE
        LDI     LOW (14)
        PLO     RE
        LDI     128
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX3)
        PHI     RB
        LDI     LOW (TX3)
        PLO     RB
        LDI     HIGH (26)
        PHI     RE
        LDI     LOW (26)
        PLO     RE
        LDI     128
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX4)
        PHI     RB
        LDI     LOW (TX4)
        PLO     RB
        LDI     HIGH (5888)
        PHI     RE
        LDI     LOW (5888)
        PLO     RE
        LDI     128
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (HISC)
        PHI     RB
        LDI     LOW (HISC)
        PLO     RB
        LDI     HIGH (17)
        PHI     RE
        LDI     LOW (17)
        PLO     RE
BO1     LDA     RB
        ADI     0B0H
        SEP     R1
        INC     RE
        GLO     RE
        XRI     23
        LBNZ    BO1
        LDI     HIGH (32)
        PHI     RE
        LDI     LOW (32)
        PLO     RE
        LDI     HIGH (LEVEL)
        PHI     RA
        LDI     LOW (LEVEL)
        PLO     RA
        LDN     RA
        ADI     0B0H
        SEP     R1
        LDI     HIGH (SCD)
        PHI     RA
        LDI     LOW (SCD)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R4
        WORD    SCORED
        LDI     HIGH (256)
        PHI     RE
        LDI     LOW (256)
        PLO     RE
        LDI     40
        PLO     R8
        LDI     20
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     HIGH (512)
        PHI     RE
        LDI     LOW (512)
        PLO     RE
        LDI     40
        PLO     R8
        LDI     21
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     HIGH (258)
        PHI     RE
        LDI     LOW (258)
        PLO     RE
        LDI     4
        PLO     R8
        LDI     22
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     HIGH (514)
        PHI     RE
        LDI     LOW (514)
        PLO     RE
        LDI     4
        PLO     R8
        LDI     22
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     HIGH (266)
        PHI     RE
        LDI     LOW (266)
        PLO     RE
        LDI     4
        PLO     R8
        LDI     22
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     HIGH (522)
        PHI     RE
        LDI     LOW (522)
        PLO     RE
        LDI     4
        PLO     R8
        LDI     22
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     HIGH (274)
        PHI     RE
        LDI     LOW (274)
        PLO     RE
        LDI     4
        PLO     R8
        LDI     22
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     HIGH (530)
        PHI     RE
        LDI     LOW (530)
        PLO     RE
        LDI     4
        PLO     R8
        LDI     22
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     HIGH (282)
        PHI     RE
        LDI     LOW (282)
        PLO     RE
        LDI     4
        PLO     R8
        LDI     22
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     HIGH (538)
        PHI     RE
        LDI     LOW (538)
        PLO     RE
        LDI     4
        PLO     R8
        LDI     22
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     HIGH (290)
        PHI     RE
        LDI     LOW (290)
        PLO     RE
        LDI     4
        PLO     R8
        LDI     22
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     HIGH (546)
        PHI     RE
        LDI     LOW (546)
        PLO     RE
        LDI     4
        PLO     R8
        LDI     22
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     HIGH (2816)
        PHI     RE
        LDI     LOW (2816)
        PLO     RE
        LDI     40
        PLO     R8
        LDI     151
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     HIGH (3072)
        PHI     RE
        LDI     LOW (3072)
        PLO     RE
        LDI     40
        PLO     R8
        LDI     151
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     HIGH (5376)
        PHI     RE
        LDI     LOW (5376)
        PLO     RE
        LDI     40
        PLO     R8
        LDI     151
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     HIGH (5632)
        PHI     RE
        LDI     LOW (5632)
        PLO     RE
        LDI     40
        PLO     R8
        LDI     151
        PLO     R9
        SEP     R4
        WORD    FILLROW
        LDI     0
        PLO     R8
BO2
        GLO     R8
        STXD
        SEP     R4
        WORD    BUILD
        IRX
        LDN     R2
        PLO     R8
        STXD
        SEP     R4
        WORD    LDRAW
        SEP     R4
        WORD    QFLUSH
        IRX
        LDX
        PLO     R8
        INC     R8
        GLO     R8
        XRI     8
        LBNZ    BO2
        SEP     R4
        WORD    LIVESD
        SEP     R4
        WORD    NEWFROG
        LDI     HIGH (OFS)
        PHI     RA
        LDI     LOW (OFS)
        PLO     RA
        LDI     255
        STR     RA
        SEP     R4
        WORD    FROGFIX
        SEP     R4
        WORD    QFLUSH
        LDI     HIGH (DIRECT)
        PHI     RA
        LDI     LOW (DIRECT)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R4
        WORD    VIDON
        SEP     R5
NEWLEVEL
        LDI     HIGH (BAYS)
        PHI     RA
        LDI     LOW (BAYS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (FLYB)
        PHI     RA
        LDI     LOW (FLYB)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (FLYT)
        PHI     RA
        LDI     LOW (FLYT)
        PLO     RA
        LDI     200
        STR     RA
        LDI     HIGH (LEVEL)
        PHI     RA
        LDI     LOW (LEVEL)
        PLO     RA
        LDN     RA
        SMI     1
        SMI     7
        LBNF    NV1
        LDI     0
NV1     ADI     7
        SHL
        SHL
        SHL
        ADI     LOW SPEEDS
        PLO     RC
        LDI     HIGH SPEEDS
        ADCI    0
        PHI     RC
        LDI     HIGH (LIV)
        PHI     RD
        LDI     LOW (LIV)
        PLO     RD
        LDI     8
        PLO     R8
NV2     LDA     RC
        STR     RD
        INC     RD
        DEC     R8
        GLO     R8
        LBNZ    NV2
        LDI     HIGH (LOFF0)
        PHI     RC
        LDI     LOW (LOFF0)
        PLO     RC
        LDI     HIGH (LOFF)
        PHI     RD
        LDI     LOW (LOFF)
        PLO     RD
        LDI     HIGH (8)
        PHI     RE
        LDI     LOW (8)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
        LDI     HIGH (LCNT0)
        PHI     RC
        LDI     LOW (LCNT0)
        PLO     RC
        LDI     HIGH (LCNT)
        PHI     RD
        LDI     LOW (LCNT)
        PLO     RD
        LDI     HIGH (8)
        PHI     RE
        LDI     LOW (8)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
        LDI     HIGH (DST0)
        PHI     RC
        LDI     LOW (DST0)
        PLO     RC
        LDI     HIGH (DST)
        PHI     RD
        LDI     LOW (DST)
        PLO     RD
        LDI     HIGH (8)
        PHI     RE
        LDI     LOW (8)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
        LDI     HIGH (DTM0)
        PHI     RC
        LDI     LOW (DTM0)
        PLO     RC
        LDI     HIGH (DTM)
        PHI     RD
        LDI     LOW (DTM)
        PLO     RD
        LDI     HIGH (8)
        PHI     RE
        LDI     LOW (8)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
        LDI     HIGH (DST0)
        PHI     RC
        LDI     LOW (DST0)
        PLO     RC
        LDI     HIGH (DPH)
        PHI     RD
        LDI     LOW (DPH)
        PLO     RD
        LDI     HIGH (8)
        PHI     RE
        LDI     LOW (8)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
        SEP     R4
        WORD    BOARD
        SEP     R5
INIT
        SEP     R4
        WORD    VIDINIT
        SEP     R4
        WORD    CHSAVE
        SEP     R4
        WORD    CHLOAD
        LDI     HIGH (RND)
        PHI     RA
        LDI     LOW (RND)
        PLO     RA
        LDI     5AH
        STR     RA
        INC     RA
        LDI     0A5H
        STR     RA
        LDI     HIGH (HISC)
        PHI     RD
        LDI     LOW (HISC)
        PLO     RD
        LDI     HIGH (6)
        PHI     RE
        LDI     LOW (6)
        PLO     RE
        LDI     0
        SEP     R4
        WORD    FILL
        LDI     HIGH (HISC+2)
        PHI     RD
        LDI     LOW (HISC+2)
        PLO     RD
        LDI     5
        STR     RD
        LDI     HIGH (MUTE)
        PHI     RA
        LDI     LOW (MUTE)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (VCAP)
        PHI     RA
        LDI     LOW (VCAP)
        PLO     RA
        LDI     60
        STR     RA
        LDI     HIGH (DIRECT)
        PHI     RA
        LDI     LOW (DIRECT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDI     0
        STR     RA
TITLE
        SEP     R4
        WORD    VIDOFF
        SEP     R4
        WORD    SILENCE
        SEP     R4
        WORD    CLRSCR
        LDI     HIGH (DIRECT)
        PHI     RA
        LDI     LOW (DIRECT)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TX5)
        PHI     RB
        LDI     LOW (TX5)
        PLO     RB
        LDI     HIGH (527)
        PHI     RE
        LDI     LOW (527)
        PLO     RE
        LDI     128
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX6)
        PHI     RB
        LDI     LOW (TX6)
        PLO     RB
        LDI     HIGH (1032)
        PHI     RE
        LDI     LOW (1032)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX7)
        PHI     RB
        LDI     LOW (TX7)
        PLO     RB
        LDI     HIGH (1541)
        PHI     RE
        LDI     LOW (1541)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX8)
        PHI     RB
        LDI     LOW (TX8)
        PLO     RB
        LDI     HIGH (1798)
        PHI     RE
        LDI     LOW (1798)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX9)
        PHI     RB
        LDI     LOW (TX9)
        PLO     RB
        LDI     HIGH (3593)
        PHI     RE
        LDI     LOW (3593)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX10)
        PHI     RB
        LDI     LOW (TX10)
        PLO     RB
        LDI     HIGH (3849)
        PHI     RE
        LDI     LOW (3849)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX11)
        PHI     RB
        LDI     LOW (TX11)
        PLO     RB
        LDI     HIGH (4105)
        PHI     RE
        LDI     LOW (4105)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX12)
        PHI     RB
        LDI     LOW (TX12)
        PLO     RB
        LDI     HIGH (4617)
        PHI     RE
        LDI     LOW (4617)
        PLO     RE
        LDI     128
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX13)
        PHI     RB
        LDI     LOW (TX13)
        PLO     RB
        LDI     HIGH (5391)
        PHI     RE
        LDI     LOW (5391)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (HISC)
        PHI     RB
        LDI     LOW (HISC)
        PLO     RB
        LDI     HIGH (5394)
        PHI     RE
        LDI     LOW (5394)
        PLO     RE
TI1     LDA     RB
        ADI     0B0H
        SEP     R1
        INC     RE
        GLO     RE
        XRI     24
        LBNZ    TI1
        LDI     HIGH (2309)
        PHI     RE
        LDI     LOW (2309)
        PLO     RE
        LDI     1
        SEP     R1
        LDI     HIGH (2310)
        PHI     RE
        LDI     LOW (2310)
        PLO     RE
        LDI     2
        SEP     R1
        LDI     HIGH (2565)
        PHI     RE
        LDI     LOW (2565)
        PLO     RE
        LDI     3
        SEP     R1
        LDI     HIGH (2566)
        PHI     RE
        LDI     LOW (2566)
        PLO     RE
        LDI     4
        SEP     R1
        LDI     HIGH (2314)
        PHI     RE
        LDI     LOW (2314)
        PLO     RE
        LDI     228
        SEP     R1
        LDI     HIGH (2315)
        PHI     RE
        LDI     LOW (2315)
        PLO     RE
        LDI     229
        SEP     R1
        LDI     HIGH (2570)
        PHI     RE
        LDI     LOW (2570)
        PLO     RE
        LDI     230
        SEP     R1
        LDI     HIGH (2571)
        PHI     RE
        LDI     LOW (2571)
        PLO     RE
        LDI     231
        SEP     R1
        LDI     HIGH (2319)
        PHI     RE
        LDI     LOW (2319)
        PLO     RE
        LDI     153
        SEP     R1
        LDI     HIGH (2320)
        PHI     RE
        LDI     LOW (2320)
        PLO     RE
        LDI     154
        SEP     R1
        LDI     HIGH (2321)
        PHI     RE
        LDI     LOW (2321)
        PLO     RE
        LDI     155
        SEP     R1
        LDI     HIGH (2322)
        PHI     RE
        LDI     LOW (2322)
        PLO     RE
        LDI     156
        SEP     R1
        LDI     HIGH (2575)
        PHI     RE
        LDI     LOW (2575)
        PLO     RE
        LDI     157
        SEP     R1
        LDI     HIGH (2576)
        PHI     RE
        LDI     LOW (2576)
        PLO     RE
        LDI     158
        SEP     R1
        LDI     HIGH (2577)
        PHI     RE
        LDI     LOW (2577)
        PLO     RE
        LDI     159
        SEP     R1
        LDI     HIGH (2578)
        PHI     RE
        LDI     LOW (2578)
        PLO     RE
        LDI     219
        SEP     R1
        LDI     HIGH (2326)
        PHI     RE
        LDI     LOW (2326)
        PLO     RE
        LDI     232
        SEP     R1
        LDI     HIGH (2327)
        PHI     RE
        LDI     LOW (2327)
        PLO     RE
        LDI     234
        SEP     R1
        LDI     HIGH (2328)
        PHI     RE
        LDI     LOW (2328)
        PLO     RE
        LDI     237
        SEP     R1
        LDI     HIGH (2582)
        PHI     RE
        LDI     LOW (2582)
        PLO     RE
        LDI     238
        SEP     R1
        LDI     HIGH (2583)
        PHI     RE
        LDI     LOW (2583)
        PLO     RE
        LDI     240
        SEP     R1
        LDI     HIGH (2584)
        PHI     RE
        LDI     LOW (2584)
        PLO     RE
        LDI     243
        SEP     R1
        LDI     HIGH (2332)
        PHI     RE
        LDI     LOW (2332)
        PLO     RE
        LDI     244
        SEP     R1
        LDI     HIGH (2333)
        PHI     RE
        LDI     LOW (2333)
        PLO     RE
        LDI     245
        SEP     R1
        LDI     HIGH (2588)
        PHI     RE
        LDI     LOW (2588)
        PLO     RE
        LDI     246
        SEP     R1
        LDI     HIGH (2589)
        PHI     RE
        LDI     LOW (2589)
        PLO     RE
        LDI     247
        SEP     R1
        LDI     HIGH (2337)
        PHI     RE
        LDI     LOW (2337)
        PLO     RE
        LDI     166
        SEP     R1
        LDI     HIGH (2338)
        PHI     RE
        LDI     LOW (2338)
        PLO     RE
        LDI     167
        SEP     R1
        LDI     HIGH (2593)
        PHI     RE
        LDI     LOW (2593)
        PLO     RE
        LDI     170
        SEP     R1
        LDI     HIGH (2594)
        PHI     RE
        LDI     LOW (2594)
        PLO     RE
        LDI     171
        SEP     R1
        LDI     HIGH (DIRECT)
        PHI     RA
        LDI     LOW (DIRECT)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R4
        WORD    VIDON
        LDI     HIGH (TUNE)
        PHI     RC
        LDI     LOW (TUNE)
        PLO     RC
        LDI     HIGH (MUSP)
        PHI     RA
        LDI     LOW (MUSP)
        PLO     RA
        GHI     RC
        STR     RA
        INC     RA
        GLO     RC
        STR     RA
        LDI     HIGH (MUST)
        PHI     RA
        LDI     LOW (MUST)
        PLO     RA
        LDI     1
        STR     RA
TW1
        SEP     R4
        WORD    WAITVB
        SEP     R4
        WORD    SNDTICK
        SEP     R4
        WORD    RAND
        LDI     HIGH (MUTE)
        PHI     RA
        LDI     LOW (MUTE)
        PLO     RA
        LDN     RA
        LBNZ    TW2
        SEP     R4
        WORD    MUSIC
TW2
        SEP     R4
        WORD    GETKEY
        LBZ     TW1
        PLO     R9
        XRI     'M'
        LBNZ    TW3
        LDI     HIGH (MUTE)
        PHI     RA
        LDI     LOW (MUTE)
        PLO     RA
        LDN     RA
        XRI     1
        STR     RA
        SEP     R4
        WORD    SILENCE
        LDI     HIGH (MUST)
        PHI     RA
        LDI     LOW (MUST)
        PLO     RA
        LDI     1
        STR     RA
        LBR     TW1
TW3     GLO     R9
        XRI     K_ESC
        LBZ     EXIT
        GLO     R9
        XRI     5FH
        LBZ     TW4
        GLO     R9
        XRI     20H
        LBZ     TW4
        GLO     R9
        XRI     K_CR
        LBNZ    TW1
TW4
        SEP     R4
        WORD    SILENCE
        LDI     HIGH (SCORE)
        PHI     RD
        LDI     LOW (SCORE)
        PLO     RD
        LDI     HIGH (6)
        PHI     RE
        LDI     LOW (6)
        PLO     RE
        LDI     0
        SEP     R4
        WORD    FILL
        LDI     HIGH (LIVES)
        PHI     RA
        LDI     LOW (LIVES)
        PLO     RA
        LDI     4
        STR     RA
        LDI     HIGH (LEVEL)
        PHI     RA
        LDI     LOW (LEVEL)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     0
        STR     RA
LVSTART
        SEP     R4
        WORD    NEWLEVEL
        LDI     HIGH (TXREADY)
        PHI     RB
        LDI     LOW (TXREADY)
        PLO     RB
        LDI     HIGH (3089)
        PHI     RE
        LDI     LOW (3089)
        PLO     RE
        LDI     80H
        PLO     R8
        SEP     R4
        WORD    PRQ
        SEP     R4
        WORD    QFLUSHW
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     254
        STR     RA
        LDI     HIGH (1428H)
        PHI     RC
        LDI     LOW (1428H)
        PLO     RC
        LDI     40
        SEP     R4
        WORD    SOUND
        LDI     70
        SEP     R4
        WORD    WAITN
        LDI     HIGH (3072)
        PHI     RE
        LDI     LOW (3072)
        PLO     RE
        LDI     40
        PLO     R8
        LDI     151
        PLO     R9
        SEP     R4
        WORD    FILLROW
        SEP     R4
        WORD    QFLUSHW
MAIN
        LDI     HIGH (FCNT)
        PHI     RA
        LDI     LOW (FCNT)
        PLO     RA
        LDI     0
        STR     RA
MAINW
        LDI     HIGH (FCNT)
        PHI     RA
        LDI     LOW (FCNT)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (TMPC)
        PHI     RA
        LDI     LOW (TMPC)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD9
        LDN     RA
        LBZ     TKX9
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX9
TKD9    LDI     1
        STR     RA
TKX9
        LDI     HIGH (TMPC)
        PHI     RA
        LDI     LOW (TMPC)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (FCNT)
        PHI     RA
        LDI     LOW (FCNT)
        PLO     RA
        LDN     RA
        XOR
        LBZ     MAINW
        SEP     R4
        WORD    VBDRAW
        SEP     R4
        WORD    SNDTICK
        LDI     HIGH (FRM+1)
        PHI     RA
        LDI     LOW (FRM+1)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        DEC     RA
        LDN     RA
        ADCI    0
        STR     RA
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD10
        LDN     RA
        LBZ     TKX10
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX10
TKD10    LDI     1
        STR     RA
TKX10
        SEP     R4
        WORD    GETKEY
        LBZ     MN1
        PLO     R9
        XRI     K_ESC
        LBZ     TITLE
        GLO     R9
        PLO     R7
        LDI     HIGH (KEY)
        PHI     RA
        LDI     LOW (KEY)
        PLO     RA
        GLO     R7
        STR     RA
MN1
        LDI     HIGH (FCNT)
        PHI     RA
        LDI     LOW (FCNT)
        PLO     RA
        LDN     RA
        SMI     2
        LBNF    MAINW
        STR     RA
        SMI     4
        LBNF    MN1C
        LDI     3
        STR     RA
MN1C
        SEP     R4
        WORD    LANES
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD11
        LDN     RA
        LBZ     TKX11
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX11
TKD11    LDI     1
        STR     RA
TKX11
        SEP     R4
        WORD    HOP
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDN     RA
        LBNZ    MN2
        SEP     R4
        WORD    CHECK
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD12
        LDN     RA
        LBZ     TKX12
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX12
TKD12    LDI     1
        STR     RA
TKX12
        SEP     R4
        WORD    CLOCK
        SEP     R4
        WORD    DYING
        SEP     R4
        WORD    FLY
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD13
        LDN     RA
        LBZ     TKX13
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX13
TKD13    LDI     1
        STR     RA
TKX13
        SEP     R4
        WORD    FROGFIX
        SEP     R4
        WORD    SCORED
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD14
        LDN     RA
        LBZ     TKX14
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX14
TKD14    LDI     1
        STR     RA
TKX14
MN2
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDN     RA
        LBZ     MAINW
        XRI     4
        LBZ     LVDONE
        SEP     R4
        WORD    FROGFIX
        LDI     HIGH (TXOVER)
        PHI     RB
        LDI     LOW (TXOVER)
        PLO     RB
        LDI     HIGH (3087)
        PHI     RE
        LDI     LOW (3087)
        PLO     RE
        LDI     80H
        PLO     R8
        SEP     R4
        WORD    PRQ
        SEP     R4
        WORD    QFLUSHW
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (3028H)
        PHI     RC
        LDI     LOW (3028H)
        PLO     RC
        LDI     60
        SEP     R4
        WORD    SOUND
        LDI     HIGH (SCORE)
        PHI     RB
        LDI     LOW (SCORE)
        PLO     RB
        LDI     HIGH (HISC)
        PHI     RC
        LDI     LOW (HISC)
        PLO     RC
        LDI     6
        PLO     R9
GO1     LDA     RC
        STR     R2
        LDA     RB
        SM
        LBNF    GO3
        LBNZ    GO2
        DEC     R9
        GLO     R9
        LBNZ    GO1
        LBR     GO3
GO2
        LDI     HIGH (SCORE)
        PHI     RC
        LDI     LOW (SCORE)
        PLO     RC
        LDI     HIGH (HISC)
        PHI     RD
        LDI     LOW (HISC)
        PLO     RD
        LDI     HIGH (6)
        PHI     RE
        LDI     LOW (6)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
GO3     LDI     180
        SEP     R4
        WORD    WAITN
        LBR     TITLE
LVDONE
        SEP     R4
        WORD    FROGFIX
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TXWELL)
        PHI     RB
        LDI     LOW (TXWELL)
        PLO     RB
        LDI     HIGH (3085)
        PHI     RE
        LDI     LOW (3085)
        PLO     RE
        LDI     80H
        PLO     R8
        SEP     R4
        WORD    PRQ
        SEP     R4
        WORD    QFLUSHW
        LDI     HIGH (FANF)
        PHI     RC
        LDI     LOW (FANF)
        PLO     RC
        LDI     HIGH (MUSP)
        PHI     RA
        LDI     LOW (MUSP)
        PLO     RA
        GHI     RC
        STR     RA
        INC     RA
        GLO     RC
        STR     RA
        LDI     HIGH (MUST)
        PHI     RA
        LDI     LOW (MUST)
        PLO     RA
        LDI     1
        STR     RA
        LDI     150
        PLO     RE
LD9     STXD
        SEP     R4
        WORD    WAITVB
        SEP     R4
        WORD    SNDTICK
        SEP     R4
        WORD    MUSIC
        IRX
        DEC     RE
        GLO     RE
        LBNZ    LD9
        LDI     HIGH (LEVEL)
        PHI     RA
        LDI     LOW (LEVEL)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     LVSTART
QFLUSHW
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        LDI     4
        STR     RA
QW1
        SEP     R4
        WORD    WAITVB
        LDI     HIGH (FRESH)
        PHI     RA
        LDI     LOW (FRESH)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R4
        WORD    VBDRAW
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    QW1
        SEP     R5
MUSIC
        LDI     HIGH (MUST)
        PHI     RA
        LDI     LOW (MUST)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    MUX
        LDI     HIGH (MUSP)
        PHI     RA
        LDI     LOW (MUSP)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDA     RB
        LBNZ    MU1
        LDI     HIGH (TUNE)
        PHI     RB
        LDI     LOW (TUNE)
        PLO     RB
        LDA     RB
MU1     PHI     RC
        LDI     28H
        PLO     RC
        LDA     RB
        PLO     R7
        LDI     HIGH (MUST)
        PHI     RA
        LDI     LOW (MUST)
        PLO     RA
        GLO     R7
        STR     RA
        PLO     R9
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        GHI     RC
        XRI     7FH
        LBZ     MU2
        GLO     R9
        SMI     1
        SEP     R4
        WORD    SOUND
MU2
        LDI     HIGH (MUSP)
        PHI     RA
        LDI     LOW (MUSP)
        PLO     RA
        GHI     RB
        STR     RA
        INC     RA
        GLO     RB
        STR     RA
MUX     SEP     R5
EXIT
        SEP     R4
        WORD    VIDOFF
        SEP     R4
        WORD    SILENCE
        SEP     R4
        WORD    CHREST
        SEP     R4
        WORD    CLRSCR
        LDI     HIGH (8088H)
        PHI     RF
        LDI     LOW (8088H)
        PLO     RF
        SEX     RF
        OUT     5
        LDI     HIGH (4195H)
        PHI     RA
        LDI     LOW (4195H)
        PLO     RA
        LDA     RA
        PHI     RF
        LDN     RA
        PLO     RF
        SEX     RF
        OUT     7
        SEX     R3
        OUT     3
        BYTE    80H
        SEX     R2
        LDI     HIGH (SAVESP)
        PHI     RA
        LDI     LOW (SAVESP)
        PLO     RA
        LDA     RA
        PLO     R2
        LDN     RA
        PHI     R2
        SEX     R3
        RET
        BYTE    23H
        IRX
        LDXA
        PHI     RF
        LDXA
        PLO     RF
        LDXA
        PHI     RE
        LDXA
        PLO     RE
        LDXA
        PHI     RD
        LDXA
        PLO     RD
        LDXA
        PHI     RC
        LDXA
        PLO     RC
        LDXA
        PHI     RB
        LDXA
        PLO     RB
        LDXA
        PHI     RA
        LDXA
        PLO     RA
        LDXA
        PHI     R9
        LDXA
        PLO     R9
        LDXA
        PHI     R8
        LDXA
        PLO     R8
        LDXA
        PHI     R7
        LDXA
        PLO     R7
        LDXA
        PHI     R6
        LDXA
        PLO     R6
        LDXA
        PHI     R5
        LDXA
        PLO     R5
        LDXA
        PHI     R4
        LDXA
        PLO     R4
        LDXA
        PHI     R1
        LDX
        PLO     R1
        SEP     R5
ROWTAB
        WORD    PAGE+0
        WORD    PAGE+40
        WORD    PAGE+80
        WORD    PAGE+120
        WORD    PAGE+160
        WORD    PAGE+200
        WORD    PAGE+240
        WORD    PAGE+280
        WORD    PAGE+320
        WORD    PAGE+360
        WORD    PAGE+400
        WORD    PAGE+440
        WORD    PAGE+480
        WORD    PAGE+520
        WORD    PAGE+560
        WORD    PAGE+600
        WORD    PAGE+640
        WORD    PAGE+680
        WORD    PAGE+720
        WORD    PAGE+760
        WORD    PAGE+800
        WORD    PAGE+840
        WORD    PAGE+880
        WORD    PAGE+920
LROWS   BYTE    003H, 005H, 007H, 009H, 00DH, 00FH, 011H, 013H
LDIRS   BYTE    001H, 0FFH, 001H, 0FFH, 0FFH, 001H, 0FFH, 001H
LSLOT   BYTE    001H, 002H, 003H, 004H, 006H, 007H, 008H, 009H
SPEEDS  BYTE    006H, 005H, 004H, 006H, 005H, 002H, 006H, 004H, 006H, 005H, 004H, 006H, 005H, 002H, 006H, 004H
        BYTE    005H, 004H, 003H, 005H, 004H, 001H, 005H, 003H, 005H, 004H, 003H, 005H, 004H, 001H, 005H, 003H
        BYTE    004H, 003H, 002H, 004H, 003H, 001H, 004H, 002H, 004H, 003H, 002H, 004H, 003H, 001H, 004H, 002H
        BYTE    003H, 002H, 001H, 003H, 002H, 001H, 003H, 001H, 003H, 002H, 001H, 003H, 002H, 001H, 003H, 001H
LOFF0   BYTE    000H, 00AH, 014H, 01EH, 005H, 00FH, 019H, 023H
LCNT0   BYTE    001H, 002H, 003H, 004H, 005H, 006H, 007H, 008H
DST0    BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
DTM0    BYTE    000H, 028H, 000H, 046H, 000H, 000H, 000H, 000H
DSTATE  BYTE    000H, 001H, 002H, 001H
DTIME   BYTE    050H, 00AH, 01CH, 00AH
BITS    BYTE    001H, 002H, 004H, 008H, 010H
EDGP
        WORD    EDG0
        WORD    EDG1
        WORD    EDG2
        WORD    EDG3
        WORD    EDG4
        WORD    EDG5
        WORD    EDG6
        WORD    EDG7
EDG0    BYTE    010H, 03FH, 000H, 003H, 004H, 00CH, 00DH, 010H, 011H, 01AH, 01BH, 01FH, 020H, 028H, 029H, 02CH
        BYTE    02DH
EDG1    BYTE    019H, 000H, 001H, 002H, 003H, 004H, 00AH, 00BH, 00CH, 00DH, 00EH, 014H, 015H, 016H, 017H, 018H
        BYTE    01EH, 01FH, 020H, 021H, 022H, 02AH, 02BH, 02CH, 02DH, 02EH
EDG2    BYTE    00CH, 03FH, 000H, 007H, 008H, 00FH, 010H, 016H, 017H, 01FH, 020H, 028H, 029H
EDG3    BYTE    01CH, 000H, 001H, 002H, 003H, 004H, 005H, 006H, 00DH, 00EH, 00FH, 010H, 011H, 012H, 013H, 01AH
        BYTE    01BH, 01CH, 01DH, 01EH, 01FH, 020H, 028H, 029H, 02AH, 02BH, 02CH, 02DH, 02EH
EDG4    BYTE    00FH, 000H, 001H, 002H, 003H, 004H, 010H, 011H, 012H, 013H, 014H, 022H, 023H, 024H, 025H, 026H
EDG5    BYTE    006H, 03FH, 000H, 001H, 01FH, 020H, 021H
EDG6    BYTE    00CH, 000H, 001H, 002H, 00CH, 00DH, 00EH, 01AH, 01BH, 01CH, 028H, 029H, 02AH
EDG7    BYTE    00CH, 03FH, 000H, 001H, 00AH, 00BH, 00CH, 016H, 017H, 018H, 021H, 022H, 023H
TTOP    BYTE    012H, 013H, 020H, 0E8H, 0EAH, 0EDH, 0F4H, 0F5H, 099H, 09AH, 09BH, 09CH, 0DCH, 0DDH, 0E0H, 0E1H
        BYTE    0E4H, 0E5H, 0F4H, 0F5H, 0F8H, 0F9H, 012H, 012H
TBOT    BYTE    013H, 012H, 020H, 0EEH, 0F0H, 0F3H, 0F6H, 0F7H, 09DH, 09EH, 09FH, 0DBH, 0DEH, 0DFH, 0E2H, 0E3H
        BYTE    0E6H, 0E7H, 0F6H, 0F7H, 0FAH, 0FBH, 013H, 013H
FRCH    BYTE    001H, 002H, 003H, 004H, 005H, 006H, 007H, 008H, 009H, 00AH, 00BH, 00CH, 00DH, 00EH, 00FH, 010H
SPCH    BYTE    0FCH, 0FDH, 0FEH, 0FFH
SQCH    BYTE    0A2H, 0A3H, 0A4H, 0A5H
BAYCH   BYTE    016H, 016H, 016H, 016H, 0A6H, 0A7H, 0AAH, 0ABH
KINDS   BYTE    000H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H
        BYTE    006H, 000H, 002H, 002H, 004H, 004H, 005H, 000H, 000H, 001H, 001H, 001H, 001H, 001H, 001H, 001H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 007H, 007H, 000H, 000H, 007H, 007H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 001H, 001H, 001H, 001H, 001H
        BYTE    001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H
        BYTE    003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 000H, 000H, 000H, 000H
PATS
        BYTE    003H, 004H, 004H, 004H, 005H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 003H, 004H, 004H
        BYTE    004H, 005H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 003H, 004H, 004H, 004H, 004H
        BYTE    005H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 003H, 004H, 004H, 004H, 005H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    006H, 007H, 006H, 007H, 000H, 000H, 000H, 000H, 000H, 000H, 012H, 013H, 012H, 013H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 006H, 007H, 006H, 007H, 000H, 000H, 000H, 000H, 000H, 000H, 006H, 007H
        BYTE    006H, 007H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 012H, 013H, 012H, 013H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    003H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 005H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    003H, 004H, 004H, 004H, 004H, 004H, 004H, 005H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    003H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 005H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    006H, 007H, 006H, 007H, 006H, 007H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 012H, 013H, 012H
        BYTE    013H, 012H, 013H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 006H, 007H, 006H, 007H, 006H, 007H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 006H, 007H, 006H, 007H, 006H, 007H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    008H, 009H, 00AH, 00BH, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H
        BYTE    008H, 009H, 00AH, 00BH, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H
        BYTE    002H, 002H, 008H, 009H, 00AH, 00BH, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H
        BYTE    002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H
        BYTE    00CH, 00DH, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H
        BYTE    002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H
        BYTE    00CH, 00DH, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H
        BYTE    002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H
        BYTE    00EH, 00FH, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 00EH, 00FH, 002H, 002H
        BYTE    002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 00EH, 00FH, 002H, 002H, 002H, 002H
        BYTE    002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 00EH, 00FH, 002H, 002H, 002H, 002H, 002H, 002H
        BYTE    002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H
        BYTE    010H, 011H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 010H, 011H, 002H, 002H, 002H
        BYTE    002H, 002H, 002H, 002H, 002H, 002H, 002H, 010H, 011H, 002H, 002H, 002H, 002H, 002H, 002H, 002H
        BYTE    002H, 002H, 010H, 011H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H
        BYTE    002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H
TXREADY  TEXT    "READY!"
        BYTE    0
TXOVER   TEXT    "GAME  OVER"
        BYTE    0
TXWELL   TEXT    "ALL FROGS HOME!"
        BYTE    0
TX1      TEXT    "SCORE"
        BYTE    0
TX2      TEXT    "HI"
        BYTE    0
TX3      TEXT    "LEVEL"
        BYTE    0
TX4      TEXT    "TIME"
        BYTE    0
TX5      TEXT    "LILY  LEAP"
        BYTE    0
TX6      TEXT    "GUIDE THE FROGS HOME"
        BYTE    0
TX7      TEXT    "CROSS THE ROAD, RIDE THE RIVER"
        BYTE    0
TX8      TEXT    "AND FILL ALL FIVE LILY BAYS"
        BYTE    0
TX9      TEXT    "ARROWS     HOP"
        BYTE    0
TX10     TEXT    "M          MUSIC ON/OFF"
        BYTE    0
TX11     TEXT    "ESC        QUIT"
        BYTE    0
TX12     TEXT    "SPACE      START"
        BYTE    0
TX13     TEXT    "HI"
        BYTE    0
TUNE    BYTE    014H, 006H, 01BH, 006H, 014H, 006H, 010H, 006H, 012H, 006H, 015H, 006H, 01BH, 00CH, 018H, 006H
        BYTE    014H, 006H, 00FH, 006H, 010H, 006H, 012H, 00CH, 07FH, 006H, 01BH, 006H, 014H, 006H, 01BH, 006H
        BYTE    014H, 006H, 010H, 006H, 00DH, 006H, 010H, 006H, 014H, 00CH, 012H, 006H, 00FH, 006H, 010H, 006H
        BYTE    012H, 006H, 014H, 012H, 07FH, 01EH, 000H
FANF    BYTE    014H, 006H, 010H, 006H, 00DH, 006H, 00AH, 012H, 00DH, 006H, 00AH, 01EH, 07FH, 078H, 000H
CHTAB
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 0CCH, 0DEH, 09BH, 0A7H, 0B7H, 09FH
        BYTE    000H, 000H, 0CCH, 0FCH, 0B6H, 0B9H, 0BBH, 0BEH, 087H, 085H, 09FH, 0B7H, 0A7H, 0B1H, 000H, 000H
        BYTE    0B8H, 0A8H, 0BEH, 0BBH, 0B9H, 0A3H, 000H, 000H, 000H, 000H, 0B8H, 0ACH, 084H, 09FH, 09DH, 0BFH
        BYTE    000H, 000H, 098H, 0B6H, 0A7H, 0BBH, 0BEH, 0BCH, 0BFH, 09DH, 09FH, 084H, 0ACH, 0B8H, 000H, 000H
        BYTE    0BEH, 0BEH, 0BBH, 0A7H, 0B4H, 098H, 000H, 000H, 000H, 000H, 0B1H, 0A7H, 0B7H, 09FH, 085H, 087H
        BYTE    000H, 000H, 0A3H, 0B9H, 0BBH, 0BEH, 0A8H, 0B8H, 09FH, 0B7H, 0A7H, 09BH, 0CFH, 0CCH, 000H, 000H
        BYTE    0BEH, 0BBH, 0B9H, 0B6H, 0DEH, 0CCH, 000H, 000H, 000H, 000H, 086H, 08BH, 0B9H, 0B7H, 09FH, 09FH
        BYTE    000H, 000H, 087H, 08DH, 088H, 0BEH, 0AEH, 0BFH, 08FH, 09FH, 0B7H, 0B9H, 09BH, 086H, 000H, 000H
        BYTE    0BFH, 0AEH, 0BEH, 088H, 08DH, 087H, 000H, 000H, 0D2H, 0FFH, 09EH, 0BFH, 092H, 0A1H, 080H, 080H
        BYTE    07FH, 077H, 0FFH, 07FH, 07DH, 0FFH, 07FH, 06FH, 07FH, 07FH, 06FH, 0FFH, 07FH, 07BH, 07FH, 0FFH
        BYTE    0ADH, 0BFH, 0F7H, 0BFH, 0BDH, 0BFH, 0EFH, 0BFH, 0BFH, 0EFH, 0BFH, 0BBH, 0BFH, 0F7H, 0BFH, 0A5H
        BYTE    040H, 048H, 040H, 041H, 040H, 050H, 040H, 042H, 062H, 048H, 002H, 050H, 044H, 060H, 00AH, 040H
        BYTE    080H, 0BFH, 0BFH, 0BFH, 0BFH, 0BFH, 080H, 080H, 000H, 000H, 0CFH, 0DFH, 0FFH, 0F3H, 0F3H, 0FFH
        BYTE    000H, 000H, 0FFH, 0CFH, 0CFH, 0CFH, 0CFH, 0CFH, 000H, 000H, 0FFH, 0FFH, 0FFH, 0FDH, 0FDH, 0FFH
        BYTE    000H, 000H, 0FCH, 0F8H, 0FCH, 0FCH, 0FEH, 0FCH, 0DFH, 0CFH, 006H, 000H, 000H, 000H, 000H, 000H
        BYTE    0CFH, 0FFH, 006H, 000H, 000H, 000H, 000H, 000H, 0FFH, 0FFH, 001H, 000H, 000H, 000H, 000H, 000H
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C4H, 0C4H, 0C4H, 0C4H, 0C4H, 0C0H, 0C4H, 0C0H
        BYTE    000H, 008H, 004H, 027H, 09BH, 08DH, 0BFH, 08FH, 000H, 004H, 008H, 039H, 0B6H, 0ACH, 0BFH, 0BCH
        BYTE    03FH, 00DH, 01BH, 027H, 084H, 088H, 000H, 000H, 03FH, 02CH, 036H, 039H, 088H, 084H, 000H, 000H
        BYTE    000H, 000H, 0CCH, 0D2H, 0E1H, 0D3H, 0CFH, 0C7H, 000H, 000H, 0CCH, 0D2H, 0E1H, 0F2H, 0FCH, 0F8H
        BYTE    0C2H, 0C4H, 0C8H, 0C8H, 0C8H, 0C4H, 0C2H, 0C0H, 0C8H, 0C4H, 0C2H, 0C2H, 0C2H, 0C4H, 0C8H, 0C0H
        BYTE    08FH, 097H, 0A3H, 081H, 080H, 080H, 080H, 080H, 0BCH, 0BAH, 0B1H, 0A0H, 080H, 080H, 080H, 080H
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0CCH, 0C4H, 0C8H, 0C0H, 0C0H, 0C0H, 0C0H, 0DFH, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0CCH, 0CCH, 0C0H, 0C0H, 0C1H, 0C2H, 0C4H, 0C8H, 0D0H, 0C0H, 0C0H
        BYTE    0CEH, 0D1H, 0D3H, 0D5H, 0D9H, 0D1H, 0CEH, 0C0H, 0C4H, 0CCH, 0C4H, 0C4H, 0C4H, 0C4H, 0CEH, 0C0H
        BYTE    0CEH, 0D1H, 0C1H, 0C2H, 0C4H, 0C8H, 0DFH, 0C0H, 0DFH, 0C2H, 0C4H, 0C2H, 0C1H, 0D1H, 0CEH, 0C0H
        BYTE    0C2H, 0C6H, 0CAH, 0D2H, 0DFH, 0C2H, 0C2H, 0C0H, 0DFH, 0D0H, 0DEH, 0C1H, 0C1H, 0D1H, 0CEH, 0C0H
        BYTE    0C6H, 0C8H, 0D0H, 0DEH, 0D1H, 0D1H, 0CEH, 0C0H, 0DFH, 0C1H, 0C2H, 0C4H, 0C8H, 0C8H, 0C8H, 0C0H
        BYTE    0CEH, 0D1H, 0D1H, 0CEH, 0D1H, 0D1H, 0CEH, 0C0H, 0CEH, 0D1H, 0D1H, 0CFH, 0C1H, 0C2H, 0CCH, 0C0H
        BYTE    0C0H, 0CCH, 0CCH, 0C0H, 0CCH, 0CCH, 0C0H, 0C0H, 0C0H, 0CCH, 0CCH, 0C0H, 0CCH, 0C4H, 0C8H, 0C0H
        BYTE    0C2H, 0C4H, 0C8H, 0D0H, 0C8H, 0C4H, 0C2H, 0C0H, 0C0H, 0C0H, 0DFH, 0C0H, 0DFH, 0C0H, 0C0H, 0C0H
        BYTE    0C8H, 0C4H, 0C2H, 0C1H, 0C2H, 0C4H, 0C8H, 0C0H, 0CEH, 0D1H, 0C1H, 0C2H, 0C4H, 0C0H, 0C4H, 0C0H
        BYTE    0CEH, 0D1H, 0D7H, 0D5H, 0D7H, 0D0H, 0CFH, 0C0H, 0CEH, 0D1H, 0D1H, 0DFH, 0D1H, 0D1H, 0D1H, 0C0H
        BYTE    0DEH, 0D1H, 0D1H, 0DEH, 0D1H, 0D1H, 0DEH, 0C0H, 0CEH, 0D1H, 0D0H, 0D0H, 0D0H, 0D1H, 0CEH, 0C0H
        BYTE    0DEH, 0D1H, 0D1H, 0D1H, 0D1H, 0D1H, 0DEH, 0C0H, 0DFH, 0D0H, 0D0H, 0DEH, 0D0H, 0D0H, 0DFH, 0C0H
        BYTE    0DFH, 0D0H, 0D0H, 0DEH, 0D0H, 0D0H, 0D0H, 0C0H, 0CEH, 0D1H, 0D0H, 0D7H, 0D1H, 0D1H, 0CFH, 0C0H
        BYTE    0D1H, 0D1H, 0D1H, 0DFH, 0D1H, 0D1H, 0D1H, 0C0H, 0CEH, 0C4H, 0C4H, 0C4H, 0C4H, 0C4H, 0CEH, 0C0H
        BYTE    0C7H, 0C2H, 0C2H, 0C2H, 0C2H, 0D2H, 0CCH, 0C0H, 0D1H, 0D2H, 0D4H, 0D8H, 0D4H, 0D2H, 0D1H, 0C0H
        BYTE    0D0H, 0D0H, 0D0H, 0D0H, 0D0H, 0D0H, 0DFH, 0C0H, 0D1H, 0DBH, 0D5H, 0D5H, 0D1H, 0D1H, 0D1H, 0C0H
        BYTE    0D1H, 0D9H, 0D5H, 0D3H, 0D1H, 0D1H, 0D1H, 0C0H, 0CEH, 0D1H, 0D1H, 0D1H, 0D1H, 0D1H, 0CEH, 0C0H
        BYTE    0DEH, 0D1H, 0D1H, 0DEH, 0D0H, 0D0H, 0D0H, 0C0H, 0CEH, 0D1H, 0D1H, 0D1H, 0D5H, 0D2H, 0CDH, 0C0H
        BYTE    0DEH, 0D1H, 0D1H, 0DEH, 0D4H, 0D2H, 0D1H, 0C0H, 0CFH, 0D0H, 0D0H, 0CEH, 0C1H, 0C1H, 0DEH, 0C0H
        BYTE    0DFH, 0C4H, 0C4H, 0C4H, 0C4H, 0C4H, 0C4H, 0C0H, 0D1H, 0D1H, 0D1H, 0D1H, 0D1H, 0D1H, 0CEH, 0C0H
        BYTE    0D1H, 0D1H, 0D1H, 0D1H, 0D1H, 0CAH, 0C4H, 0C0H, 0D1H, 0D1H, 0D1H, 0D5H, 0D5H, 0D5H, 0CAH, 0C0H
        BYTE    0D1H, 0D1H, 0CAH, 0C4H, 0CAH, 0D1H, 0D1H, 0C0H, 0D1H, 0D1H, 0CAH, 0C4H, 0C4H, 0C4H, 0C4H, 0C0H
        BYTE    0DFH, 0C1H, 0C2H, 0C4H, 0C8H, 0D0H, 0DFH, 0C0H, 0F8H, 0FCH, 020H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 08CH, 09EH, 0BFH, 0B3H, 0B3H, 0BFH, 000H, 000H, 086H, 08FH, 0BFH, 0BBH, 0BBH, 0BFH
        BYTE    09EH, 08CH, 000H, 000H, 000H, 000H, 000H, 000H, 08FH, 086H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 04FH, 05FH, 05BH, 07FH, 07FH, 05BH, 000H, 000H, 040H, 066H, 066H, 07EH, 07EH, 066H
        BYTE    05FH, 04FH, 000H, 000H, 000H, 000H, 000H, 000H, 066H, 040H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 018H, 03FH, 033H, 033H, 033H, 033H, 000H, 000H, 018H, 03EH, 026H, 027H, 027H, 026H
        BYTE    03FH, 018H, 000H, 000H, 000H, 000H, 000H, 000H, 03EH, 018H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 01FH, 0BFH, 0ADH, 03FH, 0B7H, 03FH, 0AEH, 000H, 03FH, 0BFH, 0B6H, 03FH, 09BH, 03FH, 0B7H
        BYTE    000H, 03FH, 0BFH, 0BDH, 03FH, 0B7H, 03FH, 0ADH, 000H, 03FH, 0BFH, 0AEH, 03FH, 09BH, 03FH, 0B6H
        BYTE    000H, 03FH, 0BFH, 0B7H, 03FH, 0B7H, 03FH, 0BDH, 000H, 03EH, 0BFH, 0ADH, 03FH, 09DH, 03FH, 0B6H
        BYTE    03FH, 0B6H, 03FH, 09FH, 000H, 080H, 000H, 000H, 03FH, 0BBH, 03FH, 0BFH, 000H, 080H, 000H, 000H
        BYTE    03FH, 09DH, 03FH, 0BFH, 000H, 080H, 000H, 000H, 03FH, 0AEH, 03FH, 0BFH, 000H, 080H, 000H, 000H
        BYTE    03FH, 0B7H, 03FH, 0BFH, 000H, 080H, 000H, 000H, 03FH, 09BH, 03FH, 0BEH, 000H, 080H, 000H, 000H
        BYTE    000H, 007H, 00FH, 01BH, 0AFH, 00BH, 09FH, 03BH, 000H, 038H, 03CH, 036H, 0BDH, 034H, 0BEH, 037H
        BYTE    09FH, 00BH, 0AFH, 01BH, 08FH, 007H, 000H, 000H, 0BEH, 034H, 0BDH, 036H, 0BCH, 038H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 004H, 00DH, 0DFH, 000H, 000H, 000H, 000H, 000H, 024H, 02CH, 0FEH
        BYTE    00DH, 0C4H, 000H, 000H, 000H, 000H, 000H, 000H, 02CH, 0E4H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 001H, 048H, 0C5H, 053H, 0C6H, 04CH, 0D2H, 000H, 008H, 071H, 0C8H, 07CH, 0C6H, 073H, 0F4H
        BYTE    04CH, 0C6H, 053H, 0C5H, 048H, 0C1H, 000H, 000H, 073H, 0C6H, 07CH, 0C8H, 071H, 0C8H, 000H, 000H
        END
