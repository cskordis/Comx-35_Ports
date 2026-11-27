;=====================================================================
; CAVE.ASM - CAVE RESCUE for the COMX-35 (1802 machine code, A18 syntax)
; An original cave-rescue game.  Start: CALL(@4500).
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
SHADOW  EQU     09000H
NEWMAP  EQU     09400H
NEWL    EQU     0AB00H
OLDL    EQU     0AB80H
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
LEVEL   EQU     0AA29H
LIVES   EQU     0AA2AH
KEY     EQU     0AA2BH
HELD    EQU     0AA2CH
HX      EQU     0AA2DH
HY      EQU     0AA2EH
FACE    EQU     0AA2FH
DRIFT   EQU     0AA30H
LIFT    EQU     0AA31H
GRND    EQU     0AA32H
DEAD    EQU     0AA33H
INV     EQU     0AA34H
POWER   EQU     0AA35H
PSUB    EQU     0AA36H
DYN     EQU     0AA37H
DYT     EQU     0AA38H
DYR     EQU     0AA39H
DYC     EQU     0AA3AH
BOOMT   EQU     0AA3BH
BMR     EQU     0AA3CH
BMC     EQU     0AA3DH
BEAMT   EQU     0AA3EH
BL      EQU     0AA3FH
BH      EQU     0AA40H
GX      EQU     0AA41H
GY      EQU     0AA42H
RIDX    EQU     0AA43H
RPTR    EQU     0AA44H
TGX     EQU     0AA46H
TGY     EQU     0AA47H
TPTR    EQU     0AA48H
LVPTR   EQU     0AA4AH
ENX     EQU     0AA4CH
ENY     EQU     0AA4DH
CT      EQU     0AA4EH
CR      EQU     0AA52H
CC      EQU     0AA56H
CD      EQU     0AA5AH
CV      EQU     0AA5EH
CK      EQU     0AA62H
MINR    EQU     0AA66H
MINC    EQU     0AA67H
MINON   EQU     0AA68H
ANIM    EQU     0AA69H
NN      EQU     0AA6AH
ON      EQU     0AA6BH
SCD     EQU     0AA6CH
ROOMF   EQU     0AA6DH
OA0     EQU     0AA75H
OA1     EQU     0AA76H
OA2     EQU     0AA77H
OA3     EQU     0AA78H
OA4     EQU     0AA79H
OA5     EQU     0AA7AH
OA6     EQU     0AA7BH
OA7     EQU     0AA7CH
BR1     EQU     0AA7DH
BC1     EQU     0AA7EH
BR2     EQU     0AA7FH
BC2     EQU     0AA80H
BCH     EQU     0AA81H
WIDX    EQU     0AA82H
BXL     EQU     0AA83H
BXH     EQU     0AA84H
BYL     EQU     0AA85H
BYH     EQU     0AA86H
LOOPS   EQU     0AA87H
PRATE   EQU     0AA88H
KLR     EQU     0AA89H
JET     EQU     0AA8AH
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
QP2     GHI     RD
        ADI     98H
        PHI     RC
        GLO     RD
        PLO     RC
        GLO     R7
        STR     RC
        LDI     HIGH DIRECT
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
PAIRH
        SEP     R4
        WORD    KINDAT
        PLO     R7
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        GLO     R7
        STR     RA
        INC     RE
        SEP     R4
        WORD    KINDAT
        DEC     RE
        LBR     PAIRC
PAIRV
        SEP     R4
        WORD    KINDAT
        PLO     R7
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        GLO     R7
        STR     RA
        GHI     RE
        ADI     1
        PHI     RE
        SEP     R4
        WORD    KINDAT
        PLO     RF
        GHI     RE
        SMI     1
        PHI     RE
        GLO     RF
PAIRC   PLO     RF
        XRI     3
        LBZ     PR3
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        LDN     RA
        XRI     3
        LBZ     PR3
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RF
        OR
        LBZ     PR0
        LDI     1
        SEP     R5
PR3     LDI     3
PR0     SEP     R5
SPUT    PLO     R7
        GHI     RE
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
        ADI     9CH
        PHI     RC
        GLO     RD
        PLO     RC
        GLO     R7
        STR     RC
        LDI     HIGH (NN)
        PHI     RA
        LDI     LOW (NN)
        PLO     RA
        LDN     RA
        SMI     40
        LBDF    SPX
        LDN     RA
        ADI     1
        STR     RA
        SMI     1
        PLO     RC
        SHL
        STR     R2
        GLO     RC
        ADD
        ADI     LOW NEWL
        PLO     RC
        LDI     HIGH NEWL
        PHI     RC
        GHI     RD
        STR     RC
        INC     RC
        GLO     RD
        STR     RC
        INC     RC
        GLO     R7
        STR     RC
SPX     SEP     R5
SYNC
        LDI     HIGH (ON)
        PHI     RA
        LDI     LOW (ON)
        PLO     RA
        LDN     RA
        LBZ     SY3
        PLO     R8
        LDI     HIGH (OLDL)
        PHI     RB
        LDI     LOW (OLDL)
        PLO     RB
SY1     LDA     RB
        PHI     RD
        LDA     RB
        PLO     RD
        INC     RB
        GHI     RD
        ADI     9CH
        PHI     RC
        GLO     RD
        PLO     RC
        LDN     RC
        LBNZ    SY2
        GHI     RD
        ADI     0A8H
        PHI     RC
        LDN     RC
        PLO     R7
        GHI     RD
        ADI     98H
        PHI     RC
        LDN     RC
        STR     R2
        GLO     R7
        XOR
        LBZ     SY2
        LDI     HIGH (QP2)
        PHI     R1
        LDI     LOW (QP2)
        PLO     R1
        SEP     R1
SY2
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
        DEC     R8
        GLO     R8
        LBNZ    SY1
SY3
        LDI     HIGH (NN)
        PHI     RA
        LDI     LOW (NN)
        PLO     RA
        LDN     RA
        LBZ     SY6
        PLO     R8
        LDI     HIGH (NEWL)
        PHI     RB
        LDI     LOW (NEWL)
        PLO     RB
SY4     LDA     RB
        PHI     RD
        LDA     RB
        PLO     RD
        INC     RB
        GHI     RD
        ADI     9CH
        PHI     RC
        GLO     RD
        PLO     RC
        LDN     RC
        LBZ     SY5
        PLO     R7
        LDI     0
        STR     RC
        GHI     RD
        ADI     98H
        PHI     RC
        LDN     RC
        STR     R2
        GLO     R7
        XOR
        LBZ     SY5
        LDI     HIGH (QP2)
        PHI     R1
        LDI     LOW (QP2)
        PLO     R1
        SEP     R1
SY5
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
        DEC     R8
        GLO     R8
        LBNZ    SY4
SY6
        LDI     HIGH (NN)
        PHI     RA
        LDI     LOW (NN)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (ON)
        PHI     RA
        LDI     LOW (ON)
        PLO     RA
        GLO     R7
        STR     RA
        LBZ     SY8
        PLO     R8
        LDI     HIGH (NEWL)
        PHI     RB
        LDI     LOW (NEWL)
        PLO     RB
        LDI     HIGH (OLDL)
        PHI     RC
        LDI     LOW (OLDL)
        PLO     RC
SY7     LDA     RB
        STR     RC
        INC     RC
        LDA     RB
        STR     RC
        INC     RC
        LDA     RB
        STR     RC
        INC     RC
        DEC     R8
        GLO     R8
        LBNZ    SY7
SY8
        LDI     HIGH (NN)
        PHI     RA
        LDI     LOW (NN)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R5
