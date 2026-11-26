;=====================================================================
; FORTRAID.ASM - FORTRESS RAID for the COMX-35 (1802 machine code, A18 syntax)
; An original altitude shooter.  Start: CALL(@4500).
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
QBUF    EQU     0A900H
CSAVE   EQU     09C00H
SPR     EQU     0A400H
OT      EQU     0A5B0H
OPR     EQU     0A5C0H
OC      EQU     0A5D0H
HG      EQU     0A500H
HC      EQU     0A504H
HON     EQU     0A508H
PG      EQU     0A510H
PC_     EQU     0A514H
PAL     EQU     0A518H
PON     EQU     0A51CH
PTM     EQU     0A520H
MG      EQU     0A524H
MC      EQU     0A526H
MAL     EQU     0A528H
MON     EQU     0A52AH
XT      EQU     0A52CH
NEWROW  EQU     0A540H
HUDBUF  EQU     0A570H
PEND    EQU     0A5A0H
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
LIVES   EQU     0AA1FH
FRM     EQU     0AA20H
LASTD   EQU     0AA22H
FCNT    EQU     0AA23H
ANIM    EQU     0AA24H
HELD    EQU     0AA25H
AUTO    EQU     0AA26H
KCNT    EQU     0AA27H
DEAD    EQU     0AA28H
DTMR    EQU     0AA29H
INV     EQU     0AA2AH
PX      EQU     0AA2BH
PALT    EQU     0AA2CH
FUEL    EQU     0AA2DH
FTMR    EQU     0AA2EH
SHON    EQU     0AA2FH
SHG     EQU     0AA30H
SHX     EQU     0AA31H
SHA     EQU     0AA32H
TOPV    EQU     0AA33H
NTOP    EQU     0AA34H
SCRREQ  EQU     0AA35H
FRESH   EQU     0AA36H
LASTF   EQU     0AA37H
VCAP    EQU     0AA38H
NHMA    EQU     0AA39H
HUDDST  EQU     0AA3BH
ROWDST  EQU     0AA3DH
LPOS    EQU     0AA3FH
OPTR    EQU     0AA41H
EPTR    EQU     0AA43H
SCRL    EQU     0AA45H
SCNT    EQU     0AA46H
SPER    EQU     0AA47H
LOOP    EQU     0AA48H
SECT    EQU     0AA49H
MSGT    EQU     0AA4AH
MSGN    EQU     0AA4BH
PWAVE   EQU     0AA4CH
PWT     EQU     0AA4DH
TFT     EQU     0AA4EH
BOSS    EQU     0AA4FH
BOSSREQ EQU     0AA50H
BX      EQU     0AA51H
BOX     EQU     0AA52H
BON     EQU     0AA53H
BHP     EQU     0AA54H
BDIR    EQU     0AA55H
BTMR    EQU     0AA56H
MTMR    EQU     0AA57H
HUDT    EQU     0AA58H
BFLASH  EQU     0AA59H
TMPA    EQU     0AA5AH
TMPB    EQU     0AA5BH
TMPC    EQU     0AA5CH
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
QPRET   SEP     R3
QP1     PLO     R7
        LDI     HIGH TOPV
        PHI     RC
        LDI     LOW TOPV
        PLO     RC
        LDN     RC
        STR     R2
        GHI     RE
        ADD
        SHL
        ADI     LOW ROWT2
        PLO     RC
        LDI     HIGH ROWT2
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
        GLO     R7
        LBNZ    QP2
        GLO     RD
        PLO     RC
        GHI     RD
        ADI     0A8H
        PHI     RC
        LDN     RC
        PLO     R7
QP2
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        SMI     78
        LBDF    QPRET
        LDN     RA
        ADI     1
        STR     RA
        SMI     1
        STR     R2
        SHL
        ADD
        PLO     RA
        LDI     HIGH QBUF
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
        LDI     HIGH (SCRREQ)
        PHI     RA
        LDI     LOW (SCRREQ)
        PLO     RA
        LDN     RA
        LBZ     VBD0
        LDI     0
        STR     RA
        LDI     HIGH (FRESH)
        PHI     RA
        LDI     LOW (FRESH)
        PLO     RA
        LDN     RA
        LBNZ    VBD1
VBW1    BN1     VBW1
VBW2    B1      VBW2
VBD1
        LDI     HIGH (VCAP)
        PHI     RA
        LDI     LOW (VCAP)
        PLO     RA
        LDI     30
        STR     RA
        LDI     HIGH (NHMA)
        PHI     RB
        LDI     LOW (NHMA)
        PLO     RB
        LDA     RB
        PHI     RF
        LDN     RB
        PLO     RF
        SEX     RF
        OUT     7
        SEX     R2
        LDI     HIGH (HUDDST)
        PHI     RB
        LDI     LOW (HUDDST)
        PLO     RB
        LDA     RB
        PHI     RD
        LDN     RB
        PLO     RD
        LDI     HIGH (HUDBUF)
        PHI     RC
        LDI     LOW (HUDBUF)
        PLO     RC
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDI     HIGH (ROWDST)
        PHI     RB
        LDI     LOW (ROWDST)
        PLO     RB
        LDA     RB
        PHI     RD
        LDN     RB
        PLO     RD
        LDI     HIGH (NEWROW)
        PHI     RC
        LDI     LOW (NEWROW)
        PLO     RC
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
VBD0
        LDI     HIGH (QR)
        PHI     RA
        LDI     LOW (QR)
        PLO     RA
        LDN     RA
        PLO     R9
        STR     R2
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        SM
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
        LDI     HIGH (QRO)
        PHI     RA
        LDI     LOW (QRO)
        PLO     RA
        LDN     RA
        PLO     RA
        LDI     HIGH QBUF
        PHI     RA
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
        PLO     R7
        LDI     HIGH (QRO)
        PHI     RA
        LDI     LOW (QRO)
        PLO     RA
        GLO     R7
        STR     RA
        GLO     R9
        PLO     R7
        LDI     HIGH (QR)
        PHI     RA
        LDI     LOW (QR)
        PLO     RA
        GLO     R7
        STR     RA
        GLO     R9
        STR     R2
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        XOR
        LBZ     VBE
        SEP     R5
VBE
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
BGAT
        LDI     HIGH (TOPV)
        PHI     RC
        LDI     LOW (TOPV)
        PLO     RC
        LDN     RC
        STR     R2
        GHI     RE
        ADD
        SHL
        ADI     LOW ROWT2
        PLO     RC
        LDI     HIGH ROWT2
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
        ADCI    0A8H
        PHI     RD
        LDN     RD
        SEP     R5
BLOCKED ANI     7FH
        ADI     LOW HGTT
        PLO     RC
        LDI     HIGH HGTT
        ADCI    0
        PHI     RC
        LDN     RC
        LBZ     BKN
        STR     R2
        ANI     80H
        LBNZ    BKF
        GLO     R9
        SD
        LBZ     BKN
        LBNF    BKN
        LDI     1
        SEP     R5
BKF     LDN     R2
        ANI     7FH
        STR     R2
        GLO     R9
        SM
        LBNF    BKN
        LDI     1
        SEP     R5
BKN     LDI     0
        SEP     R5
; SPRITES - erase what moved, then draw it at its new place
SPRITES
        LDI     HIGH (SPR)
        PHI     RB
        LDI     LOW (SPR)
        PLO     RB
SPR1    LDN     RB
        PLO     R9
        GLO     RB
        ADI     6
        PLO     RC
        GHI     RB
        PHI     RC
        LDN     RC
        STR     R2
        GLO     R9
        XOR
        LBNZ    SPCH
        GLO     R9
        LBZ     SPNC
        GLO     RB
        ADI     1
        PLO     RD
        GHI     RB
        PHI     RD
        INC     RC
        LDA     RC
        STR     R2
        LDA     RD
        XOR
        LBNZ    SPCH
        LDA     RC
        STR     R2
        LDA     RD
        XOR
        LBNZ    SPCH
        INC     RC
        INC     RD
        LDN     RC
        STR     R2
        LDN     RD
        XOR
        LBNZ    SPCH
SPNC    GLO     RB
        ADI     12
        PLO     RC
        LDI     0
        STR     RC
        LBR     SPN1
SPCH    GLO     RB
        ADI     12
        PLO     RC
        GHI     RB
        PHI     RC
        LDI     1
        STR     RC
        GLO     RB
        ADI     6
        PLO     RC
        LDA     RC
        LBZ     SPN1
        LDA     RC
        PHI     RE
        LDA     RC
        PLO     RE
        LDN     RC
        PLO     R9
        LDI     0
        SEP     R1
        GLO     R9
        XRI     2
        LBNZ    SPN1
        INC     RE
        LDI     0
        SEP     R1
SPN1    GLO     RB
        ANI     3FH
        LBNZ    SPN1A
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
SPN1A   GLO     RB
        ADI     16
        PLO     RB
        LBNZ    SPR1
        LDI     HIGH (SPR)
        PHI     RB
        LDI     LOW (SPR)
        PLO     RB
SPR2    GLO     RB
        ADI     12
        PLO     RC
        GHI     RB
        PHI     RC
        LDN     RC
        LBZ     SPN2
        GLO     RB
        PLO     RC
        ADI     6
        PLO     RD
        GHI     RB
        PHI     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDA     RC
        STR     RD
        INC     RD
        LDN     RB
        LBZ     SPN2
        GLO     RB
        PLO     RC
        INC     RC
        LDA     RC
        PHI     RE
        LDA     RC
        PLO     RE
        LDA     RC
        PLO     R9
        LDA     RC
        PLO     RF
        LDN     RC
        PHI     R9
        GLO     RF
        SEP     R1
        GLO     R9
        XRI     2
        LBNZ    SPN2
        INC     RE
        GHI     R9
        SEP     R1
SPN2    GLO     RB
        ANI     3FH
        LBNZ    SPN2A
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
SPN2A   GLO     RB
        ADI     16
        PLO     RB
        LBNZ    SPR2
        SEP     R5
SPSET
        GLO     R8
        SHL
        SHL
        SHL
        SHL
        ADI     0
        PLO     RD
        LDI     HIGH SPR
        PHI     RD
        GHI     RE
        LBZ     SPHIDE
        SMI     23
        LBDF    SPHIDE
        LDI     1
        STR     RD
        INC     RD
        GHI     RE
        STR     RD
        INC     RD
        GLO     RE
        STR     RD
        INC     RD
        GHI     R9
        LBZ     SPS1
        LDI     2
        LBR     SPS2
SPS1    LDI     1
SPS2    STR     RD
        INC     RD
        GLO     R9
        STR     RD
        INC     RD
        GHI     R9
        STR     RD
        SEP     R5
SPHIDE  LDI     0
        STR     RD
        SEP     R5
; EFFECT - explosion at RE, R9.1 = 1 for two cells wide (keeps R8, R9, RB, RE)
EFFECT  GLO     RB
        STXD
        GLO     R8
        STXD
        GLO     R9
        STXD
        GHI     R9
        STXD
        LDI     0
        PLO     RB
EF1     GLO     RB
        ADI     LOW XT
        PLO     RA
        LDI     HIGH XT
        ADCI    0
        PHI     RA
        LDN     RA
        LBZ     EF2
        INC     RB
        GLO     RB
        XRI     2
        LBNZ    EF1
        LBR     EFR
EF2     LDI     10
        STR     RA
        GLO     RB
        ADI     14
        PLO     R8
        LDI     221
        PLO     R9
        GHI     R9
        LBZ     EF3
        LDI     221
        PHI     R9
EF3
        SEP     R4
        WORD    SPSET
EFR     IRX
        LDXA
        PHI     R9
        LDXA
        PLO     R9
        LDXA
        PLO     R8
        LDX
        PLO     RB
        SEP     R5
EFFECTS LDI     0
        PLO     RB
EFL     GLO     RB
        ADI     LOW XT
        PLO     RA
        LDI     HIGH XT
        ADCI    0
        PHI     RA
        LDN     RA
        LBZ     EFN
        SMI     1
        STR     RA
        PLO     R9
        GLO     RB
        ADI     14
        PLO     R8
        GLO     R9
        LBNZ    EFL2
        GLO     R8
        SHL
        SHL
        SHL
        SHL
        ADI     0
        PLO     RA
        LDI     HIGH SPR
        PHI     RA
        LDI     0
        STR     RA
        LBR     EFN
EFL2    GLO     R9
        XRI     5
        LBNZ    EFN
        GLO     R8
        SHL
        SHL
        SHL
        SHL
        ADI     4
        PLO     RA
        LDI     HIGH SPR
        PHI     RA
        LDI     222
        STR     RA
        INC     RA
        STR     RA
EFN     INC     RB
        GLO     RB
        XRI     2
        LBNZ    EFL
        SEP     R5
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
ASX     SEP     R5
HUDBLD
        LDI     HIGH (MSGT)
        PHI     RA
        LDI     LOW (MSGT)
        PLO     RA
        LDN     RA
        LBZ     HB0
        SMI     1
        STR     RA
        LDI     HIGH (MSGN)
        PHI     RA
        LDI     LOW (MSGN)
        PLO     RA
        LDN     RA
        SHL
        ADI     LOW MSGTAB
        PLO     RA
        LDI     HIGH MSGTAB
        ADCI    0
        PHI     RA
        LDA     RA
        PHI     RC
        LDN     RA
        PLO     RC
        LDI     HIGH (HUDBUF)
        PHI     RD
        LDI     LOW (HUDBUF)
        PLO     RD
        LDI     HIGH (40)
        PHI     RE
        LDI     LOW (40)
        PLO     RE
        LDI     20H
        SEP     R4
        WORD    FILL
        LDI     HIGH (HUDBUF+8)
        PHI     RD
        LDI     LOW (HUDBUF+8)
        PLO     RD
