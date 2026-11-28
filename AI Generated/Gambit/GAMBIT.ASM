;=====================================================================
; GAMBIT.ASM - GAMBIT for the COMX-35 (1802 machine code, A18 syntax)
; An original chess program.  Start: CALL(@4500).
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
BOARD   EQU     08000H
PVBASE  EQU     08000H
MOVES   EQU     09000H
UNDO    EQU     09800H
KILF    EQU     09900H
KILT    EQU     09910H
ULIST   EQU     09A00H
HIST    EQU     0A000H
STACK   EQU     0AFF0H
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
SIDE    EQU     0AA29H
CASTLE  EQU     0AA2AH
EP      EQU     0AA2BH
KSQW    EQU     0AA2CH
KSQB    EQU     0AA2DH
SC      EQU     0AA2EH
PLY     EQU     0AA30H
MSP     EQU     0AA31H
ATSQ    EQU     0AA33H
ATBY    EQU     0AA34H
PROMOP  EQU     0AA35H
NODES   EQU     0AA36H
ABORT   EQU     0AA39H
ROOTF   EQU     0AA3AH
ROOTT   EQU     0AA3BH
ROOTK   EQU     0AA3CH
RDONE   EQU     0AA3DH
ROOTV   EQU     0AA3EH
TV      EQU     0AA40H
RETV    EQU     0AA42H
TA      EQU     0AA44H
PCNT    EQU     0AA46H
LOC     EQU     0AA4AH
GPLY    EQU     0AA5AH
HUMAN   EQU     0AA5BH
CPU     EQU     0AA5CH
LEVEL   EQU     0AA5DH
CURSOR  EQU     0AA5EH
SELSQ   EQU     0AA5FH
LASTF   EQU     0AA60H
LASTT   EQU     0AA61H
FLIP    EQU     0AA62H
STAT    EQU     0AA63H
KEY     EQU     0AA64H
ULN     EQU     0AA65H
SPIN    EQU     0AA66H
MFROM   EQU     0AA67H
MTO     EQU     0AA68H
MKIND   EQU     0AA69H
BOOKP   EQU     0AA6AH
TMPD    EQU     0AA6BH
TMPE    EQU     0AA6CH
DRSQ    EQU     0AA6DH
TWO     EQU     0AA6EH
TBC     EQU     0AA6FH
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
        LDI     0CH
        PHI     RF
        LDI     0
        PLO     RF
VOF0    DEC     RF
        GHI     RF
        BNZ     VOF0
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
SOUND   PLO     RF
        LDI     HIGH (MUTE)
        PHI     RA
        LDI     LOW (MUTE)
        PLO     RA
        LDN     RA
        LBNZ    SNDQ
        GLO     RF
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
SNDQ    SEP     R5
; NOISE - RC = noise word (high byte, low byte 80H), D = frames
NOISE   PLO     RF
        LDI     HIGH (MUTE)
        PHI     RA
        LDI     LOW (MUTE)
        PLO     RA
        LDN     RA
        LBNZ    SNDQ
        GLO     RF
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
ALPHA   EQU     LOC
BETA    EQU     LOC+2
BEST    EQU     LOC+4
DEP     EQU     LOC+6
MPTR    EQU     LOC+7
MLE     EQU     LOC+9
LEG     EQU     LOC+11
QPH     EQU     LOC+12
MLS     EQU     LOC+13
INCHK   EQU     LOC+15
GEN
        LDI     HIGH BOARD
        PHI     RD
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        PHI     R7
        LDI     0
        PLO     R9
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
GL      GLO     R9
        PLO     RD
        LDN     RD
        LBNZ    GL1
GNX     INC     R9
        GLO     R9
        ANI     08H
        LBZ     GL
        GLO     R9
        ADI     8
        PLO     R9
        ANI     80H
        LBZ     GL
        LBR     GDONE
GL1     PLO     R7
        ANI     8
        STR     R2
        GHI     R7
        XOR
        LBNZ    GNX
        GLO     R7
        ANI     7
        PHI     R9
        SMI     1
        LBZ     GPAWN
        SMI     1
        LBZ     GKNI
        SMI     1
        LBZ     GBIS
        SMI     1
        LBZ     GROO
        SMI     1
        LBZ     GQUE
        LBR     GKIN
GDONE
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        GHI     RB
        STR     RA
        INC     RA
        GLO     RB
        STR     RA
        LDI     0
        PHI     R7
        SEP     R5
GBIS
        LDI     HIGH (DIAG)
        PHI     RE
        LDI     LOW (DIAG)
        PLO     RE
        LDI     4
        LBR     GSL0
GROO
        LDI     HIGH (ORTH)
        PHI     RE
        LDI     LOW (ORTH)
        PLO     RE
        LDI     4
        LBR     GSL0
GQUE
        LDI     HIGH (DIAG)
        PHI     RE
        LDI     LOW (DIAG)
        PLO     RE
        LDI     8
GSL0    PHI     R8
GSL     LDA     RE
        PLO     R8
        GLO     R9
        PLO     RC
GS1     GLO     RC
        STR     R2
        GLO     R8
        ADD
        PLO     RC
        ANI     88H
        LBNZ    GS9
        GLO     RC
        PLO     RD
        LDN     RD
        LBNZ    GS5
        GLO     RF
        LBNZ    GS1
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     0
        STR     RB
        INC     RB
        LDI     0
        STR     RB
        INC     RB
        LBR     GS1
GS5     PLO     R7
        ANI     8
        STR     R2
        GHI     R7
        XOR
        LBZ     GS9
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     0
        STR     RB
        INC     RB
        GLO     R7
        ANI     7
        SHL
        SHL
        SHL
        STR     R2
        GHI     R9
        SD
        STR     RB
        INC     RB
GS9     GHI     R8
        SMI     1
        PHI     R8
        LBNZ    GSL
        LBR     GNX
GKNI
        LDI     HIGH (NOFF)
        PHI     RE
        LDI     LOW (NOFF)
        PLO     RE
        LBR     GN0
GKIN
        LDI     HIGH (KOFF)
        PHI     RE
        LDI     LOW (KOFF)
        PLO     RE
GN0     LDI     8
        PHI     R8
GN1     LDA     RE
        STR     R2
        GLO     R9
        ADD
        PLO     RC
        ANI     88H
        LBNZ    GN9
        GLO     RC
        PLO     RD
        LDN     RD
        LBNZ    GN5
        GLO     RF
        LBNZ    GN9
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     0
        STR     RB
        INC     RB
        LDI     0
        STR     RB
        INC     RB
        LBR     GN9
GN5     PLO     R7
        ANI     8
        STR     R2
        GHI     R7
        XOR
        LBZ     GN9
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     0
        STR     RB
        INC     RB
        GLO     R7
        ANI     7
        SHL
        SHL
        SHL
        STR     R2
        GHI     R9
        SD
        STR     RB
        INC     RB
GN9     GHI     R8
        SMI     1
        PHI     R8
        LBNZ    GN1
        GHI     R9
        XRI     6
        LBNZ    GNX
        GLO     RF
        LBNZ    GNX
        GHI     R7
        LBNZ    GCB
GCW1
        LDI     HIGH (CASTLE)
        PHI     RA
        LDI     LOW (CASTLE)
        PLO     RA
        LDN     RA
        ANI     1
        LBZ     GCW1X
        GLO     R9
        XRI     4
        LBNZ    GCW1X
        LDI     5
        PLO     RD
        LDN     RD
        LBNZ    GCW1X
        LDI     6
        PLO     RD
        LDN     RD
        LBNZ    GCW1X
        LDI     7
        PLO     RD
        LDN     RD
        XRI     4
        LBNZ    GCW1X
        LDI     HIGH (ATBY)
        PHI     RA
        LDI     LOW (ATBY)
        PLO     RA
        LDI     8
        STR     RA
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        LDI     4
        STR     RA
        SEP     R4
        WORD    ATTACKED
        LBNZ    GCW1X
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        LDI     5
        STR     RA
        SEP     R4
        WORD    ATTACKED
        LBNZ    GCW1X
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        LDI     6
        STR     RA
        SEP     R4
        WORD    ATTACKED
        LBNZ    GCW1X
        LDI     HIGH BOARD
        PHI     RD
        LDI     6
        PLO     RC
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     3
        STR     RB
        INC     RB
        LDI     0
        STR     RB
        INC     RB
GCW1X
GCW2
        LDI     HIGH (CASTLE)
        PHI     RA
        LDI     LOW (CASTLE)
        PLO     RA
        LDN     RA
        ANI     2
        LBZ     GCW2X
        GLO     R9
        XRI     4
        LBNZ    GCW2X
        LDI     3
        PLO     RD
        LDN     RD
        LBNZ    GCW2X
        LDI     2
        PLO     RD
        LDN     RD
        LBNZ    GCW2X
        LDI     1
        PLO     RD
        LDN     RD
        LBNZ    GCW2X
        LDI     0
        PLO     RD
        LDN     RD
        XRI     4
        LBNZ    GCW2X
        LDI     HIGH (ATBY)
        PHI     RA
        LDI     LOW (ATBY)
        PLO     RA
        LDI     8
        STR     RA
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        LDI     4
        STR     RA
        SEP     R4
        WORD    ATTACKED
        LBNZ    GCW2X
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        LDI     3
        STR     RA
        SEP     R4
        WORD    ATTACKED
        LBNZ    GCW2X
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        LDI     2
        STR     RA
        SEP     R4
        WORD    ATTACKED
        LBNZ    GCW2X
        LDI     HIGH BOARD
        PHI     RD
        LDI     2
        PLO     RC
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     3
        STR     RB
        INC     RB
        LDI     0
        STR     RB
        INC     RB
GCW2X
        LDI     0
        PLO     RF
        LBR     GNX
GCB
GCB1
        LDI     HIGH (CASTLE)
        PHI     RA
        LDI     LOW (CASTLE)
        PLO     RA
        LDN     RA
        ANI     4
        LBZ     GCB1X
        GLO     R9
        XRI     116
        LBNZ    GCB1X
        LDI     117
        PLO     RD
        LDN     RD
        LBNZ    GCB1X
        LDI     118
        PLO     RD
        LDN     RD
        LBNZ    GCB1X
        LDI     119
        PLO     RD
        LDN     RD
        XRI     12
        LBNZ    GCB1X
        LDI     HIGH (ATBY)
        PHI     RA
        LDI     LOW (ATBY)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        LDI     116
        STR     RA
        SEP     R4
        WORD    ATTACKED
        LBNZ    GCB1X
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        LDI     117
        STR     RA
        SEP     R4
        WORD    ATTACKED
        LBNZ    GCB1X
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        LDI     118
        STR     RA
        SEP     R4
        WORD    ATTACKED
        LBNZ    GCB1X
        LDI     HIGH BOARD
        PHI     RD
        LDI     118
        PLO     RC
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     3
        STR     RB
        INC     RB
        LDI     0
        STR     RB
        INC     RB
GCB1X
GCB2
        LDI     HIGH (CASTLE)
        PHI     RA
        LDI     LOW (CASTLE)
        PLO     RA
        LDN     RA
        ANI     8
        LBZ     GCB2X
        GLO     R9
        XRI     116
        LBNZ    GCB2X
        LDI     115
        PLO     RD
        LDN     RD
        LBNZ    GCB2X
        LDI     114
        PLO     RD
        LDN     RD
        LBNZ    GCB2X
        LDI     113
        PLO     RD
        LDN     RD
        LBNZ    GCB2X
        LDI     112
        PLO     RD
        LDN     RD
        XRI     12
        LBNZ    GCB2X
        LDI     HIGH (ATBY)
        PHI     RA
        LDI     LOW (ATBY)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        LDI     116
        STR     RA
        SEP     R4
        WORD    ATTACKED
        LBNZ    GCB2X
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        LDI     115
        STR     RA
        SEP     R4
        WORD    ATTACKED
        LBNZ    GCB2X
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        LDI     114
        STR     RA
        SEP     R4
        WORD    ATTACKED
        LBNZ    GCB2X
        LDI     HIGH BOARD
        PHI     RD
        LDI     114
        PLO     RC
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     3
        STR     RB
        INC     RB
        LDI     0
        STR     RB
        INC     RB
GCB2X
        LDI     0
        PLO     RF
        LBR     GNX
GPAWN   GHI     R7
        LBZ     GP1
        LDI     0F0H
        PLO     R8
        GLO     R9
        SMI     20H
        LBR     GP2
GP1     LDI     10H
        PLO     R8
        GLO     R9
        ADI     20H
GP2     ANI     0F0H
        XRI     80H
        LBZ     GP2L
        XRI     80H
        XRI     0F0H
GP2L    PHI     R8
        GLO     R8
        ADI     255
        STR     R2
        GLO     R9
        ADD
        PLO     RC
        ANI     88H
        LBNZ    GPC1X
        GLO     RC
        PLO     RD
        LDN     RD
        LBZ     GPC1E
        PLO     R7
        ANI     8
        STR     R2
        GHI     R7
        XOR
        LBZ     GPC1X
        GHI     R8
        LBZ     GPC1P
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     0
        STR     RB
        INC     RB
        GLO     R7
        ANI     7
        SHL
        SHL
        SHL
        STR     R2
        GHI     R9
        SD
        STR     RB
        INC     RB
        LBR     GPC1X
GPC1P
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     4
        STR     RB
        INC     RB
        GLO     R7
        ANI     7
        SHL
        SHL
        SHL
        STR     R2
        GHI     R9
        SD
        STR     RB
        INC     RB
        DEC     RB
        LDN     RB
        ADI     40
        STR     RB
        INC     RB
        LBR     GPC1X
GPC1E
        LDI     HIGH (EP)
        PHI     RA
        LDI     LOW (EP)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RC
        XOR
        LBNZ    GPC1X
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     2
        STR     RB
        INC     RB
        LDI     7
        STR     RB
        INC     RB
GPC1X
        GLO     R8
        ADI     1
        STR     R2
        GLO     R9
        ADD
        PLO     RC
        ANI     88H
        LBNZ    GPC2X
        GLO     RC
        PLO     RD
        LDN     RD
        LBZ     GPC2E
        PLO     R7
        ANI     8
        STR     R2
        GHI     R7
        XOR
        LBZ     GPC2X
        GHI     R8
        LBZ     GPC2P
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     0
        STR     RB
        INC     RB
        GLO     R7
        ANI     7
        SHL
        SHL
        SHL
        STR     R2
        GHI     R9
        SD
        STR     RB
        INC     RB
        LBR     GPC2X
GPC2P
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     4
        STR     RB
        INC     RB
        GLO     R7
        ANI     7
        SHL
        SHL
        SHL
        STR     R2
        GHI     R9
        SD
        STR     RB
        INC     RB
        DEC     RB
        LDN     RB
        ADI     40
        STR     RB
        INC     RB
        LBR     GPC2X
GPC2E
        LDI     HIGH (EP)
        PHI     RA
        LDI     LOW (EP)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RC
        XOR
        LBNZ    GPC2X
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     2
        STR     RB
        INC     RB
        LDI     7
        STR     RB
        INC     RB
GPC2X
        GLO     R8
        STR     R2
        GLO     R9
        ADD
        PLO     RC
        PLO     RD
        LDN     RD
        LBNZ    GNX
        GHI     R8
        LBNZ    GP5
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     4
        STR     RB
        INC     RB
        LDI     40
        STR     RB
        INC     RB
        LBR     GNX
GP5     GLO     RF
        LBNZ    GNX
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     0
        STR     RB
        INC     RB
        LDI     0
        STR     RB
        INC     RB
        GLO     R9
        ANI     0F0H
        STR     R2
        GHI     R7
        LBZ     GP6
        LDI     60H
        LBR     GP7
GP6     LDI     10H
GP7     XOR
        LBNZ    GNX
        GLO     R8
        STR     R2
        GLO     RC
        ADD
        PLO     RC
        PLO     RD
        LDN     RD
        LBNZ    GNX
        GLO     R9
        STR     RB
        INC     RB
        GLO     RC
        STR     RB
        INC     RB
        LDI     1
        STR     RB
        INC     RB
        LDI     0
        STR     RB
        INC     RB
        LBR     GNX
ATTACKED
        LDI     HIGH BOARD
        PHI     RD
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        LDN     RA
        PLO     RC
        LDI     HIGH (ATBY)
        PHI     RA
        LDI     LOW (ATBY)
        PLO     RA
        LDN     RA
        PLO     RF
        LBNZ    ATPB
        GLO     RC
        ADI     241
        PLO     RD
        ANI     88H
        LBNZ    ATP241
        LDN     RD
        XRI     1
        LBZ     ATYES
ATP241
        GLO     RC
        ADI     239
        PLO     RD
        ANI     88H
        LBNZ    ATP239
        LDN     RD
        XRI     1
        LBZ     ATYES
ATP239
        LBR     ATN
ATPB
        GLO     RC
        ADI     15
        PLO     RD
        ANI     88H
        LBNZ    ATQ15
        LDN     RD
        XRI     9
        LBZ     ATYES
ATQ15
        GLO     RC
        ADI     17
        PLO     RD
        ANI     88H
        LBNZ    ATQ17
        LDN     RD
        XRI     9
        LBZ     ATYES
ATQ17
ATN
        LDI     HIGH (NOFF)
        PHI     RE
        LDI     LOW (NOFF)
        PLO     RE
        LDI     8
        PHI     R8
ATN1   LDA     RE
        STR     R2
        GLO     RC
        ADD
        PLO     RD
        ANI     88H
        LBNZ    ATN2
        GLO     RF
        ORI     2
        STR     R2
        LDN     RD
        XOR
        LBZ     ATYES
ATN2   GHI     R8
        SMI     1
        PHI     R8
        LBNZ    ATN1
ATK
        LDI     HIGH (KOFF)
        PHI     RE
        LDI     LOW (KOFF)
        PLO     RE
        LDI     8
        PHI     R8
ATK1   LDA     RE
        STR     R2
        GLO     RC
        ADD
        PLO     RD
        ANI     88H
        LBNZ    ATK2
        GLO     RF
        ORI     6
        STR     R2
        LDN     RD
        XOR
        LBZ     ATYES
ATK2   GHI     R8
        SMI     1
        PHI     R8
        LBNZ    ATK1
ATD
        LDI     HIGH (DIAG)
        PHI     RE
        LDI     LOW (DIAG)
        PLO     RE
        LDI     4
        PHI     R8
ATD1   LDA     RE
        PLO     R8
        GLO     RC
        PLO     RD
ATD2   GLO     RD
        STR     R2
        GLO     R8
        ADD
        PLO     RD
        ANI     88H
        LBNZ    ATD3
        LDN     RD
        LBZ     ATD2
        STR     R2
        GLO     RF
        ORI     3
        XOR
        LBZ     ATYES
        GLO     RF
        ORI     5
        XOR
        LBZ     ATYES