FINDXY
        LDI     HIGH (LVPTR)
        PHI     RA
        LDI     LOW (LVPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDA     RB
        PLO     R8
        LDI     0
        PLO     R9
FX1
        LDI     HIGH (TGX)
        PHI     RA
        LDI     LOW (TGX)
        PLO     RA
        LDN     RA
        STR     R2
        LDA     RB
        XOR
        LBNZ    FX2
        LDI     HIGH (TGY)
        PHI     RA
        LDI     LOW (TGY)
        PLO     RA
        LDN     RA
        STR     R2
        LDN     RB
        XOR
        LBNZ    FX2
        INC     RB
        LDI     HIGH (TPTR)
        PHI     RA
        LDI     LOW (TPTR)
        PLO     RA
        LDA     RB
        STR     RA
        INC     RA
        LDN     RB
        STR     RA
        GLO     R9
        SEP     R5
FX2     INC     RB
        INC     RB
        INC     RB
        INC     R9
        DEC     R8
        GLO     R8
        LBNZ    FX1
        LDI     0FFH
        SEP     R5
BOXF
        LDI     HIGH (BR1)
        PHI     RA
        LDI     LOW (BR1)
        PLO     RA
        LDN     RA
        PHI     RE
BX1     GHI     RE
        SHL
        ADI     LOW ROWTAB
        PLO     RA
        LDI     HIGH ROWTAB
        ADCI    0
        PHI     RA
        LDA     RA
        ADI     0A8H
        PHI     RD
        LDN     RA
        PLO     RD
        LDI     HIGH (BC1)
        PHI     RA
        LDI     LOW (BC1)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RD
        ADD
        PLO     RD
        GHI     RD
        ADCI    0
        PHI     RD
        LDI     HIGH (BC2)
        PHI     RA
        LDI     LOW (BC2)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (BC1)
        PHI     RA
        LDI     LOW (BC1)
        PLO     RA
        LDN     RA
        SD
        ADI     1
        PLO     R8
        LDI     HIGH (BCH)
        PHI     RA
        LDI     LOW (BCH)
        PLO     RA
        LDN     RA
        PLO     R7
BX2     GLO     R7
        STR     RD
        INC     RD
        DEC     R8
        GLO     R8
        LBNZ    BX2
        GHI     RE
        STR     R2
        LDI     HIGH (BR2)
        PHI     RA
        LDI     LOW (BR2)
        PLO     RA
        LDN     RA
        XOR
        LBZ     BXX
        GHI     RE
        ADI     1
        PHI     RE
        LBR     BX1
BXX     SEP     R5
RDOPS   LDA     RB
        LBZ     RDX
        PLO     R9
        LDA     RB
        PLO     R7
        LDI     HIGH (BR1)
        PHI     RA
        LDI     LOW (BR1)
        PLO     RA
        GLO     R7
        STR     RA
        LDA     RB
        PLO     R7
        LDI     HIGH (BC1)
        PHI     RA
        LDI     LOW (BC1)
        PLO     RA
        GLO     R7
        STR     RA
        LDA     RB
        PLO     R7
        LDI     HIGH (BR2)
        PHI     RA
        LDI     LOW (BR2)
        PLO     RA
        GLO     R7
        STR     RA
        LDA     RB
        PLO     R7
        LDI     HIGH (BC2)
        PHI     RA
        LDI     LOW (BC2)
        PLO     RA
        GLO     R7
        STR     RA
        GLO     R9
RDX     SEP     R5
WALLBIT
        LDI     HIGH (WIDX)
        PHI     RA
        LDI     LOW (WIDX)
        PLO     RA
        LDN     RA
        ADI     LOW BITS
        PLO     RC
        LDI     HIGH BITS
        ADCI    0
        PHI     RC
        LDI     HIGH (RIDX)
        PHI     RA
        LDI     LOW (RIDX)
        PLO     RA
        LDN     RA
        ADI     LOW ROOMF
        PLO     RA
        LDI     HIGH ROOMF
        ADCI    0
        PHI     RA
        LDN     RC
        SEP     R5
ROOMDRAW
        LDI     HIGH (BGBUF+40)
        PHI     RD
        LDI     LOW (BGBUF+40)
        PLO     RD
        LDI     1
        PLO     R9
RM1     GLO     R9
        ANI     1
        PLO     RF
        LDI     40
        PLO     R8
RM2     GLO     RF
        XRI     1
        PLO     RF
        LBZ     RM3
        LDI     1
        LBR     RM4
RM3     LDI     2
RM4     STR     RD
        INC     RD
        DEC     R8
        GLO     R8
        LBNZ    RM2
        INC     R9
        GLO     R9
        XRI     23
        LBNZ    RM1
        LDI     HIGH (RPTR)
        PHI     RA
        LDI     LOW (RPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDI     HIGH (WIDX)
        PHI     RA
        LDI     LOW (WIDX)
        PLO     RA
        LDI     0
        STR     RA
RM5
        SEP     R4
        WORD    RDOPS
        LBZ     RM9
        XRI     1
        LBZ     RMO
        GLO     R9
        XRI     2
        LBZ     RMW
        GLO     R9
        XRI     3
        LBZ     RML
        LDI     6
        LBR     RM8
RML     LDI     132
        LBR     RM8
RMW
        SEP     R4
        WORD    WALLBIT
        STR     R2
        LDN     RA
        AND
        PLO     R9
        LDI     HIGH (WIDX)
        PHI     RA
        LDI     LOW (WIDX)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        GLO     R9
        LBNZ    RMO
        LDI     131
        LBR     RM8
RMO     LDI     20H
RM8
        PLO     R7
        LDI     HIGH (BCH)
        PHI     RA
        LDI     LOW (BCH)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    BOXF
        LBR     RM5
RM9
        LDI     HIGH (MINON)
        PHI     RA
        LDI     LOW (MINON)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (CT)
        PHI     RD
        LDI     LOW (CT)
        PLO     RD
        LDI     HIGH (8)
        PHI     RE
        LDI     LOW (8)
        PLO     RE
        LDI     0
        SEP     R4
        WORD    FILL
        LDI     HIGH (CK)
        PHI     RD
        LDI     LOW (CK)
        PLO     RD
        LDI     HIGH (4)
        PHI     RE
        LDI     LOW (4)
        PLO     RE
        LDI     0
        SEP     R4
        WORD    FILL
        LDI     0
        PLO     R8
RMB     LDA     RB
        LBZ     RMD
        PLO     R9
        XRI     4
        LBNZ    RMC
        LDA     RB
        PLO     R7
        LDI     HIGH (MINR)
        PHI     RA
        LDI     LOW (MINR)
        PLO     RA
        GLO     R7
        STR     RA
        LDA     RB
        PLO     R7
        LDI     HIGH (MINC)
        PHI     RA
        LDI     LOW (MINC)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (MINON)
        PHI     RA
        LDI     LOW (MINON)
        PLO     RA
        LDI     1
        STR     RA
        LBR     RMB
RMC
        GLO     R8
        ADI     LOW CR
        PLO     RA
        LDI     HIGH CR
        ADCI    0
        PHI     RA
        LDA     RB
        STR     RA
        GLO     R8
        ADI     LOW CC
        PLO     RA
        LDI     HIGH CC
        ADCI    0
        PHI     RA
        LDA     RB
        STR     RA
        GLO     R8
        ADI     LOW CD
        PLO     RA
        LDI     HIGH CD
        ADCI    0
        PHI     RA
        LDI     1
        STR     RA
        GLO     R8
        ADI     LOW CV
        PLO     RA
        LDI     HIGH CV
        ADCI    0
        PHI     RA
        LDI     1
        STR     RA
        GLO     R8
        ADI     4
        PLO     R7
        LDI     HIGH (WIDX)
        PHI     RA
        LDI     LOW (WIDX)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    WALLBIT
        STR     R2
        LDN     RA
        AND
        LBNZ    RMC2
        GLO     R8
        ADI     LOW CT
        PLO     RA
        LDI     HIGH CT
        ADCI    0
        PHI     RA
        GLO     R9
        STR     RA
RMC2    INC     R8
        LBR     RMB
RMD
        LDI     HIGH (BGBUF+40)
        PHI     RC
        LDI     LOW (BGBUF+40)
        PLO     RC
        LDI     HIGH (PAGE+40)
        PHI     RD
        LDI     LOW (PAGE+40)
        PLO     RD
        LDI     HIGH (880)
        PHI     RE
        LDI     LOW (880)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
        LDI     HIGH (BGBUF+40)
        PHI     RC
        LDI     LOW (BGBUF+40)
        PLO     RC
        LDI     HIGH (SHADOW+40)
        PHI     RD
        LDI     LOW (SHADOW+40)
        PLO     RD
        LDI     HIGH (880)
        PHI     RE
        LDI     LOW (880)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
        LDI     HIGH (ON)
        PHI     RA
        LDI     LOW (ON)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (NN)
        PHI     RA
        LDI     LOW (NN)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R5
ENTER
        LDI     HIGH (TGX)
        PHI     RA
        LDI     LOW (TGX)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (GX)
        PHI     RA
        LDI     LOW (GX)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (TGY)
        PHI     RA
        LDI     LOW (TGY)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (GY)
        PHI     RA
        LDI     LOW (GY)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    FINDXY
        PLO     R7
        LDI     HIGH (RIDX)
        PHI     RA
        LDI     LOW (RIDX)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (TPTR)
        PHI     RA
        LDI     LOW (TPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDI     HIGH (RPTR)
        PHI     RA
        LDI     LOW (RPTR)
        PLO     RA
        GHI     RB
        STR     RA
        INC     RA
        GLO     RB
        STR     RA
        LDI     HIGH (DYT)
        PHI     RA
        LDI     LOW (DYT)
        PLO     RA
        LDN     RA
        LBZ     EN1
        LDI     HIGH (DYT)
        PHI     RA
        LDI     LOW (DYT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (DYN)
        PHI     RA
        LDI     LOW (DYN)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        SEP     R4
        WORD    DYND
EN1
        LDI     HIGH (BOOMT)
        PHI     RA
        LDI     LOW (BOOMT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (BEAMT)
        PHI     RA
        LDI     LOW (BEAMT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (ENX)
        PHI     RA
        LDI     LOW (ENX)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (ENY)
        PHI     RA
        LDI     LOW (ENY)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    VIDOFF
        SEP     R4
        WORD    QFLUSH
        SEP     R4
        WORD    ROOMDRAW
        SEP     R4
        WORD    VIDON
        LDI     HIGH (FCNT)
        PHI     RA
        LDI     LOW (FCNT)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R5
TRYROOM
        SEP     R4
        WORD    FINDXY
        XRI     0FFH
        LBZ     TRN
        SEP     R4
        WORD    ENTER
        LDI     0
        SEP     R5
TRN     LDI     1
        SEP     R5
KILLH
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    KHX
        LDI     HIGH (INV)
        PHI     RA
        LDI     LOW (INV)
        PLO     RA
        LDN     RA
        LBNZ    KHX
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDI     24
        STR     RA
        LDI     HIGH (LIFT)
        PHI     RA
        LDI     LOW (LIFT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (DRIFT)
        PHI     RA
        LDI     LOW (DRIFT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (BEAMT)
        PHI     RA
        LDI     LOW (BEAMT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (0888H)
        PHI     RC
        LDI     LOW (0888H)
        PLO     RC
        LDI     20
        SEP     R4
        WORD    NOISE
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (1428H)
        PHI     RC
        LDI     LOW (1428H)
        PLO     RC
        LDI     24
        SEP     R4
        WORD    SOUND
KHX     SEP     R5
INPUT
        LDI     HIGH (KLR)
        PHI     RA
        LDI     LOW (KLR)
        PLO     RA
        LDN     RA
        LBZ     IN0
        PLO     R9
        LDI     0
        STR     RA
        GLO     R9
        PLO     R7
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        GLO     R7
        STR     RA
        GLO     R9
        XRI     K_LEFT
        LBNZ    INR
        LDI     HIGH (FACE)
        PHI     RA
        LDI     LOW (FACE)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (DRIFT)
        PHI     RA
        LDI     LOW (DRIFT)
        PLO     RA
        LDI     255
        STR     RA
        LBR     IN0
INR
        LDI     HIGH (FACE)
        PHI     RA
        LDI     LOW (FACE)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (DRIFT)
        PHI     RA
        LDI     LOW (DRIFT)
        PLO     RA
        LDI     1
        STR     RA
IN0
        LDI     HIGH (KEY)
        PHI     RA
        LDI     LOW (KEY)
        PLO     RA
        LDN     RA
        LBZ     IN5
        PLO     R9
        LDI     HIGH (KEY)
        PHI     RA
        LDI     LOW (KEY)
        PLO     RA
        LDI     0
        STR     RA
        GLO     R9
        SMI     82H
        LBNF    IN1
        SMI     4
        LBDF    IN1
        GLO     R9
        PLO     R7
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        GLO     R7
        STR     RA
IN1     GLO     R9
        SMI     82H
        LBNF    IN1F
        SMI     4
        LBNF    IN2
IN1F
        LDI     HIGH (BEAMT)
        PHI     RA
        LDI     LOW (BEAMT)
        PLO     RA
        LDN     RA
        LBNZ    IN5
        LDI     HIGH (BEAMT)
        PHI     RA
        LDI     LOW (BEAMT)
        PLO     RA
        LDI     3
        STR     RA
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     2
        STR     RA
        LDI     HIGH (0538H)
        PHI     RC
        LDI     LOW (0538H)
        PLO     RC
        LDI     3
        SEP     R4
        WORD    SOUND
        LBR     IN5
IN2     GLO     R9
        XRI     K_DOWN
        LBNZ    IN3
        LDI     HIGH (GRND)
        PHI     RA
        LDI     LOW (GRND)
        PLO     RA
        LDN     RA
        LBNZ    IN2A
        LDI     HIGH (DRIFT)
        PHI     RA
        LDI     LOW (DRIFT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (LIFT)
        PHI     RA
        LDI     LOW (LIFT)
        PLO     RA
        LDI     0
        STR     RA
        LBR     IN5
IN2A
        LDI     HIGH (DYT)
        PHI     RA
        LDI     LOW (DYT)
        PLO     RA
        LDN     RA
        LBNZ    IN5
        LDI     HIGH (BOOMT)
        PHI     RA
        LDI     LOW (BOOMT)
        PLO     RA
        LDN     RA
        LBNZ    IN5
        LDI     HIGH (DYN)
        PHI     RA
        LDI     LOW (DYN)
        PLO     RA
        LDN     RA
        LBZ     IN5
        LDI     HIGH (DYN)
        PHI     RA
        LDI     LOW (DYN)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        SEP     R4
        WORD    DYND
        LDI     HIGH (DYT)
        PHI     RA
        LDI     LOW (DYT)
        PLO     RA
        LDI     16
        STR     RA
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDN     RA
        ADI     1
        PLO     R7
        LDI     HIGH (DYR)
        PHI     RA
        LDI     LOW (DYR)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (FACE)
        PHI     RA
        LDI     LOW (FACE)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        LDN     RA
        ADD
        PLO     R7
        LDI     HIGH (DYC)
        PHI     RA
        LDI     LOW (DYC)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (2028H)
        PHI     RC
        LDI     LOW (2028H)
        PLO     RC
        LDI     3
        SEP     R4
        WORD    SOUND
        LBR     IN5
IN3     GLO     R9
        XRI     K_LEFT
        LBNZ    IN4
        LDI     HIGH (FACE)
        PHI     RA
        LDI     LOW (FACE)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (DRIFT)
        PHI     RA
        LDI     LOW (DRIFT)
        PLO     RA
        LDI     255
        STR     RA
        LBR     IN5
IN4     GLO     R9
        XRI     K_RIGHT
        LBNZ    IN4A
        LDI     HIGH (FACE)
        PHI     RA
        LDI     LOW (FACE)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (DRIFT)
        PHI     RA
        LDI     LOW (DRIFT)
        PLO     RA
        LDI     1
        STR     RA
        LBR     IN5
IN4A    GLO     R9
        XRI     K_UP
        LBNZ    IN5
        LDI     HIGH (LIFT)
        PHI     RA
        LDI     LOW (LIFT)
        PLO     RA
        LDI     3
        STR     RA
IN5
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        LBZ     IN9
        B2      IN6
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDI     0
        STR     RA
        LBR     IN9
IN6
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        XRI     K_UP
        LBNZ    IN7
        LDI     HIGH (LIFT)
        PHI     RA
        LDI     LOW (LIFT)
        PLO     RA
        LDI     3
        STR     RA
        LBR     IN9
IN7
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        XRI     K_LEFT
        LBNZ    IN8
        LDI     HIGH (FACE)
        PHI     RA
        LDI     LOW (FACE)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (DRIFT)
        PHI     RA
        LDI     LOW (DRIFT)
        PLO     RA
        LDI     255
        STR     RA
        LBR     IN9
IN8
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        XRI     K_RIGHT
        LBNZ    IN9
        LDI     HIGH (FACE)
        PHI     RA
        LDI     LOW (FACE)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (DRIFT)
        PHI     RA
        LDI     LOW (DRIFT)
        PLO     RA
        LDI     1
        STR     RA
IN9     SEP     R5
MOVE
        LDI     HIGH (DRIFT)
        PHI     RA
        LDI     LOW (DRIFT)
        PLO     RA
        LDN     RA
        LBZ     MV5
        STR     R2
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        LDN     RA
        ADD
        PLO     R9
        XRI     0FFH
        LBNZ    MV1
        LDI     HIGH (GX)
        PHI     RA
        LDI     LOW (GX)
        PLO     RA
        LDN     RA
        SMI     1
        PLO     R7
        LDI     HIGH (TGX)
        PHI     RA
        LDI     LOW (TGX)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (GY)
        PHI     RA
        LDI     LOW (GY)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (TGY)
        PHI     RA
        LDI     LOW (TGY)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        LDI     38
        STR     RA
        SEP     R4
        WORD    TRYROOM
        LBZ     MVX
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (DRIFT)
        PHI     RA
        LDI     LOW (DRIFT)
        PLO     RA
        LDI     0
        STR     RA
        LBR     MV5
MV1     GLO     R9
        XRI     39
        LBNZ    MV2
        LDI     HIGH (GX)
        PHI     RA
        LDI     LOW (GX)
        PLO     RA
        LDN     RA
        ADI     1
        PLO     R7
        LDI     HIGH (TGX)
        PHI     RA
        LDI     LOW (TGX)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (GY)
        PHI     RA
        LDI     LOW (GY)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (TGY)
        PHI     RA
        LDI     LOW (TGY)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R4
        WORD    TRYROOM
        LBZ     MVX
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        LDI     38
        STR     RA
        LDI     HIGH (DRIFT)
        PHI     RA
        LDI     LOW (DRIFT)
        PLO     RA
        LDI     0
        STR     RA
        LBR     MV5
MV2
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDN     RA
        PHI     RE
        LDI     HIGH (DRIFT)
        PHI     RA
        LDI     LOW (DRIFT)
        PLO     RA
        LDN     RA
        ANI     80H
        LBNZ    MV3
        GLO     R9
        ADI     1
        LBR     MV4
MV3     GLO     R9
MV4     PLO     RE
        SEP     R4
        WORD    PAIRV
        LBZ     MV4A
        XRI     3
        LBZ     MVL
        LDI     HIGH (DRIFT)
        PHI     RA
        LDI     LOW (DRIFT)
        PLO     RA
        LDI     0
        STR     RA
        LBR     MV5
MV4A    GLO     R9
        PLO     R7
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        GLO     R7
        STR     RA
MV5
        LDI     HIGH (GRND)
        PHI     RA
        LDI     LOW (GRND)
        PLO     RA
        LDN     RA
        LBZ     MV6
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        XRI     K_LEFT
        LBZ     MV6
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        XRI     K_RIGHT
        LBZ     MV6
        LDI     HIGH (DRIFT)
        PHI     RA
        LDI     LOW (DRIFT)
        PLO     RA
        LDI     0
        STR     RA
MV6
        LDI     HIGH (LIFT)
        PHI     RA
        LDI     LOW (LIFT)
        PLO     RA
        LDN     RA
        LBZ     MV8
        SMI     1
        STR     RA
        LDI     HIGH (GRND)
        PHI     RA
        LDI     LOW (GRND)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (JET)
        PHI     RA
        LDI     LOW (JET)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (0288H)
        PHI     RC
        LDI     LOW (0288H)
        PLO     RC
        LDI     2
        SEP     R4
        WORD    NOISE
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDN     RA
        SMI     1
        LBNZ    MV7
        LDI     HIGH (GX)
        PHI     RA
        LDI     LOW (GX)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (TGX)
        PHI     RA
        LDI     LOW (TGX)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (GY)
        PHI     RA
        LDI     LOW (GY)
        PLO     RA
        LDN     RA
        SMI     1
        PLO     R7
        LDI     HIGH (TGY)
        PHI     RA
        LDI     LOW (TGY)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDI     21
        STR     RA
        SEP     R4
        WORD    TRYROOM
        LBZ     MVX
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (LIFT)
        PHI     RA
        LDI     LOW (LIFT)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R5
MV7     PHI     RE
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        LDN     RA
        PLO     RE
        SEP     R4
        WORD    PAIRH
        LBZ     MV7A
        XRI     3
        LBZ     MVL
        LDI     HIGH (LIFT)
        PHI     RA
        LDI     LOW (LIFT)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R5
MV7A
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        SEP     R5
MV8
        LDI     HIGH (JET)
        PHI     RA
        LDI     LOW (JET)
        PLO     RA
        LDN     RA
        LBZ     MV8A
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        XRI     K_LEFT
        LBZ     MV8H
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        XRI     K_RIGHT
        LBNZ    MV8A
MV8H
        LDI     HIGH (0288H)
        PHI     RC
        LDI     LOW (0288H)
        PLO     RC
        LDI     2
        SEP     R4
        WORD    NOISE
        SEP     R5
MV8A
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDN     RA
        XRI     21
        LBNZ    MV9
        LDI     HIGH (GX)
        PHI     RA
        LDI     LOW (GX)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (TGX)
        PHI     RA
        LDI     LOW (TGX)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (GY)
        PHI     RA
        LDI     LOW (GY)
        PLO     RA
        LDN     RA
        ADI     1
        PLO     R7
        LDI     HIGH (TGY)
        PHI     RA
        LDI     LOW (TGY)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R4
        WORD    TRYROOM
        LBZ     MVX
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDI     21
        STR     RA
        LDI     HIGH (GRND)
        PHI     RA
        LDI     LOW (GRND)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R5
MV9
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDN     RA
        ADI     2
        PHI     RE
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        LDN     RA
        PLO     RE
        SEP     R4
        WORD    PAIRH
        LBZ     MV9A
        XRI     3
        LBZ     MVL
        LDI     HIGH (GRND)
        PHI     RA
        LDI     LOW (GRND)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (JET)
        PHI     RA
        LDI     LOW (JET)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R5
MV9A
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (GRND)
        PHI     RA
        LDI     LOW (GRND)
        PLO     RA
        LDI     0
        STR     RA
MVX     SEP     R5
MVL
        LBR     KILLH
HEROBOX
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OA0)
        PHI     RA
        LDI     LOW (OA0)
        PLO     RA
        GLO     R7
        STR     RA
        ADI     1
        PLO     R7
        LDI     HIGH (OA1)
        PHI     RA
        LDI     LOW (OA1)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OA2)
        PHI     RA
        LDI     LOW (OA2)
        PLO     RA
        GLO     R7
        STR     RA
        ADI     1
        PLO     R7
        LDI     HIGH (OA3)
        PHI     RA
        LDI     LOW (OA3)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R5
OVL
        LDI     HIGH (OA0)
        PHI     RA
        LDI     LOW (OA0)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (OA5)
        PHI     RA
        LDI     LOW (OA5)
        PLO     RA
        LDN     RA
        SM
        LBNF    OVN
        LDI     HIGH (OA4)
        PHI     RA
        LDI     LOW (OA4)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (OA1)
        PHI     RA
        LDI     LOW (OA1)
        PLO     RA
        LDN     RA
        SM
        LBNF    OVN
        LDI     HIGH (OA2)
        PHI     RA
        LDI     LOW (OA2)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (OA7)
        PHI     RA
        LDI     LOW (OA7)
        PLO     RA
        LDN     RA
        SM
        LBNF    OVN
        LDI     HIGH (OA6)
        PHI     RA
        LDI     LOW (OA6)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (OA3)
        PHI     RA
        LDI     LOW (OA3)
        PLO     RA
        LDN     RA
        SM
        LBNF    OVN
        LDI     1
        SEP     R5
OVN     LDI     0
        SEP     R5
CBOX
        GLO     R8
        ADI     LOW CC
        PLO     RA
        LDI     HIGH CC
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OA4)
        PHI     RA
        LDI     LOW (OA4)
        PLO     RA
        GLO     R7
        STR     RA
        PLO     R7
        LDI     HIGH (OA5)
        PHI     RA
        LDI     LOW (OA5)
        PLO     RA
        GLO     R7
        STR     RA
        GLO     R8
        ADI     LOW CT
        PLO     RA
        LDI     HIGH CT
        ADCI    0
        PHI     RA
        LDN     RA
        XRI     2
        LBNZ    CB1
        LDI     HIGH (OA5)
        PHI     RA
        LDI     LOW (OA5)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
CB1
        GLO     R8
        ADI     LOW CR
        PLO     RA
        LDI     HIGH CR
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OA6)
        PHI     RA
        LDI     LOW (OA6)
        PLO     RA
        GLO     R7
        STR     RA
        PLO     R7
        LDI     HIGH (OA7)
        PHI     RA
        LDI     LOW (OA7)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R5
CKILL
        GLO     R8
        ADI     LOW CK
        PLO     RA
        LDI     HIGH CK
        ADCI    0
        PHI     RA
        LDI     4
        STR     RA
        GLO     R8
        ADI     4
        PLO     R7
        LDI     HIGH (WIDX)
        PHI     RA
        LDI     LOW (WIDX)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    WALLBIT
        STR     R2
        LDN     RA
        OR
        STR     RA
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     3
        STR     RA
        LDI     HIGH (0A28H)
        PHI     RC
        LDI     LOW (0A28H)
        PLO     RC
        LDI     6
        SEP     R4
        WORD    SOUND
        LDI     HIGH (SCORE+4)
        PHI     RB
        LDI     LOW (SCORE+4)
        PLO     RB
        LDI     5
        SEP     R4
        WORD    ADDSC
        SEP     R5
HITBOX   LDI     0
        PLO     R8
HB1
        GLO     R8
        ADI     LOW CT
        PLO     RA
        LDI     HIGH CT
        ADCI    0
        PHI     RA
        LDN     RA
        LBZ     HB2
        GLO     R8
        ADI     LOW CK
        PLO     RA
        LDI     HIGH CK
        ADCI    0
        PHI     RA
        LDN     RA
        LBNZ    HB2
        SEP     R4
        WORD    CBOX
        SEP     R4
        WORD    OVL
        LBZ     HB2
        SEP     R4
        WORD    CKILL
HB2     INC     R8
        GLO     R8
        XRI     4
        LBNZ    HB1
        SEP     R5
COLLIDE
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    COX
        SEP     R4
        WORD    HEROBOX
        LDI     0
        PLO     R8
CO1
        GLO     R8
        ADI     LOW CT
        PLO     RA
        LDI     HIGH CT
        ADCI    0
        PHI     RA
        LDN     RA
        LBZ     CO2
        GLO     R8
        ADI     LOW CK
        PLO     RA
        LDI     HIGH CK
        ADCI    0
        PHI     RA
        LDN     RA
        LBNZ    CO2
        SEP     R4
        WORD    CBOX
        SEP     R4
        WORD    OVL
        LBZ     CO2
        SEP     R4
        WORD    KILLH
CO2     INC     R8
        GLO     R8
        XRI     4
        LBNZ    CO1
        LDI     HIGH (MINON)
        PHI     RA
        LDI     LOW (MINON)
        PLO     RA
        LDN     RA
        LBZ     COX
        LDI     HIGH (MINC)
        PHI     RA
        LDI     LOW (MINC)
        PLO     RA
        LDN     RA
        SMI     1
        PLO     R7
        LDI     HIGH (OA4)
        PHI     RA
        LDI     LOW (OA4)
        PLO     RA
        GLO     R7
        STR     RA
        ADI     3
        PLO     R7
        LDI     HIGH (OA5)
        PHI     RA
        LDI     LOW (OA5)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (MINR)
        PHI     RA
        LDI     LOW (MINR)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OA6)
        PHI     RA
        LDI     LOW (OA6)
        PLO     RA
        GLO     R7
        STR     RA
        ADI     1
        PLO     R7
        LDI     HIGH (OA7)
        PHI     RA
        LDI     LOW (OA7)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    OVL
        LBZ     COX
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     4
        STR     RA
COX     SEP     R5
CRIT
        LDI     HIGH (ANIM)
        PHI     RA
        LDI     LOW (ANIM)
        PLO     RA
        LDN     RA
        ANI     1
        LBZ     CRX
        LDI     0
        PLO     R8
CR1
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
        GLO     R8
        ADI     LOW CT
        PLO     RA
        LDI     HIGH CT
        ADCI    0
        PHI     RA
        LDN     RA
        LBZ     CR9
        PLO     R9
        GLO     R8
        ADI     LOW CK
        PLO     RA
        LDI     HIGH CK
        ADCI    0
        PHI     RA
        LDN     RA
        LBNZ    CR9
        GLO     R9
        XRI     1
        LBZ     CRV
        GLO     R8
        ADI     LOW CD
        PLO     RA
        LDI     HIGH CD
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        GLO     R8
        ADI     LOW CC
        PLO     RA
        LDI     HIGH CC
        ADCI    0
        PHI     RA
        LDN     RA
        ADD
        PLO     RE
        SMI     40
        LBDF    CRH2
        GLO     R8
        ADI     LOW CR
        PLO     RA
        LDI     HIGH CR
        ADCI    0
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     R9
        XRI     2
        LBNZ    CRH1
        GLO     RE
        SMI     39
        LBDF    CRH2
        SEP     R4
        WORD    PAIRH
        LBNZ    CRH2
        LBR     CRH3
CRH1
        SEP     R4
        WORD    KINDAT
        LBNZ    CRH2
CRH3
        GLO     R8
        ADI     LOW CC
        PLO     RA
        LDI     HIGH CC
        ADCI    0
        PHI     RA
        GLO     RE
        STR     RA
        LBR     CRH4
CRH2
        GLO     R8
        ADI     LOW CD
        PLO     RA
        LDI     HIGH CD
        ADCI    0
        PHI     RA
        LDN     RA
        XRI     0FEH
        STR     RA
CRH4    GLO     R9
        XRI     3
        LBNZ    CR9
CRV
        GLO     R8
        ADI     LOW CV
        PLO     RA
        LDI     HIGH CV
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        GLO     R8
        ADI     LOW CR
        PLO     RA
        LDI     HIGH CR
        ADCI    0
        PHI     RA
        LDN     RA
        ADD
        PHI     RE
        LBZ     CRV2
        SMI     23
        LBDF    CRV2
        GLO     R8
        ADI     LOW CC
        PLO     RA
        LDI     HIGH CC
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     RE
        SEP     R4
        WORD    KINDAT
        LBNZ    CRV2
        GLO     R8
        ADI     LOW CR
        PLO     RA
        LDI     HIGH CR
        ADCI    0
        PHI     RA
        GHI     RE
        STR     RA
        LBR     CR9
CRV2
        GLO     R8
        ADI     LOW CV
        PLO     RA
        LDI     HIGH CV
        ADCI    0
        PHI     RA
        LDN     RA
        XRI     0FEH
        STR     RA
CR9     INC     R8
        GLO     R8
        XRI     4
        LBNZ    CR1
CRX     SEP     R5
DYNAM
        LDI     HIGH (DYT)
        PHI     RA
        LDI     LOW (DYT)
        PLO     RA
        LDN     RA
        LBZ     DY9
        SMI     1
        STR     RA
        LBNZ    DY9
        LDI     HIGH (DYR)
        PHI     RA
        LDI     LOW (DYR)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (BMR)
        PHI     RA
        LDI     LOW (BMR)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (DYC)
        PHI     RA
        LDI     LOW (DYC)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (BMC)
        PHI     RA
        LDI     LOW (BMC)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BOOMT)
        PHI     RA
        LDI     LOW (BOOMT)
        PLO     RA
        LDI     5
        STR     RA
        LDI     HIGH (0F88H)
        PHI     RC
        LDI     LOW (0F88H)
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
        LDI     HIGH (3828H)
        PHI     RC
        LDI     LOW (3828H)
        PLO     RC
        LDI     20
        SEP     R4
        WORD    SOUND
        SEX     R3
        OUT     3
        BYTE    R3ON+4
        SEX     R2
        LDI     HIGH (BMC)
        PHI     RA
        LDI     LOW (BMC)
        PLO     RA
        LDN     RA
        SMI     3
        LBDF    DYA
        LDI     0
DYA
        PLO     R7
        LDI     HIGH (OA0)
        PHI     RA
        LDI     LOW (OA0)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BMC)
        PHI     RA
        LDI     LOW (BMC)
        PLO     RA
        LDN     RA
        ADI     3
        PLO     R7
        LDI     HIGH (OA1)
        PHI     RA
        LDI     LOW (OA1)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BMR)
        PHI     RA
        LDI     LOW (BMR)
        PLO     RA
        LDN     RA
        SMI     3
        LBDF    DYB
        LDI     0
DYB
        PLO     R7
        LDI     HIGH (OA2)
        PHI     RA
        LDI     LOW (OA2)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BMR)
        PHI     RA
        LDI     LOW (BMR)
        PLO     RA
        LDN     RA
        ADI     1
        PLO     R7
        LDI     HIGH (OA3)
        PHI     RA
        LDI     LOW (OA3)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    HITBOX
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    DYC1
        LDI     HIGH (BMC)
        PHI     RA
        LDI     LOW (BMC)
        PLO     RA
        LDN     RA
        SMI     2
        LBDF    DYD
        LDI     0
DYD
        PLO     R7
        LDI     HIGH (OA4)
        PHI     RA
        LDI     LOW (OA4)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BMC)
        PHI     RA
        LDI     LOW (BMC)
        PLO     RA
        LDN     RA
        ADI     2
        PLO     R7
        LDI     HIGH (OA5)
        PHI     RA
        LDI     LOW (OA5)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BMR)
        PHI     RA
        LDI     LOW (BMR)
        PLO     RA
        LDN     RA
        SMI     2
        PLO     R7
        LDI     HIGH (OA6)
        PHI     RA
        LDI     LOW (OA6)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BMR)
        PHI     RA
        LDI     LOW (BMR)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OA7)
        PHI     RA
        LDI     LOW (OA7)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OA0)
        PHI     RA
        LDI     LOW (OA0)
        PLO     RA
        GLO     R7
        STR     RA
        ADI     1
        PLO     R7
        LDI     HIGH (OA1)
        PHI     RA
        LDI     LOW (OA1)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OA2)
        PHI     RA
        LDI     LOW (OA2)
        PLO     RA
        GLO     R7
        STR     RA
        ADI     1
        PLO     R7
        LDI     HIGH (OA3)
        PHI     RA
        LDI     LOW (OA3)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    OVL
        LBZ     DYC1
        SEP     R4
        WORD    KILLH