HBM     LDA     RC
        LBZ     HBMX
        ORI     80H
        STR     RD
        INC     RD
        LBR     HBM
HBMX    SEP     R5
HB0
        LDI     HIGH (HUDBUF)
        PHI     RD
        LDI     LOW (HUDBUF)
        PLO     RD
        LDI     HIGH (40)
        PHI     RE
        LDI     LOW (40)
        PLO     RE
        LDI     20H
        SEP     R4
        WORD    FILL
        LDI     HIGH (SCORE)
        PHI     RB
        LDI     LOW (SCORE)
        PLO     RB
        LDI     HIGH (HUDBUF)
        PHI     RD
        LDI     LOW (HUDBUF)
        PLO     RD
        LDI     6
        PLO     R9
HB1     LDA     RB
        ADI     0B0H
        STR     RD
        INC     RD
        DEC     R9
        GLO     R9
        LBNZ    HB1
        LDI     HIGH (TXFUEL)
        PHI     RC
        LDI     LOW (TXFUEL)
        PLO     RC
        LDI     HIGH (HUDBUF+8)
        PHI     RD
        LDI     LOW (HUDBUF+8)
        PLO     RD
HB2     LDA     RC
        LBZ     HB3
        STR     RD
        INC     RD
        LBR     HB2
HB3
        LDI     HIGH (FUEL)
        PHI     RA
        LDI     LOW (FUEL)
        PLO     RA
        LDN     RA
        PLO     R9
        LDI     HIGH (HUDBUF+13)
        PHI     RD
        LDI     LOW (HUDBUF+13)
        PLO     RD
        LDI     10
        PLO     RB
HB4     GLO     R9
        SMI     6
        LBNF    HB5
        PLO     R9
        LDI     246
        STR     RD
        INC     RD
        DEC     RB
        GLO     RB
        LBNZ    HB4
        LBR     HB7
HB5     GLO     R9
        LBZ     HB7
        ADI     LOW (BART-1)
        PLO     RC
        LDI     HIGH (BART-1)
        ADCI    0
        PHI     RC
        LDN     RC
        STR     RD
HB7
        LDI     HIGH (TXALT)
        PHI     RC
        LDI     LOW (TXALT)
        PLO     RC
        LDI     HIGH (HUDBUF+24)
        PHI     RD
        LDI     LOW (HUDBUF+24)
        PLO     RD
HB8     LDA     RC
        LBZ     HB9
        STR     RD
        INC     RD
        LBR     HB8
HB9
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDN     RA
        ADI     1
        PLO     R9
        LDI     HIGH (HUDBUF+28)
        PHI     RD
        LDI     LOW (HUDBUF+28)
        PLO     RD
        LDI     6
        PLO     RB
HB10    GLO     R9
        LBZ     HB11
        DEC     R9
        LDI     247
        LBR     HB12
HB11    LDI     120
HB12    STR     RD
        INC     RD
        DEC     RB
        GLO     RB
        LBNZ    HB10
        LDI     HIGH (LIVES)
        PHI     RA
        LDI     LOW (LIVES)
        PLO     RA
        LDN     RA
        SMI     1
        LBZ     HBX
        PLO     R9
        LDI     HIGH (HUDBUF+35)
        PHI     RD
        LDI     LOW (HUDBUF+35)
        PLO     RD
HB13
        LDI     249
        STR     RD
        INC     RD
        DEC     R9
        GLO     R9
        LBZ     HBX
        GLO     RD
        XRI     LOW (HUDBUF+40)
        LBNZ    HB13
HBX     SEP     R5
HUDQ
        SEP     R4
        WORD    HUDBLD
        LDI     HIGH (HUDBUF)
        PHI     RB
        LDI     LOW (HUDBUF)
        PLO     RB
        LDI     0
        PHI     RE
        PLO     RE
HQ1     LDA     RB
        SEP     R1
        INC     RE
        GLO     RE
        ANI     7
        LBNZ    HQ2
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
HQ2     GLO     RE
        XRI     40
        LBNZ    HQ1
        SEP     R5
SHOWMSG
        PLO     R7
        LDI     HIGH (MSGN)
        PHI     RA
        LDI     LOW (MSGN)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (MSGT)
        PHI     RA
        LDI     LOW (MSGT)
        PLO     RA
        LDI     40
        STR     RA
        SEP     R5
SCPREP
        LDI     HIGH (TOPV)
        PHI     RA
        LDI     LOW (TOPV)
        PLO     RA
        LDN     RA
        LBNZ    SC1
        LDI     24
SC1     SMI     1
        PLO     R9
        PLO     R7
        LDI     HIGH (NTOP)
        PHI     RA
        LDI     LOW (NTOP)
        PLO     RA
        GLO     R7
        STR     RA
        GLO     R9
        SHL
        ADI     LOW ROWT2
        PLO     RC
        LDI     HIGH ROWT2
        ADCI    0
        PHI     RC
        LDI     HIGH (NHMA)
        PHI     RA
        LDI     LOW (NHMA)
        PLO     RA
        LDA     RC
        STR     RA
        INC     RA
        LDA     RC
        STR     RA
        DEC     RC
        DEC     RC
        LDI     HIGH (HUDDST)
        PHI     RA
        LDI     LOW (HUDDST)
        PLO     RA
        LDA     RC
        STR     RA
        INC     RA
        LDA     RC
        STR     RA
        LDI     HIGH (ROWDST)
        PHI     RA
        LDI     LOW (ROWDST)
        PLO     RA
        LDA     RC
        STR     RA
        INC     RA
        LDN     RC
        STR     RA
        SEP     R4
        WORD    NEXTROW
        LDI     HIGH (ROWDST)
        PHI     RA
        LDI     LOW (ROWDST)
        PLO     RA
        LDA     RA
        ADI     0A8H
        PHI     RD
        LDN     RA
        PLO     RD
        LDI     HIGH (NEWROW)
        PHI     RC
        LDI     LOW (NEWROW)
        PLO     RC
        LDI     HIGH (40)
        PHI     RE
        LDI     LOW (40)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
        SEP     R4
        WORD    HUDBLD
        SEP     R5
SCROLL
        LDI     HIGH (NTOP)
        PHI     RA
        LDI     LOW (NTOP)
        PLO     RA
        LDN     RA
        PLO     R9
        PLO     R7
        LDI     HIGH (TOPV)
        PHI     RA
        LDI     LOW (TOPV)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (SCRREQ)
        PHI     RA
        LDI     LOW (SCRREQ)
        PLO     RA
        LDI     1
        STR     RA
        LDI     0
        PLO     R8
SC2
        GLO     R8
        ADI     LOW OT
        PLO     RA
        LDI     HIGH OT
        ADCI    0
        PHI     RA
        LDN     RA
        LBZ     SC4
        GLO     R8
        ADI     LOW OPR
        PLO     RA
        LDI     HIGH OPR
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        GLO     R9
        XOR
        LBZ     SC3
        LDN     R2
        ADI     1
        STR     R2
        SMI     24
        LBNZ    SC2B
        STR     R2
SC2B    GLO     R9
        XOR
        LBNZ    SC4
SC3
        GLO     R8
        ADI     LOW OT
        PLO     RA
        LDI     HIGH OT
        ADCI    0
        PHI     RA
        LDI     0
        STR     RA
SC4     INC     R8
        GLO     R8
        XRI     12
        LBNZ    SC2
        LDI     HIGH (SPR+6)
        PHI     RA
        LDI     LOW (SPR+6)
        PLO     RA
SC5     LDA     RA
        LBZ     SC6
        LDN     RA
        ADI     1
        STR     RA
SC6     GLO     RA
        ADI     15
        PLO     RA
        GHI     RA
        ADCI    0
        PHI     RA
        XRI     HIGH SPR
        LBZ     SC5
        LDI     HIGH (SPR+3*16+1)
        PHI     RA
        LDI     LOW (SPR+3*16+1)
        PLO     RA
SC7     LDN     RA
        ADI     1
        STR     RA
        GLO     RA
        ADI     16
        PLO     RA
        GHI     RA
        ADCI    0
        PHI     RA
        XRI     HIGH SPR
        LBZ     SC7
        LDI     HIGH (SHG)
        PHI     RA
        LDI     LOW (SHG)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (HG+0)
        PHI     RA
        LDI     LOW (HG+0)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (HG+1)
        PHI     RA
        LDI     LOW (HG+1)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (HG+2)
        PHI     RA
        LDI     LOW (HG+2)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (HG+3)
        PHI     RA
        LDI     LOW (HG+3)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (PG+0)
        PHI     RA
        LDI     LOW (PG+0)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (PG+1)
        PHI     RA
        LDI     LOW (PG+1)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (PG+2)
        PHI     RA
        LDI     LOW (PG+2)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (PG+3)
        PHI     RA
        LDI     LOW (PG+3)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (MG+0)
        PHI     RA
        LDI     LOW (MG+0)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (MG+1)
        PHI     RA
        LDI     LOW (MG+1)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        SEP     R5
NEXTROW
        LDI     HIGH (LPOS)
        PHI     RA
        LDI     LOW (LPOS)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        GLO     RB
        ADI     LOW SEQ
        PLO     RC
        GHI     RB
        ADCI    HIGH SEQ
        PHI     RC
        LDN     RC
        XRI     0FFH
        LBNZ    NR1
        LDI     HIGH (BOSSREQ)
        PHI     RA
        LDI     LOW (BOSSREQ)
        PLO     RA
        LDI     1
        STR     RA
        LDI     6
        LBR     NR2
NR1     LDN     RC
NR2     SHL
        ADI     LOW RPTR
        PLO     RC
        LDI     HIGH RPTR
        ADCI    0
        PHI     RC
        LDA     RC
        PHI     RA
        LDN     RC
        PLO     RC
        GHI     RA
        PHI     RC
        LDI     HIGH (NEWROW)
        PHI     RD
        LDI     LOW (NEWROW)
        PLO     RD
        LDI     HIGH (40)
        PHI     RE
        LDI     LOW (40)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
        LDI     0
        PLO     RB
NR3     GLO     RB
        SHL
        ADI     LOW PEND
        PLO     RA
        LDI     HIGH PEND
        PHI     RA
        LDN     RA
        LBZ     NR5
        PLO     R9
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        PHI     R9
        GLO     R9
        SHL
        SHL
        ADI     LOW OBJCH
        PLO     RC
        LDI     HIGH OBJCH
        ADCI    0
        PHI     RC
        GHI     R9
        ADI     LOW NEWROW
        PLO     RD
        LDI     HIGH NEWROW
        PHI     RD
        LDA     RC
        STR     RD
        INC     RD
        LDN     RC
        STR     RD
        LDI     0
        PLO     R8
NR4
        GLO     R8
        ADI     LOW OT
        PLO     RA
        LDI     HIGH OT
        ADCI    0
        PHI     RA
        LDN     RA
        LBZ     NR4B
        INC     R8
        GLO     R8
        XRI     12
        LBNZ    NR4
        LBR     NR5
NR4B    GLO     R9
        STR     RA
        GLO     R8
        ADI     LOW OC
        PLO     RA
        LDI     HIGH OC
        ADCI    0
        PHI     RA
        GHI     R9
        STR     RA
        LDI     HIGH (NTOP)
        PHI     RA
        LDI     LOW (NTOP)
        PLO     RA
        LDN     RA
        ADI     1
        PLO     R7
        SMI     24
        LBNZ    NR4C
        PLO     R7
NR4C
        GLO     R8
        ADI     LOW OPR
        PLO     RA
        LDI     HIGH OPR
        ADCI    0
        PHI     RA
        GLO     R7
        STR     RA
NR5     INC     RB
        GLO     RB
        XRI     4
        LBNZ    NR3
NR6
        LDI     HIGH (OPTR)
        PHI     RA
        LDI     LOW (OPTR)
        PLO     RA
        LDA     RA
        PHI     RC
        LDN     RA
        PLO     RC
        LDI     HIGH (LPOS)
        PHI     RA
        LDI     LOW (LPOS)
        PLO     RA
        LDA     RA
        STR     R2
        LDA     RC
        XOR
        LBNZ    NR8
        LDN     RA
        STR     R2
        LDA     RC
        XOR
        LBNZ    NR8
        LDN     RC
        ANI     3FH
        PHI     R9
        LDN     RC
        SHR
        SHR
        SHR
        SHR
        SHR
        SHR
        PLO     R9
        INC     RC
        LDI     HIGH (OPTR)
        PHI     RA
        LDI     LOW (OPTR)
        PLO     RA
        GHI     RC
        STR     RA
        INC     RA
        GLO     RC
        STR     RA
        GLO     R9
        SHL
        SHL
        ADI     LOW (OBJCH+2)
        PLO     RC
        LDI     HIGH (OBJCH+2)
        ADCI    0
        PHI     RC
        GHI     R9
        ADI     LOW NEWROW
        PLO     RD
        LDI     HIGH NEWROW
        PHI     RD
        LDA     RC
        STR     RD
        INC     RD
        LDN     RC
        STR     RD
        LDI     0
        PLO     RB