ATD3   GHI     R8
        SMI     1
        PHI     R8
        LBNZ    ATD1
ATO
        LDI     HIGH (ORTH)
        PHI     RE
        LDI     LOW (ORTH)
        PLO     RE
        LDI     4
        PHI     R8
ATO1   LDA     RE
        PLO     R8
        GLO     RC
        PLO     RD
ATO2   GLO     RD
        STR     R2
        GLO     R8
        ADD
        PLO     RD
        ANI     88H
        LBNZ    ATO3
        LDN     RD
        LBZ     ATO2
        STR     R2
        GLO     RF
        ORI     4
        XOR
        LBZ     ATYES
        GLO     RF
        ORI     5
        XOR
        LBZ     ATYES
ATO3   GHI     R8
        SMI     1
        PHI     R8
        LBNZ    ATO1
        LDI     0
        SEP     R5
ATYES   LDI     1
        SEP     R5
PVADD   GHI     RB
        LBZ     PVX
        ADI     HIGH PVBASE
        PHI     RA
        GLO     RB
        PLO     RA
        LDN     RA
        PLO     R7
        GLO     RA
        ADI     80H
        PLO     RA
        LDN     RA
        PHI     R7
        LDI     HIGH (SC+1)
        PHI     RA
        LDI     LOW (SC+1)
        PLO     RA
        SEX     RA
        GLO     R7
        ADD
        STR     RA
        DEC     RA
        GHI     R7
        ADC
        STR     RA
        SEX     R2
        LDI     0
        PHI     R7
PVX     SEP     R5
PVSUB   GHI     RB
        LBZ     PVX
        ADI     HIGH PVBASE
        PHI     RA
        GLO     RB
        PLO     RA
        LDN     RA
        PLO     R7
        GLO     RA
        ADI     80H
        PLO     RA
        LDN     RA
        PHI     R7
        LDI     HIGH (SC+1)
        PHI     RA
        LDI     LOW (SC+1)
        PLO     RA
        SEX     RA
        GLO     R7
        SD
        STR     RA
        DEC     RA
        GHI     R7
        SDB
        STR     RA
        SEX     R2
        LDI     0
        PHI     R7
        SEP     R5
MAKE
        LDI     HIGH BOARD
        PHI     RD
        LDA     RB
        PLO     R9
        STR     RC
        INC     RC
        LDA     RB
        PHI     R9
        STR     RC
        INC     RC
        LDN     RB
        PLO     R8
        STR     RC
        INC     RC
        GLO     R9
        PLO     RD
        LDN     RD
        PHI     R8
        STR     RC
        INC     RC
        GHI     R9
        PLO     RD
        PHI     RE
        LDN     RD
        PLO     RE
        GLO     R8
        XRI     2
        LBNZ    MK1
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        LBZ     MK0
        GHI     R9
        ADI     10H
        LBR     MK0A
MK0     GHI     R9
        SMI     10H
MK0A    PHI     RE
        PLO     RD
        LDN     RD
        PLO     RE
        LDI     0
        STR     RD
MK1     GLO     RE
        STR     RC
        INC     RC
        GHI     RE
        STR     RC
        INC     RC
        LDI     HIGH (CASTLE)
        PHI     RA
        LDI     LOW (CASTLE)
        PLO     RA
        LDA     RA
        STR     RC
        INC     RC
        LDN     RA
        STR     RC
        INC     RC
        LDI     HIGH (SC)
        PHI     RA
        LDI     LOW (SC)
        PLO     RA
        LDA     RA
        STR     RC
        INC     RC
        LDN     RA
        STR     RC
        GHI     R8
        PLO     RF
        GLO     R8
        XRI     4
        LBNZ    MK2
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (PROMOP)
        PHI     RA
        LDI     LOW (PROMOP)
        PLO     RA
        LDN     RA
        OR
        PLO     RF
MK2     GHI     R8
        PHI     RB
        GLO     R9
        PLO     RB
        SEP     R4
        WORD    PVSUB
        GLO     RF
        PHI     RB
        GHI     R9
        PLO     RB
        SEP     R4
        WORD    PVADD
        GLO     RE
        PHI     RB
        GHI     RE
        PLO     RB
        SEP     R4
        WORD    PVSUB
        LDI     HIGH BOARD
        PHI     RD
        GHI     R9
        PLO     RD
        GLO     RF
        STR     RD
        GLO     R9
        PLO     RD
        LDI     0
        STR     RD
        GLO     R8
        XRI     3
        LBNZ    MK4
        GLO     R9
        STR     R2
        GHI     R9
        SM
        LBNF    MK3
        GLO     R9
        ADI     3
        PLO     RB
        ADI     0FEH
        LBR     MK3A
MK3     GLO     R9
        SMI     4
        PLO     RB
        ADI     3
MK3A    PLO     RE
        GLO     RB
        PLO     RD
        LDN     RD
        PHI     RB
        LDI     0
        STR     RD
        GLO     RE
        PLO     RD
        GHI     RB
        STR     RD
        SEP     R4
        WORD    PVSUB
        GLO     RE
        PLO     RB
        SEP     R4
        WORD    PVADD
MK4     GHI     R8
        ANI     7
        XRI     6
        LBNZ    MK5
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        SHR
        SHR
        SHR
        ADI     LOW KSQW
        PLO     RA
        LDI     HIGH KSQW
        ADCI    0
        PHI     RA
        GHI     R9
        STR     RA
MK5     GLO     R9
        ADI     LOW CMASK
        PLO     RA
        LDI     HIGH CMASK
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     RE
        GHI     R9
        ADI     LOW CMASK
        PLO     RA
        LDI     HIGH CMASK
        ADCI    0
        PHI     RA
        GLO     RE
        SEX     RA
        AND
        SEX     R2
        STR     R2
        LDI     HIGH (CASTLE)
        PHI     RA
        LDI     LOW (CASTLE)
        PLO     RA
        LDN     RA
        AND
        STR     RA
        INC     RA
        GLO     R8
        XRI     1
        LBZ     MK6
        LDI     80H
        STR     RA
        LBR     MK7
MK6     GLO     R9
        STR     R2
        GHI     R9
        ADD
        SHR
        STR     RA
MK7
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        XRI     8
        STR     RA
        SEP     R5
UNMAKE
        LDI     HIGH BOARD
        PHI     RD
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        XRI     8
        STR     RA
        LDA     RC
        PLO     R9
        LDA     RC
        PHI     R9
        LDA     RC
        PLO     R8
        LDA     RC
        PHI     R8
        LDA     RC
        PLO     RE
        LDA     RC
        PHI     RE
        GLO     R9
        PLO     RD
        GHI     R8
        STR     RD
        GHI     R9
        PLO     RD
        LDI     0
        STR     RD
        GHI     RE
        PLO     RD
        GLO     RE
        STR     RD
        GLO     R8
        XRI     3
        LBNZ    UM4
        GLO     R9
        STR     R2
        GHI     R9
        SM
        LBNF    UM3
        GLO     R9
        ADI     3
        PLO     RB
        ADI     0FEH
        LBR     UM3A
UM3     GLO     R9
        SMI     4
        PLO     RB
        ADI     3
UM3A    PLO     RD
        LDN     RD
        PHI     RB
        LDI     0
        STR     RD
        GLO     RB
        PLO     RD
        GHI     RB
        STR     RD
UM4     GHI     R8
        ANI     7
        XRI     6
        LBNZ    UM5
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        SHR
        SHR
        SHR
        ADI     LOW KSQW
        PLO     RA
        LDI     HIGH KSQW
        ADCI    0
        PHI     RA
        GLO     R9
        STR     RA
UM5
        LDI     HIGH (CASTLE)
        PHI     RA
        LDI     LOW (CASTLE)
        PLO     RA
        LDA     RC
        STR     RA
        INC     RA
        LDA     RC
        STR     RA
        LDI     HIGH (SC)
        PHI     RA
        LDI     LOW (SC)
        PLO     RA
        LDA     RC
        STR     RA
        INC     RA
        LDN     RC
        STR     RA
        SEP     R5
LEGALCHK
        LDI     HIGH (INCHK)
        PHI     RA
        LDI     LOW (INCHK)
        PLO     RA
        LDN     RA
        LBNZ    LCF
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SHL
        SHL
        PLO     RC
        LDI     HIGH UNDO
        PHI     RC
        LDA     RC
        PLO     R9
        INC     RC
        LDA     RC
        XRI     2
        LBZ     LCF
        LDN     RC
        ANI     7
        XRI     6
        LBZ     LCF
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        XRI     8
        SHR
        SHR
        SHR
        ADI     LOW KSQW
        PLO     RA
        LDI     HIGH KSQW
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        GLO     R9
        SM
        ADI     77H
        ADI     LOW ALIGN
        PLO     RA
        LDI     HIGH ALIGN
        ADCI    0
        PHI     RA
        LDN     RA
        LBNZ    LCF
        SEP     R5
LCF
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (ATBY)
        PHI     RA
        LDI     LOW (ATBY)
        PLO     RA
        GLO     R7
        STR     RA
        XRI     8
        SHR
        SHR
        SHR
        ADI     LOW KSQW
        PLO     RA
        LDI     HIGH KSQW
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    ATTACKED
        SEP     R5
PICK
        LDI     HIGH (QPH)
        PHI     RA
        LDI     LOW (QPH)
        PLO     RA
        LDN     RA
        LBNZ    PKX
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDI     HIGH (MLE)
        PHI     RA
        LDI     LOW (MLE)
        PLO     RA
        LDA     RA
        PHI     RE
        LDN     RA
        PLO     RE
        GLO     RB
        PLO     RC
        GHI     RB
        PHI     RC
        INC     RB
        INC     RB
        INC     RB
        LDN     RB
        PLO     R8
        DEC     RB
        DEC     RB
        DEC     RB
PK1     INC     RB
        INC     RB
        INC     RB
        INC     RB
        GLO     RB
        STR     R2
        GLO     RE
        XOR
        LBNZ    PK2
        GHI     RB
        STR     R2
        GHI     RE
        XOR
        LBZ     PK5
PK2     INC     RB
        INC     RB
        INC     RB
        GLO     R8
        STR     R2
        LDN     RB
        SM
        DEC     RB
        DEC     RB
        DEC     RB
        LBNF    PK1
        LBZ     PK1
        INC     RB
        INC     RB
        INC     RB
        LDN     RB
        PLO     R8
        DEC     RB
        DEC     RB
        DEC     RB
        GLO     RB
        PLO     RC
        GHI     RB
        PHI     RC
        LBR     PK1
PK5     GLO     R8
        LBNZ    PK6
        LDI     HIGH (QPH)
        PHI     RA
        LDI     LOW (QPH)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R5
PK6
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDI     4
        PLO     RE
PK7     LDN     RB
        PLO     R8
        LDN     RC
        STR     RB
        GLO     R8
        STR     RC
        INC     RB
        INC     RC
        DEC     RE
        GLO     RE
        LBNZ    PK7
PKX     SEP     R5
POLL    B1      PL1
        SEP     R4
        WORD    VBDRAW
PL1
        LDI     HIGH (NODES+2)
        PHI     RA
        LDI     LOW (NODES+2)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LBNF    PL2
        DEC     RA
        LDN     RA
        ADI     1
        STR     RA
        DEC     RA
        LDN     RA
        ADCI    0
        STR     RA
        LDI     HIGH (NODES+2)
        PHI     RA
        LDI     LOW (NODES+2)
        PLO     RA
        LDN     RA
PL2     ANI     15
        LBNZ    PL3
        SEP     R4
        WORD    THINKTICK
PL3     SEP     R5
SEARCH
        SEP     R4
        WORD    POLL
        LDI     HIGH (DEP)
        PHI     RA
        LDI     LOW (DEP)
        PLO     RA
        LDN     RA
        LBZ     QSEARCH
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        GLO     R7
        STR     RA
        XRI     8
        PLO     R7
        LDI     HIGH (ATBY)
        PHI     RA
        LDI     LOW (ATBY)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        LDN     RA
        SHR
        SHR
        SHR
        ADI     LOW KSQW
        PLO     RA
        LDI     HIGH KSQW
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    ATTACKED
        PLO     R7
        LDI     HIGH (INCHK)
        PHI     RA
        LDI     LOW (INCHK)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (MLS)
        PHI     RA
        LDI     LOW (MLS)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     0
        PLO     RF
        SEP     R4
        WORD    GEN
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (MLE)
        PHI     RA
        LDI     LOW (MLE)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     HIGH (MLS)
        PHI     RA
        LDI     LOW (MLS)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     HIGH (QPH)
        PHI     RA
        LDI     LOW (QPH)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (LEG)
        PHI     RA
        LDI     LOW (LEG)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (BEST)
        PHI     RA
        LDI     LOW (BEST)
        PLO     RA
        LDI     3
        STR     RA
        INC     RA
        LDI     0
        STR     RA
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        ADI     LOW KILF
        PLO     RA
        LDI     HIGH KILF
        PHI     RA
        LDN     RA
        PLO     R9
        GLO     RA
        ADI     16
        PLO     RA
        LDN     RA
        PHI     R9
        LDI     HIGH (MLS)
        PHI     RA
        LDI     LOW (MLS)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDI     HIGH (MLE)
        PHI     RA
        LDI     LOW (MLE)
        PLO     RA
        LDA     RA
        PHI     RE
        LDN     RA
        PLO     RE
SK1     GLO     RB
        STR     R2
        GLO     RE
        XOR
        LBNZ    SK2
        GHI     RB
        STR     R2
        GHI     RE
        XOR
        LBZ     SK9
SK2     GLO     R9
        STR     R2
        LDA     RB
        XOR
        LBNZ    SK3
        GHI     R9
        STR     R2
        LDN     RB
        XOR
        LBNZ    SK3
        INC     RB
        INC     RB
        LDN     RB
        LBNZ    SK9
        LDI     30
        STR     RB
        LBR     SK9
SK3     DEC     RB
        INC     RB
        INC     RB
        INC     RB
        INC     RB
        LBR     SK1
SK9
SL
        LDI     HIGH (MPTR+1)
        PHI     RA
        LDI     LOW (MPTR+1)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (MLE+1)
        PHI     RA
        LDI     LOW (MLE+1)
        PLO     RA
        LDN     RA
        XOR
        LBNZ    SL1
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (MLE)
        PHI     RA
        LDI     LOW (MLE)
        PLO     RA
        LDN     RA
        XOR
        LBZ     SDONE
SL1
        SEP     R4
        WORD    PICK
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SHL
        SHL
        PLO     RC
        LDI     HIGH UNDO
        PHI     RC
        SEP     R4
        WORD    MAKE
        SEP     R4
        WORD    LEGALCHK
        LBZ     SL2
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SHL
        SHL
        PLO     RC
        LDI     HIGH UNDO
        PHI     RC
        SEP     R4
        WORD    UNMAKE
        LBR     SNEXT
SL2
        LDI     HIGH (LEG)
        PHI     RA
        LDI     LOW (LEG)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (LOC+15)
        PHI     RA
        LDI     LOW (LOC+15)
        PLO     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        LDI     HIGH (BETA+1)
        PHI     RA
        LDI     LOW (BETA+1)
        PLO     RA
        LDN     RA
        SDI     0
        PLO     R7
        LDI     HIGH (TA+1)
        PHI     RA
        LDI     LOW (TA+1)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BETA)
        PHI     RA
        LDI     LOW (BETA)
        PLO     RA
        LDN     RA
        SDBI    0
        PLO     R7
        LDI     HIGH (TA)
        PHI     RA
        LDI     LOW (TA)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (ALPHA+1)
        PHI     RA
        LDI     LOW (ALPHA+1)
        PLO     RA
        LDN     RA
        SDI     0
        PLO     R7
        LDI     HIGH (BETA+1)
        PHI     RA
        LDI     LOW (BETA+1)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (ALPHA)
        PHI     RA
        LDI     LOW (ALPHA)
        PLO     RA
        LDN     RA
        SDBI    0
        PLO     R7
        LDI     HIGH (BETA)
        PHI     RA
        LDI     LOW (BETA)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (TA)
        PHI     RA
        LDI     LOW (TA)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (ALPHA)
        PHI     RA
        LDI     LOW (ALPHA)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     HIGH (DEP)
        PHI     RA
        LDI     LOW (DEP)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        SEP     R4
        WORD    SEARCH
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LDI     HIGH (LOC)
        PHI     RA
        LDI     LOW (LOC)
        PLO     RA
        IRX
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDX
        STR     RA
        LDI     HIGH (RETV+1)
        PHI     RA
        LDI     LOW (RETV+1)
        PLO     RA
        LDN     RA
        SDI     0
        PLO     R7
        LDI     HIGH (TV+1)
        PHI     RA
        LDI     LOW (TV+1)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (RETV)
        PHI     RA
        LDI     LOW (RETV)
        PLO     RA
        LDN     RA
        SDBI    0
        PLO     R7
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SHL
        SHL
        PLO     RC
        LDI     HIGH UNDO
        PHI     RC
        SEP     R4
        WORD    UNMAKE
        LDI     HIGH (ABORT)
        PHI     RA
        LDI     LOW (ABORT)
        PLO     RA
        LDN     RA
        LBNZ    SDONE
        LDI     HIGH (TV+1)
        PHI     RA
        LDI     LOW (TV+1)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (BEST+1)
        PHI     RA
        LDI     LOW (BEST+1)
        PLO     RA
        LDN     RA
        SM
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (BEST)
        PHI     RA
        LDI     LOW (BEST)
        PLO     RA
        LDN     RA
        SMB
        LBNF    SL3
        LBR     SL5
SL3
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (BEST)
        PHI     RA
        LDI     LOW (BEST)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        LBNZ    SL5
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDI     HIGH (ROOTF)
        PHI     RA
        LDI     LOW (ROOTF)
        PLO     RA
        LDA     RB
        STR     RA
        INC     RA
        LDA     RB
        STR     RA
        INC     RA
        LDA     RB
        STR     RA
        INC     RA
        LDI     1
        STR     RA
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (ROOTV)
        PHI     RA
        LDI     LOW (ROOTV)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
SL5
        LDI     HIGH (TV+1)
        PHI     RA
        LDI     LOW (TV+1)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (ALPHA+1)
        PHI     RA
        LDI     LOW (ALPHA+1)
        PLO     RA
        LDN     RA
        SM
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (ALPHA)
        PHI     RA
        LDI     LOW (ALPHA)
        PLO     RA
        LDN     RA
        SMB
        LBNF    SL6
        LBR     SNEXT