DYC1
        LDI     HIGH (BMC)
        PHI     RA
        LDI     LOW (BMC)
        PLO     RA
        LDN     RA
        SMI     3
        LBDF    DYE
        LDI     0
DYE
        PLO     R7
        LDI     HIGH (OA4)
        PHI     RA
        LDI     LOW (OA4)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BMC)
        PHI     RA
        LDI     LOW (BMC)
        PLO     RA
        LDN     RA
        ADI     3
        PLO     R7
        LDI     HIGH (OA5)
        PHI     RA
        LDI     LOW (OA5)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BMR)
        PHI     RA
        LDI     LOW (BMR)
        PLO     RA
        LDN     RA
        SMI     6
        LBDF    DYF
        LDI     1
DYF
        PLO     R7
        LDI     HIGH (OA6)
        PHI     RA
        LDI     LOW (OA6)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BMR)
        PHI     RA
        LDI     LOW (BMR)
        PLO     RA
        LDN     RA
        ADI     1
        PLO     R7
        LDI     HIGH (OA7)
        PHI     RA
        LDI     LOW (OA7)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (RPTR)
        PHI     RA
        LDI     LOW (RPTR)
        PLO     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDI     HIGH (WIDX)
        PHI     RA
        LDI     LOW (WIDX)
        PLO     RA
        LDI     0
        STR     RA