NR7     GLO     RB
        SHL
        ADI     LOW PEND
        PLO     RA
        LDI     HIGH PEND
        PHI     RA
        LDN     RA
        LBZ     NR7B
        INC     RB
        GLO     RB
        XRI     4
        LBNZ    NR7
        LBR     NR6
NR7B    GLO     R9
        STR     RA
        INC     RA
        GHI     R9
        STR     RA
        LBR     NR6
NR8
NR9
        LDI     HIGH (EPTR)
        PHI     RA
        LDI     LOW (EPTR)
        PLO     RA
        LDA     RA
        PHI     RC
        LDN     RA
        PLO     RC
        LDI     HIGH (LPOS)
        PHI     RA
        LDI     LOW (LPOS)
        PLO     RA
        LDA     RA
        STR     R2
        LDA     RC
        XOR
        LBNZ    NRX
        LDN     RA
        STR     R2
        LDA     RC
        XOR
        LBNZ    NRX
        LDA     RC
        PLO     R9
        LDI     HIGH (EPTR)
        PHI     RA
        LDI     LOW (EPTR)
        PLO     RA
        GHI     RC
        STR     RA
        INC     RA
        GLO     RC
        STR     RA
        GLO     R9
        ANI     0F0H
        LBZ     NR10
        GLO     R9
        ANI     0FH
        PLO     R7
        LDI     HIGH (PWAVE)
        PHI     RA
        LDI     LOW (PWAVE)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (PWT)
        PHI     RA
        LDI     LOW (PWT)
        PLO     RA
        LDI     1
        STR     RA
        LBR     NR9
NR10    GLO     R9
        PLO     R7
        LDI     HIGH (SECT)
        PHI     RA
        LDI     LOW (SECT)
        PLO     RA
        GLO     R7
        STR     RA
        GLO     R9
        SMI     1
        SEP     R4
        WORD    SHOWMSG
        LBR     NR9
NRX
        LDI     HIGH (BOSSREQ)
        PHI     RA
        LDI     LOW (BOSSREQ)
        PLO     RA
        LDN     RA
        LBNZ    NRXX
        LDI     HIGH (LPOS+1)
        PHI     RA
        LDI     LOW (LPOS+1)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        DEC     RA
        LDN     RA
        ADCI    0
        STR     RA
NRXX    SEP     R5
LVRESET
        LDI     HIGH (LPOS)
        PHI     RA
        LDI     LOW (LPOS)
        PLO     RA
        LDI     0
        STR     RA
        INC     RA
        STR     RA
        LDI     HIGH (OPTR)
        PHI     RA
        LDI     LOW (OPTR)
        PLO     RA
        LDI     HIGH OBJT
        STR     RA
        INC     RA
        LDI     LOW OBJT
        STR     RA
        LDI     HIGH (EPTR)
        PHI     RA
        LDI     LOW (EPTR)
        PLO     RA
        LDI     HIGH EVTT
        STR     RA
        INC     RA
        LDI     LOW EVTT
        STR     RA
        LDI     HIGH (PEND)
        PHI     RD
        LDI     LOW (PEND)
        PLO     RD
        LDI     HIGH (8)
        PHI     RE
        LDI     LOW (8)
        PLO     RE
        LDI     0
        SEP     R4
        WORD    FILL
        LDI     HIGH (BOSSREQ)
        PHI     RA
        LDI     LOW (BOSSREQ)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (PWAVE)
        PHI     RA
        LDI     LOW (PWAVE)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R5
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
; PLAYER - keys, movement, ship + shadow, terrain collision
PLAYER  BN3     PL1
        SEX     R2
        INP     3
        PLO     R9
        SMI     61H
        LBNF    PL0
        GLO     R9
        SMI     7BH
        LBDF    PL0
        GLO     R9
        SMI     20H
        PLO     R9
PL0     GLO     R9
        SMI     82H
        LBNF    PL0N
        SMI     4
        LBDF    PL0N
        GLO     R9
        PLO     R7
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (KCNT)
        PHI     RA
        LDI     LOW (KCNT)
        PLO     RA
        LDI     1
        STR     RA
        LBR     PL1
PL0N    GLO     R9
        XRI     K_ESC
        LBNZ    PL0A
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     2
        STR     RA
        SEP     R5
PL0A    GLO     R9
        XRI     'A'
        LBNZ    PL0B
        LDI     HIGH (AUTO)
        PHI     RA
        LDI     LOW (AUTO)
        PLO     RA
        LDN     RA
        XRI     1
        STR     RA
        LBR     PL1
PL0B
        SEP     R4
        WORD    FIRE
PL1
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        LBZ     PL5
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        B2      PL2
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDI     0
        STR     RA
        LBR     PL5
PL2
        LDI     HIGH (KCNT)
        PHI     RA
        LDI     LOW (KCNT)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    PL5
        LDI     HIGH (KCNT)
        PHI     RA
        LDI     LOW (KCNT)
        PLO     RA
        LDI     2
        STR     RA
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        PLO     R9
        XRI     K_LEFT
        LBNZ    PL3
        LDI     HIGH (PX)
        PHI     RA
        LDI     LOW (PX)
        PLO     RA
        LDN     RA
        SMI     3
        LBNF    PL5
        ADI     2
        STR     RA
        LBR     PL5
PL3     GLO     R9
        XRI     K_RIGHT
        LBNZ    PL4
        LDI     HIGH (PX)
        PHI     RA
        LDI     LOW (PX)
        PLO     RA
        LDN     RA
        SMI     36
        LBDF    PL5
        ADI     37
        STR     RA
        LBR     PL5
PL4     GLO     R9
        XRI     K_UP
        LBNZ    PL4A
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDN     RA
        SMI     5
        LBDF    PL5
        ADI     6
        STR     RA
        LBR     PL5
PL4A
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDN     RA
        LBZ     PL5
        SMI     1
        STR     RA
PL5
        LDI     HIGH (AUTO)
        PHI     RA
        LDI     LOW (AUTO)
        PLO     RA
        LDN     RA
        LBZ     PL6
        LDI     HIGH (SHON)
        PHI     RA
        LDI     LOW (SHON)
        PLO     RA
        LDN     RA
        LBNZ    PL6
        SEP     R4
        WORD    FIRE
PL6
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDN     RA
        SHL
        SDI     18
        PHI     RE
        LDI     HIGH (PX)
        PHI     RA
        LDI     LOW (PX)
        PLO     RA
        LDN     RA
        PLO     RE
        LDI     150
        PLO     R9
        LDI     151
        PHI     R9
        LDI     0
        PLO     R8
        SEP     R4
        WORD    SPSET
        GHI     RE
        ADI     1
        PHI     RE
        LDI     152
        PLO     R9
        LDI     153
        PHI     R9
        LDI     1
        PLO     R8
        SEP     R4
        WORD    SPSET
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
        LDI     20
        PHI     RE
        LDI     26
        PLO     R9
        LDI     27
        PHI     R9
        LDI     2
        PLO     R8
        SEP     R4
        WORD    SPSET
        LDI     HIGH (INV)
        PHI     RA
        LDI     LOW (INV)
        PLO     RA
        LDN     RA
        LBZ     PL7
        SMI     1
        STR     RA
        SEP     R5
PL7
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
        LDI     HIGH (PX)
        PHI     RA
        LDI     LOW (PX)
        PLO     RA
        LDN     RA
        PLO     RE
        LDI     20
        PHI     RE
        SEP     R4
        WORD    BGAT
        PLO     R7
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDN     RA
        PLO     R9
        GLO     R7
        SEP     R4
        WORD    BLOCKED
        LBNZ    PLK
        INC     RE
        SEP     R4
        WORD    BGAT
        PLO     R7
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDN     RA
        PLO     R9
        GLO     R7
        SEP     R4
        WORD    BLOCKED
        LBZ     PLX
PLK
        SEP     R4
        WORD    KILLP
PLX     SEP     R5
FIRE
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    FIX
        LDI     HIGH (SHON)
        PHI     RA
        LDI     LOW (SHON)
        PLO     RA
        LDN     RA
        LBNZ    FIX
        LDI     HIGH (SHON)
        PHI     RA
        LDI     LOW (SHON)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (SHG)
        PHI     RA
        LDI     LOW (SHG)
        PLO     RA
        LDI     20
        STR     RA
        LDI     HIGH (PX)
        PHI     RA
        LDI     LOW (PX)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (SHX)
        PHI     RA
        LDI     LOW (SHX)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (SHA)
        PHI     RA
        LDI     LOW (SHA)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     3
        STR     RA
        LDI     HIGH (0A3FH)
        PHI     RC
        LDI     LOW (0A3FH)
        PLO     RC
        LDI     6
        SEP     R4
        WORD    SOUND
FIX     SEP     R5
SHOTS
        LDI     HIGH (SHON)
        PHI     RA
        LDI     LOW (SHON)
        PLO     RA
        LDN     RA
        LBZ     SHH
        LDI     2
        PLO     RB
SH1
        LDI     HIGH (SHG)
        PHI     RA
        LDI     LOW (SHG)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LDI     HIGH (BOSS)
        PHI     RA
        LDI     LOW (BOSS)
        PLO     RA
        LDN     RA
        LBZ     SH1B
        SEP     R4
        WORD    BOSSHIT
        LBNZ    SHK
SH1B
        LDI     HIGH (SHG)
        PHI     RA
        LDI     LOW (SHG)
        PLO     RA
        LDN     RA
        PHI     RE
        LDI     HIGH (SHX)
        PHI     RA
        LDI     LOW (SHX)
        PLO     RA
        LDN     RA
        PLO     RE
        LDI     HIGH (SHA)
        PHI     RA
        LDI     LOW (SHA)
        PLO     RA
        LDN     RA
        SHL
        STR     R2
        GHI     RE
        SMI     1
        SM
        LBNF    SHK
        LBZ     SHK
SH2
        LDI     HIGH (SECT)
        PHI     RA
        LDI     LOW (SECT)
        PLO     RA
        LDN     RA
        XRI     2
        LBNZ    SH3
        SEP     R4
        WORD    PLNHIT
        LBNZ    SHK
SH3
        LDI     HIGH (SHA)
        PHI     RA
        LDI     LOW (SHA)
        PLO     RA
        LDN     RA
        SMI     2
        LBDF    SH4
        SEP     R4
        WORD    OBJHIT
        LBNZ    SHK
SH4
        LDI     HIGH (SHG)
        PHI     RA
        LDI     LOW (SHG)
        PLO     RA
        LDN     RA
        PHI     RE
        LDI     HIGH (SHX)
        PHI     RA
        LDI     LOW (SHX)
        PLO     RA
        LDN     RA
        PLO     RE
        SEP     R4
        WORD    BGAT
        PLO     R7
        LDI     HIGH (SHA)
        PHI     RA
        LDI     LOW (SHA)
        PLO     RA
        LDN     RA
        PLO     R9
        GLO     R7
        SEP     R4
        WORD    BLOCKED
        LBNZ    SHK
        LDI     HIGH (SHG)
        PHI     RA
        LDI     LOW (SHG)
        PLO     RA
        LDN     RA
        PHI     RE
        LDI     HIGH (SHX)
        PHI     RA
        LDI     LOW (SHX)
        PLO     RA
        LDN     RA
        PLO     RE
        INC     RE
        SEP     R4
        WORD    BGAT
        PLO     R7
        LDI     HIGH (SHA)
        PHI     RA
        LDI     LOW (SHA)
        PLO     RA
        LDN     RA
        PLO     R9
        GLO     R7
        SEP     R4
        WORD    BLOCKED
        LBNZ    SHK
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
        DEC     RB
        GLO     RB
        LBNZ    SH1
        LBR     SHD
SHK
        LDI     HIGH (SHON)
        PHI     RA
        LDI     LOW (SHON)
        PLO     RA
        LDI     0
        STR     RA
SHH
        LDI     HIGH (SPR+48)
        PHI     RA
        LDI     LOW (SPR+48)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R5
SHD
        LDI     HIGH (SHA)
        PHI     RA
        LDI     LOW (SHA)
        PLO     RA
        LDN     RA
        SHL
        STR     R2
        LDI     HIGH (SHG)
        PHI     RA
        LDI     LOW (SHG)
        PLO     RA
        LDN     RA
        SMI     1
        SM
        PHI     RE
        LDI     HIGH (SHX)
        PHI     RA
        LDI     LOW (SHX)
        PLO     RA
        LDN     RA
        PLO     RE
        LDI     156
        PLO     R9
        LDI     157
        PHI     R9
        LDI     3
        PLO     R8
        SEP     R4
        WORD    SPSET
        SEP     R5
OBJHIT  LDI     0
        PLO     R8
OH1
        GLO     R8
        ADI     LOW OT
        PLO     RA
        LDI     HIGH OT
        ADCI    0
        PHI     RA
        LDN     RA
        LBZ     OHN
        SEP     R4
        WORD    OROW
        STR     R2
        LDI     HIGH (SHG)
        PHI     RA
        LDI     LOW (SHG)
        PLO     RA
        LDN     RA
        SM
        SMI     2
        LBDF    OHN
        GLO     R8
        ADI     LOW OC
        PLO     RA
        LDI     HIGH OC
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        LDI     HIGH (SHX)
        PHI     RA
        LDI     LOW (SHX)
        PLO     RA
        LDN     RA
        ADI     1
        SM
        LBNF    OHN
        SMI     3
        LBDF    OHN
        SEP     R4
        WORD    OKILL
        LDI     1
        SEP     R5