SL6
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (ALPHA)
        PHI     RA
        LDI     LOW (ALPHA)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     HIGH (BETA+1)
        PHI     RA
        LDI     LOW (BETA+1)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (ALPHA+1)
        PHI     RA
        LDI     LOW (ALPHA+1)
        PLO     RA
        LDN     RA
        SM
        LDI     HIGH (BETA)
        PHI     RA
        LDI     LOW (BETA)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (ALPHA)
        PHI     RA
        LDI     LOW (ALPHA)
        PLO     RA
        LDN     RA
        SMB
        LBNF    SNEXT
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        INC     RB
        INC     RB
        INC     RB
        LDN     RB
        LBNZ    SDONE
        DEC     RB
        DEC     RB
        DEC     RB
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        ADI     LOW KILF
        PLO     RA
        LDI     HIGH KILF
        PHI     RA
        LDA     RB
        STR     RA
        GLO     RA
        ADI     16
        PLO     RA
        LDN     RB
        STR     RA
        LBR     SDONE
SNEXT
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        INC     RB
        INC     RB
        INC     RB
        INC     RB
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        GHI     RB
        STR     RA
        INC     RA
        GLO     RB
        STR     RA
        LBR     SL
SDONE
        LDI     HIGH (MLS)
        PHI     RA
        LDI     LOW (MLS)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     HIGH (LEG)
        PHI     RA
        LDI     LOW (LEG)
        PLO     RA
        LDN     RA
        LBNZ    SD5
        LDI     HIGH (INCHK)
        PHI     RA
        LDI     LOW (INCHK)
        PLO     RA
        LDN     RA
        LBZ     SD4
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        ADI     0D0H
        PLO     R7
        LDI     HIGH (RETV+1)
        PHI     RA
        LDI     LOW (RETV+1)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (RETV)
        PHI     RA
        LDI     LOW (RETV)
        PLO     RA
        LDI     10
        STR     RA
        SEP     R5
SD4
        LDI     HIGH (RETV)
        PHI     RA
        LDI     LOW (RETV)
        PLO     RA
        LDI     128
        STR     RA
        INC     RA
        LDI     0
        STR     RA
        SEP     R5
SD5
        LDI     HIGH (BEST)
        PHI     RA
        LDI     LOW (BEST)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (RETV)
        PHI     RA
        LDI     LOW (RETV)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        SEP     R5
QSEARCH
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        LBNZ    QS1
        LDI     HIGH (SC)
        PHI     RA
        LDI     LOW (SC)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LBR     QS2
QS1
        LDI     HIGH (SC+1)
        PHI     RA
        LDI     LOW (SC+1)
        PLO     RA
        LDN     RA
        SDI     0
        PLO     R7
        LDI     HIGH (TV+1)
        PHI     RA
        LDI     LOW (TV+1)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (SC)
        PHI     RA
        LDI     LOW (SC)
        PLO     RA
        LDN     RA
        SDBI    0
        PLO     R7
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        GLO     R7
        STR     RA
QS2
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        LDN     RA
        XRI     80H
        STR     RA
        LDI     HIGH (BETA+1)
        PHI     RA
        LDI     LOW (BETA+1)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (TV+1)
        PHI     RA
        LDI     LOW (TV+1)
        PLO     RA
        LDN     RA
        SM
        LDI     HIGH (BETA)
        PHI     RA
        LDI     LOW (BETA)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        LDN     RA
        SMB
        LBNF    QS3
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (RETV)
        PHI     RA
        LDI     LOW (RETV)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        SEP     R5
QS3
        LDI     HIGH (TV+1)
        PHI     RA
        LDI     LOW (TV+1)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (ALPHA+1)
        PHI     RA
        LDI     LOW (ALPHA+1)
        PLO     RA
        LDN     RA
        SM
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (ALPHA)
        PHI     RA
        LDI     LOW (ALPHA)
        PLO     RA
        LDN     RA
        SMB
        LBNF    QS4
        LBR     QS5
QS4
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (ALPHA)
        PHI     RA
        LDI     LOW (ALPHA)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
QS5
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (BEST)
        PHI     RA
        LDI     LOW (BEST)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        SMI     14
        LBDF    QDONE
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        GLO     R7
        STR     RA
        XRI     8
        PLO     R7
        LDI     HIGH (ATBY)
        PHI     RA
        LDI     LOW (ATBY)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        LDN     RA
        SHR
        SHR
        SHR
        ADI     LOW KSQW
        PLO     RA
        LDI     HIGH KSQW
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    ATTACKED
        PLO     R7
        LDI     HIGH (INCHK)
        PHI     RA
        LDI     LOW (INCHK)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (MLS)
        PHI     RA
        LDI     LOW (MLS)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     1
        PLO     RF
        SEP     R4
        WORD    GEN
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (MLE)
        PHI     RA
        LDI     LOW (MLE)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     HIGH (MLS)
        PHI     RA
        LDI     LOW (MLS)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     HIGH (QPH)
        PHI     RA
        LDI     LOW (QPH)
        PLO     RA
        LDI     0
        STR     RA
QL
        LDI     HIGH (MPTR+1)
        PHI     RA
        LDI     LOW (MPTR+1)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (MLE+1)
        PHI     RA
        LDI     LOW (MLE+1)
        PLO     RA
        LDN     RA
        XOR
        LBNZ    QL1
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (MLE)
        PHI     RA
        LDI     LOW (MLE)
        PLO     RA
        LDN     RA
        XOR
        LBZ     QDONE
QL1
        SEP     R4
        WORD    PICK
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        INC     RB
        INC     RB
        INC     RB
        LDN     RB
        SMI     40
        LBDF    QL1A
        LDN     RB
        ADI     7
        SHR
        SHR
        SHR
        SHL
        ADI     LOW VALT
        PLO     RA
        LDI     HIGH VALT
        ADCI    0
        PHI     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (BEST+1)
        PHI     RA
        LDI     LOW (BEST+1)
        PLO     RA
        GLO     R8
        SEX     RA
        ADD
        PLO     R8
        DEC     RA
        GHI     R8
        ADC
        PHI     R8
        SEX     R2
        LDI     HIGH (TA)
        PHI     RA
        LDI     LOW (TA)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     HIGH (ALPHA+1)
        PHI     RA
        LDI     LOW (ALPHA+1)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (TA+1)
        PHI     RA
        LDI     LOW (TA+1)
        PLO     RA
        LDN     RA
        SM
        LDI     HIGH (ALPHA)
        PHI     RA
        LDI     LOW (ALPHA)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (TA)
        PHI     RA
        LDI     LOW (TA)
        PLO     RA
        LDN     RA
        SMB
        LBNF    QNEXT
QL1A
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SHL
        SHL
        PLO     RC
        LDI     HIGH UNDO
        PHI     RC
        SEP     R4
        WORD    MAKE
        SEP     R4
        WORD    LEGALCHK
        LBZ     QL2
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SHL
        SHL
        PLO     RC
        LDI     HIGH UNDO
        PHI     RC
        SEP     R4
        WORD    UNMAKE
        LBR     QNEXT
QL2
        LDI     HIGH (LOC+15)
        PHI     RA
        LDI     LOW (LOC+15)
        PLO     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        LDI     HIGH (BETA+1)
        PHI     RA
        LDI     LOW (BETA+1)
        PLO     RA
        LDN     RA
        SDI     0
        PLO     R7
        LDI     HIGH (TA+1)
        PHI     RA
        LDI     LOW (TA+1)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BETA)
        PHI     RA
        LDI     LOW (BETA)
        PLO     RA
        LDN     RA
        SDBI    0
        PLO     R7
        LDI     HIGH (TA)
        PHI     RA
        LDI     LOW (TA)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (ALPHA+1)
        PHI     RA
        LDI     LOW (ALPHA+1)
        PLO     RA
        LDN     RA
        SDI     0
        PLO     R7
        LDI     HIGH (BETA+1)
        PHI     RA
        LDI     LOW (BETA+1)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (ALPHA)
        PHI     RA
        LDI     LOW (ALPHA)
        PLO     RA
        LDN     RA
        SDBI    0
        PLO     R7
        LDI     HIGH (BETA)
        PHI     RA
        LDI     LOW (BETA)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (TA)
        PHI     RA
        LDI     LOW (TA)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (ALPHA)
        PHI     RA
        LDI     LOW (ALPHA)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        SEP     R4
        WORD    SEARCH
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LDI     HIGH (LOC)
        PHI     RA
        LDI     LOW (LOC)
        PLO     RA
        IRX
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDX
        STR     RA
        LDI     HIGH (RETV+1)
        PHI     RA
        LDI     LOW (RETV+1)
        PLO     RA
        LDN     RA
        SDI     0
        PLO     R7
        LDI     HIGH (TV+1)
        PHI     RA
        LDI     LOW (TV+1)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (RETV)
        PHI     RA
        LDI     LOW (RETV)
        PLO     RA
        LDN     RA
        SDBI    0
        PLO     R7
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SHL
        SHL
        PLO     RC
        LDI     HIGH UNDO
        PHI     RC
        SEP     R4
        WORD    UNMAKE
        LDI     HIGH (ABORT)
        PHI     RA
        LDI     LOW (ABORT)
        PLO     RA
        LDN     RA
        LBNZ    QDONE
        LDI     HIGH (BETA+1)
        PHI     RA
        LDI     LOW (BETA+1)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (TV+1)
        PHI     RA
        LDI     LOW (TV+1)
        PLO     RA
        LDN     RA
        SM
        LDI     HIGH (BETA)
        PHI     RA
        LDI     LOW (BETA)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        LDN     RA
        SMB
        LBNF    QL3
        LDI     HIGH (MLS)
        PHI     RA
        LDI     LOW (MLS)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (RETV)
        PHI     RA
        LDI     LOW (RETV)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        SEP     R5
QL3
        LDI     HIGH (TV+1)
        PHI     RA
        LDI     LOW (TV+1)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (ALPHA+1)
        PHI     RA
        LDI     LOW (ALPHA+1)
        PLO     RA
        LDN     RA
        SM
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (ALPHA)
        PHI     RA
        LDI     LOW (ALPHA)
        PLO     RA
        LDN     RA
        SMB
        LBNF    QL4
        LBR     QNEXT
QL4
        LDI     HIGH (TV)
        PHI     RA
        LDI     LOW (TV)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (ALPHA)
        PHI     RA
        LDI     LOW (ALPHA)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
QNEXT
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        INC     RB
        INC     RB
        INC     RB
        INC     RB
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        GHI     RB
        STR     RA
        INC     RA
        GLO     RB
        STR     RA
        LBR     QL
QDONE
        LDI     HIGH (MLS)
        PHI     RA
        LDI     LOW (MLS)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     HIGH (ALPHA)
        PHI     RA
        LDI     LOW (ALPHA)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (RETV)
        PHI     RA
        LDI     LOW (RETV)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        SEP     R5
THINK   PLO     R9
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDI     0
        STR     RA
        GLO     R9
        PLO     R7
        LDI     HIGH (DEP)
        PHI     RA
        LDI     LOW (DEP)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (ALPHA)
        PHI     RA
        LDI     LOW (ALPHA)
        PLO     RA
        LDI     3
        STR     RA
        INC     RA
        LDI     0
        STR     RA
        LDI     HIGH (BETA)
        PHI     RA
        LDI     LOW (BETA)
        PLO     RA
        LDI     253
        STR     RA
        INC     RA
        LDI     0
        STR     RA
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        LDI     144
        STR     RA
        INC     RA
        LDI     0
        STR     RA
        LDI     HIGH (ABORT)
        PHI     RA
        LDI     LOW (ABORT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (RDONE)
        PHI     RA
        LDI     LOW (RDONE)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (NODES)
        PHI     RA
        LDI     LOW (NODES)
        PLO     RA
        LDI     0
        STR     RA
        INC     RA
        STR     RA
        INC     RA
        STR     RA
        SEP     R4
        WORD    SEARCH
        SEP     R5
PERFT
        LDI     HIGH (DEP)
        PHI     RA
        LDI     LOW (DEP)
        PLO     RA
        LDN     RA
        LBNZ    PF1
        LDI     HIGH (PCNT+3)
        PHI     RA
        LDI     LOW (PCNT+3)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        DEC     RA
        LDN     RA
        ADCI    0
        STR     RA
        DEC     RA
        LDN     RA
        ADCI    0
        STR     RA
        DEC     RA
        LDN     RA
        ADCI    0
        STR     RA
        SEP     R5
PF1
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        GLO     R7
        STR     RA
        XRI     8
        PLO     R7
        LDI     HIGH (ATBY)
        PHI     RA
        LDI     LOW (ATBY)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        LDN     RA
        SHR
        SHR
        SHR
        ADI     LOW KSQW
        PLO     RA
        LDI     HIGH KSQW
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    ATTACKED
        PLO     R7
        LDI     HIGH (INCHK)
        PHI     RA
        LDI     LOW (INCHK)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (MLS)
        PHI     RA
        LDI     LOW (MLS)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     0
        PLO     RF
        SEP     R4
        WORD    GEN
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (MLE)
        PHI     RA
        LDI     LOW (MLE)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        LDI     HIGH (MLS)
        PHI     RA
        LDI     LOW (MLS)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
PFL
        LDI     HIGH (MPTR+1)
        PHI     RA
        LDI     LOW (MPTR+1)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (MLE+1)
        PHI     RA
        LDI     LOW (MLE+1)
        PLO     RA
        LDN     RA
        XOR
        LBNZ    PF2
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (MLE)
        PHI     RA
        LDI     LOW (MLE)
        PLO     RA
        LDN     RA
        XOR
        LBZ     PFD
PF2
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SHL
        SHL
        PLO     RC
        LDI     HIGH UNDO
        PHI     RC
        SEP     R4
        WORD    MAKE
        SEP     R4
        WORD    LEGALCHK
        LBNZ    PF3
        LDI     HIGH (LOC+15)
        PHI     RA
        LDI     LOW (LOC+15)
        PLO     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        DEC     RA
        LDN     RA
        STXD
        LDI     HIGH (DEP)
        PHI     RA
        LDI     LOW (DEP)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        SEP     R4
        WORD    PERFT
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LDI     HIGH (LOC)
        PHI     RA
        LDI     LOW (LOC)
        PLO     RA
        IRX
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDXA
        STR     RA
        INC     RA
        LDX
        STR     RA
PF3
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SHL
        SHL
        PLO     RC
        LDI     HIGH UNDO
        PHI     RC
        SEP     R4
        WORD    UNMAKE
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        INC     RB
        INC     RB
        INC     RB
        INC     RB
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        GHI     RB
        STR     RA
        INC     RA
        GLO     RB
        STR     RA
        LBR     PFL
PFD
        LDI     HIGH (MLS)
        PHI     RA
        LDI     LOW (MLS)
        PLO     RA
        LDA     RA
        PHI     R8
        LDN     RA
        PLO     R8
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        GHI     R8
        STR     RA
        INC     RA
        GLO     R8
        STR     RA
        SEP     R5
TPERFT
        SEP     R4
        WORD    PERFT
HALT    BR      HALT
TTHINK0
        LDI     HIGH (KILF)
        PHI     RD
        LDI     LOW (KILF)
        PLO     RD
        LDI     HIGH (32)
        PHI     RE
        LDI     LOW (32)
        PLO     RE
        LDI     0FFH
        SEP     R4
        WORD    FILL
        LDI     HIGH (DEP)
        PHI     RA
        LDI     LOW (DEP)
        PLO     RA
        LDN     RA
        SEP     R4
        WORD    THINK
        SEP     R5
PVINIT
        LDI     HIGH (PVDATA)
        PHI     RB
        LDI     LOW (PVDATA)
        PLO     RB
        LDI     1
        PLO     R9
PI1     GLO     R9
        ANI     7
        LBZ     PI5
        XRI     7
        LBZ     PI5
        GLO     R9
        ADI     HIGH PVBASE
        PHI     RD
        LDI     0
        PLO     R8
PI2     GLO     R8
        ANI     38H
        SHL
        STR     R2
        GLO     R8
        ANI     7
        OR
        PLO     RD
        LDA     RB
        PLO     RC
        LDA     RB
        STR     RD
        GLO     RD
        ADI     80H
        PLO     RD
        GLO     RC
        STR     RD
        INC     R8
        GLO     R8
        XRI     64
        LBNZ    PI2
PI5     INC     R9
        GLO     R9
        XRI     15
        LBNZ    PI1
        SEP     R5
NEWPOS
        LDI     HIGH (BOARD)
        PHI     RD
        LDI     LOW (BOARD)
        PLO     RD
        LDI     HIGH (128)
        PHI     RE
        LDI     LOW (128)
        PLO     RE
        LDI     0
        SEP     R4
        WORD    FILL
        LDI     HIGH (STARTB)
        PHI     RB
        LDI     LOW (STARTB)
        PLO     RB
        LDI     HIGH (BOARD)
        PHI     RD
        LDI     LOW (BOARD)
        PLO     RD
        LDI     8
        PLO     R8
NP1     LDA     RB
        STR     RD
        INC     RD
        DEC     R8
        GLO     R8
        LBNZ    NP1
        LDI     HIGH (BOARD+10H)
        PHI     RD
        LDI     LOW (BOARD+10H)
        PLO     RD
        LDI     8
        PLO     R8
NP2     LDI     1
        STR     RD
        INC     RD
        DEC     R8
        GLO     R8
        LBNZ    NP2
        LDI     HIGH (BOARD+60H)
        PHI     RD
        LDI     LOW (BOARD+60H)
        PLO     RD
        LDI     8
        PLO     R8
NP3     LDI     9
        STR     RD
        INC     RD
        DEC     R8
        GLO     R8
        LBNZ    NP3
        LDI     HIGH (STARTB)
        PHI     RB
        LDI     LOW (STARTB)
        PLO     RB
        LDI     HIGH (BOARD+70H)
        PHI     RD
        LDI     LOW (BOARD+70H)
        PLO     RD
        LDI     8
        PLO     R8
NP4     LDA     RB
        ORI     8
        STR     RD
        INC     RD
        DEC     R8
        GLO     R8
        LBNZ    NP4
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (CASTLE)
        PHI     RA
        LDI     LOW (CASTLE)
        PLO     RA
        LDI     15
        STR     RA
        LDI     HIGH (EP)
        PHI     RA
        LDI     LOW (EP)
        PLO     RA
        LDI     128
        STR     RA
        LDI     HIGH (KSQW)
        PHI     RA
        LDI     LOW (KSQW)
        PLO     RA
        LDI     4
        STR     RA
        LDI     HIGH (KSQB)
        PHI     RA
        LDI     LOW (KSQB)
        PLO     RA
        LDI     116
        STR     RA
        LDI     HIGH (SC)
        PHI     RA
        LDI     LOW (SC)
        PLO     RA
        LDI     0
        STR     RA
        INC     RA
        LDI     0
        STR     RA
        LDI     HIGH (PROMOP)
        PHI     RA
        LDI     LOW (PROMOP)
        PLO     RA
        LDI     5
        STR     RA
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        LDI     144
        STR     RA
        INC     RA
        LDI     0
        STR     RA
        SEP     R5
RESCORE
        LDI     HIGH (SC)
        PHI     RA
        LDI     LOW (SC)
        PLO     RA
        LDI     0
        STR     RA
        INC     RA
        LDI     0
        STR     RA
        LDI     HIGH BOARD
        PHI     RD
        LDI     0
        PLO     RD
RS1     GLO     RD
        ANI     88H
        LBNZ    RS2
        LDN     RD
        PHI     RB
        GLO     RD
        PLO     RB
        GHI     RD
        PHI     RE
        GLO     RD
        PLO     RE
        SEP     R4
        WORD    PVADD
        GHI     RE
        PHI     RD
        GLO     RE
        PLO     RD
RS2     INC     RD
        GLO     RD
        ANI     80H
        LBZ     RS1
        SEP     R5
SQPOS   PLO     R9
        LDI     HIGH (FLIP)
        PHI     RA
        LDI     LOW (FLIP)
        PLO     RA
        LDN     RA
        LBNZ    SP1
        GLO     R9
        ANI     7
        PLO     RE
        GLO     R9
        SHR
        SHR
        SHR
        SHR
        SDI     7
        LBR     SP2
SP1     GLO     R9
        ANI     7
        SDI     7
        PLO     RE
        GLO     R9
        SHR
        SHR
        SHR
        SHR
SP2     PHI     RE
        SHL
        STR     R2
        GHI     RE
        ADD
        PHI     RE
        GLO     RE
        SHL
        SHL
        PLO     RE
        SEP     R5
DRAWSQ
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        LDN     RA
        SEP     R4
        WORD    SQPOS
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (CURSOR)
        PHI     RA
        LDI     LOW (CURSOR)
        PLO     RA
        LDN     RA
        XOR
        LBNZ    DQ1
        LDI     253
        LBR     DQ5
DQ1
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (SELSQ)
        PHI     RA
        LDI     LOW (SELSQ)
        PLO     RA
        LDN     RA
        XOR
        LBNZ    DQ2
        LDI     254
        LBR     DQ5
DQ2
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        LDN     RA
        XOR
        LBZ     DQ3
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (LASTT)
        PHI     RA
        LDI     LOW (LASTT)
        PLO     RA
        LDN     RA
        XOR
        LBNZ    DQ4
DQ3
        LDI     127
        LBR     DQ5
DQ4
        SEP     R4
        WORD    DARKQ
        LBZ     DQ4A
        LDI     124
        LBR     DQ5
DQ4A    LDI     20H
DQ5     PLO     R8
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        LDN     RA
        PLO     RD
        LDI     HIGH BOARD
        PHI     RD
        LDN     RD
        LBZ     DQ6
        PLO     R9
        SHL
        STR     R2
        GLO     R9
        SHL
        SHL
        ADD
        ADI     LOW PCH
        PLO     RB
        LDI     HIGH PCH
        ADCI    0
        PHI     RB
        LBR     DQ7
DQ6
        SEP     R4
        WORD    DARKQ
        LBZ     DQ6A
        LDI     HIGH (FBLUE)
        PHI     RB
        LDI     LOW (FBLUE)
        PLO     RB
        LBR     DQ7
DQ6A
        LDI     HIGH (FSPACE)
        PHI     RB
        LDI     LOW (FSPACE)
        PLO     RB
DQ7     LDI     3
        PLO     R9
DQ8     GLO     R8
        SEP     R1
        INC     RE
        LDA     RB
        SEP     R1
        INC     RE
        LDA     RB
        SEP     R1
        INC     RE
        GLO     R8
        SEP     R1
        DEC     RE
        DEC     RE
        DEC     RE
        GHI     RE
        ADI     1
        PHI     RE
        DEC     R9
        GLO     R9
        LBNZ    DQ8
        SEP     R5
DARKQ
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        LDN     RA
        PLO     R9
        SHR
        SHR
        SHR
        SHR
        STR     R2
        GLO     R9
        ADD
        ANI     1
        XRI     1
        SEP     R5
DRAWALL
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        LDI     0
        STR     RA
DA1
        SEP     R4
        WORD    DRAWSQ
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        ANI     08H
        LBZ     DA1
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        LDN     RA
        ADI     8
        STR     RA
        ANI     80H
        LBZ     DA1
        SEP     R5
REDRAW
        SEP     R4
        WORD    DRAWSQ
        SEP     R5
PANELS
        LDI     HIGH (TX1)
        PHI     RB
        LDI     LOW (TX1)
        PLO     RB
        LDI     HIGH (32)
        PHI     RE
        LDI     LOW (32)
        PLO     RE
        LDI     128
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX2)
        PHI     RB
        LDI     LOW (TX2)
        PLO     RB
        LDI     HIGH (544)
        PHI     RE
        LDI     LOW (544)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX3)
        PHI     RB
        LDI     LOW (TX3)
        PLO     RB
        LDI     HIGH (3616)
        PHI     RE
        LDI     LOW (3616)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX4)
        PHI     RB
        LDI     LOW (TX4)
        PLO     RB
        LDI     HIGH (3872)
        PHI     RE
        LDI     LOW (3872)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX5)
        PHI     RB
        LDI     LOW (TX5)
        PLO     RB
        LDI     HIGH (4128)
        PHI     RE
        LDI     LOW (4128)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX6)
        PHI     RB
        LDI     LOW (TX6)
        PLO     RB
        LDI     HIGH (4384)
        PHI     RE
        LDI     LOW (4384)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX7)
        PHI     RB
        LDI     LOW (TX7)
        PLO     RB
        LDI     HIGH (4640)
        PHI     RE
        LDI     LOW (4640)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX8)
        PHI     RB
        LDI     LOW (TX8)
        PLO     RB
        LDI     HIGH (4896)
        PHI     RE
        LDI     LOW (4896)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX9)
        PHI     RB
        LDI     LOW (TX9)
        PLO     RB
        LDI     HIGH (5152)
        PHI     RE
        LDI     LOW (5152)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX10)
        PHI     RB
        LDI     LOW (TX10)
        PLO     RB
        LDI     HIGH (5408)
        PHI     RE
        LDI     LOW (5408)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        SEP     R4
        WORD    SHOWLV
        SEP     R4
        WORD    SHOWSND
        SEP     R5