DW1
        SEP     R4
        WORD    RDOPS
        LBZ     DY9
        XRI     2
        LBNZ    DW1
        LDI     HIGH (BC1)
        PHI     RA
        LDI     LOW (BC1)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OA0)
        PHI     RA
        LDI     LOW (OA0)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BC2)
        PHI     RA
        LDI     LOW (BC2)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OA1)
        PHI     RA
        LDI     LOW (OA1)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BR1)
        PHI     RA
        LDI     LOW (BR1)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OA2)
        PHI     RA
        LDI     LOW (OA2)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BR2)
        PHI     RA
        LDI     LOW (BR2)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OA3)
        PHI     RA
        LDI     LOW (OA3)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    WALLBIT
        STR     R2
        LDN     RA
        AND
        LBNZ    DW8
        SEP     R4
        WORD    OVL
        LBZ     DW8
        SEP     R4
        WORD    WALLBIT
        STR     R2
        LDN     RA
        OR
        STR     RA
        GHI     RB
        STXD
        GLO     RB
        STXD
        LDI     HIGH (SCORE+4)
        PHI     RB
        LDI     LOW (SCORE+4)
        PLO     RB
        LDI     7
        SEP     R4
        WORD    ADDSC
        LDI     HIGH (SCORE+5)
        PHI     RB
        LDI     LOW (SCORE+5)
        PLO     RB
        LDI     5
        SEP     R4
        WORD    ADDSC
        IRX
        LDXA
        PLO     RB
        LDX
        PHI     RB
        LDI     HIGH (0F88H)
        PHI     RC
        LDI     LOW (0F88H)
        PLO     RC
        LDI     10
        SEP     R4
        WORD    NOISE
        LDI     HIGH (BR1)
        PHI     RA
        LDI     LOW (BR1)
        PLO     RA
        LDN     RA
        PHI     RE