OHN     INC     R8
        GLO     R8
        XRI     12
        LBNZ    OH1
        LDI     0
        SEP     R5
OROW
        LDI     HIGH (TOPV)
        PHI     RA
        LDI     LOW (TOPV)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     R8
        ADI     LOW OPR
        PLO     RA
        LDI     HIGH OPR
        ADCI    0
        PHI     RA
        LDN     RA
        SM
        LBDF    ORX
        ADI     24
ORX     SEP     R5
OKILL
        SEP     R4
        WORD    OROW
        PHI     RE
        GLO     R8
        ADI     LOW OC
        PLO     RA
        LDI     HIGH OC
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     RE
        GLO     R8
        ADI     LOW OT
        PLO     RA
        LDI     HIGH OT
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     R9
        LDI     0
        STR     RA
        GLO     R9
        STXD
        GHI     RE
        STXD
        GLO     RE
        STXD
        GHI     RE
        LBZ     OKS0
        SMI     23
        LBDF    OKS0
        SEP     R4
        WORD    BGAT
        LDI     1
        STR     RD
        SEP     R1
OKS0
        INC     RE
        GHI     RE
        LBZ     OKS1
        SMI     23
        LBDF    OKS1
        SEP     R4
        WORD    BGAT
        LDI     135
        STR     RD
        SEP     R1
OKS1
        GHI     RE
        ADI     1
        PHI     RE
        DEC     RE
        GHI     RE
        LBZ     OKS2
        SMI     23
        LBDF    OKS2
        SEP     R4
        WORD    BGAT
        LDI     135
        STR     RD
        SEP     R1
OKS2
        INC     RE
        GHI     RE
        LBZ     OKS3
        SMI     23
        LBDF    OKS3
        SEP     R4
        WORD    BGAT
        LDI     1
        STR     RD
        SEP     R1
OKS3
        IRX
        LDXA
        PLO     RE
        LDXA
        PHI     RE
        LDX
        PLO     R9
        LDI     1
        PHI     R9
        SEP     R4
        WORD    EFFECT
        LDI     HIGH (2F88H)
        PHI     RC
        LDI     LOW (2F88H)
        PLO     RC
        LDI     12
        SEP     R4
        WORD    NOISE
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     4
        STR     RA
        LDI     HIGH (301FH)
        PHI     RC
        LDI     LOW (301FH)
        PLO     RC
        LDI     10
        SEP     R4
        WORD    SOUND
        GLO     R9
        XRI     2
        LBNZ    OK2
        LDI     HIGH (FUEL)
        PHI     RA
        LDI     LOW (FUEL)
        PLO     RA
        LDN     RA
        ADI     20
        STR     RA
        SMI     61
        LBNF    OK1
        LDI     60
        STR     RA
OK1
        LDI     HIGH (SCORE+3)
        PHI     RB
        LDI     LOW (SCORE+3)
        PLO     RB
        LDI     3
        SEP     R4
        WORD    ADDSC
        SEP     R5
OK2     GLO     R9
        XRI     1
        LBNZ    OK3
        LDI     HIGH (SCORE+3)
        PHI     RB
        LDI     LOW (SCORE+3)
        PLO     RB
        LDI     2
        SEP     R4
        WORD    ADDSC
        SEP     R5
OK3
        LDI     HIGH (SCORE+2)
        PHI     RB
        LDI     LOW (SCORE+2)
        PLO     RB
        LDI     1
        SEP     R4
        WORD    ADDSC
        SEP     R5
; SHELLS - turrets fire shells that roll down toward the player
SHELLS
        LDI     HIGH (SECT)
        PHI     RA
        LDI     LOW (SECT)
        PLO     RA
        LDN     RA
        XRI     2
        LBZ     SL0
        LDI     HIGH (TFT)
        PHI     RA
        LDI     LOW (TFT)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    SL0
        LDI     HIGH (LOOP)
        PHI     RA
        LDI     LOW (LOOP)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SDI     22
        LBDF    SLT
        LDI     8
SLT
        PLO     R7
        LDI     HIGH (TFT)
        PHI     RA
        LDI     LOW (TFT)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    RAND
        ANI     15
        PLO     R8
        SMI     12
        LBDF    SL0
        GLO     R8
        ADI     LOW OT
        PLO     RA
        LDI     HIGH OT
        ADCI    0
        PHI     RA
        LDN     RA
        XRI     1
        LBNZ    SL0
        SEP     R4
        WORD    OROW
        PLO     R9
        SMI     2
        LBNF    SL0
        SMI     13
        LBDF    SL0
        GLO     R8
        ADI     LOW OC
        PLO     RA
        LDI     HIGH OC
        ADCI    0
        PHI     RA
        LDN     RA
        PHI     R9
        LDI     0
        PLO     RB
SLF     GLO     RB
        ADI     LOW HON
        PLO     RA
        LDI     HIGH HON
        PHI     RA
        LDN     RA
        LBZ     SLF2
        INC     RB
        GLO     RB
        XRI     4
        LBNZ    SLF
        LBR     SL0
SLF2    LDI     1
        STR     RA
        GLO     RB
        ADI     LOW HG
        PLO     RA
        GLO     R9
        ADI     2
        STR     RA
        SEP     R4
        WORD    RAND
        ANI     1
        STR     R2
        GHI     R9
        ADD
        PLO     RC
        GLO     RB
        ADI     LOW HC
        PLO     RA
        LDI     HIGH HC
        PHI     RA
        GLO     RC
        STR     RA
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (2C1FH)
        PHI     RC
        LDI     LOW (2C1FH)
        PLO     RC
        LDI     4
        SEP     R4
        WORD    SOUND
SL0     LDI     0
        PLO     RB
SL1     GLO     RB
        ADI     LOW HON
        PLO     RA
        LDI     HIGH HON
        PHI     RA
        LDN     RA
        LBZ     SLN
        GLO     RB
        ADI     LOW HG
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        PHI     RE
        SMI     23
        LBDF    SLK
        GLO     RB
        ADI     LOW HC
        PLO     RA
        LDN     RA
        PLO     RE
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    SLD
        LDI     HIGH (INV)
        PHI     RA
        LDI     LOW (INV)
        PLO     RA
        LDN     RA
        LBNZ    SLD
        GHI     RE
        SMI     19
        SMI     2
        LBDF    SLD
        LDI     HIGH (PX)
        PHI     RA
        LDI     LOW (PX)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        SM
        SMI     2
        LBDF    SLD
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDN     RA
        SMI     3
        LBDF    SLD
        SEP     R4
        WORD    KILLP
        LBR     SLK
SLD     GLO     RB
        ADI     4
        PLO     R8
        LDI     158
        PLO     R9
        LDI     0
        PHI     R9
        SEP     R4
        WORD    SPSET
        LBR     SLN
SLK     GLO     RB
        ADI     LOW HON
        PLO     RA
        LDI     HIGH HON
        PHI     RA
        LDI     0
        STR     RA
        GLO     RB
        ADI     4
        PLO     R8
        GLO     R8
        SHL
        SHL
        SHL
        SHL
        ADI     0
        PLO     RA
        LDI     HIGH SPR
        PHI     RA
        LDI     0
        STR     RA
SLN     INC     RB
        GLO     RB
        XRI     4
        LBNZ    SL1
        SEP     R5
; PLANES - enemy fighters come at the player at their own altitude
PLANES
        LDI     HIGH (PWAVE)
        PHI     RA
        LDI     LOW (PWAVE)
        PLO     RA
        LDN     RA
        LBZ     PN0
        LDI     HIGH (PWT)
        PHI     RA
        LDI     LOW (PWT)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    PN0
        LDI     HIGH (PWT)
        PHI     RA
        LDI     LOW (PWT)
        PLO     RA
        LDI     8
        STR     RA
        LDI     0
        PLO     RB
PNF     GLO     RB
        ADI     LOW PON
        PLO     RA
        LDI     HIGH PON
        PHI     RA
        LDN     RA
        LBZ     PNF2
        INC     RB
        GLO     RB
        XRI     4
        LBNZ    PNF
        LBR     PN0
PNF2    LDI     1
        STR     RA
        LDI     HIGH (PWAVE)
        PHI     RA
        LDI     LOW (PWAVE)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        SEP     R4
        WORD    RAND
        ANI     3
        ADI     1
        PLO     R9
        GLO     RB
        ADI     LOW PAL
        PLO     RA
        LDI     HIGH PAL
        PHI     RA
        GLO     R9
        STR     RA
        GLO     RB
        ADI     LOW PG
        PLO     RA
        GLO     R9
        SHL
        ADI     2
        STR     RA
        SEP     R4
        WORD    RAND
        ANI     31
        ADI     4
        PLO     R9
        GLO     RB
        ADI     LOW PC_
        PLO     RA
        LDI     HIGH PC_
        PHI     RA
        GLO     R9
        STR     RA
PN0     LDI     0
        PLO     RB
PN1     GLO     RB
        ADI     LOW PON
        PLO     RA
        LDI     HIGH PON
        PHI     RA
        LDN     RA
        LBZ     PNN
        LDI     HIGH (FRM+1)
        PHI     RA
        LDI     LOW (FRM+1)
        PLO     RA
        LDN     RA
        ANI     1
        LBZ     PN3
        GLO     RB
        ADI     LOW PG
        PLO     RA
        LDI     HIGH PG
        PHI     RA
        LDN     RA
        ADI     1
        STR     RA
        SMI     23
        LBDF    PNK
PN3
        LDI     HIGH (FRM+1)
        PHI     RA
        LDI     LOW (FRM+1)
        PLO     RA
        LDN     RA
        ANI     3
        LBNZ    PN5
        LDI     HIGH (PX)
        PHI     RA
        LDI     LOW (PX)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RB
        ADI     LOW PC_
        PLO     RA
        LDI     HIGH PC_
        PHI     RA
        LDN     RA
        SM
        LBZ     PN5
        LBNF    PN4
        LDN     RA
        SMI     1
        STR     RA
        LBR     PN5
PN4     LDN     RA
        ADI     1
        STR     RA
PN5
        LDI     HIGH (FRM+1)
        PHI     RA
        LDI     LOW (FRM+1)
        PLO     RA
        LDN     RA
        ANI     15
        LBNZ    PN7
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RB
        ADI     LOW PAL
        PLO     RA
        LDI     HIGH PAL
        PHI     RA
        LDN     RA
        SM
        LBZ     PN7
        LBNF    PN6
        LDN     RA
        SMI     1
        STR     RA
        LBR     PN7
PN6     LDN     RA
        ADI     1
        STR     RA
PN7
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    PN8
        LDI     HIGH (INV)
        PHI     RA
        LDI     LOW (INV)
        PLO     RA
        LDN     RA
        LBNZ    PN8
        SEP     R4
        WORD    PLGET
        GHI     RE
        SMI     19
        SMI     2
        LBDF    PN8
        LDI     HIGH (PX)
        PHI     RA
        LDI     LOW (PX)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        SM
        ADI     1
        SMI     3
        LBDF    PN8
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     R9
        SM
        ADI     1
        SMI     3
        LBDF    PN8
        SEP     R4
        WORD    KILLP
        LBR     PNK
PN8
        SEP     R4
        WORD    PLGET
        GLO     R9
        SHL
        STR     R2
        GHI     RE
        SMI     1
        SM
        PHI     RE
        GLO     RB
        ADI     8
        PLO     R8
        LDI     219
        PLO     R9
        LDI     220
        PHI     R9
        SEP     R4
        WORD    SPSET
        LBR     PNN
PNK     GLO     RB
        ADI     LOW PON
        PLO     RA
        LDI     HIGH PON
        PHI     RA
        LDI     0
        STR     RA
        GLO     RB
        ADI     8
        PLO     R8
        GLO     R8
        SHL
        SHL
        SHL
        SHL
        ADI     0
        PLO     RA
        LDI     HIGH SPR
        PHI     RA
        LDI     0
        STR     RA
PNN
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
        INC     RB
        GLO     RB
        XRI     4
        LBNZ    PN1
        SEP     R5
PLGET   GLO     RB
        ADI     LOW PG
        PLO     RA
        LDI     HIGH PG
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     RB
        ADI     LOW PC_
        PLO     RA
        LDN     RA
        PLO     RE
        GLO     RB
        ADI     LOW PAL
        PLO     RA
        LDN     RA
        PLO     R9
        SEP     R5
PLNHIT  GLO     RB
        STXD
        LDI     0
        PLO     RB