SHOWSND
        LDI     HIGH (MUTE)
        PHI     RA
        LDI     LOW (MUTE)
        PLO     RA
        LDN     RA
        LBNZ    SSD1
        LDI     HIGH (TXSON)
        PHI     RB
        LDI     LOW (TXSON)
        PLO     RB
        LBR     SSD2
SSD1
        LDI     HIGH (TXSOFF)
        PHI     RB
        LDI     LOW (TXSOFF)
        PLO     RB
SSD2
        LDI     HIGH (5664)
        PHI     RE
        LDI     LOW (5664)
        PLO     RE
        LDI     80H
        PLO     R8
        LBR     PRQ
TOGSND
        LDI     HIGH (MUTE)
        PHI     RA
        LDI     LOW (MUTE)
        PLO     RA
        LDN     RA
        XRI     1
        STR     RA
        SEP     R4
        WORD    SILENCE
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (1244H)
        PHI     RC
        LDI     LOW (1244H)
        PLO     RC
        LDI     2
        SEP     R4
        WORD    SOUND
        SEP     R5
SHOWLV
        LDI     HIGH (550)
        PHI     RE
        LDI     LOW (550)
        PLO     RE
        LDI     HIGH (LEVEL)
        PHI     RA
        LDI     LOW (LEVEL)
        PLO     RA
        LDN     RA
        ADI     0B0H
        SEP     R1
        SEP     R5
SHOWSIDE
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        LBNZ    SS1
        LDI     HIGH (TXWHITE)
        PHI     RB
        LDI     LOW (TXWHITE)
        PLO     RB
        LBR     SS2
SS1
        LDI     HIGH (TXBLACK)
        PHI     RB
        LDI     LOW (TXBLACK)
        PLO     RB
SS2
        LDI     HIGH (1056)
        PHI     RE
        LDI     LOW (1056)
        PLO     RE
        LDI     80H
        PLO     R8
        SEP     R4
        WORD    PRQ
        SEP     R5
MSG5
        LDI     HIGH (1312)
        PHI     RE
        LDI     LOW (1312)
        PLO     RE
        LDI     0
        PLO     R8
        LBR     PRQ
MSG10
        LDI     HIGH (2592)
        PHI     RE
        LDI     LOW (2592)
        PLO     RE
        LDI     80H
        PLO     R8
        LBR     PRQ
SHOWMOVE
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        LDN     RA
        ANI     88H
        LBNZ    SMX
        LDI     HIGH (1824)
        PHI     RE
        LDI     LOW (1824)
        PLO     RE
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        LDN     RA
        SEP     R4
        WORD    SQTXT
        LDI     0ADH
        SEP     R1
        INC     RE
        LDI     HIGH (LASTT)
        PHI     RA
        LDI     LOW (LASTT)
        PLO     RA
        LDN     RA
        SEP     R4
        WORD    SQTXT
        LDI     20H
        SEP     R1
        INC     RE
        LDI     20H
        SEP     R1
SMX     SEP     R5
SQTXT   PLO     R9
        ANI     7
        ADI     0C1H
        PHI     R9
        GLO     R9
        SHR
        SHR
        SHR
        SHR
        ADI     0B1H
        PLO     R9
        GHI     R9
        SEP     R1
        INC     RE
        GLO     R9
        SEP     R1
        INC     RE
        SEP     R5
SHOWAT
        LDI     HIGH (3104)
        PHI     RE
        LDI     LOW (3104)
        PLO     RE
        LDI     'A'
        SEP     R1
        INC     RE
        LDI     'T'
        SEP     R1
        INC     RE
        INC     RE
        LDI     HIGH (CURSOR)
        PHI     RA
        LDI     LOW (CURSOR)
        PLO     RA
        LDN     RA
        SEP     R4
        WORD    SQTXT
        SEP     R5