DW2
        LDI     HIGH (BC1)
        PHI     RA
        LDI     LOW (BC1)
        PLO     RA
        LDN     RA
        PLO     RE
DW3     LDI     1
        PHI     R7
        LDI     20H
        SEP     R1
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
        LDI     HIGH (BC2)
        PHI     RA
        LDI     LOW (BC2)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        XOR
        LBZ     DW4
        INC     RE
        LBR     DW3
DW4
        LDI     HIGH (BR2)
        PHI     RA
        LDI     LOW (BR2)
        PLO     RA
        LDN     RA
        STR     R2
        GHI     RE
        XOR
        LBZ     DW8
        GHI     RE
        ADI     1
        PHI     RE
        LBR     DW2
DW8
        LDI     HIGH (WIDX)
        PHI     RA
        LDI     LOW (WIDX)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     DW1
DY9
        LDI     HIGH (BOOMT)
        PHI     RA
        LDI     LOW (BOOMT)
        PLO     RA
        LDN     RA
        XRI     4
        LBNZ    DYX
        SEX     R3
        OUT     3
        BYTE    R3ON
        SEX     R2
DYX     SEP     R5
BEAM
        LDI     HIGH (BEAMT)
        PHI     RA
        LDI     LOW (BEAMT)
        PLO     RA
        LDN     RA
        LBZ     BMX
        SMI     1
        STR     RA
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDN     RA
        PHI     RE
        LDI     0
        PLO     R8
        LDI     HIGH (FACE)
        PHI     RA
        LDI     LOW (FACE)
        PLO     RA
        LDN     RA
        LBNZ    BML
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        LDN     RA
        ADI     2
        PLO     RE
        PLO     R7
        LDI     HIGH (BL)
        PHI     RA
        LDI     LOW (BL)
        PLO     RA
        GLO     R7
        STR     RA
BR1L    GLO     RE
        SMI     40
        LBDF    BM9
        SEP     R4
        WORD    KINDAT
        LBNZ    BM9
        GLO     RE
        PLO     R7
        LDI     HIGH (BH)
        PHI     RA
        LDI     LOW (BH)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     219
        SEP     R4
        WORD    SPUT
        INC     R8
        GLO     R8
        XRI     8
        LBZ     BM9
        INC     RE
        LBR     BR1L
BML
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        LDN     RA
        LBZ     BMX
        SMI     1
        PLO     RE
        PLO     R7
        LDI     HIGH (BH)
        PHI     RA
        LDI     LOW (BH)
        PLO     RA
        GLO     R7
        STR     RA
BR2L
        SEP     R4
        WORD    KINDAT
        LBNZ    BM9
        GLO     RE
        PLO     R7
        LDI     HIGH (BL)
        PHI     RA
        LDI     LOW (BL)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     219
        SEP     R4
        WORD    SPUT
        INC     R8
        GLO     R8
        XRI     8
        LBZ     BM9
        GLO     RE
        LBZ     BM9
        DEC     RE
        LBR     BR2L
BM9     GLO     R8
        LBZ     BMX
        LDI     HIGH (BL)
        PHI     RA
        LDI     LOW (BL)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OA0)
        PHI     RA
        LDI     LOW (OA0)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (BH)
        PHI     RA
        LDI     LOW (BH)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OA1)
        PHI     RA
        LDI     LOW (OA1)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OA2)
        PHI     RA
        LDI     LOW (OA2)
        PLO     RA
        GLO     R7
        STR     RA
        ADI     1
        PLO     R7
        LDI     HIGH (OA3)
        PHI     RA
        LDI     LOW (OA3)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    HITBOX
BMX     SEP     R5
DRAW
        LDI     HIGH (MINON)
        PHI     RA
        LDI     LOW (MINON)
        PLO     RA
        LDN     RA
        LBZ     DR1
        LDI     HIGH (MINR)
        PHI     RA
        LDI     LOW (MINR)
        PLO     RA
        LDN     RA
        PHI     RE
        LDI     HIGH (MINC)
        PHI     RA
        LDI     LOW (MINC)
        PLO     RA
        LDN     RA
        PLO     RE
        LDI     HIGH (ANIM)
        PHI     RA
        LDI     LOW (ANIM)
        PLO     RA
        LDN     RA
        ANI     8
        SHR
        ADI     LOW MNCH
        PLO     RB
        LDI     HIGH MNCH
        ADCI    0
        PHI     RB
        LDA     RB
        SEP     R4
        WORD    SPUT
        INC     RE
        LDA     RB
        SEP     R4
        WORD    SPUT
        DEC     RE
        GHI     RE
        ADI     1
        PHI     RE
        LDA     RB
        SEP     R4
        WORD    SPUT
        INC     RE
        LDA     RB
        SEP     R4
        WORD    SPUT
DR1     LDI     0
        PLO     R8
DR2
        GLO     R8
        ADI     LOW CT
        PLO     RA
        LDI     HIGH CT
        ADCI    0
        PHI     RA
        LDN     RA
        LBZ     DR5
        PLO     R9
        GLO     R8
        ADI     LOW CR
        PLO     RA
        LDI     HIGH CR
        ADCI    0
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     R8
        ADI     LOW CC
        PLO     RA
        LDI     HIGH CC
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     RE
        GLO     R8
        ADI     LOW CK
        PLO     RA
        LDI     HIGH CK
        ADCI    0
        PHI     RA
        LDN     RA
        LBZ     DR3
        SMI     1
        STR     RA
        LBNZ    DR2A
        GLO     R8
        ADI     LOW CT
        PLO     RA
        LDI     HIGH CT
        ADCI    0
        PHI     RA
        LDI     0
        STR     RA
        LBR     DR5
DR2A
        LDI     223
        SEP     R4
        WORD    SPUT
        GLO     R9
        XRI     2
        LBNZ    DR5
        INC     RE
        LDI     223
        SEP     R4
        WORD    SPUT
        LBR     DR5
DR3
        LDI     HIGH (ANIM)
        PHI     RA
        LDI     LOW (ANIM)
        PLO     RA
        LDN     RA
        ANI     2
        STR     R2
        GLO     R9
        SHL
        SHL
        ADD
        ADI     LOW CRCH
        PLO     RB
        LDI     HIGH CRCH
        ADCI    0
        PHI     RB
        LDA     RB
        SEP     R4
        WORD    SPUT
        LDN     RB
        LBZ     DR5
        INC     RE
        SEP     R4
        WORD    SPUT
DR5     INC     R8
        GLO     R8
        XRI     4
        LBNZ    DR2
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
        LDI     HIGH (DYT)
        PHI     RA
        LDI     LOW (DYT)
        PLO     RA
        LDN     RA
        LBZ     DR6
        LDI     HIGH (DYR)
        PHI     RA
        LDI     LOW (DYR)
        PLO     RA
        LDN     RA
        PHI     RE
        LDI     HIGH (DYC)
        PHI     RA
        LDI     LOW (DYC)
        PLO     RA
        LDN     RA
        PLO     RE
        LDI     HIGH (DYT)
        PHI     RA
        LDI     LOW (DYT)
        PLO     RA
        LDN     RA
        ANI     2
        LBZ     DR5A
        LDI     221
        LBR     DR5B
DR5A    LDI     220
DR5B
        SEP     R4
        WORD    SPUT
DR6
        LDI     HIGH (BOOMT)
        PHI     RA
        LDI     LOW (BOOMT)
        PLO     RA
        LDN     RA
        LBZ     DR8
        SMI     1
        STR     RA
        LDI     HIGH (BMR)
        PHI     RA
        LDI     LOW (BMR)
        PLO     RA
        LDN     RA
        SMI     1
        PHI     RE
        LDI     2
        PLO     R9
DR6A
        LDI     HIGH (BMC)
        PHI     RA
        LDI     LOW (BMC)
        PLO     RA
        LDN     RA
        SMI     1
        LBDF    DR6B
        LDI     0
DR6B    PLO     RE
        LDI     3
        PLO     R8
DR6C    GLO     RE
        SMI     40
        LBDF    DR6D
        LDI     HIGH (BOOMT)
        PHI     RA
        LDI     LOW (BOOMT)
        PLO     RA
        LDN     RA
        ANI     1
        LBZ     DR6E
        LDI     222
        LBR     DR6F
DR6E    LDI     223
DR6F
        SEP     R4
        WORD    SPUT
        INC     RE
        DEC     R8
        GLO     R8
        LBNZ    DR6C
DR6D    GHI     RE
        ADI     1
        PHI     RE
        DEC     R9
        GLO     R9
        LBNZ    DR6A
DR8
        SEP     R4
        WORD    BEAM
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
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        ANI     2
        LBNZ    DR9
        LDI     HIGH (INV)
        PHI     RA
        LDI     LOW (INV)
        PLO     RA
        LDN     RA
        ANI     1
        LBNZ    DR9
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        LDN     RA
        PHI     RE
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        LDN     RA
        PLO     RE
        LDI     HIGH (LIFT)
        PHI     RA
        LDI     LOW (LIFT)
        PLO     RA
        LDN     RA
        LBNZ    DR8B
        LDI     HIGH (JET)
        PHI     RA
        LDI     LOW (JET)
        PLO     RA
        LDN     RA
        LBZ     DR8A
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        XRI     K_LEFT
        LBZ     DR8B
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        XRI     K_RIGHT
        LBZ     DR8B
DR8A    LDI     0
        LBR     DR8C