PH1     GLO     RB
        ADI     LOW PON
        PLO     RA
        LDI     HIGH PON
        PHI     RA
        LDN     RA
        LBZ     PHN
        SEP     R4
        WORD    PLGET
        LDI     HIGH (SHG)
        PHI     RA
        LDI     LOW (SHG)
        PLO     RA
        LDN     RA
        STR     R2
        GHI     RE
        SM
        ADI     1
        SMI     3
        LBDF    PHN
        LDI     HIGH (SHX)
        PHI     RA
        LDI     LOW (SHX)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        SM
        ADI     1
        SMI     3
        LBDF    PHN
        LDI     HIGH (SHA)
        PHI     RA
        LDI     LOW (SHA)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     R9
        SM
        ADI     1
        SMI     3
        LBDF    PHN
        GLO     R9
        SHL
        STR     R2
        GHI     RE
        SMI     1
        SM
        PHI     RE
        LDI     1
        PHI     R9
        SEP     R4
        WORD    EFFECT
        LDI     HIGH (2F88H)
        PHI     RC
        LDI     LOW (2F88H)
        PLO     RC
        LDI     10
        SEP     R4
        WORD    NOISE
        LDI     HIGH (SCORE+3)
        PHI     RB
        LDI     LOW (SCORE+3)
        PLO     RB
        LDI     1
        SEP     R4
        WORD    ADDSC
        LDI     HIGH (SCORE+4)
        PHI     RB
        LDI     LOW (SCORE+4)
        PLO     RB
        LDI     5
        SEP     R4
        WORD    ADDSC
        GLO     RB
        ADI     LOW PON
        PLO     RA
        LDI     HIGH PON
        PHI     RA
        LDI     0
        STR     RA
        GLO     RB
        ADI     8
        PLO     R8
        GLO     R8
        SHL
        SHL
        SHL
        SHL
        ADI     0
        PLO     RA
        LDI     HIGH SPR
        PHI     RA
        LDI     0
        STR     RA
        IRX
        LDX
        PLO     RB
        LDI     1
        SEP     R5
PHN     INC     RB
        GLO     RB
        XRI     4
        LBNZ    PH1
        IRX
        LDX
        PLO     RB
        LDI     0
        SEP     R5
; BOSSDRAW - erase what the guardian leaves uncovered at BOX and draw it at BX
BOSSDRAW
        LDI     HIGH (BON)
        PHI     RA
        LDI     LOW (BON)
        PLO     RA
        LDN     RA
        LBZ     BD2
        LDI     HIGH (BHP)
        PHI     RA
        LDI     LOW (BHP)
        PLO     RA
        LDN     RA
        LBZ     BDF
        LDI     HIGH (BOX)
        PHI     RA
        LDI     LOW (BOX)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (BX)
        PHI     RA
        LDI     LOW (BX)
        PLO     RA
        LDN     RA
        SM
        XRI     1
        LBNZ    BDL
        LDI     HIGH (BOX)
        PHI     RA
        LDI     LOW (BOX)
        PLO     RA
        LDN     RA
        LBR     BDC
BDL
        LDI     HIGH (BOX)
        PHI     RA
        LDI     LOW (BOX)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (BX)
        PHI     RA
        LDI     LOW (BX)
        PLO     RA
        LDN     RA
        SD
        XRI     1
        LBNZ    BDF
        LDI     HIGH (BOX)
        PHI     RA
        LDI     LOW (BOX)
        PLO     RA
        LDN     RA
        ADI     5
BDC     PLO     RE
        LDI     2
        PHI     RE
BDC1    LDI     0
        SEP     R1
        GHI     RE
        ADI     1
        PHI     RE
        SMI     5
        LBNZ    BDC1
        LBR     BD2
BDF
        LDI     HIGH (BOX)
        PHI     RA
        LDI     LOW (BOX)
        PLO     RA
        LDN     RA
        PLO     RB
        LDI     2
        PHI     RE
BD1     GLO     RB
        PLO     RE
        LDI     6
        PLO     R9
BD1A    LDI     0
        SEP     R1
        INC     RE
        DEC     R9
        GLO     R9
        LBNZ    BD1A
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
        GHI     RE
        ADI     1
        PHI     RE
        SMI     5
        LBNZ    BD1
BD2
        LDI     HIGH (BHP)
        PHI     RA
        LDI     LOW (BHP)
        PLO     RA
        LDN     RA
        LBZ     BDX
        LDI     HIGH (BX)
        PHI     RA
        LDI     LOW (BX)
        PLO     RA
        LDN     RA
        PLO     RB
        PLO     R7
        LDI     HIGH (BOX)
        PHI     RA
        LDI     LOW (BOX)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BON)
        PHI     RA
        LDI     LOW (BON)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (GUCH)
        PHI     RF
        LDI     LOW (GUCH)
        PLO     RF
        LDI     HIGH (BFLASH)
        PHI     RA
        LDI     LOW (BFLASH)
        PLO     RA
        LDN     RA
        LBZ     BD2A
        LDI     HIGH (GUCH2)
        PHI     RF
        LDI     LOW (GUCH2)
        PLO     RF
BD2A    LDI     2
        PHI     RE
BD3     GLO     RB
        PLO     RE
        LDI     6
        PLO     R9
BD3A    LDA     RF
        SEP     R1
        INC     RE
        DEC     R9
        GLO     R9
        LBNZ    BD3A
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
        GHI     RE
        ADI     1
        PHI     RE
        SMI     5
        LBNZ    BD3
BDX     SEP     R5
BOSSGO
        LDI     HIGH (BOSS)
        PHI     RA
        LDI     LOW (BOSS)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (BHP)
        PHI     RA
        LDI     LOW (BHP)
        PLO     RA
        LDI     6
        STR     RA
        LDI     HIGH (BX)
        PHI     RA
        LDI     LOW (BX)
        PLO     RA
        LDI     17
        STR     RA
        LDI     HIGH (BON)
        PHI     RA
        LDI     LOW (BON)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (BDIR)
        PHI     RA
        LDI     LOW (BDIR)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (BTMR)
        PHI     RA
        LDI     LOW (BTMR)
        PLO     RA
        LDI     4
        STR     RA
        LDI     HIGH (MTMR)
        PHI     RA
        LDI     LOW (MTMR)
        PLO     RA
        LDI     40
        STR     RA
        LDI     HIGH (SCRL)
        PHI     RA
        LDI     LOW (SCRL)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (BFLASH)
        PHI     RA
        LDI     LOW (BFLASH)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (HUDT)
        PHI     RA
        LDI     LOW (HUDT)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R4
        WORD    BOSSDRAW
        LDI     3
        SEP     R4
        WORD    SHOWMSG
        SEP     R5
; BOSSRUN - move, fire missiles
BOSSRUN
        LDI     HIGH (BHP)
        PHI     RA
        LDI     LOW (BHP)
        PLO     RA
        LDN     RA
        LBZ     BRDEAD
        LDI     HIGH (BTMR)
        PHI     RA
        LDI     LOW (BTMR)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    BR3
        LDI     HIGH (BTMR)
        PHI     RA
        LDI     LOW (BTMR)
        PLO     RA
        LDI     4
        STR     RA
        LDI     HIGH (BFLASH)
        PHI     RA
        LDI     LOW (BFLASH)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (BDIR)
        PHI     RA
        LDI     LOW (BDIR)
        PLO     RA
        LDN     RA
        LBZ     BR1
        LDI     HIGH (BX)
        PHI     RA
        LDI     LOW (BX)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        SMI     30
        LBNF    BR2
        LDI     HIGH (BDIR)
        PHI     RA
        LDI     LOW (BDIR)
        PLO     RA
        LDI     0
        STR     RA
        LBR     BR2
BR1
        LDI     HIGH (BX)
        PHI     RA
        LDI     LOW (BX)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        SMI     4
        LBDF    BR2
        LDI     HIGH (BDIR)
        PHI     RA
        LDI     LOW (BDIR)
        PLO     RA
        LDI     1
        STR     RA
BR2
        SEP     R4
        WORD    BOSSDRAW
BR3
        LDI     HIGH (MTMR)
        PHI     RA
        LDI     LOW (MTMR)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    MSL
        LDI     HIGH (LOOP)
        PHI     RA
        LDI     LOW (LOOP)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SHL
        SDI     40
        LBDF    BR4
        LDI     12
BR4
        PLO     R7
        LDI     HIGH (MTMR)
        PHI     RA
        LDI     LOW (MTMR)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     0
        PLO     RB
BR5     GLO     RB
        ADI     LOW MON
        PLO     RA
        LDI     HIGH MON
        PHI     RA
        LDN     RA
        LBZ     BR6
        INC     RB
        GLO     RB
        XRI     2
        LBNZ    BR5
        LBR     MSL
BR6     LDI     1
        STR     RA
        GLO     RB
        ADI     LOW MG
        PLO     RA
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDN     RA
        SHL
        ADI     6
        PLO     R7
        GLO     RB
        ADI     LOW MG
        PLO     RA
        LDI     HIGH MG
        PHI     RA
        GLO     R7
        STR     RA
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDN     RA
        PLO     R7
        GLO     RB
        ADI     LOW MAL
        PLO     RA
        LDI     HIGH MAL
        PHI     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BX)
        PHI     RA
        LDI     LOW (BX)
        PLO     RA
        LDN     RA
        ADI     2
        PLO     R7
        GLO     RB
        ADI     LOW MC
        PLO     RA
        LDI     HIGH MC
        PHI     RA
        GLO     R7
        STR     RA
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     2
        STR     RA
        LDI     HIGH (201FH)
        PHI     RC
        LDI     LOW (201FH)
        PLO     RC
        LDI     12
        SEP     R4
        WORD    SOUND
MSL     LDI     0
        PLO     RB
MS1     GLO     RB
        ADI     LOW MON
        PLO     RA
        LDI     HIGH MON
        PHI     RA
        LDN     RA
        LBZ     MSN
        GLO     RB
        ADI     LOW MG
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        PHI     RE
        SMI     23
        LBDF    MSK
        GLO     RB
        ADI     LOW MC
        PLO     RA
        LDN     RA
        PLO     RE
        GLO     RB
        ADI     LOW MAL
        PLO     RA
        LDN     RA
        PLO     R9
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    MS2
        LDI     HIGH (INV)
        PHI     RA
        LDI     LOW (INV)
        PLO     RA
        LDN     RA
        LBNZ    MS2
        GHI     RE
        SMI     19
        SMI     2
        LBDF    MS2
        LDI     HIGH (PX)
        PHI     RA
        LDI     LOW (PX)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        SM
        SMI     2
        LBDF    MS2
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     R9
        SM
        ADI     1
        SMI     3
        LBDF    MS2
        SEP     R4
        WORD    KILLP
        LBR     MSK
MS2     GLO     R9
        SHL
        STR     R2
        GHI     RE
        SMI     1
        SM
        PHI     RE
        GLO     RB
        ADI     12
        PLO     R8
        LDI     159
        PLO     R9
        LDI     0
        PHI     R9
        SEP     R4
        WORD    SPSET
        LBR     MSN
MSK     GLO     RB
        ADI     LOW MON
        PLO     RA
        LDI     HIGH MON
        PHI     RA
        LDI     0
        STR     RA
        GLO     RB
        ADI     12
        PLO     R8
        GLO     R8
        SHL
        SHL
        SHL
        SHL
        ADI     0
        PLO     RA
        LDI     HIGH SPR
        PHI     RA
        LDI     0
        STR     RA
MSN     INC     RB
        GLO     RB
        XRI     2
        LBNZ    MS1
        SEP     R5