LEGALS
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        LDI     144
        STR     RA
        INC     RA
        LDI     0
        STR     RA
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        GLO     R7
        STR     RA
        XRI     8
        PLO     R7
        LDI     HIGH (ATBY)
        PHI     RA
        LDI     LOW (ATBY)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        LDN     RA
        SHR
        SHR
        SHR
        ADI     LOW KSQW
        PLO     RA
        LDI     HIGH KSQW
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (ATSQ)
        PHI     RA
        LDI     LOW (ATSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    ATTACKED
        PLO     R7
        LDI     HIGH (INCHK)
        PHI     RA
        LDI     LOW (INCHK)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     0
        PLO     RF
        SEP     R4
        WORD    GEN
        LDI     HIGH (ULN)
        PHI     RA
        LDI     LOW (ULN)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (MSP)
        PHI     RA
        LDI     LOW (MSP)
        PLO     RA
        LDA     RA
        PHI     RE
        LDN     RA
        PLO     RE
        LDI     HIGH (MLE)
        PHI     RA
        LDI     LOW (MLE)
        PLO     RA
        GHI     RE
        STR     RA
        INC     RA
        GLO     RE
        STR     RA
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDI     144
        STR     RA
        INC     RA
        LDI     0
        STR     RA
LG1
        LDI     HIGH (MPTR+1)
        PHI     RA
        LDI     LOW (MPTR+1)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (MLE+1)
        PHI     RA
        LDI     LOW (MLE+1)
        PLO     RA
        LDN     RA
        XOR
        LBNZ    LG2
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (MLE)
        PHI     RA
        LDI     LOW (MLE)
        PLO     RA
        LDN     RA
        XOR
        LBZ     LGX
LG2
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SHL
        SHL
        PLO     RC
        LDI     HIGH UNDO
        PHI     RC
        SEP     R4
        WORD    MAKE
        SEP     R4
        WORD    LEGALCHK
        PLO     R7
        LDI     HIGH (TMPC)
        PHI     RA
        LDI     LOW (TMPC)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (PLY)
        PHI     RA
        LDI     LOW (PLY)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SHL
        SHL
        PLO     RC
        LDI     HIGH UNDO
        PHI     RC
        SEP     R4
        WORD    UNMAKE
        LDI     HIGH (TMPC)
        PHI     RA
        LDI     LOW (TMPC)
        PLO     RA
        LDN     RA
        LBNZ    LG3
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDI     HIGH (ULN)
        PHI     RA
        LDI     LOW (ULN)
        PLO     RA
        LDN     RA
        SHL
        SHL
        PLO     RC
        LDI     HIGH ULIST
        PHI     RC
        LDA     RB
        STR     RC
        INC     RC
        LDA     RB
        STR     RC
        INC     RC
        LDA     RB
        STR     RC
        INC     RC
        LDA     RB
        STR     RC
        LDI     HIGH (ULN)
        PHI     RA
        LDI     LOW (ULN)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (ULN)
        PHI     RA
        LDI     LOW (ULN)
        PLO     RA
        LDN     RA
        XRI     64
        LBZ     LGX
LG3
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        INC     RB
        INC     RB
        INC     RB
        INC     RB
        LDI     HIGH (MPTR)
        PHI     RA
        LDI     LOW (MPTR)
        PLO     RA
        GHI     RB
        STR     RA
        INC     RA
        GLO     RB
        STR     RA
        LBR     LG1
LGX     SEP     R5
FINDM
        LDI     HIGH (ULN)
        PHI     RA
        LDI     LOW (ULN)
        PLO     RA
        LDN     RA
        LBZ     FMN
        PLO     R8
        LDI     HIGH (ULIST)
        PHI     RB
        LDI     LOW (ULIST)
        PLO     RB
FM1
        LDI     HIGH (MFROM)
        PHI     RA
        LDI     LOW (MFROM)
        PLO     RA
        LDN     RA
        STR     R2
        LDN     RB
        XOR
        LBNZ    FM2
        INC     RB
        LDI     HIGH (MTO)
        PHI     RA
        LDI     LOW (MTO)
        PLO     RA
        LDN     RA
        STR     R2
        LDN     RB
        DEC     RB
        XOR
        LBNZ    FM2
        LDI     1
        SEP     R5
FM2     INC     RB
        INC     RB
        INC     RB
        INC     RB
        DEC     R8
        GLO     R8
        LBNZ    FM1
FMN     LDI     0
        SEP     R5
HASMOVES
        LDI     HIGH (ULN)
        PHI     RA
        LDI     LOW (ULN)
        PLO     RA
        LDN     RA
        LBZ     HMN
        PLO     R8
        LDI     HIGH (ULIST)
        PHI     RB
        LDI     LOW (ULIST)
        PLO     RB
HM1
        LDI     HIGH (MFROM)
        PHI     RA
        LDI     LOW (MFROM)
        PLO     RA
        LDN     RA
        STR     R2
        LDN     RB
        XOR
        LBNZ    HM2
        LDI     1
        SEP     R5
HM2     INC     RB
        INC     RB
        INC     RB
        INC     RB
        DEC     R8
        GLO     R8
        LBNZ    HM1
HMN     LDI     0
        SEP     R5
GMOVE
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (TMPD)
        PHI     RA
        LDI     LOW (TMPD)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (LASTT)
        PHI     RA
        LDI     LOW (LASTT)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (TMPE)
        PHI     RA
        LDI     LOW (TMPE)
        PLO     RA
        GLO     R7
        STR     RA
        LDA     RB
        DEC     RB
        PLO     R7
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        GLO     R7
        STR     RA
        INC     RB
        LDA     RB
        DEC     RB
        DEC     RB
        PLO     R7
        LDI     HIGH (LASTT)
        PHI     RA
        LDI     LOW (LASTT)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (LASTT)
        PHI     RA
        LDI     LOW (LASTT)
        PLO     RA
        LDN     RA
        PLO     RD
        LDI     HIGH BOARD
        PHI     RD
        LDN     RD
        PLO     R7
        LDI     HIGH (TMPC)
        PHI     RA
        LDI     LOW (TMPC)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (GPLY)
        PHI     RA
        LDI     LOW (GPLY)
        PLO     RA
        LDN     RA
        ANI     63
        PLO     RC
        SHR
        SHR
        SHR
        SHR
        ADI     HIGH HIST
        PHI     RC
        GLO     RC
        SHL
        SHL
        SHL
        SHL
        PLO     RC
        SEP     R4
        WORD    MAKE
        LDI     HIGH (GPLY)
        PHI     RA
        LDI     LOW (GPLY)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (TBC)
        PHI     RA
        LDI     LOW (TBC)
        PLO     RA
        LDN     RA
        XRI     63
        LBZ     GMTB
        LDI     HIGH (TBC)
        PHI     RA
        LDI     LOW (TBC)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
GMTB
        LDI     HIGH (PROMOP)
        PHI     RA
        LDI     LOW (PROMOP)
        PLO     RA
        LDI     5
        STR     RA
        LDI     HIGH (SELSQ)
        PHI     RA
        LDI     LOW (SELSQ)
        PLO     RA
        LDI     255
        STR     RA
        LDI     HIGH (TMPD)
        PHI     RA
        LDI     LOW (TMPD)
        PLO     RA
        LDN     RA
        ANI     88H
        LBNZ    RV11
        LDI     HIGH (TMPD)
        PHI     RA
        LDI     LOW (TMPD)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    DRAWSQ
RV11
        LDI     HIGH (TMPE)
        PHI     RA
        LDI     LOW (TMPE)
        PLO     RA
        LDN     RA
        ANI     88H
        LBNZ    RV12
        LDI     HIGH (TMPE)
        PHI     RA
        LDI     LOW (TMPE)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    DRAWSQ
RV12
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        LDN     RA
        ANI     88H
        LBNZ    RV13
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    DRAWSQ
RV13
        LDI     HIGH (LASTT)
        PHI     RA
        LDI     LOW (LASTT)
        PLO     RA
        LDN     RA
        ANI     88H
        LBNZ    RV14
        LDI     HIGH (LASTT)
        PHI     RA
        LDI     LOW (LASTT)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    DRAWSQ
RV14
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (LASTT)
        PHI     RA
        LDI     LOW (LASTT)
        PLO     RA
        LDN     RA
        SM
        PLO     R9
        LDI     HIGH (LASTT)
        PHI     RA
        LDI     LOW (LASTT)
        PLO     RA
        LDN     RA
        PLO     RD
        LDI     HIGH BOARD
        PHI     RD
        LDN     RD
        ANI     7
        XRI     6
        LBNZ    GMV2
        GLO     R9
        XRI     2
        LBNZ    GMV1
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        LDN     RA
        ADI     1
        PLO     R7
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    DRAWSQ
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        LDN     RA
        ADI     3
        PLO     R7
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    DRAWSQ
        LBR     GMV3
GMV1    GLO     R9
        XRI     0FEH
        LBNZ    GMV3
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        LDN     RA
        SMI     1
        PLO     R7
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    DRAWSQ
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        LDN     RA
        SMI     4
        PLO     R7
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    DRAWSQ
        LBR     GMV3
GMV2    ANI     0
        LDI     HIGH (LASTT)
        PHI     RA
        LDI     LOW (LASTT)
        PLO     RA
        LDN     RA
        PLO     RD
        LDN     RD
        ANI     7
        XRI     1
        LBNZ    GMV3
        GLO     R9
        ANI     7
        LBZ     GMV3
        LDI     HIGH (LASTT)
        PHI     RA
        LDI     LOW (LASTT)
        PLO     RA
        LDN     RA
        ANI     7
        STR     R2
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        LDN     RA
        ANI     70H
        OR
        PLO     R7
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    DRAWSQ
GMV3
        SEP     R4
        WORD    SHOWMOVE
        SEP     R4
        WORD    SHOWSIDE
        LDI     HIGH (TMPC)
        PHI     RA
        LDI     LOW (TMPC)
        PLO     RA
        LDN     RA
        LBZ     GMV4
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (4226H)
        PHI     RC
        LDI     LOW (4226H)
        PLO     RC
        LDI     30
        SEP     R4
        WORD    SOUND
        LBR     GMV5
GMV4
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (1244H)
        PHI     RC
        LDI     LOW (1244H)
        PLO     RC
        LDI     2
        SEP     R4
        WORD    SOUND
GMV5
        SEP     R4
        WORD    QFLUSHW
        SEP     R5
TAKEBACK
        LDI     HIGH (TBC)
        PHI     RA
        LDI     LOW (TBC)
        PLO     RA
        LDN     RA
        LBZ     TBX
        LDI     HIGH (TBC)
        PHI     RA
        LDI     LOW (TBC)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LDI     HIGH (GPLY)
        PHI     RA
        LDI     LOW (GPLY)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        ANI     63
        PLO     RC
        SHR
        SHR
        SHR
        SHR
        ADI     HIGH HIST
        PHI     RC
        GLO     RC
        SHL
        SHL
        SHL
        SHL
        PLO     RC
        SEP     R4
        WORD    UNMAKE
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        LDI     255
        STR     RA
        LDI     HIGH (LASTT)
        PHI     RA
        LDI     LOW (LASTT)
        PLO     RA
        LDI     255
        STR     RA
        LDI     HIGH (SELSQ)
        PHI     RA
        LDI     LOW (SELSQ)
        PLO     RA
        LDI     255
        STR     RA
TBX     SEP     R5
FULLDRAW
        SEP     R4
        WORD    VIDOFF
        SEP     R4
        WORD    QFLUSH
        LDI     HIGH (DIRECT)
        PHI     RA
        LDI     LOW (DIRECT)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R4
        WORD    CLRSCR
        SEP     R4
        WORD    DRAWALL
        SEP     R4
        WORD    PANELS
        SEP     R4
        WORD    SHOWSIDE
        SEP     R4
        WORD    SHOWMOVE
        SEP     R4
        WORD    SHOWAT
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
        SEP     R4
        WORD    VIDON
        SEP     R5
THINKTICK
        LDI     HIGH (SPIN)
        PHI     RA
        LDI     LOW (SPIN)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        ANI     3
        ADI     LOW SPINCH
        PLO     RA
        LDI     HIGH SPINCH
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     R9
        LDI     0
        PHI     R7
        LDI     HIGH (1571)
        PHI     RE
        LDI     LOW (1571)
        PLO     RE
        GLO     R9
        SEP     R1
        SEP     R4
        WORD    SNDTICK
        SEP     R4
        WORD    GETKEY
        LBZ     TTX
        ANI     7FH
        XRI     20H
        LBZ     TTA
        XRI     7FH
        LBNZ    TTX
TTA
        LDI     HIGH (ABORT)
        PHI     RA
        LDI     LOW (ABORT)
        PLO     RA
        LDI     1
        STR     RA
TTX     SEP     R5
CPUMOVE
        LDI     HIGH (TXTHINK)
        PHI     RB
        LDI     LOW (TXTHINK)
        PLO     RB
        SEP     R4
        WORD    MSG5
        SEP     R4
        WORD    QFLUSHW
CPW
        LDI     HIGH (SNDT)
        PHI     RA
        LDI     LOW (SNDT)
        PLO     RA
        LDN     RA
        LBZ     CPW1
        SEP     R4
        WORD    WAITVB
        SEP     R4
        WORD    SNDTICK
        LBR     CPW
CPW1
        SEP     R4
        WORD    SILENCE
        SEP     R4
        WORD    BOOK
        LBNZ    CPB
        LDI     HIGH (KILF)
        PHI     RD
        LDI     LOW (KILF)
        PLO     RD
        LDI     HIGH (32)
        PHI     RE
        LDI     LOW (32)
        PLO     RE
        LDI     0FFH
        SEP     R4
        WORD    FILL
        LDI     HIGH (MFROM)
        PHI     RA
        LDI     LOW (MFROM)
        PLO     RA
        LDI     255
        STR     RA
        LDI     HIGH (TMPD)
        PHI     RA
        LDI     LOW (TMPD)
        PLO     RA
        LDI     1
        STR     RA
CP1
        LDI     HIGH (MFROM)
        PHI     RA
        LDI     LOW (MFROM)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (KILF)
        PHI     RA
        LDI     LOW (KILF)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (MTO)
        PHI     RA
        LDI     LOW (MTO)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (KILT)
        PHI     RA
        LDI     LOW (KILT)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (TMPD)
        PHI     RA
        LDI     LOW (TMPD)
        PLO     RA
        LDN     RA
        SEP     R4
        WORD    THINK
        LDI     HIGH (ABORT)
        PHI     RA
        LDI     LOW (ABORT)
        PLO     RA
        LDN     RA
        LBNZ    CP3
        LDI     HIGH (ROOTF)
        PHI     RA
        LDI     LOW (ROOTF)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (MFROM)
        PHI     RA
        LDI     LOW (MFROM)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (ROOTT)
        PHI     RA
        LDI     LOW (ROOTT)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (MTO)
        PHI     RA
        LDI     LOW (MTO)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (ROOTV)
        PHI     RA
        LDI     LOW (ROOTV)
        PLO     RA
        LDN     RA
        SMI     0F0H
        LBDF    CP4
        LDI     HIGH (TMPD)
        PHI     RA
        LDI     LOW (TMPD)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (LEVEL)
        PHI     RA
        LDI     LOW (LEVEL)
        PLO     RA
        LDN     RA
        ADI     LOW (DEPTHS-1)
        PLO     RA
        LDI     HIGH (DEPTHS-1)
        ADCI    0
        PHI     RA
        LDN     RA
        SM
        LBZ     CP4
        LDI     HIGH (TMPD)
        PHI     RA
        LDI     LOW (TMPD)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     CP1
CP3
        LDI     HIGH (MFROM)
        PHI     RA
        LDI     LOW (MFROM)
        PLO     RA
        LDN     RA
        XRI     0FFH
        LBNZ    CP4
        LDI     HIGH (RDONE)
        PHI     RA
        LDI     LOW (RDONE)
        PLO     RA
        LDN     RA
        LBZ     CP4
        LDI     HIGH (ROOTF)
        PHI     RA
        LDI     LOW (ROOTF)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (MFROM)
        PHI     RA
        LDI     LOW (MFROM)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (ROOTT)
        PHI     RA
        LDI     LOW (ROOTT)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (MTO)
        PHI     RA
        LDI     LOW (MTO)
        PLO     RA
        GLO     R7
        STR     RA
CP4
        SEP     R4
        WORD    LEGALS
        SEP     R4
        WORD    FINDM
        LBNZ    CP5
        LDI     HIGH (ULIST)
        PHI     RB
        LDI     LOW (ULIST)
        PLO     RB
CP5
        LDI     HIGH (1571)
        PHI     RE
        LDI     LOW (1571)
        PLO     RE
        LDI     20H
        SEP     R1
        LDI     HIGH (TXBLANK)
        PHI     RB
        LDI     LOW (TXBLANK)
        PLO     RB
        SEP     R4
        WORD    MSG5
        SEP     R4
        WORD    FINDM
        LBNZ    CP6
        LDI     HIGH (ULIST)
        PHI     RB
        LDI     LOW (ULIST)
        PLO     RB
CP6
        SEP     R4
        WORD    GMOVE
        SEP     R5
CPB
        SEP     R4
        WORD    LEGALS
        LBR     CP5
BOOK
        LDI     HIGH (GPLY)
        PHI     RA
        LDI     LOW (GPLY)
        PLO     RA
        LDN     RA
        SMI     10
        LBDF    BKN
        LDI     HIGH (MFROM)
        PHI     RA
        LDI     LOW (MFROM)
        PLO     RA
        LDI     255
        STR     RA
        LDI     HIGH (TMPC)
        PHI     RA
        LDI     LOW (TMPC)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (BOOKD)
        PHI     RB
        LDI     LOW (BOOKD)
        PLO     RB
BK1     LDN     RB
        LBZ     BK9
        PLO     R9
        INC     RB
        GLO     RB
        PLO     RC
        GHI     RB
        PHI     RC
        LDI     0
        PLO     R8
BK2     GLO     R8
        STR     R2
        LDI     HIGH (GPLY)
        PHI     RA
        LDI     LOW (GPLY)
        PLO     RA
        LDN     RA
        XOR
        LBZ     BK5
        GLO     R8
        STR     R2
        GLO     R9
        XOR
        LBZ     BK8
        GLO     R8
        SHL
        SHL
        SHL
        SHL
        PLO     RD
        GLO     R8
        SHR
        SHR
        SHR
        SHR
        ADI     HIGH HIST
        PHI     RD
        LDA     RD
        STR     R2
        LDA     RC
        XOR
        LBNZ    BK8
        LDN     RD
        STR     R2
        LDA     RC
        XOR
        LBNZ    BK8
        INC     R8
        LBR     BK2
BK5     GLO     R8
        STR     R2
        GLO     R9
        XOR
        LBZ     BK8
        SEP     R4
        WORD    RAND
        ANI     1
        LBZ     BK6
        LDI     HIGH (MFROM)
        PHI     RA
        LDI     LOW (MFROM)
        PLO     RA
        LDN     RA
        XRI     0FFH
        LBNZ    BK8
BK6     LDA     RC
        PLO     R7
        LDI     HIGH (MFROM)
        PHI     RA
        LDI     LOW (MFROM)
        PLO     RA
        GLO     R7
        STR     RA
        LDN     RC
        PLO     R7
        LDI     HIGH (MTO)
        PHI     RA
        LDI     LOW (MTO)
        PLO     RA
        GLO     R7
        STR     RA
BK8     GLO     R9
        SHL
        STR     R2
        GLO     RB
        ADD
        PLO     RB
        GHI     RB
        ADCI    0
        PHI     RB
        LBR     BK1
BK9
        LDI     HIGH (MFROM)
        PHI     RA
        LDI     LOW (MFROM)
        PLO     RA
        LDN     RA
        XRI     0FFH
        LBZ     BKN
        LDI     1
        SEP     R5
BKN     LDI     0
        SEP     R5
INIT    LDI     HIGH STACK
        PHI     R2
        LDI     LOW STACK
        PLO     R2
        SEP     R4
        WORD    VIDINIT
        SEP     R4
        WORD    VIDOFF
        SEP     R4
        WORD    CHSAVE
        SEP     R4
        WORD    CHLOAD
        SEP     R4
        WORD    PVINIT
        LDI     HIGH (RND)
        PHI     RA
        LDI     LOW (RND)
        PLO     RA
        LDI     5AH
        STR     RA
        INC     RA
        LDI     0A5H
        STR     RA
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
        LDI     40
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
        LDI     HIGH (LEVEL)
        PHI     RA
        LDI     LOW (LEVEL)
        PLO     RA
        LDI     2
        STR     RA
        LDI     HIGH (HUMAN)
        PHI     RA
        LDI     LOW (HUMAN)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TWO)
        PHI     RA
        LDI     LOW (TWO)
        PLO     RA
        LDI     0
        STR     RA
TITLE
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
        LDI     HIGH (TX15)
        PHI     RB
        LDI     LOW (TX15)
        PLO     RB
        LDI     HIGH (273)
        PHI     RE
        LDI     LOW (273)
        PLO     RE
        LDI     128
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX16)
        PHI     RB
        LDI     LOW (TX16)
        PLO     RB
        LDI     HIGH (776)
        PHI     RE
        LDI     LOW (776)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX17)
        PHI     RB
        LDI     LOW (TX17)
        PLO     RB
        LDI     HIGH (3334)
        PHI     RE
        LDI     LOW (3334)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX18)
        PHI     RB
        LDI     LOW (TX18)
        PLO     RB
        LDI     HIGH (3590)
        PHI     RE
        LDI     LOW (3590)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX19)
        PHI     RB
        LDI     LOW (TX19)
        PLO     RB
        LDI     HIGH (3846)
        PHI     RE
        LDI     LOW (3846)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX20)
        PHI     RB
        LDI     LOW (TX20)
        PLO     RB
        LDI     HIGH (4102)
        PHI     RE
        LDI     LOW (4102)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX21)
        PHI     RB
        LDI     LOW (TX21)
        PLO     RB
        LDI     HIGH (4358)
        PHI     RE
        LDI     LOW (4358)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX22)
        PHI     RB
        LDI     LOW (TX22)
        PLO     RB
        LDI     HIGH (4614)
        PHI     RE
        LDI     LOW (4614)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX23)
        PHI     RB
        LDI     LOW (TX23)
        PLO     RB
        LDI     HIGH (4870)
        PHI     RE
        LDI     LOW (4870)
        PLO     RE
        LDI     128
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX24)
        PHI     RB
        LDI     LOW (TX24)
        PLO     RB
        LDI     HIGH (5382)
        PHI     RE
        LDI     LOW (5382)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX25)
        PHI     RB
        LDI     LOW (TX25)
        PLO     RB
        LDI     HIGH (5638)
        PHI     RE
        LDI     LOW (5638)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (1540)
        PHI     RE
        LDI     LOW (1540)
        PLO     RE
        LDI     147
        SEP     R1
        LDI     HIGH (1541)
        PHI     RE
        LDI     LOW (1541)
        PLO     RE
        LDI     148
        SEP     R1
        LDI     HIGH (1796)
        PHI     RE
        LDI     LOW (1796)
        PLO     RE
        LDI     149
        SEP     R1
        LDI     HIGH (1797)
        PHI     RE
        LDI     LOW (1797)
        PLO     RE
        LDI     150
        SEP     R1
        LDI     HIGH (2052)
        PHI     RE
        LDI     LOW (2052)
        PLO     RE
        LDI     139
        SEP     R1
        LDI     HIGH (2053)
        PHI     RE
        LDI     LOW (2053)
        PLO     RE
        LDI     140
        SEP     R1
        LDI     HIGH (1544)
        PHI     RE
        LDI     LOW (1544)
        PLO     RE
        LDI     226
        SEP     R1
        LDI     HIGH (1545)
        PHI     RE
        LDI     LOW (1545)
        PLO     RE
        LDI     227
        SEP     R1
        LDI     HIGH (1800)
        PHI     RE
        LDI     LOW (1800)
        PLO     RE
        LDI     228
        SEP     R1
        LDI     HIGH (1801)
        PHI     RE
        LDI     LOW (1801)
        PLO     RE
        LDI     229
        SEP     R1
        LDI     HIGH (2056)
        PHI     RE
        LDI     LOW (2056)
        PLO     RE
        LDI     230
        SEP     R1
        LDI     HIGH (2057)
        PHI     RE
        LDI     LOW (2057)
        PLO     RE
        LDI     231
        SEP     R1
        LDI     HIGH (1548)
        PHI     RE
        LDI     LOW (1548)
        PLO     RE
        LDI     141
        SEP     R1
        LDI     HIGH (1549)
        PHI     RE
        LDI     LOW (1549)
        PLO     RE
        LDI     142
        SEP     R1
        LDI     HIGH (1804)
        PHI     RE
        LDI     LOW (1804)
        PLO     RE
        LDI     143
        SEP     R1
        LDI     HIGH (1805)
        PHI     RE
        LDI     LOW (1805)
        PLO     RE
        LDI     144
        SEP     R1
        LDI     HIGH (2060)
        PHI     RE
        LDI     LOW (2060)
        PLO     RE
        LDI     145
        SEP     R1
        LDI     HIGH (2061)
        PHI     RE
        LDI     LOW (2061)
        PLO     RE
        LDI     146
        SEP     R1
        LDI     HIGH (1552)
        PHI     RE
        LDI     LOW (1552)
        PLO     RE
        LDI     242
        SEP     R1
        LDI     HIGH (1553)
        PHI     RE
        LDI     LOW (1553)
        PLO     RE
        LDI     243
        SEP     R1
        LDI     HIGH (1808)
        PHI     RE
        LDI     LOW (1808)
        PLO     RE
        LDI     244
        SEP     R1
        LDI     HIGH (1809)
        PHI     RE
        LDI     LOW (1809)
        PLO     RE
        LDI     245
        SEP     R1
        LDI     HIGH (2064)
        PHI     RE
        LDI     LOW (2064)
        PLO     RE
        LDI     236
        SEP     R1
        LDI     HIGH (2065)
        PHI     RE
        LDI     LOW (2065)
        PLO     RE
        LDI     237
        SEP     R1
        LDI     HIGH (1556)
        PHI     RE
        LDI     LOW (1556)
        PLO     RE
        LDI     155
        SEP     R1
        LDI     HIGH (1557)
        PHI     RE
        LDI     LOW (1557)
        PLO     RE
        LDI     156
        SEP     R1
        LDI     HIGH (1812)
        PHI     RE
        LDI     LOW (1812)
        PLO     RE
        LDI     157
        SEP     R1
        LDI     HIGH (1813)
        PHI     RE
        LDI     LOW (1813)
        PLO     RE
        LDI     158
        SEP     R1
        LDI     HIGH (2068)
        PHI     RE
        LDI     LOW (2068)
        PLO     RE
        LDI     159
        SEP     R1
        LDI     HIGH (2069)
        PHI     RE
        LDI     LOW (2069)
        PLO     RE
        LDI     219
        SEP     R1
        LDI     HIGH (1560)
        PHI     RE
        LDI     LOW (1560)
        PLO     RE
        LDI     232
        SEP     R1
        LDI     HIGH (1561)
        PHI     RE
        LDI     LOW (1561)
        PLO     RE
        LDI     233
        SEP     R1
        LDI     HIGH (1816)
        PHI     RE
        LDI     LOW (1816)
        PLO     RE
        LDI     234
        SEP     R1
        LDI     HIGH (1817)
        PHI     RE
        LDI     LOW (1817)
        PLO     RE
        LDI     235
        SEP     R1
        LDI     HIGH (2072)
        PHI     RE
        LDI     LOW (2072)
        PLO     RE
        LDI     236
        SEP     R1
        LDI     HIGH (2073)
        PHI     RE
        LDI     LOW (2073)
        PLO     RE
        LDI     237
        SEP     R1
        LDI     HIGH (1564)
        PHI     RE
        LDI     LOW (1564)
        PLO     RE
        LDI     135
        SEP     R1
        LDI     HIGH (1565)
        PHI     RE
        LDI     LOW (1565)
        PLO     RE
        LDI     136
        SEP     R1
        LDI     HIGH (1820)
        PHI     RE
        LDI     LOW (1820)
        PLO     RE
        LDI     137
        SEP     R1
        LDI     HIGH (1821)
        PHI     RE
        LDI     LOW (1821)
        PLO     RE
        LDI     138
        SEP     R1
        LDI     HIGH (2076)
        PHI     RE
        LDI     LOW (2076)
        PLO     RE
        LDI     139
        SEP     R1
        LDI     HIGH (2077)
        PHI     RE
        LDI     LOW (2077)
        PLO     RE
        LDI     140
        SEP     R1
        LDI     HIGH (1568)
        PHI     RE
        LDI     LOW (1568)
        PLO     RE
        LDI     238
        SEP     R1
        LDI     HIGH (1569)
        PHI     RE
        LDI     LOW (1569)
        PLO     RE
        LDI     239
        SEP     R1
        LDI     HIGH (1824)
        PHI     RE
        LDI     LOW (1824)
        PLO     RE
        LDI     240
        SEP     R1
        LDI     HIGH (1825)
        PHI     RE
        LDI     LOW (1825)
        PLO     RE
        LDI     241
        SEP     R1
        LDI     HIGH (2080)
        PHI     RE
        LDI     LOW (2080)
        PLO     RE
        LDI     230
        SEP     R1
        LDI     HIGH (2081)
        PHI     RE
        LDI     LOW (2081)
        PLO     RE
        LDI     231
        SEP     R1
        LDI     HIGH (DIRECT)
        PHI     RA
        LDI     LOW (DIRECT)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R4
        WORD    VIDON