DR8B    LDI     4
DR8C    STR     R2
        LDI     HIGH (FACE)
        PHI     RA
        LDI     LOW (FACE)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SHL
        ADD
        ADI     LOW HCH
        PLO     RB
        LDI     HIGH HCH
        ADCI    0
        PHI     RB
        LDA     RB
        SEP     R4
        WORD    SPUT
        INC     RE
        LDA     RB
        SEP     R4
        WORD    SPUT
        DEC     RE
        GHI     RE
        ADI     1
        PHI     RE
        LDA     RB
        SEP     R4
        WORD    SPUT
        INC     RE
        LDA     RB
        SEP     R4
        WORD    SPUT
DR9
        SEP     R4
        WORD    SYNC
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
ASX
        LDI     HIGH (SCD)
        PHI     RA
        LDI     LOW (SCD)
        PLO     RA
        LDI     1
        STR     RA
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
ICONS   GLO     R8
        LBZ     IC2
        DEC     R8
        GLO     R9
        LBR     IC3
IC2     LDI     20H
IC3     SEP     R1
        INC     RE
        GHI     R8
        SMI     1
        PHI     R8
        LBNZ    ICONS
        SEP     R5
DYND
        LDI     HIGH (21)
        PHI     RE
        LDI     LOW (21)
        PLO     RE
        LDI     HIGH (DYN)
        PHI     RA
        LDI     LOW (DYN)
        PLO     RA
        LDN     RA
        PLO     R8
        LDI     6
        PHI     R8
        LDI     226
        PLO     R9
        LBR     ICONS
LIVESD
        LDI     HIGH (33)
        PHI     RE
        LDI     LOW (33)
        PLO     RE
        LDI     HIGH (LIVES)
        PHI     RA
        LDI     LOW (LIVES)
        PLO     RA
        LDN     RA
        PLO     R8
        LDI     5
        PHI     R8
        LDI     97
        PLO     R9
        LBR     ICONS
DRAWBAR
        LDI     HIGH (5894)
        PHI     RE
        LDI     LOW (5894)
        PLO     RE
        LDI     HIGH (POWER)
        PHI     RA
        LDI     LOW (POWER)
        PLO     RA
        LDN     RA
        PLO     R8
        LDI     30
        PHI     R8
        LDI     224
        PLO     R9
        LBR     ICONS
POWERT
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    PWX
        LDI     HIGH (PSUB)
        PHI     RA
        LDI     LOW (PSUB)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    PWX
        LDI     HIGH (PRATE)
        PHI     RA
        LDI     LOW (PRATE)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (PSUB)
        PHI     RA
        LDI     LOW (PSUB)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (POWER)
        PHI     RA
        LDI     LOW (POWER)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        ADI     6
        PLO     RE
        LDI     23
        PHI     RE
        LDI     20H
        SEP     R1
        LDI     HIGH (POWER)
        PHI     RA
        LDI     LOW (POWER)
        PLO     RA
        LDN     RA
        LBZ     PW2
        SMI     6
        LBDF    PWX
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
        LDI     2
        SEP     R4
        WORD    SOUND
PWX     SEP     R5
PW2
        LBR     KILLH
HUD
        LDI     HIGH (TX1)
        PHI     RB
        LDI     LOW (TX1)
        PLO     RB
        LDI     HIGH (0)
        PHI     RE
        LDI     LOW (0)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX2)
        PHI     RB
        LDI     LOW (TX2)
        PLO     RB
        LDI     HIGH (13)
        PHI     RE
        LDI     LOW (13)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX3)
        PHI     RB
        LDI     LOW (TX3)
        PLO     RB
        LDI     HIGH (5888)
        PHI     RE
        LDI     LOW (5888)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (18)
        PHI     RE
        LDI     LOW (18)
        PLO     RE
        SEP     R4
        WORD    LVDIG
        SEP     R1
        LDI     HIGH (SCD)
        PHI     RA
        LDI     LOW (SCD)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R4
        WORD    SCORED
        SEP     R4
        WORD    DYND
        SEP     R4
        WORD    LIVESD
        SEP     R4
        WORD    DRAWBAR
        SEP     R5
LVDIG
        LDI     HIGH (LEVEL)
        PHI     RA
        LDI     LOW (LEVEL)
        PLO     RA
        LDN     RA
        SMI     10
        LBNF    LVD1
        LDI     8
LVD1    ADI     0BAH
        SEP     R5
MSG     LDI     80H
        PLO     R8
        LBR     PRQ
RESTROW LDI     0
        SEP     R1
        INC     RE
        DEC     R9
        GLO     R9
        LBNZ    RESTROW
        SEP     R5
DYING
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBZ     DGX
        SMI     1
        STR     RA
        LBNZ    DGX
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
        LBNZ    DG1
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R5
DG1
        SEP     R4
        WORD    RESPAWN
DGX     SEP     R5
RESPAWN
        LDI     HIGH (ENX)
        PHI     RA
        LDI     LOW (ENX)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (HX)
        PHI     RA
        LDI     LOW (HX)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (ENY)
        PHI     RA
        LDI     LOW (ENY)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (HY)
        PHI     RA
        LDI     LOW (HY)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (POWER)
        PHI     RA
        LDI     LOW (POWER)
        PLO     RA
        LDI     30
        STR     RA
        LDI     HIGH (PRATE)
        PHI     RA
        LDI     LOW (PRATE)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (PSUB)
        PHI     RA
        LDI     LOW (PSUB)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    DRAWBAR
        LDI     HIGH (DYN)
        PHI     RA
        LDI     LOW (DYN)
        PLO     RA
        LDI     6
        STR     RA
        SEP     R4
        WORD    DYND
        LDI     HIGH (INV)
        PHI     RA
        LDI     LOW (INV)
        PLO     RA
        LDI     20
        STR     RA
        LDI     HIGH (LIFT)
        PHI     RA
        LDI     LOW (LIFT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (DRIFT)
        PHI     RA
        LDI     LOW (DRIFT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (GRND)
        PHI     RA
        LDI     LOW (GRND)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (JET)
        PHI     RA
        LDI     LOW (JET)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (DYT)
        PHI     RA
        LDI     LOW (DYT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (BOOMT)
        PHI     RA
        LDI     LOW (BOOMT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (BEAMT)
        PHI     RA
        LDI     LOW (BEAMT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (KEY)
        PHI     RA
        LDI     LOW (KEY)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R5
NEWLEVEL
        LDI     HIGH (LEVEL)
        PHI     RA
        LDI     LOW (LEVEL)
        PLO     RA
        LDN     RA
        SMI     1
        ANI     7
        PLO     R9
        SMI     LEVN
        LBNF    NL1
        PLO     R9
NL1     GLO     R9
        SHL
        ADI     LOW LVTAB
        PLO     RA
        LDI     HIGH LVTAB
        ADCI    0
        PHI     RA
        LDA     RA
        PHI     RB
        LDN     RA
        PLO     RB
        LDI     HIGH (LVPTR)
        PHI     RA
        LDI     LOW (LVPTR)
        PLO     RA
        GHI     RB
        STR     RA
        INC     RA
        GLO     RB
        STR     RA
        LDI     HIGH (ROOMF)
        PHI     RD
        LDI     LOW (ROOMF)
        PLO     RD
        LDI     HIGH (8)
        PHI     RE
        LDI     LOW (8)
        PLO     RE
        LDI     0
        SEP     R4
        WORD    FILL
        LDI     HIGH (LEVEL)
        PHI     RA
        LDI     LOW (LEVEL)
        PLO     RA
        LDN     RA
        SHL
        STR     R2
        LDI     32
        SM
        LBNF    NL2
        SMI     14
        LBDF    NL3
NL2     LDI     0
NL3     ADI     14
        PLO     R7
        LDI     HIGH (PRATE)
        PHI     RA
        LDI     LOW (PRATE)
        PLO     RA
        GLO     R7
        STR     RA
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
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R4
        WORD    HUD
        LDI     HIGH (DIRECT)
        PHI     RA
        LDI     LOW (DIRECT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (ENX)
        PHI     RA
        LDI     LOW (ENX)
        PLO     RA
        LDI     19
        STR     RA
        LDI     HIGH (ENY)
        PHI     RA
        LDI     LOW (ENY)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (DYT)
        PHI     RA
        LDI     LOW (DYT)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R4
        WORD    RESPAWN
        LDI     HIGH (INV)
        PHI     RA
        LDI     LOW (INV)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TGX)
        PHI     RA
        LDI     LOW (TGX)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TGY)
        PHI     RA
        LDI     LOW (TGY)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R4
        WORD    ENTER
        SEP     R5
INIT
        SEP     R4
        WORD    VIDINIT
        SEP     R4
        WORD    VIDOFF
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
        LDI     HIGH (NEWMAP)
        PHI     RD
        LDI     LOW (NEWMAP)
        PLO     RD
        LDI     HIGH (960)
        PHI     RE
        LDI     LOW (960)
        PLO     RE
        LDI     0
        SEP     R4
        WORD    FILL
        LDI     HIGH (NN)
        PHI     RA
        LDI     LOW (NN)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (ON)
        PHI     RA
        LDI     LOW (ON)
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
        LDI     HIGH (ON)
        PHI     RA
        LDI     LOW (ON)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (NN)
        PHI     RA
        LDI     LOW (NN)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TX4)
        PHI     RB
        LDI     LOW (TX4)
        PLO     RB
        LDI     HIGH (270)
        PHI     RE
        LDI     LOW (270)
        PLO     RE
        LDI     128
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX5)
        PHI     RB
        LDI     LOW (TX5)
        PLO     RB
        LDI     HIGH (774)
        PHI     RE
        LDI     LOW (774)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX6)
        PHI     RB
        LDI     LOW (TX6)
        PLO     RB
        LDI     HIGH (1030)
        PHI     RE
        LDI     LOW (1030)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX7)
        PHI     RB
        LDI     LOW (TX7)
        PLO     RB
        LDI     HIGH (1286)
        PHI     RE
        LDI     LOW (1286)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX8)
        PHI     RB
        LDI     LOW (TX8)
        PLO     RB
        LDI     HIGH (3334)
        PHI     RE
        LDI     LOW (3334)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX9)
        PHI     RB
        LDI     LOW (TX9)
        PLO     RB
        LDI     HIGH (3590)
        PHI     RE
        LDI     LOW (3590)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX10)
        PHI     RB
        LDI     LOW (TX10)
        PLO     RB
        LDI     HIGH (3846)
        PHI     RE
        LDI     LOW (3846)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX11)
        PHI     RB
        LDI     LOW (TX11)
        PLO     RB
        LDI     HIGH (2819)
        PHI     RE
        LDI     LOW (2819)
        PLO     RE
        LDI     128
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX12)
        PHI     RB
        LDI     LOW (TX12)
        PLO     RB
        LDI     HIGH (4102)
        PHI     RE
        LDI     LOW (4102)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX13)
        PHI     RB
        LDI     LOW (TX13)
        PLO     RB
        LDI     HIGH (4358)
        PHI     RE
        LDI     LOW (4358)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX14)
        PHI     RB
        LDI     LOW (TX14)
        PLO     RB
        LDI     HIGH (4614)
        PHI     RE
        LDI     LOW (4614)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX15)
        PHI     RB
        LDI     LOW (TX15)
        PLO     RB
        LDI     HIGH (5126)
        PHI     RE
        LDI     LOW (5126)
        PLO     RE
        LDI     128
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (TX16)
        PHI     RB
        LDI     LOW (TX16)
        PLO     RB
        LDI     HIGH (5647)
        PHI     RE
        LDI     LOW (5647)
        PLO     RE
        LDI     0
        PLO     R8
        SEP     R4
        WORD    PRQ
        LDI     HIGH (HISC)
        PHI     RB
        LDI     LOW (HISC)
        PLO     RB
        LDI     HIGH (5650)
        PHI     RE
        LDI     LOW (5650)
        PLO     RE