BRDEAD
        LDI     HIGH (BTMR)
        PHI     RA
        LDI     LOW (BTMR)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    BRD1
        LDI     HIGH (BOSS)
        PHI     RA
        LDI     LOW (BOSS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (SCRL)
        PHI     RA
        LDI     LOW (SCRL)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (LOOP)
        PHI     RA
        LDI     LOW (LOOP)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (SPER)
        PHI     RA
        LDI     LOW (SPER)
        PLO     RA
        LDN     RA
        SMI     3
        LBNF    BRD0
        ADI     2
        STR     RA
BRD0
        SEP     R4
        WORD    LVRESET
BRD1    SEP     R5
BOSSHIT
        LDI     HIGH (BHP)
        PHI     RA
        LDI     LOW (BHP)
        PLO     RA
        LDN     RA
        LBZ     BHN
        LDI     HIGH (SHA)
        PHI     RA
        LDI     LOW (SHA)
        PLO     RA
        LDN     RA
        SHL
        STR     R2
        LDI     HIGH (SHG)
        PHI     RA
        LDI     LOW (SHG)
        PLO     RA
        LDN     RA
        SMI     1
        SM
        SMI     5
        LBNF    BHS
        SMI     240
        LBNF    BHN
BHS
        LDI     HIGH (BX)
        PHI     RA
        LDI     LOW (BX)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (SHX)
        PHI     RA
        LDI     LOW (SHX)
        PLO     RA
        LDN     RA
        ADI     1
        SM
        LBNF    BHN
        SMI     7
        LBDF    BHN
        LDI     HIGH (SHA)
        PHI     RA
        LDI     LOW (SHA)
        PLO     RA
        LDN     RA
        SMI     2
        LBNF    BHA
        SMI     3
        LBDF    BHA
        LDI     HIGH (BX)
        PHI     RA
        LDI     LOW (BX)
        PLO     RA
        LDN     RA
        ADI     1
        STR     R2
        LDI     HIGH (SHX)
        PHI     RA
        LDI     LOW (SHX)
        PLO     RA
        LDN     RA
        SM
        LBNF    BHA
        SMI     3
        LBDF    BHA
        LDI     HIGH (BHP)
        PHI     RA
        LDI     LOW (BHP)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LDI     HIGH (BFLASH)
        PHI     RA
        LDI     LOW (BFLASH)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (BTMR)
        PHI     RA
        LDI     LOW (BTMR)
        PLO     RA
        LDI     3
        STR     RA
        SEP     R4
        WORD    BOSSDRAW
        LDI     HIGH (1F88H)
        PHI     RC
        LDI     LOW (1F88H)
        PLO     RC
        LDI     8
        SEP     R4
        WORD    NOISE
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     5
        STR     RA
        LDI     HIGH (151FH)
        PHI     RC
        LDI     LOW (151FH)
        PLO     RC
        LDI     8
        SEP     R4
        WORD    SOUND
        LDI     HIGH (SCORE+3)
        PHI     RB
        LDI     LOW (SCORE+3)
        PLO     RB
        LDI     1
        SEP     R4
        WORD    ADDSC
        LDI     HIGH (BHP)
        PHI     RA
        LDI     LOW (BHP)
        PLO     RA
        LDN     RA
        LBNZ    BHY
        LDI     HIGH (BTMR)
        PHI     RA
        LDI     LOW (BTMR)
        PLO     RA
        LDI     60
        STR     RA
        LDI     HIGH (SCORE+2)
        PHI     RB
        LDI     LOW (SCORE+2)
        PLO     RB
        LDI     5
        SEP     R4
        WORD    ADDSC
        LDI     HIGH (3F88H)
        PHI     RC
        LDI     LOW (3F88H)
        PLO     RC
        LDI     20
        SEP     R4
        WORD    NOISE
        SEP     R4
        WORD    BOSSDRAW
        LDI     HIGH (BX)
        PHI     RA
        LDI     LOW (BX)
        PLO     RA
        LDN     RA
        ADI     1
        PLO     RE
        LDI     3
        PHI     RE
        LDI     1
        PHI     R9
        SEP     R4
        WORD    EFFECT
        LDI     HIGH (BX)
        PHI     RA
        LDI     LOW (BX)
        PLO     RA
        LDN     RA
        ADI     4
        PLO     RE
        LDI     3
        PHI     RE
        LDI     1
        PHI     R9
        SEP     R4
        WORD    EFFECT
        LDI     HIGH (BX)
        PHI     RA
        LDI     LOW (BX)
        PLO     RA
        LDN     RA
        ADI     2
        PLO     RE
        LDI     4
        PHI     RE
        LDI     1
        PHI     R9
        SEP     R4
        WORD    EFFECT
        LDI     HIGH (BX)
        PHI     RA
        LDI     LOW (BX)
        PLO     RA
        LDN     RA
        ADI     3
        PLO     RE
        LDI     2
        PHI     RE
        LDI     1
        PHI     R9
        SEP     R4
        WORD    EFFECT
BHY     LDI     1
        SEP     R5
BHA
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (3F1FH)
        PHI     RC
        LDI     LOW (3F1FH)
        PLO     RC
        LDI     3
        SEP     R4
        WORD    SOUND
        LDI     1
        SEP     R5
BHN     LDI     0
        SEP     R5
FUELT
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    FUX
        LDI     HIGH (BOSS)
        PHI     RA
        LDI     LOW (BOSS)
        PLO     RA
        LDN     RA
        LBNZ    FUX
        LDI     HIGH (FTMR)
        PHI     RA
        LDI     LOW (FTMR)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    FUX
        LDI     HIGH (FTMR)
        PHI     RA
        LDI     LOW (FTMR)
        PLO     RA
        LDI     16
        STR     RA
        LDI     HIGH (FUEL)
        PHI     RA
        LDI     LOW (FUEL)
        PLO     RA
        LDN     RA
        LBZ     FUK
        SMI     1
        STR     RA
        LBZ     FUK
        SMI     10
        LBDF    FUX
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (0C1FH)
        PHI     RC
        LDI     LOW (0C1FH)
        PLO     RC
        LDI     4
        SEP     R4
        WORD    SOUND
        SEP     R5
FUK
        SEP     R4
        WORD    KILLP
FUX     SEP     R5
KILLP
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    KPX
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (DTMR)
        PHI     RA
        LDI     LOW (DTMR)
        PLO     RA
        LDI     60
        STR     RA
        LDI     HIGH (SHON)
        PHI     RA
        LDI     LOW (SHON)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (1F88H)
        PHI     RC
        LDI     LOW (1F88H)
        PLO     RC
        LDI     14
        SEP     R4
        WORD    NOISE
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     4
        STR     RA
        LDI     HIGH (101FH)
        PHI     RC
        LDI     LOW (101FH)
        PLO     RC
        LDI     10
        SEP     R4
        WORD    SOUND
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDN     RA
        SHL
        SDI     19
        PHI     RE
        LDI     HIGH (PX)
        PHI     RA
        LDI     LOW (PX)
        PLO     RA
        LDN     RA
        PLO     RE
        LDI     1
        PHI     R9
        SEP     R4
        WORD    EFFECT
        LDI     HIGH (SPR+0)
        PHI     RA
        LDI     LOW (SPR+0)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (SPR+16)
        PHI     RA
        LDI     LOW (SPR+16)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (SPR+32)
        PHI     RA
        LDI     LOW (SPR+32)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (SPR+48)
        PHI     RA
        LDI     LOW (SPR+48)
        PLO     RA
        LDI     0
        STR     RA
KPX     SEP     R5
DEATH
        LDI     HIGH (DTMR)
        PHI     RA
        LDI     LOW (DTMR)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    DTX
        LDI     HIGH (LIVES)
        PHI     RA
        LDI     LOW (LIVES)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    DT1
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R5
DT1
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (INV)
        PHI     RA
        LDI     LOW (INV)
        PLO     RA
        LDI     40
        STR     RA
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDI     3
        STR     RA
        LDI     HIGH (PX)
        PHI     RA
        LDI     LOW (PX)
        PLO     RA
        LDI     19
        STR     RA
        LDI     HIGH (FUEL)
        PHI     RA
        LDI     LOW (FUEL)
        PLO     RA
        LDI     60
        STR     RA
DTX     SEP     R5
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
        LDI     HIGH (HISC+1)
        PHI     RD
        LDI     LOW (HISC+1)
        PLO     RD
        LDI     1
        STR     RD
        LDI     HIGH (AUTO)
        PHI     RA
        LDI     LOW (AUTO)
        PLO     RA
        LDI     0
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
        LDI     60
        STR     RA
        LDI     HIGH (SCRREQ)
        PHI     RA
        LDI     LOW (SCRREQ)
        PLO     RA
        LDI     0
        STR     RA
TITLE
        SEP     R4
        WORD    VIDOFF
        SEP     R4
        WORD    SILENCE
        SEP     R4
        WORD    HOME
        SEP     R4
        WORD    CLRSCR
        LDI     HIGH (525)
        PHI     RE
        LDI     LOW (525)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX1)
        PHI     RC
        LDI     LOW (TX1)
        PLO     RC
        LDI     128
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (1032)
        PHI     RE
        LDI     LOW (1032)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX2)
        PHI     RC
        LDI     LOW (TX2)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (1799)
        PHI     RE
        LDI     LOW (1799)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX3)
        PHI     RC
        LDI     LOW (TX3)
        PLO     RC
        LDI     128
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (2311)
        PHI     RE
        LDI     LOW (2311)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX4)
        PHI     RC
        LDI     LOW (TX4)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (2567)
        PHI     RE
        LDI     LOW (2567)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX5)
        PHI     RC
        LDI     LOW (TX5)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (3332)
        PHI     RE
        LDI     LOW (3332)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX6)
        PHI     RC
        LDI     LOW (TX6)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (3588)
        PHI     RE
        LDI     LOW (3588)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX7)
        PHI     RC
        LDI     LOW (TX7)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (3844)
        PHI     RE
        LDI     LOW (3844)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX8)
        PHI     RC
        LDI     LOW (TX8)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (4100)
        PHI     RE
        LDI     LOW (4100)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX9)
        PHI     RC
        LDI     LOW (TX9)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (4868)
        PHI     RE
        LDI     LOW (4868)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX10)
        PHI     RC
        LDI     LOW (TX10)
        PLO     RC
        LDI     128
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (5390)
        PHI     RE
        LDI     LOW (5390)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX11)
        PHI     RC
        LDI     LOW (TX11)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (5393)
        PHI     RE
        LDI     LOW (5393)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (HISC)
        PHI     RB
        LDI     LOW (HISC)
        PLO     RB
        LDI     6
        PLO     R9
TI1     LDA     RB
        ADI     0B0H
        STR     RD
        INC     RD
        DEC     R9
        GLO     R9
        LBNZ    TI1
        LDI     HIGH (PAGE+71)
        PHI     RD
        LDI     LOW (PAGE+71)
        PLO     RD
        LDI     223
        STR     RD
        LDI     HIGH (PAGE+72)
        PHI     RD
        LDI     LOW (PAGE+72)
        PLO     RD
        LDI     224
        STR     RD
        LDI     HIGH (PAGE+73)
        PHI     RD
        LDI     LOW (PAGE+73)
        PLO     RD
        LDI     225
        STR     RD
        LDI     HIGH (PAGE+74)
        PHI     RD
        LDI     LOW (PAGE+74)
        PLO     RD
        LDI     226
        STR     RD
        LDI     HIGH (PAGE+75)
        PHI     RD
        LDI     LOW (PAGE+75)
        PLO     RD
        LDI     227
        STR     RD
        LDI     HIGH (PAGE+76)
        PHI     RD
        LDI     LOW (PAGE+76)
        PLO     RD
        LDI     228
        STR     RD
        LDI     HIGH (PAGE+111)
        PHI     RD
        LDI     LOW (PAGE+111)
        PLO     RD
        LDI     229
        STR     RD
        LDI     HIGH (PAGE+112)
        PHI     RD
        LDI     LOW (PAGE+112)
        PLO     RD
        LDI     230
        STR     RD
        LDI     HIGH (PAGE+113)
        PHI     RD
        LDI     LOW (PAGE+113)
        PLO     RD
        LDI     231
        STR     RD
        LDI     HIGH (PAGE+114)
        PHI     RD
        LDI     LOW (PAGE+114)
        PLO     RD
        LDI     232
        STR     RD
        LDI     HIGH (PAGE+115)
        PHI     RD
        LDI     LOW (PAGE+115)
        PLO     RD
        LDI     233
        STR     RD
        LDI     HIGH (PAGE+116)
        PHI     RD
        LDI     LOW (PAGE+116)
        PLO     RD
        LDI     234
        STR     RD
        LDI     HIGH (PAGE+151)
        PHI     RD
        LDI     LOW (PAGE+151)
        PLO     RD
        LDI     235
        STR     RD
        LDI     HIGH (PAGE+152)
        PHI     RD
        LDI     LOW (PAGE+152)
        PLO     RD
        LDI     236
        STR     RD
        LDI     HIGH (PAGE+153)
        PHI     RD
        LDI     LOW (PAGE+153)
        PLO     RD
        LDI     237
        STR     RD
        LDI     HIGH (PAGE+154)
        PHI     RD
        LDI     LOW (PAGE+154)
        PLO     RD
        LDI     238
        STR     RD
        LDI     HIGH (PAGE+155)
        PHI     RD
        LDI     LOW (PAGE+155)
        PLO     RD
        LDI     239
        STR     RD
        LDI     HIGH (PAGE+156)
        PHI     RD
        LDI     LOW (PAGE+156)
        PLO     RD
        LDI     240
        STR     RD
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
        LBZ     NEWGAME
        GLO     R9
        XRI     20H
        LBZ     NEWGAME
        GLO     R9
        XRI     '1'
        LBZ     NEWGAME
        LBR     TW1
HOME
        LDI     HIGH (TOPV)
        PHI     RA
        LDI     LOW (TOPV)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (PAGE)
        PHI     RF
        LDI     LOW (PAGE)
        PLO     RF
        SEX     RF
        OUT     7
        SEX     R2
        SEP     R5