TT0
        SEP     R4
        WORD    TOPT
TT1
        SEP     R4
        WORD    WAITVB
        SEP     R4
        WORD    VBDRAW
        SEP     R4
        WORD    SNDTICK
        SEP     R4
        WORD    RAND
        SEP     R4
        WORD    GETKEY
        LBZ     TT1
        PLO     R9
        XRI     K_ESC
        LBZ     EXIT
        GLO     R9
        XRI     20H
        LBZ     NEWGAME
        GLO     R9
        XRI     5FH
        LBZ     NEWGAME
        GLO     R9
        XRI     K_CR
        LBZ     NEWGAME
        GLO     R9
        ANI     0DFH
        XRI     'W'
        LBNZ    TT2
        LDI     HIGH (HUMAN)
        PHI     RA
        LDI     LOW (HUMAN)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TWO)
        PHI     RA
        LDI     LOW (TWO)
        PLO     RA
        LDI     0
        STR     RA
        LBR     TT0
TT2     GLO     R9
        ANI     0DFH
        XRI     'B'
        LBNZ    TT3
        LDI     HIGH (HUMAN)
        PHI     RA
        LDI     LOW (HUMAN)
        PLO     RA
        LDI     8
        STR     RA
        LDI     HIGH (TWO)
        PHI     RA
        LDI     LOW (TWO)
        PLO     RA
        LDI     0
        STR     RA
        LBR     TT0
TT3     GLO     R9
        XRI     '2'
        LBNZ    TT4
        LDI     HIGH (HUMAN)
        PHI     RA
        LDI     LOW (HUMAN)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TWO)
        PHI     RA
        LDI     LOW (TWO)
        PLO     RA
        LDI     1
        STR     RA
        LBR     TT0
TT4     GLO     R9
        ANI     0DFH
        XRI     'M'
        LBNZ    TT5
        SEP     R4
        WORD    TOGSND
        LBR     TT0
TT5     GLO     R9
        SMI     '1'
        LBNF    TT1
        SMI     4
        LBDF    TT1
        GLO     R9
        SMI     '0'
        PLO     R7
        LDI     HIGH (LEVEL)
        PHI     RA
        LDI     LOW (LEVEL)
        PLO     RA
        GLO     R7
        STR     RA
        LBR     TT0
TOPT
        LDI     HIGH (TWO)
        PHI     RA
        LDI     LOW (TWO)
        PLO     RA
        LDN     RA
        LBNZ    TO2
        LDI     HIGH (HUMAN)
        PHI     RA
        LDI     LOW (HUMAN)
        PLO     RA
        LDN     RA
        LBNZ    TO1
        LDI     HIGH (TXWHITE)
        PHI     RB
        LDI     LOW (TXWHITE)
        PLO     RB
        LBR     TO3
TO1
        LDI     HIGH (TXBLACK)
        PHI     RB
        LDI     LOW (TXBLACK)
        PLO     RB
        LBR     TO3
TO2
        LDI     HIGH (TXBOTH)
        PHI     RB
        LDI     LOW (TXBOTH)
        PLO     RB
TO3
        LDI     HIGH (5391)
        PHI     RE
        LDI     LOW (5391)
        PLO     RE
        LDI     80H
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (5647)
        PHI     RE
        LDI     LOW (5647)
        PLO     RE
        LDI     HIGH (LEVEL)
        PHI     RA
        LDI     LOW (LEVEL)
        PLO     RA
        LDN     RA
        ADI     0B0H
        SEP     R1
        LDI     HIGH (MUTE)
        PHI     RA
        LDI     LOW (MUTE)
        PLO     RA
        LDN     RA
        LBNZ    TO4
        LDI     HIGH (TXSON)
        PHI     RB
        LDI     LOW (TXSON)
        PLO     RB
        LBR     TO5
TO4
        LDI     HIGH (TXSOFF)
        PHI     RB
        LDI     LOW (TXSOFF)
        PLO     RB
TO5
        LDI     HIGH (5894)
        PHI     RE
        LDI     LOW (5894)
        PLO     RE
        LDI     80H
        PLO     R8
        LBR     PRQ
NEWGAME
        SEP     R4
        WORD    SILENCE
        SEP     R4
        WORD    NEWPOS
        LDI     HIGH (GPLY)
        PHI     RA
        LDI     LOW (GPLY)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TBC)
        PHI     RA
        LDI     LOW (TBC)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        LDI     255
        STR     RA
        LDI     HIGH (LASTT)
        PHI     RA
        LDI     LOW (LASTT)
        PLO     RA
        LDI     255
        STR     RA
        LDI     HIGH (SELSQ)
        PHI     RA
        LDI     LOW (SELSQ)
        PLO     RA
        LDI     255
        STR     RA
        LDI     HIGH (HUMAN)
        PHI     RA
        LDI     LOW (HUMAN)
        PLO     RA
        LDN     RA
        SHR
        SHR
        SHR
        PLO     R7
        LDI     HIGH (FLIP)
        PHI     RA
        LDI     LOW (FLIP)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (HUMAN)
        PHI     RA
        LDI     LOW (HUMAN)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        GLO     R7
        STR     RA
        XRI     8
        PLO     R7
        LDI     HIGH (CPU)
        PHI     RA
        LDI     LOW (CPU)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (FLIP)
        PHI     RA
        LDI     LOW (FLIP)
        PLO     RA
        LDN     RA
        LBZ     NG1
        LDI     HIGH (CURSOR)
        PHI     RA
        LDI     LOW (CURSOR)
        PLO     RA
        LDI     100
        STR     RA
        LBR     NG2
NG1
        LDI     HIGH (CURSOR)
        PHI     RA
        LDI     LOW (CURSOR)
        PLO     RA
        LDI     20
        STR     RA
NG2
        SEP     R4
        WORD    FULLDRAW
TURN
        SEP     R4
        WORD    LEGALS
        LDI     HIGH (TXBLANK)
        PHI     RB
        LDI     LOW (TXBLANK)
        PLO     RB
        SEP     R4
        WORD    MSG10
        LDI     HIGH (INCHK)
        PHI     RA
        LDI     LOW (INCHK)
        PLO     RA
        LDN     RA
        LBZ     TU1
        LDI     HIGH (TXCHECK)
        PHI     RB
        LDI     LOW (TXCHECK)
        PLO     RB
        SEP     R4
        WORD    MSG10
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (3126H)
        PHI     RC
        LDI     LOW (3126H)
        PLO     RC
        LDI     30
        SEP     R4
        WORD    SOUND
TU1
        LDI     HIGH (ULN)
        PHI     RA
        LDI     LOW (ULN)
        PLO     RA
        LDN     RA
        LBNZ    TU3
        LDI     HIGH (INCHK)
        PHI     RA
        LDI     LOW (INCHK)
        PLO     RA
        LDN     RA
        LBZ     TU2
        LDI     HIGH (TXMATE)
        PHI     RB
        LDI     LOW (TXMATE)
        PLO     RB
        SEP     R4
        WORD    MSG10
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
        LBR     TU2A
TU2
        LDI     HIGH (TXSTALE)
        PHI     RB
        LDI     LOW (TXSTALE)
        PLO     RB
        SEP     R4
        WORD    MSG10
TU2A
        LDI     HIGH (TXBLANK)
        PHI     RB
        LDI     LOW (TXBLANK)
        PLO     RB
        SEP     R4
        WORD    MSG5
        SEP     R4
        WORD    QFLUSHW
        LBR     HUMAN0
TU3
        LDI     HIGH (TWO)
        PHI     RA
        LDI     LOW (TWO)
        PLO     RA
        LDN     RA
        LBNZ    HUMAN0
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (CPU)
        PHI     RA
        LDI     LOW (CPU)
        PLO     RA
        LDN     RA
        XOR
        LBNZ    HUMAN0
        SEP     R4
        WORD    CPUMOVE
        LBR     TURN
HUMAN0
        LDI     HIGH (TXYOUR)
        PHI     RB
        LDI     LOW (TXYOUR)
        PLO     RB
        SEP     R4
        WORD    MSG5
        SEP     R4
        WORD    SHOWAT
HU1
        SEP     R4
        WORD    WAITVB
        SEP     R4
        WORD    VBDRAW
        SEP     R4
        WORD    SNDTICK
        SEP     R4
        WORD    RAND
        SEP     R4
        WORD    GETKEY
        LBZ     HU1
        PLO     R9
        XRI     K_ESC
        LBZ     TITLE
        GLO     R9
        XRI     K_UP
        LBNZ    HK26
        LDI     HIGH (FLIP)
        PHI     RA
        LDI     LOW (FLIP)
        PLO     RA
        LDN     RA
        LBZ     HK26A
        LDI     240
        LBR     HK26B
HK26A    LDI     16
HK26B    LBR     HMOVE
HK26
        GLO     R9
        XRI     K_DOWN
        LBNZ    HK27
        LDI     HIGH (FLIP)
        PHI     RA
        LDI     LOW (FLIP)
        PLO     RA
        LDN     RA
        LBZ     HK27A
        LDI     16
        LBR     HK27B
HK27A    LDI     240
HK27B    LBR     HMOVE
HK27
        GLO     R9
        XRI     K_RIGHT
        LBNZ    HK28
        LDI     HIGH (FLIP)
        PHI     RA
        LDI     LOW (FLIP)
        PLO     RA
        LDN     RA
        LBZ     HK28A
        LDI     255
        LBR     HK28B
HK28A    LDI     1
HK28B    LBR     HMOVE
HK28
        GLO     R9
        XRI     K_LEFT
        LBNZ    HK29
        LDI     HIGH (FLIP)
        PHI     RA
        LDI     LOW (FLIP)
        PLO     RA
        LDN     RA
        LBZ     HK29A
        LDI     1
        LBR     HK29B
HK29A    LDI     255
HK29B    LBR     HMOVE
HK29
        GLO     R9
        XRI     20H
        LBZ     HPICK
        GLO     R9
        XRI     5FH
        LBZ     HPICK
        GLO     R9
        XRI     K_CR
        LBZ     HPICK
        GLO     R9
        ANI     0DFH
        PLO     R9
        XRI     'T'
        LBZ     HBACK
        GLO     R9
        XRI     'S'
        LBZ     HSWAP
        GLO     R9
        XRI     'L'
        LBZ     HLEV
        GLO     R9
        XRI     'N'
        LBZ     TITLE
        GLO     R9
        XRI     'M'
        LBZ     HSND
        LBR     HU1
HSND
        SEP     R4
        WORD    TOGSND
        SEP     R4
        WORD    SHOWSND
        LBR     HU1
HMOVE   STR     R2
        LDI     HIGH (CURSOR)
        PHI     RA
        LDI     LOW (CURSOR)
        PLO     RA
        LDN     RA
        ADD
        PLO     R9
        ANI     88H
        LBNZ    HU1
        LDI     HIGH (CURSOR)
        PHI     RA
        LDI     LOW (CURSOR)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        GLO     R7
        STR     RA
        GLO     R9
        PLO     R7
        LDI     HIGH (CURSOR)
        PHI     RA
        LDI     LOW (CURSOR)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    DRAWSQ
        LDI     HIGH (CURSOR)
        PHI     RA
        LDI     LOW (CURSOR)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    DRAWSQ
        SEP     R4
        WORD    SHOWAT
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (1543H)
        PHI     RC
        LDI     LOW (1543H)
        PLO     RC
        LDI     1
        SEP     R4
        WORD    SOUND
        LBR     HU1
HPICK
        LDI     HIGH (ULN)
        PHI     RA
        LDI     LOW (ULN)
        PLO     RA
        LDN     RA
        LBZ     HU1
        LDI     HIGH (SELSQ)
        PHI     RA
        LDI     LOW (SELSQ)
        PLO     RA
        LDN     RA
        XRI     0FFH
        LBZ     HP1
        LDI     HIGH (SELSQ)
        PHI     RA
        LDI     LOW (SELSQ)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (CURSOR)
        PHI     RA
        LDI     LOW (CURSOR)
        PLO     RA
        LDN     RA
        XOR
        LBNZ    HP3
        LDI     HIGH (SELSQ)
        PHI     RA
        LDI     LOW (SELSQ)
        PLO     RA
        LDI     255
        STR     RA
        LDI     HIGH (CURSOR)
        PHI     RA
        LDI     LOW (CURSOR)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    DRAWSQ
        LBR     HU1
HP3
        LDI     HIGH (CURSOR)
        PHI     RA
        LDI     LOW (CURSOR)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (MFROM)
        PHI     RA
        LDI     LOW (MFROM)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    HASMOVES
        LBZ     HP4
        LDI     HIGH (SELSQ)
        PHI     RA
        LDI     LOW (SELSQ)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (SELSQ)
        PHI     RA
        LDI     LOW (SELSQ)
        PLO     RA
        LDI     255
        STR     RA
        SEP     R4
        WORD    DRAWSQ
        LBR     HP1
HP4
        LDI     HIGH (SELSQ)
        PHI     RA
        LDI     LOW (SELSQ)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (MFROM)
        PHI     RA
        LDI     LOW (MFROM)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (CURSOR)
        PHI     RA
        LDI     LOW (CURSOR)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (MTO)
        PHI     RA
        LDI     LOW (MTO)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    FINDM
        LBNZ    HP5
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (5826H)
        PHI     RC
        LDI     LOW (5826H)
        PLO     RC
        LDI     30
        SEP     R4
        WORD    SOUND
        LBR     HU1
HP5     INC     RB
        INC     RB
        LDN     RB
        DEC     RB
        DEC     RB
        XRI     4
        LBNZ    HP6
        GHI     RB
        STXD
        GLO     RB
        STXD
        SEP     R4
        WORD    ASKPRO
        IRX
        LDXA
        PLO     RB
        LDX
        PHI     RB
HP6
        SEP     R4
        WORD    GMOVE
        LBR     TURN
HP1
        LDI     HIGH (CURSOR)
        PHI     RA
        LDI     LOW (CURSOR)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (MFROM)
        PHI     RA
        LDI     LOW (MFROM)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    HASMOVES
        LBNZ    HP2
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (5826H)
        PHI     RC
        LDI     LOW (5826H)
        PLO     RC
        LDI     30
        SEP     R4
        WORD    SOUND
        LBR     HU1
HP2
        LDI     HIGH (CURSOR)
        PHI     RA
        LDI     LOW (CURSOR)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (SELSQ)
        PHI     RA
        LDI     LOW (SELSQ)
        PLO     RA
        GLO     R7
        STR     RA
        PLO     R7
        LDI     HIGH (DRSQ)
        PHI     RA
        LDI     LOW (DRSQ)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    DRAWSQ
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (1044H)
        PHI     RC
        LDI     LOW (1044H)
        PLO     RC
        LDI     1
        SEP     R4
        WORD    SOUND
        LBR     HU1
ASKPRO
        LDI     HIGH (TXPRO)
        PHI     RB
        LDI     LOW (TXPRO)
        PLO     RB
        SEP     R4
        WORD    MSG10
AP1
        SEP     R4
        WORD    WAITVB
        SEP     R4
        WORD    VBDRAW
        SEP     R4
        WORD    GETKEY
        LBZ     AP1
        ANI     0DFH
        PLO     R9
        GLO     R9
        XRI     'Q'
        LBNZ    AP30
        LDI     HIGH (PROMOP)
        PHI     RA
        LDI     LOW (PROMOP)
        PLO     RA
        LDI     5
        STR     RA
        LBR     AP9
AP30
        GLO     R9
        XRI     'R'
        LBNZ    AP31
        LDI     HIGH (PROMOP)
        PHI     RA
        LDI     LOW (PROMOP)
        PLO     RA
        LDI     4
        STR     RA
        LBR     AP9
AP31
        GLO     R9
        XRI     'B'
        LBNZ    AP32
        LDI     HIGH (PROMOP)
        PHI     RA
        LDI     LOW (PROMOP)
        PLO     RA
        LDI     3
        STR     RA
        LBR     AP9