TI1     LDA     RB
        ADI     0B0H
        SEP     R1
        INC     RE
        GLO     RE
        XRI     24
        LBNZ    TI1
        LDI     HIGH (2055)
        PHI     RE
        LDI     LOW (2055)
        PLO     RE
        LDI     7
        SEP     R1
        LDI     HIGH (2056)
        PHI     RE
        LDI     LOW (2056)
        PLO     RE
        LDI     8
        SEP     R1
        LDI     HIGH (2311)
        PHI     RE
        LDI     LOW (2311)
        PLO     RE
        LDI     11
        SEP     R1
        LDI     HIGH (2312)
        PHI     RE
        LDI     LOW (2312)
        PLO     RE
        LDI     12
        SEP     R1
        LDI     HIGH (2061)
        PHI     RE
        LDI     LOW (2061)
        PLO     RE
        LDI     147
        SEP     R1
        LDI     HIGH (2062)
        PHI     RE
        LDI     LOW (2062)
        PLO     RE
        LDI     151
        SEP     R1
        LDI     HIGH (2317)
        PHI     RE
        LDI     LOW (2317)
        PLO     RE
        LDI     149
        SEP     R1
        LDI     HIGH (2318)
        PHI     RE
        LDI     LOW (2318)
        PLO     RE
        LDI     150
        SEP     R1
        LDI     HIGH (2067)
        PHI     RE
        LDI     LOW (2067)
        PLO     RE
        LDI     154
        SEP     R1
        LDI     HIGH (2068)
        PHI     RE
        LDI     LOW (2068)
        PLO     RE
        LDI     155
        SEP     R1
        LDI     HIGH (2328)
        PHI     RE
        LDI     LOW (2328)
        PLO     RE
        LDI     152
        SEP     R1
        LDI     HIGH (2076)
        PHI     RE
        LDI     LOW (2076)
        PLO     RE
        LDI     158
        SEP     R1
        LDI     HIGH (2579)
        PHI     RE
        LDI     LOW (2579)
        PLO     RE
        LDI     1
        SEP     R1
        LDI     HIGH (2580)
        PHI     RE
        LDI     LOW (2580)
        PLO     RE
        LDI     131
        SEP     R1
        LDI     HIGH (2581)
        PHI     RE
        LDI     LOW (2581)
        PLO     RE
        LDI     131
        SEP     R1
        LDI     HIGH (2582)
        PHI     RE
        LDI     LOW (2582)
        PLO     RE
        LDI     2
        SEP     R1
        LDI     HIGH (2586)
        PHI     RE
        LDI     LOW (2586)
        PLO     RE
        LDI     132
        SEP     R1
        LDI     HIGH (2587)
        PHI     RE
        LDI     LOW (2587)
        PLO     RE
        LDI     132
        SEP     R1
        LDI     HIGH (2588)
        PHI     RE
        LDI     LOW (2588)
        PLO     RE
        LDI     132
        SEP     R1
        LDI     HIGH (2591)
        PHI     RE
        LDI     LOW (2591)
        PLO     RE
        LDI     220
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
        LDI     HIGH (2832)
        PHI     RE
        LDI     LOW (2832)
        PLO     RE
        SEP     R4
        WORD    MSG
        LDI     HIGH (2837)
        PHI     RE
        LDI     LOW (2837)
        PLO     RE
        SEP     R4
        WORD    LVDIG
        SEP     R1
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
        LDI     HIGH (2832)
        PHI     RE
        LDI     LOW (2832)
        PLO     RE
        LDI     8
        PLO     R9
        SEP     R4
        WORD    RESTROW
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     0
        STR     RA
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
        WORD    GETKEY
        LBZ     MN1
        PLO     R9
        XRI     K_ESC
        LBZ     TITLE
        GLO     R9
        XRI     K_LEFT
        LBZ     MN0
        GLO     R9
        XRI     K_RIGHT
        LBZ     MN0
        GLO     R9
        PLO     R7
        LDI     HIGH (KEY)
        PHI     RA
        LDI     LOW (KEY)
        PLO     RA
        GLO     R7
        STR     RA
        LBR     MN1
MN0     GLO     R9
        PLO     R7
        LDI     HIGH (KLR)
        PHI     RA
        LDI     LOW (KLR)
        PLO     RA
        GLO     R7
        STR     RA
MN1
        LDI     HIGH (FCNT)
        PHI     RA
        LDI     LOW (FCNT)
        PLO     RA
        LDN     RA
        SMI     6
        LBNF    MAINW
        STR     RA
        SMI     6
        LBNF    MN1C
        LDI     5
        STR     RA
MN1C
        LDI     HIGH (ANIM)
        PHI     RA
        LDI     LOW (ANIM)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (INV)
        PHI     RA
        LDI     LOW (INV)
        PLO     RA
        LDN     RA
        LBZ     MN2
        SMI     1
        STR     RA
MN2
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    MN3
        SEP     R4
        WORD    INPUT
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
        SEP     R4
        WORD    MOVE
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
MN3
        SEP     R4
        WORD    CRIT
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
        WORD    DYNAM
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
        WORD    COLLIDE
        SEP     R4
        WORD    POWERT
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
        WORD    DRAW
        SEP     R4
        WORD    SCORED
        SEP     R4
        WORD    DYING
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDN     RA
        LBZ     MAINW
        XRI     4
        LBZ     LVDONE
        LDI     HIGH (TXOVER)
        PHI     RB
        LDI     LOW (TXOVER)
        PLO     RB
        LDI     HIGH (2831)
        PHI     RE
        LDI     LOW (2831)
        PLO     RE
        SEP     R4
        WORD    MSG
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
        SEP     R4
        WORD    DRAW
        LDI     HIGH (TXWELL)
        PHI     RB
        LDI     LOW (TXWELL)
        PLO     RB
        LDI     HIGH (2828)
        PHI     RE
        LDI     LOW (2828)
        PLO     RE
        SEP     R4
        WORD    MSG
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
        LDI     90
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
LDP
        LDI     HIGH (POWER)
        PHI     RA
        LDI     LOW (POWER)
        PLO     RA
        LDN     RA
        LBZ     LDQ
        SMI     1
        STR     RA
        ADI     6
        PLO     RE
        LDI     23
        PHI     RE
        LDI     20H
        SEP     R1
        LDI     HIGH (SCORE+4)
        PHI     RB
        LDI     LOW (SCORE+4)
        PLO     RB
        LDI     5
        SEP     R4
        WORD    ADDSC
        SEP     R4
        WORD    SCORED
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (0828H)
        PHI     RC
        LDI     LOW (0828H)
        PLO     RC
        LDI     2
        SEP     R4
        WORD    SOUND
        LDI     3
        SEP     R4
        WORD    WAITN
        SEP     R4
        WORD    QFLUSHW
        LBR     LDP
LDQ
        LDI     HIGH (DYN)
        PHI     RA
        LDI     LOW (DYN)
        PLO     RA
        LDN     RA
        LBZ     LDR
        SMI     1
        STR     RA
        SEP     R4
        WORD    DYND
        LDI     HIGH (SCORE+4)
        PHI     RB
        LDI     LOW (SCORE+4)
        PLO     RB
        LDI     5
        SEP     R4
        WORD    ADDSC
        SEP     R4
        WORD    SCORED
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (1028H)
        PHI     RC
        LDI     LOW (1028H)
        PLO     RC
        LDI     4
        SEP     R4
        WORD    SOUND
        LDI     8
        SEP     R4
        WORD    WAITN
        SEP     R4
        WORD    QFLUSHW
        LBR     LDQ
LDR
        LDI     HIGH (SCORE+2)
        PHI     RB
        LDI     LOW (SCORE+2)
        PLO     RB
        LDI     1
        SEP     R4
        WORD    ADDSC
        SEP     R4
        WORD    SCORED
        SEP     R4
        WORD    QFLUSHW
        LDI     60
        SEP     R4
        WORD    WAITN
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
BITS    BYTE    001H, 002H, 004H, 008H, 010H, 020H, 040H, 080H
KINDS   BYTE    000H, 001H, 001H, 002H, 003H, 003H, 001H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 004H, 004H, 004H, 004H, 004H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
HCH     BYTE    007H, 008H, 009H, 00AH, 007H, 008H, 00BH, 00CH, 00DH, 00EH, 00FH, 010H, 00DH, 00EH, 011H, 012H
MNCH    BYTE    093H, 094H, 095H, 096H, 093H, 097H, 095H, 096H
CRCH    BYTE    000H, 000H, 000H, 000H, 098H, 000H, 099H, 000H, 09AH, 09BH, 09CH, 09DH, 09EH, 000H, 09FH, 000H
LEVN    EQU     5
LVTAB
        WORD    LEV0
        WORD    LEV1
        WORD    LEV2
        WORD    LEV3
        WORD    LEV4
LEV0    BYTE    2
        BYTE    0,0
        WORD    RM0_0
        BYTE    0,1
        WORD    RM0_1
RM0_0   BYTE    001H, 001H, 011H, 00CH, 016H, 001H, 009H, 003H, 00EH, 024H, 002H, 009H, 01AH, 00EH, 01BH, 001H
        BYTE    009H, 01FH, 016H, 024H, 000H, 000H
RM0_1   BYTE    001H, 001H, 01FH, 008H, 024H, 001H, 006H, 003H, 00BH, 024H, 000H, 002H, 007H, 014H, 004H, 00AH
        BYTE    005H, 000H
LEV1    BYTE    3
        BYTE    0,0
        WORD    RM1_0
        BYTE    0,1
        WORD    RM1_1
        BYTE    0,2
        WORD    RM1_2
RM1_0   BYTE    001H, 001H, 011H, 006H, 016H, 001H, 005H, 002H, 00AH, 025H, 002H, 005H, 00AH, 00AH, 00BH, 001H
        BYTE    005H, 002H, 016H, 007H, 000H, 001H, 005H, 01EH, 000H
RM1_1   BYTE    001H, 001H, 002H, 007H, 007H, 001H, 006H, 002H, 00BH, 024H, 003H, 00CH, 00EH, 00CH, 018H, 001H
        BYTE    00AH, 01FH, 016H, 024H, 000H, 003H, 008H, 012H, 000H
RM1_2   BYTE    001H, 001H, 01FH, 006H, 024H, 001H, 005H, 003H, 00AH, 024H, 002H, 005H, 014H, 00AH, 015H, 000H
        BYTE    001H, 005H, 01BH, 004H, 009H, 005H, 000H