NEWGAME
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
        LDI     HIGH (LOOP)
        PHI     RA
        LDI     LOW (LOOP)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (SPER)
        PHI     RA
        LDI     LOW (SPER)
        PLO     RA
        LDI     3
        STR     RA
        LDI     HIGH (PX)
        PHI     RA
        LDI     LOW (PX)
        PLO     RA
        LDI     19
        STR     RA
        LDI     HIGH (PALT)
        PHI     RA
        LDI     LOW (PALT)
        PLO     RA
        LDI     3
        STR     RA
        LDI     HIGH (FUEL)
        PHI     RA
        LDI     LOW (FUEL)
        PLO     RA
        LDI     60
        STR     RA
        LDI     HIGH (FTMR)
        PHI     RA
        LDI     LOW (FTMR)
        PLO     RA
        LDI     16
        STR     RA
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (INV)
        PHI     RA
        LDI     LOW (INV)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (SHON)
        PHI     RA
        LDI     LOW (SHON)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (SECT)
        PHI     RA
        LDI     LOW (SECT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (MSGT)
        PHI     RA
        LDI     LOW (MSGT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (BOSS)
        PHI     RA
        LDI     LOW (BOSS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (BHP)
        PHI     RA
        LDI     LOW (BHP)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (BON)
        PHI     RA
        LDI     LOW (BON)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (SCRL)
        PHI     RA
        LDI     LOW (SCRL)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (SCNT)
        PHI     RA
        LDI     LOW (SCNT)
        PLO     RA
        LDI     2
        STR     RA
        LDI     HIGH (SCRREQ)
        PHI     RA
        LDI     LOW (SCRREQ)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TFT)
        PHI     RA
        LDI     LOW (TFT)
        PLO     RA
        LDI     30
        STR     RA
        LDI     HIGH (SPR)
        PHI     RD
        LDI     LOW (SPR)
        PLO     RD
        LDI     HIGH (1E0H)
        PHI     RE
        LDI     LOW (1E0H)
        PLO     RE
        LDI     0
        SEP     R4
        WORD    FILL
        SEP     R4
        WORD    LVRESET
        SEP     R4
        WORD    VIDOFF
        SEP     R4
        WORD    HOME
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
        LDI     HIGH (VCAP)
        PHI     RA
        LDI     LOW (VCAP)
        PLO     RA
        LDI     60
        STR     RA
        SEP     R4
        WORD    HUDBLD
        LDI     HIGH (HUDBUF)
        PHI     RC
        LDI     LOW (HUDBUF)
        PLO     RC
        LDI     HIGH (PAGE)
        PHI     RD
        LDI     LOW (PAGE)
        PLO     RD
        LDI     HIGH (40)
        PHI     RE
        LDI     LOW (40)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
        SEP     R4
        WORD    VIDON
MAIN
        LDI     HIGH (FRESH)
        PHI     RA
        LDI     LOW (FRESH)
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
        LDI     HIGH (FRESH)
        PHI     RA
        LDI     LOW (FRESH)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (FCNT)
        PHI     RA
        LDI     LOW (FCNT)
        PLO     RA
        LDN     RA
        SMI     3
        LBDF    MAING
        SEP     R4
        WORD    VBDRAW
        LDI     HIGH (FRESH)
        PHI     RA
        LDI     LOW (FRESH)
        PLO     RA
        LDI     0
        STR     RA
        LBR     MAINW
MAING
        LDI     HIGH (FCNT)
        PHI     RA
        LDI     LOW (FCNT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (LASTF)
        PHI     RA
        LDI     LOW (LASTF)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R4
        WORD    VBDRAW
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
        LDI     HIGH (SNDT)
        PHI     RA
        LDI     LOW (SNDT)
        PLO     RA
        LDN     RA
        LBNZ    MXS1
        LDI     HIGH (NSDT)
        PHI     RA
        LDI     LOW (NSDT)
        PLO     RA
        LDN     RA
        LBZ     MXS2
MXS1
        SEP     R4
        WORD    SNDTICK
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
MXS2
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
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDN     RA
        LBNZ    GAMEOVER
        LDI     HIGH (SCRL)
        PHI     RA
        LDI     LOW (SCRL)
        PLO     RA
        LDN     RA
        LBZ     MX1
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    MX1
        LDI     HIGH (SCNT)
        PHI     RA
        LDI     LOW (SCNT)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBZ     MX0A
        XRI     1
        LBNZ    MX1
        SEP     R4
        WORD    SCPREP
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
        LBR     MX1
MX0A
        LDI     HIGH (SPER)
        PHI     RA
        LDI     LOW (SPER)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (SCNT)
        PHI     RA
        LDI     LOW (SCNT)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    SCROLL
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
        LDI     HIGH (BOSSREQ)
        PHI     RA
        LDI     LOW (BOSSREQ)
        PLO     RA
        LDN     RA
        LBZ     MX1
        LDI     HIGH (BOSSREQ)
        PHI     RA
        LDI     LOW (BOSSREQ)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R4
        WORD    BOSSGO
MX1
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBZ     MXP
        SEP     R4
        WORD    DEATH
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD15
        LDN     RA
        LBZ     TKX15
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX15
TKD15    LDI     1
        STR     RA
TKX15
        LBR     MXQ
MXP
        SEP     R4
        WORD    PLAYER
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD16
        LDN     RA
        LBZ     TKX16
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX16
TKD16    LDI     1
        STR     RA
TKX16
MXQ
        SEP     R4
        WORD    SHOTS
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD17
        LDN     RA
        LBZ     TKX17
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX17
TKD17    LDI     1
        STR     RA
TKX17
        SEP     R4
        WORD    SHELLS
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD18
        LDN     RA
        LBZ     TKX18
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX18
TKD18    LDI     1
        STR     RA
TKX18
        SEP     R4
        WORD    PLANES
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD19
        LDN     RA
        LBZ     TKX19
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX19
TKD19    LDI     1
        STR     RA
TKX19
        LDI     HIGH (BOSS)
        PHI     RA
        LDI     LOW (BOSS)
        PLO     RA
        LDN     RA
        LBZ     MX2
        SEP     R4
        WORD    BOSSRUN
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD20
        LDN     RA
        LBZ     TKX20
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX20
TKD20    LDI     1
        STR     RA
TKX20
        LDI     HIGH (HUDT)
        PHI     RA
        LDI     LOW (HUDT)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    MX2
        LDI     HIGH (HUDT)
        PHI     RA
        LDI     LOW (HUDT)
        PLO     RA
        LDI     16
        STR     RA
        SEP     R4
        WORD    HUDQ
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD21
        LDN     RA
        LBZ     TKX21
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX21
TKD21    LDI     1
        STR     RA
TKX21
MX2
        SEP     R4
        WORD    EFFECTS
        SEP     R4
        WORD    FUELT
        SEP     R4
        WORD    SPRITES
        LDI     HIGH (LASTD)
        PHI     RA
        LDI     LOW (LASTD)
        PLO     RA
        B1      TKD22
        LDN     RA
        LBZ     TKX22
        LDI     0
        STR     RA
        INC     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     TKX22
TKD22    LDI     1
        STR     RA
TKX22
        LBR     MAIN
GAMEOVER
        SEP     R4
        WORD    SILENCE
        SEP     R4
        WORD    QFLUSHW
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
GO3
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDN     RA
        XRI     2
        LBZ     TITLE
        LDI     HIGH (2831)
        PHI     RE
        LDI     LOW (2831)
        PLO     RE
        LDI     HIGH (TXGO)
        PHI     RF
        LDI     LOW (TXGO)
        PLO     RF
GO4     LDA     RF
        LBZ     GO5
        ORI     80H
        SEP     R1
        INC     RE
        LBR     GO4
GO5
        SEP     R4
        WORD    QFLUSHW
        LDI     HIGH (1F88H)
        PHI     RC
        LDI     LOW (1F88H)
        PLO     RC
        LDI     20
        SEP     R4
        WORD    NOISE
        LDI     200
        SEP     R4
        WORD    WAITN
        LBR     TITLE
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
ROWT2
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
HGTT    BYTE    000H, 000H, 009H, 003H, 003H, 009H, 082H, 000H, 000H, 000H, 002H, 002H, 002H, 002H, 002H, 002H
        BYTE    002H, 002H, 002H, 002H, 002H, 002H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
BART    BYTE    0F1H, 0F2H, 0F3H, 0F4H, 0F5H
OBJCH   BYTE    000H, 000H, 000H, 000H, 08AH, 08BH, 08CH, 08DH, 08EH, 08FH, 090H, 091H, 012H, 013H, 014H, 015H
GUCH    BYTE    0DFH, 0E0H, 0E1H, 0E2H, 0E3H, 0E4H, 0E5H, 0E6H, 0E7H, 0E8H, 0E9H, 0EAH, 0EBH, 0ECH, 0EDH, 0EEH
        BYTE    0EFH, 0F0H
GUCH2   BYTE    05FH, 060H, 061H, 062H, 063H, 064H, 065H, 066H, 067H, 068H, 069H, 06AH, 06BH, 06CH, 06DH, 06EH
        BYTE    06FH, 070H
TXFUEL   TEXT    "FUEL"
        BYTE    0
TXALT    TEXT    "ALT"
        BYTE    0
TXGO     TEXT    "GAME OVER"
        BYTE    0
MSGTAB
        WORD    TXM0
        WORD    TXM1
        WORD    TXM2
        WORD    TXM3
TXM0     TEXT    "ENTERING THE FORTRESS"
        BYTE    0
TXM1     TEXT    "OUTER SPACE - ENEMY FIGHTERS"
        BYTE    0
TXM2     TEXT    "THE INNER FORTRESS"
        BYTE    0
TXM3     TEXT    "THE GUARDIAN - HIT ITS CORE"
        BYTE    0
RPTR
        WORD    LR0
        WORD    LR1
        WORD    LR2
        WORD    LR3
        WORD    LR4
        WORD    LR5
        WORD    LR6
        WORD    LR7
        WORD    LR8
        WORD    LR9
        WORD    LR10
        WORD    LR11
        WORD    LR12
        WORD    LR13
        WORD    LR14
        WORD    LR15
        WORD    LR16
        WORD    LR17
        WORD    LR18
        WORD    LR19
        WORD    LR20
        WORD    LR21
        WORD    LR22
        WORD    LR23
        WORD    LR24
        WORD    LR25
LR0     BYTE    020H, 020H, 020H, 009H, 020H, 020H, 020H, 020H, 020H, 009H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 088H, 020H, 020H, 020H, 020H, 020H
LR1     BYTE    020H, 020H, 088H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 088H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    088H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
LR2     BYTE    020H, 020H, 020H, 020H, 009H, 088H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 088H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
LR3     BYTE    020H, 020H, 020H, 009H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 088H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 088H, 020H, 020H, 020H
LR4     BYTE    020H, 020H, 088H, 009H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 088H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
LR5     BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 009H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 009H, 088H, 020H, 020H, 020H
LR6     BYTE    002H, 002H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H
        BYTE    001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H
        BYTE    001H, 001H, 001H, 001H, 001H, 001H, 002H, 002H
LR7     BYTE    002H, 002H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H
        BYTE    004H, 001H, 001H, 001H, 001H, 001H, 001H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H
        BYTE    004H, 004H, 004H, 004H, 004H, 004H, 002H, 002H
LR8     BYTE    002H, 002H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H
        BYTE    003H, 001H, 001H, 001H, 001H, 001H, 001H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H
        BYTE    003H, 003H, 003H, 003H, 003H, 003H, 002H, 002H
LR9     BYTE    002H, 002H, 085H, 086H, 086H, 086H, 086H, 086H, 086H, 086H, 086H, 086H, 086H, 086H, 086H, 086H
        BYTE    086H, 086H, 086H, 086H, 086H, 086H, 086H, 086H, 086H, 086H, 086H, 086H, 086H, 086H, 086H, 086H
        BYTE    086H, 086H, 086H, 086H, 086H, 085H, 002H, 002H
LR10    BYTE    002H, 002H, 004H, 004H, 001H, 001H, 001H, 001H, 001H, 001H, 004H, 004H, 004H, 004H, 004H, 004H
        BYTE    004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 001H, 001H, 001H, 001H
        BYTE    001H, 001H, 004H, 004H, 004H, 004H, 002H, 002H
LR11    BYTE    002H, 002H, 003H, 003H, 001H, 001H, 001H, 001H, 001H, 001H, 003H, 003H, 003H, 003H, 003H, 003H
        BYTE    003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 001H, 001H, 001H, 001H
        BYTE    001H, 001H, 003H, 003H, 003H, 003H, 002H, 002H
LR12    BYTE    002H, 002H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 085H, 086H
        BYTE    086H, 085H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H
        BYTE    004H, 004H, 004H, 004H, 004H, 004H, 002H, 002H
LR13    BYTE    002H, 002H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 085H, 086H
        BYTE    086H, 085H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H
        BYTE    003H, 003H, 003H, 003H, 003H, 003H, 002H, 002H
LR14    BYTE    002H, 002H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H
        BYTE    004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H
        BYTE    004H, 004H, 004H, 004H, 004H, 004H, 002H, 002H
LR15    BYTE    002H, 002H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H
        BYTE    003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H
        BYTE    003H, 003H, 003H, 003H, 003H, 003H, 002H, 002H
LR16    BYTE    002H, 002H, 004H, 004H, 001H, 001H, 001H, 001H, 001H, 004H, 004H, 004H, 004H, 004H, 004H, 004H
        BYTE    004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H
        BYTE    004H, 004H, 004H, 004H, 004H, 004H, 002H, 002H
LR17    BYTE    002H, 002H, 003H, 003H, 001H, 001H, 001H, 001H, 001H, 003H, 003H, 003H, 003H, 003H, 003H, 003H
        BYTE    003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H
        BYTE    003H, 003H, 003H, 003H, 003H, 003H, 002H, 002H
LR18    BYTE    002H, 002H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H
        BYTE    004H, 004H, 004H, 004H, 085H, 086H, 086H, 086H, 086H, 085H, 004H, 004H, 004H, 004H, 004H, 004H
        BYTE    004H, 004H, 004H, 004H, 004H, 004H, 002H, 002H
LR19    BYTE    002H, 002H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H
        BYTE    003H, 003H, 003H, 003H, 085H, 086H, 086H, 086H, 086H, 085H, 003H, 003H, 003H, 003H, 003H, 003H
        BYTE    003H, 003H, 003H, 003H, 003H, 003H, 002H, 002H
LR20    BYTE    002H, 002H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H
        BYTE    004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 001H, 001H
        BYTE    001H, 001H, 001H, 004H, 004H, 004H, 002H, 002H
LR21    BYTE    002H, 002H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H
        BYTE    003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 001H, 001H
        BYTE    001H, 001H, 001H, 003H, 003H, 003H, 002H, 002H
LR22    BYTE    002H, 002H, 004H, 004H, 004H, 004H, 085H, 086H, 086H, 085H, 004H, 004H, 004H, 004H, 004H, 004H
        BYTE    004H, 004H, 004H, 004H, 004H, 004H, 085H, 086H, 086H, 085H, 004H, 004H, 004H, 004H, 004H, 004H
        BYTE    004H, 004H, 004H, 004H, 004H, 004H, 002H, 002H
LR23    BYTE    002H, 002H, 003H, 003H, 003H, 003H, 085H, 086H, 086H, 085H, 003H, 003H, 003H, 003H, 003H, 003H
        BYTE    003H, 003H, 003H, 003H, 003H, 003H, 085H, 086H, 086H, 085H, 003H, 003H, 003H, 003H, 003H, 003H
        BYTE    003H, 003H, 003H, 003H, 003H, 003H, 002H, 002H
LR24    BYTE    002H, 002H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H
        BYTE    001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 004H, 004H, 004H, 004H, 004H, 004H, 004H, 004H
        BYTE    004H, 004H, 004H, 004H, 004H, 004H, 002H, 002H
LR25    BYTE    002H, 002H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H
        BYTE    001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H
        BYTE    003H, 003H, 003H, 003H, 003H, 003H, 002H, 002H
SEQ     BYTE    005H, 001H, 000H, 004H, 004H, 005H, 001H, 002H, 006H, 006H, 006H, 007H, 008H, 006H, 006H, 006H
        BYTE    006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 009H, 006H
        BYTE    006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 00AH, 00BH, 006H, 006H, 006H, 006H, 006H, 006H
        BYTE    006H, 006H, 006H, 006H, 006H, 00CH, 00DH, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H
        BYTE    006H, 006H, 006H, 006H, 009H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H
        BYTE    00EH, 00FH, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 000H, 004H, 005H, 000H
        BYTE    004H, 000H, 004H, 001H, 003H, 005H, 004H, 003H, 002H, 003H, 004H, 003H, 002H, 002H, 001H, 001H
        BYTE    005H, 001H, 000H, 004H, 002H, 004H, 003H, 002H, 005H, 003H, 002H, 004H, 000H, 000H, 004H, 003H
        BYTE    001H, 002H, 001H, 003H, 003H, 000H, 005H, 000H, 004H, 004H, 002H, 002H, 005H, 002H, 004H, 003H
        BYTE    004H, 003H, 000H, 000H, 002H, 003H, 005H, 005H, 000H, 000H, 005H, 005H, 002H, 005H, 004H, 005H
        BYTE    003H, 002H, 005H, 003H, 005H, 002H, 000H, 003H, 006H, 006H, 006H, 010H, 011H, 006H, 006H, 006H
        BYTE    006H, 006H, 006H, 006H, 012H, 013H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 009H, 006H
        BYTE    006H, 009H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 014H, 015H, 006H, 006H, 006H
        BYTE    006H, 006H, 006H, 006H, 016H, 017H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H
        BYTE    006H, 006H, 018H, 019H, 006H, 006H, 009H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H
        BYTE    006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 0FFH
OBJT    BYTE    000H, 010H, 086H, 000H, 010H, 05EH, 000H, 015H, 0D2H, 000H, 01AH, 048H, 000H, 01AH, 09AH, 000H
        BYTE    023H, 08EH, 000H, 023H, 056H, 000H, 02DH, 052H, 000H, 030H, 0A0H, 000H, 030H, 084H, 000H, 03BH
        BYTE    0CAH, 000H, 03BH, 05CH, 000H, 040H, 092H, 000H, 048H, 046H, 000H, 048H, 05EH, 000H, 04CH, 092H
        BYTE    000H, 056H, 0DAH, 000H, 056H, 088H, 000H, 0B0H, 04EH, 000H, 0B0H, 05AH, 000H, 0B9H, 08AH, 000H
        BYTE    0B9H, 0DCH, 000H, 0C6H, 048H, 000H, 0C6H, 094H, 000H, 0C6H, 060H, 000H, 0D0H, 09EH, 000H, 0D0H
        BYTE    04CH, 000H, 0DAH, 0D0H, 000H, 0DDH, 058H, 000H, 0DDH, 086H, 000H, 0EBH, 092H, 000H, 0EFH, 048H
        BYTE    000H, 0EFH, 05CH, 0FFH, 0FFH, 000H
EVTT    BYTE    000H, 008H, 001H, 000H, 060H, 002H, 000H, 066H, 013H, 000H, 070H, 013H, 000H, 07AH, 013H, 000H
        BYTE    084H, 013H, 000H, 08EH, 013H, 000H, 098H, 013H, 000H, 0A8H, 003H, 000H, 0F5H, 004H, 0FFH, 0FFH
        BYTE    000H
TUNE    BYTE    029H, 006H, 021H, 006H, 01BH, 006H, 014H, 00CH, 01BH, 006H, 014H, 012H, 07FH, 006H, 018H, 006H
        BYTE    01BH, 006H, 021H, 006H, 01BH, 00CH, 021H, 006H, 025H, 012H, 07FH, 006H, 029H, 006H, 021H, 006H
        BYTE    01BH, 006H, 018H, 00CH, 01BH, 006H, 021H, 006H, 01FH, 006H, 025H, 006H, 01BH, 00CH, 015H, 006H
        BYTE    014H, 018H, 07FH, 03CH, 000H
TX1      TEXT    "FORTRESS RAID"
        BYTE    0
TX2      TEXT    "STRIKE THE SKY FORTRESS"
        BYTE    0
TX3      TEXT    "SPACE OR 1   START"
        BYTE    0
TX4      TEXT    "ESC          BACK TO BASIC"
        BYTE    0
TX5      TEXT    "M            MUSIC ON/OFF"
        BYTE    0
TX6      TEXT    "LEFT/RIGHT  STEER (HOLD)"
        BYTE    0
TX7      TEXT    "UP/DOWN     CLIMB/DIVE (HOLD)"
        BYTE    0
TX8      TEXT    "SPACE       FIRE"
        BYTE    0
TX9      TEXT    "A           AUTO-FIRE ON/OFF"
        BYTE    0
TX10     TEXT    "WATCH YOUR FUEL AND ALTITUDE"
        BYTE    0
TX11     TEXT    "HI"
        BYTE    0
CHTAB
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 060H, 040H, 040H, 040H, 044H, 040H, 040H, 040H
        BYTE    0BFH, 0A4H, 0A4H, 0BFH, 084H, 084H, 0BFH, 089H, 0FFH, 0EAH, 0FFH, 0D5H, 0FFH, 0EAH, 0FFH, 0FFH
        BYTE    0BFH, 088H, 088H, 0BFH, 0A1H, 0A1H, 0BFH, 040H, 0CCH, 0CCH, 0CCH, 0CCH, 0CCH, 0CCH, 0CCH, 0CCH
        BYTE    060H, 050H, 049H, 046H, 082H, 085H, 088H, 090H, 000H, 008H, 02AH, 01CH, 02BH, 012H, 000H, 000H
        BYTE    0C0H, 0C0H, 0C8H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0D0H, 0C0H, 0C0H
        BYTE    000H, 087H, 08FH, 09FH, 09EH, 0BFH, 0BFH, 09FH, 000H, 0B8H, 0BCH, 0BEH, 09EH, 0BFH, 0BFH, 0BEH
        BYTE    00CH, 00CH, 007H, 001H, 001H, 001H, 0C3H, 0C0H, 00CH, 00CH, 038H, 020H, 020H, 020H, 0F0H, 0C0H
        BYTE    0C7H, 0CFH, 0DFH, 0FFH, 03FH, 03FH, 03FH, 03FH, 0F8H, 0FCH, 0FEH, 0FFH, 03FH, 03FH, 03FH, 03FH
        BYTE    0FFH, 0FFH, 0FFH, 0FFH, 01FH, 00FH, 000H, 000H, 0FFH, 0FFH, 0FFH, 0FFH, 03EH, 03CH, 000H, 000H
        BYTE    0CCH, 0C7H, 0C7H, 0C3H, 0CBH, 0CCH, 0CCH, 0CEH, 0C0H, 0C0H, 0F0H, 0FCH, 0FEH, 0FFH, 0DEH, 0CCH
        BYTE    087H, 083H, 081H, 081H, 083H, 087H, 080H, 080H, 080H, 0A0H, 0A0H, 0A0H, 0B0H, 0B8H, 080H, 080H
        BYTE    0C1H, 0C1H, 0C3H, 0C2H, 0C7H, 0CFH, 0DFH, 0FFH, 0E0H, 0E0H, 0F0H, 0D0H, 0F8H, 0FCH, 0FEH, 0FFH
        BYTE    0FFH, 0F7H, 0E7H, 0C6H, 0C6H, 00EH, 000H, 000H, 0FFH, 0FBH, 0F9H, 0D8H, 0D8H, 01CH, 000H, 000H
        BYTE    040H, 040H, 04AH, 045H, 04AH, 045H, 040H, 040H, 040H, 040H, 068H, 054H, 068H, 054H, 040H, 040H
        BYTE    081H, 081H, 081H, 081H, 081H, 081H, 080H, 080H, 0A0H, 0A0H, 0A0H, 0A0H, 0A0H, 0A0H, 080H, 080H
        BYTE    080H, 08CH, 01EH, 01EH, 00CH, 000H, 000H, 080H, 0CCH, 0CCH, 0DEH, 0FFH, 00CH, 012H, 000H, 000H
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C4H, 0C4H, 0C4H, 0C4H, 0C4H, 0C0H, 0C4H, 0C0H
        BYTE    0CAH, 0CAH, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0CAH, 0CAH, 0DFH, 0CAH, 0DFH, 0CAH, 0CAH, 0C0H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 0D8H, 0D9H, 0C2H, 0C4H, 0C8H, 0D3H, 0C3H, 0C0H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 0C4H, 0C4H, 0C8H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    0C2H, 0C4H, 0C8H, 0C8H, 0C8H, 0C4H, 0C2H, 0C0H, 0C8H, 0C4H, 0C2H, 0C2H, 0C2H, 0C4H, 0C8H, 0C0H
        BYTE    0C0H, 0D5H, 0CEH, 0DFH, 0CEH, 0D5H, 0C0H, 0C0H, 0C0H, 0C4H, 0C4H, 0DFH, 0C4H, 0C4H, 0C0H, 0C0H
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
        BYTE    0DFH, 0C1H, 0C2H, 0C4H, 0C8H, 0D0H, 0DFH, 0C0H, 070H, 059H, 04FH, 07FH, 04FH, 043H, 041H, 040H
        BYTE    043H, 066H, 07CH, 07FH, 07CH, 070H, 060H, 040H, 080H, 08AH, 01EH, 03FH, 01CH, 02AH, 080H, 080H
        BYTE    022H, 094H, 022H, 089H, 011H, 0A4H, 009H, 080H, 0C0H, 0C0H, 0C0H, 0C1H, 0C3H, 0C7H, 0CFH, 0CFH
        BYTE    0CCH, 0DEH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0F8H, 0C0H, 0CFH, 0DFH, 0FFH, 0FFH, 0FFH, 0FFH, 0DFH
        BYTE    0C0H, 0FCH, 0FEH, 0FFH, 0FFH, 0FFH, 0FFH, 0FEH, 0CCH, 0DEH, 0FFH, 0FCH, 0FFH, 0FFH, 0FFH, 0C7H
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0F8H, 0FCH, 0FCH, 0CFH, 0CFH, 0CFH, 0CFH, 00FH, 007H, 003H, 001H
        BYTE    0F3H, 0F3H, 0F8H, 0FFH, 03FH, 03FH, 03FH, 03EH, 0CFH, 0CEH, 0DCH, 0F9H, 039H, 031H, 033H, 007H
        BYTE    0FCH, 0DCH, 0CEH, 0E7H, 027H, 023H, 033H, 038H, 0F3H, 0F3H, 0C7H, 0FFH, 03FH, 03FH, 03FH, 01FH
        BYTE    0FCH, 0FCH, 0FCH, 0FCH, 03CH, 038H, 030H, 020H, 000H, 001H, 003H, 003H, 083H, 087H, 086H, 080H
        BYTE    03CH, 03CH, 03CH, 00CH, 08CH, 08EH, 086H, 080H, 003H, 003H, 003H, 003H, 081H, 081H, 080H, 080H
        BYTE    030H, 030H, 030H, 030H, 0A0H, 0A0H, 080H, 080H, 00FH, 00FH, 00FH, 00CH, 08CH, 09CH, 098H, 080H
        BYTE    000H, 020H, 030H, 030H, 0B0H, 0B8H, 098H, 080H, 080H, 0A0H, 0A0H, 0A0H, 0A0H, 0A0H, 0A0H, 080H
        BYTE    080H, 0B0H, 0B0H, 0B0H, 0B0H, 0B0H, 0B0H, 080H, 080H, 0B8H, 0B8H, 0B8H, 0B8H, 0B8H, 0B8H, 080H
        BYTE    080H, 0BCH, 0BCH, 0BCH, 0BCH, 0BCH, 0BCH, 080H, 080H, 0BEH, 0BEH, 0BEH, 0BEH, 0BEH, 0BEH, 080H
        BYTE    080H, 0BFH, 0BFH, 0BFH, 0BFH, 0BFH, 0BFH, 080H, 0C0H, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0C0H
        BYTE    040H, 061H, 061H, 061H, 061H, 061H, 07FH, 040H, 0CCH, 0CCH, 0DEH, 0FFH, 0FFH, 0EDH, 0C0H, 0C0H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        END