AP32
        GLO     R9
        XRI     'N'
        LBNZ    AP33
        LDI     HIGH (PROMOP)
        PHI     RA
        LDI     LOW (PROMOP)
        PLO     RA
        LDI     2
        STR     RA
        LBR     AP9
AP33
        LBR     AP1
AP9
        LDI     HIGH (TXBLANK)
        PHI     RB
        LDI     LOW (TXBLANK)
        PLO     RB
        SEP     R4
        WORD    MSG10
        SEP     R5
HBACK
        LDI     HIGH (TBC)
        PHI     RA
        LDI     LOW (TBC)
        PLO     RA
        LDN     RA
        LBZ     HU1
        SEP     R4
        WORD    TAKEBACK
        LDI     HIGH (TWO)
        PHI     RA
        LDI     LOW (TWO)
        PLO     RA
        LDN     RA
        LBNZ    HB2
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (HUMAN)
        PHI     RA
        LDI     LOW (HUMAN)
        PLO     RA
        LDN     RA
        XOR
        LBZ     HB2
        SEP     R4
        WORD    TAKEBACK
HB2
        SEP     R4
        WORD    FULLDRAW
        LBR     TURN
HSWAP
        LDI     HIGH (TWO)
        PHI     RA
        LDI     LOW (TWO)
        PLO     RA
        LDN     RA
        LBZ     HS1
        LDI     HIGH (TWO)
        PHI     RA
        LDI     LOW (TWO)
        PLO     RA
        LDI     0
        STR     RA
HS1
        LDI     HIGH (SIDE)
        PHI     RA
        LDI     LOW (SIDE)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (CPU)
        PHI     RA
        LDI     LOW (CPU)
        PLO     RA
        GLO     R7
        STR     RA
        XRI     8
        PLO     R7
        LDI     HIGH (HUMAN)
        PHI     RA
        LDI     LOW (HUMAN)
        PLO     RA
        GLO     R7
        STR     RA
        SHR
        SHR
        SHR
        PLO     R7
        LDI     HIGH (FLIP)
        PHI     RA
        LDI     LOW (FLIP)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    FULLDRAW
        LBR     TURN
HLEV
        LDI     HIGH (LEVEL)
        PHI     RA
        LDI     LOW (LEVEL)
        PLO     RA
        LDN     RA
        ANI     3
        ADI     1
        STR     RA
        SEP     R4
        WORD    SHOWLV
        LBR     HU1
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
NOFF    BYTE    021H, 01FH, 012H, 00EH, 0F2H, 0EEH, 0E1H, 0DFH
KOFF    BYTE    001H, 0FFH, 010H, 0F0H, 00FH, 011H, 0F1H, 0EFH
DIAG    BYTE    00FH, 011H, 0F1H, 0EFH
ORTH    BYTE    001H, 0FFH, 010H, 0F0H
ALIGN   BYTE    001H, 000H, 000H, 000H, 000H, 000H, 000H, 001H, 000H, 000H, 000H, 000H, 000H, 000H, 001H, 000H
        BYTE    000H, 001H, 000H, 000H, 000H, 000H, 000H, 001H, 000H, 000H, 000H, 000H, 000H, 001H, 000H, 000H
        BYTE    000H, 000H, 001H, 000H, 000H, 000H, 000H, 001H, 000H, 000H, 000H, 000H, 001H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 001H, 000H, 000H, 000H, 001H, 000H, 000H, 000H, 001H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 001H, 000H, 000H, 001H, 000H, 000H, 001H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 001H, 000H, 001H, 000H, 001H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 001H, 001H, 001H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    001H, 001H, 001H, 001H, 001H, 001H, 001H, 000H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 001H, 001H, 001H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 001H, 000H, 001H, 000H, 001H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 001H, 000H, 000H, 001H, 000H, 000H, 001H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 001H, 000H, 000H, 000H, 001H, 000H, 000H, 000H, 001H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 001H, 000H, 000H, 000H, 000H, 001H, 000H, 000H, 000H, 000H, 001H, 000H, 000H, 000H
        BYTE    000H, 001H, 000H, 000H, 000H, 000H, 000H, 001H, 000H, 000H, 000H, 000H, 000H, 001H, 000H, 000H
        BYTE    001H, 000H, 000H, 000H, 000H, 000H, 000H, 001H, 000H, 000H, 000H, 000H, 000H, 000H, 001H
VALT    BYTE    000H, 0C8H, 001H, 02CH, 002H, 008H, 002H, 012H, 002H, 0BCH, 004H, 04CH, 000H, 0C8H, 000H, 0C8H
CMASK   BYTE    00DH, 00FH, 00FH, 00FH, 00CH, 00FH, 00FH, 00EH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH
        BYTE    00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH
        BYTE    00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH
        BYTE    00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH
        BYTE    00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH
        BYTE    00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH
        BYTE    00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH
        BYTE    007H, 00FH, 00FH, 00FH, 003H, 00FH, 00FH, 00BH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH
STARTB  BYTE    004H, 002H, 003H, 005H, 006H, 003H, 002H, 004H
PVDATA  BYTE    000H, 064H, 000H, 064H, 000H, 064H, 000H, 064H, 000H, 064H, 000H, 064H, 000H, 064H, 000H, 064H
        BYTE    000H, 069H, 000H, 06EH, 000H, 06EH, 000H, 050H, 000H, 050H, 000H, 06EH, 000H, 06EH, 000H, 069H
        BYTE    000H, 069H, 000H, 05FH, 000H, 05AH, 000H, 064H, 000H, 064H, 000H, 05AH, 000H, 05FH, 000H, 069H
        BYTE    000H, 064H, 000H, 064H, 000H, 064H, 000H, 078H, 000H, 078H, 000H, 064H, 000H, 064H, 000H, 064H
        BYTE    000H, 069H, 000H, 069H, 000H, 06EH, 000H, 07DH, 000H, 07DH, 000H, 06EH, 000H, 069H, 000H, 069H
        BYTE    000H, 06EH, 000H, 06EH, 000H, 078H, 000H, 082H, 000H, 082H, 000H, 078H, 000H, 06EH, 000H, 06EH
        BYTE    000H, 096H, 000H, 096H, 000H, 096H, 000H, 096H, 000H, 096H, 000H, 096H, 000H, 096H, 000H, 096H
        BYTE    000H, 064H, 000H, 064H, 000H, 064H, 000H, 064H, 000H, 064H, 000H, 064H, 000H, 064H, 000H, 064H
        BYTE    001H, 00EH, 001H, 018H, 001H, 022H, 001H, 022H, 001H, 022H, 001H, 022H, 001H, 018H, 001H, 00EH
        BYTE    001H, 018H, 001H, 02CH, 001H, 040H, 001H, 045H, 001H, 045H, 001H, 040H, 001H, 02CH, 001H, 018H
        BYTE    001H, 022H, 001H, 045H, 001H, 04AH, 001H, 04FH, 001H, 04FH, 001H, 04AH, 001H, 045H, 001H, 022H
        BYTE    001H, 022H, 001H, 040H, 001H, 04FH, 001H, 054H, 001H, 054H, 001H, 04FH, 001H, 040H, 001H, 022H
        BYTE    001H, 022H, 001H, 045H, 001H, 04FH, 001H, 054H, 001H, 054H, 001H, 04FH, 001H, 045H, 001H, 022H
        BYTE    001H, 022H, 001H, 040H, 001H, 04AH, 001H, 04FH, 001H, 04FH, 001H, 04AH, 001H, 040H, 001H, 022H
        BYTE    001H, 018H, 001H, 02CH, 001H, 040H, 001H, 040H, 001H, 040H, 001H, 040H, 001H, 02CH, 001H, 018H
        BYTE    001H, 00EH, 001H, 018H, 001H, 022H, 001H, 022H, 001H, 022H, 001H, 022H, 001H, 018H, 001H, 00EH
        BYTE    001H, 036H, 001H, 040H, 001H, 040H, 001H, 040H, 001H, 040H, 001H, 040H, 001H, 040H, 001H, 036H
        BYTE    001H, 040H, 001H, 04FH, 001H, 04AH, 001H, 04AH, 001H, 04AH, 001H, 04AH, 001H, 04FH, 001H, 040H
        BYTE    001H, 040H, 001H, 054H, 001H, 054H, 001H, 054H, 001H, 054H, 001H, 054H, 001H, 054H, 001H, 040H
        BYTE    001H, 040H, 001H, 04AH, 001H, 054H, 001H, 054H, 001H, 054H, 001H, 054H, 001H, 04AH, 001H, 040H
        BYTE    001H, 040H, 001H, 04FH, 001H, 04FH, 001H, 054H, 001H, 054H, 001H, 04FH, 001H, 04FH, 001H, 040H
        BYTE    001H, 040H, 001H, 04AH, 001H, 04FH, 001H, 054H, 001H, 054H, 001H, 04FH, 001H, 04AH, 001H, 040H
        BYTE    001H, 040H, 001H, 04AH, 001H, 04AH, 001H, 04AH, 001H, 04AH, 001H, 04AH, 001H, 04AH, 001H, 040H
        BYTE    001H, 036H, 001H, 040H, 001H, 040H, 001H, 040H, 001H, 040H, 001H, 040H, 001H, 040H, 001H, 036H
        BYTE    001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F9H, 001H, 0F9H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H
        BYTE    001H, 0EFH, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0EFH
        BYTE    001H, 0EFH, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0EFH
        BYTE    001H, 0EFH, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0EFH
        BYTE    001H, 0EFH, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0EFH
        BYTE    001H, 0EFH, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0EFH
        BYTE    001H, 0F9H, 001H, 0FEH, 001H, 0FEH, 001H, 0FEH, 001H, 0FEH, 001H, 0FEH, 001H, 0FEH, 001H, 0F9H
        BYTE    001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H, 001H, 0F4H
        BYTE    003H, 070H, 003H, 07AH, 003H, 07AH, 003H, 07FH, 003H, 07FH, 003H, 07AH, 003H, 07AH, 003H, 070H
        BYTE    003H, 07AH, 003H, 084H, 003H, 089H, 003H, 084H, 003H, 084H, 003H, 084H, 003H, 084H, 003H, 07AH
        BYTE    003H, 07AH, 003H, 089H, 003H, 089H, 003H, 089H, 003H, 089H, 003H, 089H, 003H, 084H, 003H, 07AH
        BYTE    003H, 084H, 003H, 084H, 003H, 089H, 003H, 089H, 003H, 089H, 003H, 089H, 003H, 084H, 003H, 07FH
        BYTE    003H, 07FH, 003H, 084H, 003H, 089H, 003H, 089H, 003H, 089H, 003H, 089H, 003H, 084H, 003H, 07FH
        BYTE    003H, 07AH, 003H, 084H, 003H, 089H, 003H, 089H, 003H, 089H, 003H, 089H, 003H, 084H, 003H, 07AH
        BYTE    003H, 07AH, 003H, 084H, 003H, 084H, 003H, 084H, 003H, 084H, 003H, 084H, 003H, 084H, 003H, 07AH
        BYTE    003H, 070H, 003H, 07AH, 003H, 07AH, 003H, 07FH, 003H, 07FH, 003H, 07AH, 003H, 07AH, 003H, 070H
        BYTE    000H, 014H, 000H, 01EH, 000H, 00AH, 000H, 000H, 000H, 000H, 000H, 00AH, 000H, 01EH, 000H, 014H
        BYTE    000H, 014H, 000H, 014H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 014H, 000H, 014H
        BYTE    0FFH, 0F6H, 0FFH, 0ECH, 0FFH, 0ECH, 0FFH, 0ECH, 0FFH, 0ECH, 0FFH, 0ECH, 0FFH, 0ECH, 0FFH, 0F6H
        BYTE    0FFH, 0ECH, 0FFH, 0E2H, 0FFH, 0E2H, 0FFH, 0D8H, 0FFH, 0D8H, 0FFH, 0E2H, 0FFH, 0E2H, 0FFH, 0ECH
        BYTE    0FFH, 0E2H, 0FFH, 0D8H, 0FFH, 0D8H, 0FFH, 0CEH, 0FFH, 0CEH, 0FFH, 0D8H, 0FFH, 0D8H, 0FFH, 0E2H
        BYTE    0FFH, 0E2H, 0FFH, 0D8H, 0FFH, 0D8H, 0FFH, 0CEH, 0FFH, 0CEH, 0FFH, 0D8H, 0FFH, 0D8H, 0FFH, 0E2H
        BYTE    0FFH, 0E2H, 0FFH, 0D8H, 0FFH, 0D8H, 0FFH, 0CEH, 0FFH, 0CEH, 0FFH, 0D8H, 0FFH, 0D8H, 0FFH, 0E2H
        BYTE    0FFH, 0E2H, 0FFH, 0D8H, 0FFH, 0D8H, 0FFH, 0CEH, 0FFH, 0CEH, 0FFH, 0D8H, 0FFH, 0D8H, 0FFH, 0E2H
        BYTE    0FFH, 09CH, 0FFH, 09CH, 0FFH, 09CH, 0FFH, 09CH, 0FFH, 09CH, 0FFH, 09CH, 0FFH, 09CH, 0FFH, 09CH
        BYTE    0FFH, 06AH, 0FFH, 06AH, 0FFH, 06AH, 0FFH, 06AH, 0FFH, 06AH, 0FFH, 06AH, 0FFH, 06AH, 0FFH, 06AH
        BYTE    0FFH, 092H, 0FFH, 092H, 0FFH, 088H, 0FFH, 07EH, 0FFH, 07EH, 0FFH, 088H, 0FFH, 092H, 0FFH, 092H
        BYTE    0FFH, 097H, 0FFH, 097H, 0FFH, 092H, 0FFH, 083H, 0FFH, 083H, 0FFH, 092H, 0FFH, 097H, 0FFH, 097H
        BYTE    0FFH, 09CH, 0FFH, 09CH, 0FFH, 09CH, 0FFH, 088H, 0FFH, 088H, 0FFH, 09CH, 0FFH, 09CH, 0FFH, 09CH
        BYTE    0FFH, 097H, 0FFH, 0A1H, 0FFH, 0A6H, 0FFH, 09CH, 0FFH, 09CH, 0FFH, 0A6H, 0FFH, 0A1H, 0FFH, 097H
        BYTE    0FFH, 097H, 0FFH, 092H, 0FFH, 092H, 0FFH, 0B0H, 0FFH, 0B0H, 0FFH, 092H, 0FFH, 092H, 0FFH, 097H
        BYTE    0FFH, 09CH, 0FFH, 09CH, 0FFH, 09CH, 0FFH, 09CH, 0FFH, 09CH, 0FFH, 09CH, 0FFH, 09CH, 0FFH, 09CH
        BYTE    0FEH, 0F2H, 0FEH, 0E8H, 0FEH, 0DEH, 0FEH, 0DEH, 0FEH, 0DEH, 0FEH, 0DEH, 0FEH, 0E8H, 0FEH, 0F2H
        BYTE    0FEH, 0E8H, 0FEH, 0D4H, 0FEH, 0C0H, 0FEH, 0C0H, 0FEH, 0C0H, 0FEH, 0C0H, 0FEH, 0D4H, 0FEH, 0E8H
        BYTE    0FEH, 0DEH, 0FEH, 0C0H, 0FEH, 0B6H, 0FEH, 0B1H, 0FEH, 0B1H, 0FEH, 0B6H, 0FEH, 0C0H, 0FEH, 0DEH
        BYTE    0FEH, 0DEH, 0FEH, 0BBH, 0FEH, 0B1H, 0FEH, 0ACH, 0FEH, 0ACH, 0FEH, 0B1H, 0FEH, 0BBH, 0FEH, 0DEH
        BYTE    0FEH, 0DEH, 0FEH, 0C0H, 0FEH, 0B1H, 0FEH, 0ACH, 0FEH, 0ACH, 0FEH, 0B1H, 0FEH, 0C0H, 0FEH, 0DEH
        BYTE    0FEH, 0DEH, 0FEH, 0BBH, 0FEH, 0B6H, 0FEH, 0B1H, 0FEH, 0B1H, 0FEH, 0B6H, 0FEH, 0BBH, 0FEH, 0DEH
        BYTE    0FEH, 0E8H, 0FEH, 0D4H, 0FEH, 0C0H, 0FEH, 0BBH, 0FEH, 0BBH, 0FEH, 0C0H, 0FEH, 0D4H, 0FEH, 0E8H
        BYTE    0FEH, 0F2H, 0FEH, 0E8H, 0FEH, 0DEH, 0FEH, 0DEH, 0FEH, 0DEH, 0FEH, 0DEH, 0FEH, 0E8H, 0FEH, 0F2H
        BYTE    0FEH, 0CAH, 0FEH, 0C0H, 0FEH, 0C0H, 0FEH, 0C0H, 0FEH, 0C0H, 0FEH, 0C0H, 0FEH, 0C0H, 0FEH, 0CAH
        BYTE    0FEH, 0C0H, 0FEH, 0B6H, 0FEH, 0B6H, 0FEH, 0B6H, 0FEH, 0B6H, 0FEH, 0B6H, 0FEH, 0B6H, 0FEH, 0C0H
        BYTE    0FEH, 0C0H, 0FEH, 0B6H, 0FEH, 0B1H, 0FEH, 0ACH, 0FEH, 0ACH, 0FEH, 0B1H, 0FEH, 0B6H, 0FEH, 0C0H
        BYTE    0FEH, 0C0H, 0FEH, 0B1H, 0FEH, 0B1H, 0FEH, 0ACH, 0FEH, 0ACH, 0FEH, 0B1H, 0FEH, 0B1H, 0FEH, 0C0H
        BYTE    0FEH, 0C0H, 0FEH, 0B6H, 0FEH, 0ACH, 0FEH, 0ACH, 0FEH, 0ACH, 0FEH, 0ACH, 0FEH, 0B6H, 0FEH, 0C0H
        BYTE    0FEH, 0C0H, 0FEH, 0ACH, 0FEH, 0ACH, 0FEH, 0ACH, 0FEH, 0ACH, 0FEH, 0ACH, 0FEH, 0ACH, 0FEH, 0C0H
        BYTE    0FEH, 0C0H, 0FEH, 0B1H, 0FEH, 0B6H, 0FEH, 0B6H, 0FEH, 0B6H, 0FEH, 0B6H, 0FEH, 0B1H, 0FEH, 0C0H
        BYTE    0FEH, 0CAH, 0FEH, 0C0H, 0FEH, 0C0H, 0FEH, 0C0H, 0FEH, 0C0H, 0FEH, 0C0H, 0FEH, 0C0H, 0FEH, 0CAH
        BYTE    0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH
        BYTE    0FEH, 007H, 0FEH, 002H, 0FEH, 002H, 0FEH, 002H, 0FEH, 002H, 0FEH, 002H, 0FEH, 002H, 0FEH, 007H
        BYTE    0FEH, 011H, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 011H
        BYTE    0FEH, 011H, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 011H
        BYTE    0FEH, 011H, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 011H
        BYTE    0FEH, 011H, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 011H
        BYTE    0FEH, 011H, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 011H
        BYTE    0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 007H, 0FEH, 007H, 0FEH, 00CH, 0FEH, 00CH, 0FEH, 00CH
        BYTE    0FCH, 090H, 0FCH, 086H, 0FCH, 086H, 0FCH, 081H, 0FCH, 081H, 0FCH, 086H, 0FCH, 086H, 0FCH, 090H
        BYTE    0FCH, 086H, 0FCH, 07CH, 0FCH, 07CH, 0FCH, 07CH, 0FCH, 07CH, 0FCH, 07CH, 0FCH, 07CH, 0FCH, 086H
        BYTE    0FCH, 086H, 0FCH, 07CH, 0FCH, 077H, 0FCH, 077H, 0FCH, 077H, 0FCH, 077H, 0FCH, 07CH, 0FCH, 086H
        BYTE    0FCH, 081H, 0FCH, 07CH, 0FCH, 077H, 0FCH, 077H, 0FCH, 077H, 0FCH, 077H, 0FCH, 07CH, 0FCH, 081H
        BYTE    0FCH, 07CH, 0FCH, 07CH, 0FCH, 077H, 0FCH, 077H, 0FCH, 077H, 0FCH, 077H, 0FCH, 07CH, 0FCH, 081H
        BYTE    0FCH, 086H, 0FCH, 077H, 0FCH, 077H, 0FCH, 077H, 0FCH, 077H, 0FCH, 077H, 0FCH, 07CH, 0FCH, 086H
        BYTE    0FCH, 086H, 0FCH, 07CH, 0FCH, 077H, 0FCH, 07CH, 0FCH, 07CH, 0FCH, 07CH, 0FCH, 07CH, 0FCH, 086H
        BYTE    0FCH, 090H, 0FCH, 086H, 0FCH, 086H, 0FCH, 081H, 0FCH, 081H, 0FCH, 086H, 0FCH, 086H, 0FCH, 090H
        BYTE    000H, 01EH, 000H, 028H, 000H, 028H, 000H, 032H, 000H, 032H, 000H, 028H, 000H, 028H, 000H, 01EH
        BYTE    000H, 01EH, 000H, 028H, 000H, 028H, 000H, 032H, 000H, 032H, 000H, 028H, 000H, 028H, 000H, 01EH
        BYTE    000H, 01EH, 000H, 028H, 000H, 028H, 000H, 032H, 000H, 032H, 000H, 028H, 000H, 028H, 000H, 01EH
        BYTE    000H, 01EH, 000H, 028H, 000H, 028H, 000H, 032H, 000H, 032H, 000H, 028H, 000H, 028H, 000H, 01EH
        BYTE    000H, 014H, 000H, 01EH, 000H, 01EH, 000H, 028H, 000H, 028H, 000H, 01EH, 000H, 01EH, 000H, 014H
        BYTE    000H, 00AH, 000H, 014H, 000H, 014H, 000H, 014H, 000H, 014H, 000H, 014H, 000H, 014H, 000H, 00AH
        BYTE    0FFH, 0ECH, 0FFH, 0ECH, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 0FFH, 0ECH, 0FFH, 0ECH
        BYTE    0FFH, 0ECH, 0FFH, 0E2H, 0FFH, 0F6H, 000H, 000H, 000H, 000H, 0FFH, 0F6H, 0FFH, 0E2H, 0FFH, 0ECH