LEV2    BYTE    4
        BYTE    0,0
        WORD    RM2_0
        BYTE    0,1
        WORD    RM2_1
        BYTE    1,1
        WORD    RM2_2
        BYTE    1,2
        WORD    RM2_3
RM2_0   BYTE    001H, 001H, 011H, 00AH, 016H, 001H, 008H, 008H, 00DH, 016H, 001H, 008H, 008H, 016H, 00DH, 000H
        BYTE    001H, 009H, 00AH, 000H
RM2_1   BYTE    001H, 001H, 008H, 009H, 00DH, 001H, 007H, 008H, 00CH, 027H, 002H, 007H, 018H, 00CH, 019H, 003H
        BYTE    00DH, 00FH, 00DH, 014H, 000H, 001H, 007H, 020H, 000H
RM2_2   BYTE    001H, 007H, 000H, 00CH, 01EH, 001H, 007H, 019H, 016H, 01EH, 004H, 00DH, 001H, 00DH, 005H, 000H
        BYTE    003H, 009H, 00CH, 000H
RM2_3   BYTE    001H, 001H, 019H, 007H, 01EH, 001H, 005H, 004H, 00AH, 01EH, 003H, 00BH, 008H, 00BH, 010H, 002H
        BYTE    005H, 013H, 00AH, 014H, 000H, 002H, 006H, 00EH, 004H, 009H, 004H, 000H
LEV3    BYTE    4
        BYTE    0,0
        WORD    RM3_0
        BYTE    0,1
        WORD    RM3_1
        BYTE    0,2
        WORD    RM3_2
        BYTE    0,3
        WORD    RM3_3
RM3_0   BYTE    001H, 001H, 011H, 016H, 016H, 003H, 006H, 010H, 00CH, 010H, 003H, 00EH, 017H, 012H, 017H, 000H
        BYTE    001H, 008H, 016H, 000H
RM3_1   BYTE    001H, 001H, 011H, 006H, 016H, 001H, 005H, 011H, 00AH, 024H, 002H, 005H, 01AH, 00AH, 01BH, 001H
        BYTE    009H, 020H, 016H, 024H, 000H, 003H, 007H, 016H, 000H
RM3_2   BYTE    001H, 001H, 020H, 006H, 024H, 001H, 005H, 004H, 00AH, 024H, 003H, 00BH, 00CH, 00BH, 01CH, 001H
        BYTE    009H, 004H, 016H, 009H, 000H, 002H, 006H, 014H, 000H
RM3_3   BYTE    001H, 001H, 004H, 008H, 009H, 001H, 007H, 004H, 00CH, 023H, 002H, 007H, 00EH, 00CH, 00FH, 002H
        BYTE    007H, 018H, 00CH, 019H, 000H, 001H, 007H, 013H, 004H, 00BH, 020H, 000H
LEV4    BYTE    6
        BYTE    0,0
        WORD    RM4_0
        BYTE    0,1
        WORD    RM4_1
        BYTE    0,2
        WORD    RM4_2
        BYTE    0,3
        WORD    RM4_3
        BYTE    1,3
        WORD    RM4_4
        BYTE    1,4
        WORD    RM4_5
RM4_0   BYTE    001H, 001H, 011H, 008H, 016H, 001H, 007H, 004H, 00CH, 016H, 002H, 007H, 00AH, 00CH, 00BH, 001H
        BYTE    00BH, 004H, 016H, 008H, 000H, 002H, 008H, 005H, 000H
RM4_1   BYTE    001H, 001H, 004H, 009H, 008H, 001H, 008H, 004H, 00DH, 026H, 003H, 00EH, 00CH, 00EH, 01EH, 001H
        BYTE    00CH, 022H, 016H, 026H, 000H, 003H, 00AH, 016H, 001H, 008H, 022H, 000H
RM4_2   BYTE    001H, 001H, 022H, 006H, 026H, 001H, 005H, 006H, 00AH, 026H, 002H, 005H, 01AH, 00AH, 01BH, 001H
        BYTE    009H, 006H, 016H, 00BH, 000H, 002H, 006H, 012H, 000H
RM4_3   BYTE    001H, 001H, 006H, 007H, 00BH, 001H, 006H, 006H, 00BH, 027H, 003H, 006H, 014H, 008H, 015H, 002H
        BYTE    006H, 00EH, 00BH, 00FH, 000H, 001H, 006H, 01EH, 000H
RM4_4   BYTE    001H, 006H, 000H, 00BH, 021H, 001H, 00AH, 01CH, 016H, 021H, 003H, 00CH, 001H, 00CH, 014H, 000H
        BYTE    003H, 008H, 00EH, 000H
RM4_5   BYTE    001H, 001H, 01CH, 006H, 021H, 001H, 005H, 003H, 00AH, 021H, 002H, 005H, 012H, 00AH, 013H, 000H
        BYTE    002H, 007H, 018H, 001H, 005H, 00AH, 004H, 009H, 004H, 000H
TXREADY  TEXT    "CAVE "
        BYTE    0
TXOVER   TEXT    "GAME  OVER"
        BYTE    0
TXWELL   TEXT    "MINER RESCUED!"
        BYTE    0
TX1      TEXT    "SCORE"
        BYTE    0
TX2      TEXT    "CAVE"
        BYTE    0
TX3      TEXT    "POWER"
        BYTE    0
TX4      TEXT    "CAVE  RESCUE"
        BYTE    0
TX5      TEXT    "MINERS ARE TRAPPED UNDERGROUND"
        BYTE    0
TX6      TEXT    "FLY DOWN WITH YOUR JET PACK"
        BYTE    0
TX7      TEXT    "AND BRING THEM HOME"
        BYTE    0
TX8      TEXT    "LEFT RIGHT   WALK OR STEER"
        BYTE    0
TX9      TEXT    "UP (HOLD)    JET PACK"
        BYTE    0
TX10     TEXT    "SPACE        LASER"
        BYTE    0
TX11     TEXT    "IN THE AIR HOLD LEFT/RIGHT TO HOVER"
        BYTE    0
TX12     TEXT    "DOWN         DYNAMITE"
        BYTE    0
TX13     TEXT    "M            MUSIC ON/OFF"
        BYTE    0
TX14     TEXT    "ESC          QUIT"
        BYTE    0
TX15     TEXT    "SPACE        START"
        BYTE    0
TX16     TEXT    "HI"
        BYTE    0
TUNE    BYTE    018H, 009H, 014H, 009H, 010H, 009H, 00CH, 012H, 00DH, 009H, 010H, 009H, 00FH, 012H, 012H, 009H
        BYTE    00FH, 009H, 010H, 01BH, 07FH, 009H, 012H, 009H, 00FH, 009H, 00CH, 009H, 00DH, 009H, 00FH, 009H
        BYTE    010H, 009H, 012H, 009H, 014H, 009H, 015H, 009H, 014H, 009H, 018H, 01BH, 07FH, 01BH, 000H
FANF    BYTE    018H, 006H, 014H, 006H, 010H, 006H, 00CH, 00CH, 010H, 006H, 00CH, 018H, 07FH, 05AH, 000H
CHTAB
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 07FH, 07FH, 07BH, 07FH, 07FH, 067H, 07FH, 07FH
        BYTE    07FH, 077H, 07FH, 07FH, 079H, 07FH, 07FH, 06FH, 07FH, 064H, 07FH, 07FH, 044H, 07FH, 07FH, 064H
        BYTE    089H, 09BH, 0BFH, 037H, 03FH, 03FH, 03FH, 03FH, 0A4H, 0B6H, 0BFH, 03BH, 03FH, 03FH, 03FH, 03FH
        BYTE    0FFH, 0FFH, 0EDH, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C7H, 0CFH, 0CCH, 0CFH, 0C7H, 0BBH, 0BBH, 0BBH
        BYTE    0F0H, 0F8H, 0DCH, 0F8H, 0F0H, 0B8H, 0BDH, 0B6H, 0BBH, 0BBH, 042H, 046H, 046H, 04EH, 0C0H, 0C0H
        BYTE    0B0H, 0B0H, 050H, 058H, 058H, 05CH, 0C0H, 0C0H, 0BBH, 0BBH, 072H, 073H, 056H, 067H, 0D0H, 0C0H
        BYTE    0B0H, 0B0H, 050H, 04CH, 058H, 04EH, 0C0H, 0C0H, 0C3H, 0C7H, 0CEH, 0C7H, 0C3H, 087H, 0AFH, 09BH
        BYTE    0F8H, 0FCH, 0CCH, 0FCH, 0F8H, 0B7H, 0B7H, 0B7H, 083H, 083H, 042H, 046H, 046H, 04EH, 0C0H, 0C0H
        BYTE    0B7H, 0B7H, 050H, 058H, 058H, 05CH, 0C0H, 0C0H, 083H, 083H, 042H, 04CH, 046H, 05CH, 0C0H, 0C0H
        BYTE    0B7H, 0B7H, 053H, 073H, 05AH, 079H, 0C2H, 0C0H, 083H, 087H, 08CH, 087H, 0C5H, 0C3H, 0CFH, 0D3H
        BYTE    0B0H, 0B8H, 08CH, 0B8H, 0E8H, 0F0H, 0FCH, 0F2H, 003H, 007H, 00CH, 00CH, 05CH, 040H, 040H, 040H
        BYTE    030H, 038H, 00CH, 00CH, 04EH, 040H, 040H, 040H, 0B2H, 0BAH, 08EH, 0B8H, 0E8H, 0F0H, 0F8H, 0F0H
        BYTE    0CCH, 0EDH, 0DEH, 0FFH, 0DEH, 0E1H, 0C0H, 0C0H, 0CCH, 0DEH, 0FFH, 0DEH, 0EDH, 0D2H, 0C0H, 0C0H
        BYTE    060H, 071H, 07BH, 07FH, 05BH, 041H, 040H, 040H, 041H, 063H, 077H, 07FH, 076H, 060H, 040H, 040H
        BYTE    040H, 041H, 047H, 04FH, 05FH, 071H, 060H, 040H, 040H, 060H, 078H, 07CH, 07EH, 063H, 041H, 040H
        BYTE    0A1H, 0B3H, 0BFH, 09EH, 0BFH, 0B3H, 080H, 080H, 080H, 0A1H, 0BFH, 09EH, 0BFH, 0A1H, 080H, 080H
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
        BYTE    0DFH, 0C1H, 0C2H, 0C4H, 0C8H, 0D0H, 0DFH, 0C0H, 0C0H, 0C0H, 0C0H, 0FFH, 0FFH, 0C0H, 0C0H, 0C0H
        BYTE    084H, 088H, 018H, 018H, 018H, 018H, 018H, 000H, 0D4H, 0C8H, 018H, 018H, 018H, 018H, 018H, 000H
        BYTE    0A9H, 01EH, 03FH, 03FH, 03FH, 01EH, 025H, 080H, 0E2H, 0C8H, 0D2H, 0C4H, 0E1H, 0CAH, 0E0H, 0C0H
        BYTE    080H, 0BFH, 0BFH, 0BFH, 0BFH, 0BFH, 080H, 080H, 0DEH, 0EDH, 0DEH, 0BFH, 09EH, 092H, 040H, 040H
        BYTE    088H, 098H, 018H, 018H, 018H, 018H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        END