PCH     BYTE    000H, 000H, 000H, 000H, 000H, 000H, 081H, 082H, 083H, 084H, 085H, 086H, 087H, 088H, 089H, 08AH
        BYTE    08BH, 08CH, 08DH, 08EH, 08FH, 090H, 091H, 092H, 093H, 094H, 095H, 096H, 08BH, 08CH, 097H, 098H
        BYTE    099H, 09AH, 091H, 092H, 09BH, 09CH, 09DH, 09EH, 09FH, 0DBH, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 0DCH, 0DDH, 0DEH, 0DFH, 0E0H, 0E1H, 0E2H, 0E3H, 0E4H, 0E5H
        BYTE    0E6H, 0E7H, 0E8H, 0E9H, 0EAH, 0EBH, 0ECH, 0EDH, 0EEH, 0EFH, 0F0H, 0F1H, 0E6H, 0E7H, 0F2H, 0F3H
        BYTE    0F4H, 0F5H, 0ECH, 0EDH, 0F6H, 0F7H, 0F8H, 0F9H, 0FAH, 0FBH
FBLUE   BYTE    07CH, 07CH, 07CH, 07CH, 07CH, 07CH
FSPACE  BYTE    020H, 020H, 020H, 020H, 020H, 020H
DEPTHS  BYTE    001H, 002H, 003H, 004H
SPINCH  BYTE    0BBH, 0AFH, 0ADH, 0BCH
BOOKD   BYTE    006H, 014H, 034H, 064H, 044H, 006H, 025H, 071H, 052H, 005H, 041H, 060H, 050H, 006H, 014H, 034H
        BYTE    064H, 044H, 006H, 025H, 071H, 052H, 005H, 032H, 075H, 042H, 006H, 014H, 034H, 064H, 044H, 006H
        BYTE    025H, 071H, 052H, 013H, 033H, 044H, 033H, 006H, 014H, 034H, 062H, 042H, 006H, 025H, 063H, 053H
        BYTE    013H, 033H, 042H, 033H, 006H, 014H, 034H, 062H, 042H, 006H, 025H, 071H, 052H, 013H, 033H, 042H
        BYTE    033H, 006H, 014H, 034H, 064H, 054H, 013H, 033H, 063H, 043H, 001H, 022H, 076H, 055H, 006H, 014H
        BYTE    034H, 062H, 052H, 013H, 033H, 063H, 043H, 001H, 022H, 043H, 034H, 006H, 013H, 033H, 063H, 043H
        BYTE    012H, 032H, 064H, 054H, 001H, 022H, 076H, 055H, 006H, 013H, 033H, 076H, 055H, 012H, 032H, 064H
        BYTE    054H, 006H, 025H, 063H, 043H, 006H, 013H, 033H, 076H, 055H, 012H, 032H, 066H, 056H, 001H, 022H
        BYTE    075H, 066H, 006H, 012H, 032H, 064H, 044H, 001H, 022H, 076H, 055H, 006H, 025H, 071H, 052H, 006H
        BYTE    006H, 025H, 063H, 043H, 013H, 033H, 076H, 055H, 012H, 032H, 064H, 054H, 006H, 013H, 033H, 063H
        BYTE    043H, 006H, 025H, 076H, 055H, 012H, 032H, 062H, 052H, 006H, 014H, 034H, 064H, 044H, 001H, 022H
        BYTE    076H, 055H, 006H, 025H, 071H, 052H, 000H
TXCHECK BYTE    0A2H, 0A3H, 0A4H, 0A2H, 0A5H, 0A6H, 020H, 020H, 000H
TXMATE  BYTE    0A7H, 0AAH, 0ABH, 0A4H, 0A6H, 020H, 020H, 020H, 000H
TXWHITE  TEXT    "WHITE   "
        BYTE    0
TXBLACK  TEXT    "BLACK   "
        BYTE    0
TXBOTH   TEXT    "BOTH    "
        BYTE    0
TXTHINK  TEXT    "THINKING"
        BYTE    0
TXYOUR   TEXT    "YOUR GO "
        BYTE    0
TXBLANK  TEXT    "        "
        BYTE    0
TXSTALE  TEXT    "STALEMAT"
        BYTE    0
TXPRO    TEXT    "Q R B N?"
        BYTE    0
TXSON    TEXT    "SOUND ON"
        BYTE    0
TXSOFF   TEXT    "SOUNDOFF"
        BYTE    0
TUNE    BYTE    0
TX1      TEXT    " GAMBIT "
        BYTE    0
TX2      TEXT    "LEVEL   "
        BYTE    0
TX3      TEXT    "ARROWS  "
        BYTE    0
TX4      TEXT    "SPC=PICK"
        BYTE    0
TX5      TEXT    "T=BACK  "
        BYTE    0
TX6      TEXT    "S=SWAP  "
        BYTE    0
TX7      TEXT    "L=LEVEL "
        BYTE    0
TX8      TEXT    "N=NEW   "
        BYTE    0
TX9      TEXT    "ESC=QUIT"
        BYTE    0
TX10     TEXT    "M=SOUND "
        BYTE    0
TX15     TEXT    "GAMBIT"
        BYTE    0
TX16     TEXT    "CHESS FOR THE COMX-35"
        BYTE    0
TX17     TEXT    "W     PLAY WHITE"
        BYTE    0
TX18     TEXT    "B     PLAY BLACK"
        BYTE    0
TX19     TEXT    "2     TWO PLAYERS"
        BYTE    0
TX20     TEXT    "1-4   LEVEL"
        BYTE    0
TX21     TEXT    "M     SOUND ON/OFF"
        BYTE    0
TX22     TEXT    "ESC   QUIT"
        BYTE    0
TX23     TEXT    "SPACE START"
        BYTE    0
TX24     TEXT    "YOU PLAY"
        BYTE    0
TX25     TEXT    "LEVEL"
        BYTE    0
CHTAB
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C1H, 0C3H, 0C3H
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0E0H, 0F0H, 0F0H, 0C1H, 0C3H, 0C1H, 0C1H, 0C3H, 0C3H, 0C7H, 0C7H
        BYTE    0E0H, 0F0H, 0E0H, 0E0H, 0F0H, 0F0H, 0F8H, 0F8H, 0CFH, 0CFH, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    0FCH, 0FCH, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C1H, 0C3H, 0C6H, 0CFH
        BYTE    0C0H, 0C0H, 0C0H, 0E8H, 0F8H, 0FCH, 0FEH, 0FEH, 0DFH, 0FCH, 0F0H, 0C1H, 0C3H, 0C7H, 0C7H, 0CFH
        BYTE    0FEH, 0FEH, 0FEH, 0FEH, 0FCH, 0F8H, 0F8H, 0FCH, 0DFH, 0DFH, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    0FEH, 0FEH, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C1H, 0C3H, 0C7H, 0C6H, 0C5H, 0C7H
        BYTE    0C0H, 0C0H, 0E0H, 0F0H, 0C8H, 0D8H, 0F8H, 0F8H, 0C3H, 0C1H, 0C3H, 0C7H, 0C1H, 0C3H, 0C3H, 0C7H
        BYTE    0F0H, 0E0H, 0F0H, 0F8H, 0E0H, 0F0H, 0F0H, 0F8H, 0CFH, 0DFH, 0DFH, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    0FCH, 0FEH, 0FEH, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0CDH, 0CDH, 0CFH, 0C7H, 0C7H
        BYTE    0C0H, 0C0H, 0C0H, 0ECH, 0ECH, 0FCH, 0F8H, 0F8H, 0C7H, 0C7H, 0C7H, 0C7H, 0C7H, 0C7H, 0C7H, 0CFH
        BYTE    0F8H, 0F8H, 0F8H, 0F8H, 0F8H, 0F8H, 0F8H, 0FCH, 0C0H, 0C0H, 0D1H, 0D1H, 0D9H, 0D9H, 0DDH, 0DFH
        BYTE    0C0H, 0C0H, 0E2H, 0E2H, 0E6H, 0E6H, 0EEH, 0FEH, 0CFH, 0CFH, 0C7H, 0C7H, 0C3H, 0C7H, 0CFH, 0C7H
        BYTE    0FCH, 0FCH, 0F8H, 0F8H, 0F0H, 0F8H, 0FCH, 0F8H, 0C0H, 0C1H, 0C7H, 0C1H, 0C1H, 0CDH, 0DFH, 0DFH
        BYTE    0C0H, 0E0H, 0F8H, 0E0H, 0E0H, 0ECH, 0FEH, 0FEH, 0DFH, 0CFH, 0CFH, 0C7H, 0C7H, 0C3H, 0C7H, 0CFH
        BYTE    0FEH, 0FCH, 0FCH, 0F8H, 0F8H, 0F0H, 0F8H, 0FCH, 0C7H, 0CFH, 0DFH, 0DFH, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C4H, 0C4H, 0C4H, 0C4H, 0C4H, 0C0H, 0C4H, 0C0H
        BYTE    00EH, 011H, 010H, 010H, 010H, 011H, 00EH, 000H, 011H, 011H, 011H, 01FH, 011H, 011H, 011H, 000H
        BYTE    01FH, 010H, 010H, 01EH, 010H, 010H, 01FH, 000H, 011H, 012H, 014H, 018H, 014H, 012H, 011H, 000H
        BYTE    004H, 004H, 004H, 004H, 004H, 000H, 004H, 000H, 011H, 01BH, 015H, 015H, 011H, 011H, 011H, 000H
        BYTE    0C2H, 0C4H, 0C8H, 0C8H, 0C8H, 0C4H, 0C2H, 0C0H, 0C8H, 0C4H, 0C2H, 0C2H, 0C2H, 0C4H, 0C8H, 0C0H
        BYTE    00EH, 011H, 011H, 01FH, 011H, 011H, 011H, 000H, 01FH, 004H, 004H, 004H, 004H, 004H, 004H, 000H
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0CCH, 0C4H, 0C8H, 0C0H, 0C0H, 0C0H, 0C0H, 0DFH, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0CCH, 0CCH, 0C0H, 0C0H, 0C1H, 0C2H, 0C4H, 0C8H, 0D0H, 0C0H, 0C0H
        BYTE    0CEH, 0D1H, 0D3H, 0D5H, 0D9H, 0D1H, 0CEH, 0C0H, 0C4H, 0CCH, 0C4H, 0C4H, 0C4H, 0C4H, 0CEH, 0C0H
        BYTE    0CEH, 0D1H, 0C1H, 0C2H, 0C4H, 0C8H, 0DFH, 0C0H, 0DFH, 0C2H, 0C4H, 0C2H, 0C1H, 0D1H, 0CEH, 0C0H
        BYTE    0C2H, 0C6H, 0CAH, 0D2H, 0DFH, 0C2H, 0C2H, 0C0H, 0DFH, 0D0H, 0DEH, 0C1H, 0C1H, 0D1H, 0CEH, 0C0H
        BYTE    0C6H, 0C8H, 0D0H, 0DEH, 0D1H, 0D1H, 0CEH, 0C0H, 0DFH, 0C1H, 0C2H, 0C4H, 0C8H, 0C8H, 0C8H, 0C0H
        BYTE    0CEH, 0D1H, 0D1H, 0CEH, 0D1H, 0D1H, 0CEH, 0C0H, 0CEH, 0D1H, 0D1H, 0CFH, 0C1H, 0C2H, 0CCH, 0C0H
        BYTE    0C0H, 0CCH, 0CCH, 0C0H, 0CCH, 0CCH, 0C0H, 0C0H, 0C8H, 0C8H, 0C8H, 0C8H, 0C8H, 0C8H, 0C8H, 0C0H
        BYTE    0E0H, 0D0H, 0D0H, 0C8H, 0C4H, 0C4H, 0C2H, 0C0H, 0C0H, 0C0H, 0DFH, 0C0H, 0DFH, 0C0H, 0C0H, 0C0H
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
        BYTE    0DFH, 0C1H, 0C2H, 0C4H, 0C8H, 0D0H, 0DFH, 0C0H, 0F8H, 0FCH, 0FEH, 0FEH, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    000H, 000H, 000H, 000H, 000H, 001H, 003H, 003H, 000H, 000H, 000H, 000H, 000H, 020H, 030H, 030H
        BYTE    001H, 003H, 001H, 001H, 003H, 003H, 007H, 007H, 020H, 030H, 020H, 020H, 030H, 030H, 038H, 038H
        BYTE    00FH, 00FH, 000H, 000H, 000H, 000H, 000H, 000H, 03CH, 03CH, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 001H, 003H, 006H, 00FH, 000H, 000H, 000H, 028H, 038H, 03CH, 03EH, 03EH
        BYTE    01FH, 03CH, 030H, 001H, 003H, 007H, 007H, 00FH, 03EH, 03EH, 03EH, 03EH, 03CH, 038H, 038H, 03CH
        BYTE    01FH, 01FH, 000H, 000H, 000H, 000H, 000H, 000H, 03EH, 03EH, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 001H, 003H, 007H, 006H, 005H, 007H, 000H, 000H, 020H, 030H, 008H, 018H, 038H, 038H
        BYTE    003H, 001H, 003H, 007H, 001H, 003H, 003H, 007H, 030H, 020H, 030H, 038H, 020H, 030H, 030H, 038H
        BYTE    00FH, 01FH, 01FH, 000H, 000H, 000H, 000H, 000H, 03CH, 03EH, 03EH, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 00DH, 00DH, 00FH, 007H, 007H, 000H, 000H, 000H, 02CH, 02CH, 03CH, 038H, 038H
        BYTE    007H, 007H, 007H, 007H, 007H, 007H, 007H, 00FH, 038H, 038H, 038H, 038H, 038H, 038H, 038H, 03CH
        BYTE    000H, 000H, 011H, 011H, 019H, 019H, 01DH, 01FH, 000H, 000H, 022H, 022H, 026H, 026H, 02EH, 03EH
        BYTE    00FH, 00FH, 007H, 007H, 003H, 007H, 00FH, 007H, 03CH, 03CH, 038H, 038H, 030H, 038H, 03CH, 038H
        BYTE    000H, 001H, 007H, 001H, 001H, 00DH, 01FH, 01FH, 000H, 020H, 038H, 020H, 020H, 02CH, 03EH, 03EH
        BYTE    01FH, 00FH, 00FH, 007H, 007H, 003H, 007H, 00FH, 03EH, 03CH, 03CH, 038H, 038H, 030H, 038H, 03CH
        BYTE    007H, 00FH, 01FH, 01FH, 000H, 000H, 000H, 000H, 038H, 03CH, 03EH, 03EH, 000H, 000H, 000H, 000H
        BYTE    07FH, 07FH, 07FH, 07FH, 07FH, 07FH, 07FH, 07FH, 0BFH, 0BFH, 0BFH, 0BFH, 0BFH, 0BFH, 0BFH, 0BFH
        BYTE    07FH, 07FH, 07FH, 07FH, 07FH, 07FH, 07FH, 07FH, 0BFH, 0BFH, 0BFH, 0BFH, 0BFH, 0BFH, 0BFH, 0BFH
        END
