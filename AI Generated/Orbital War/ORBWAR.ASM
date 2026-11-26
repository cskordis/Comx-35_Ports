;=====================================================================
; ORBWAR.ASM - ORBITAL WAR for the COMX-35 (1802 machine code, A18 syntax)
; An original orbit shooter.  Start: CALL(@4500).
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
EA      EQU     0A400H
ER      EQU     0A410H
ET      EQU     0A420H
EM      EQU     0A430H
EP      EQU     0A440H
EQ_     EQU     0A450H
EOX     EQU     0A460H
EOY     EQU     0A470H
EON     EQU     0A480H
EF      EQU     0A490H
BA      EQU     0A4A0H
BR      EQU     0A4A8H
BON     EQU     0A4B0H
BOX     EQU     0A4B8H
BOY     EQU     0A4C0H
SA      EQU     0A4C8H
SR      EQU     0A4D0H
SON     EQU     0A4D8H
SOX     EQU     0A4E0H
SOY     EQU     0A4E8H
XA      EQU     0A500H
XR      EQU     0A508H
XOX     EQU     0A510H
XOY     EQU     0A518H
XON     EQU     0A520H
EXX     EQU     0A528H
EXY     EQU     0A52CH
EXT     EQU     0A530H
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
HUDF    EQU     0AA20H
FRM     EQU     0AA21H
LASTD   EQU     0AA23H
FCNT    EQU     0AA24H
PA      EQU     0AA25H
POA     EQU     0AA26H
PON     EQU     0AA27H
HELD    EQU     0AA28H
AUTO    EQU     0AA29H
KCNT    EQU     0AA2AH
DEAD    EQU     0AA2BH
DTMR    EQU     0AA2CH
ANIM    EQU     0AA2DH
STAGE   EQU     0AA2EH
PLANET  EQU     0AA2FH
WARP    EQU     0AA30H
LOOP    EQU     0AA31H
NALIVE  EQU     0AA32H
NSPAWN  EQU     0AA33H
GRP     EQU     0AA34H
GTMR    EQU     0AA35H
ATMR    EQU     0AA36H
FTMR    EQU     0AA37H
DOUBLE  EQU     0AA38H
SATT    EQU     0AA39H
WIN     EQU     0AA3AH
WTMR    EQU     0AA3BH
CHANCE  EQU     0AA3CH
HITS    EQU     0AA3DH
HOLDA   EQU     0AA3EH
TMPA    EQU     0AA3FH
TMPB    EQU     0AA40H
SPD     EQU     0AA41H
STRT    EQU     0AA42H
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
        LDI     HIGH (QR)
        PHI     RA
        LDI     LOW (QR)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        SM
        LBZ     VBE
        PLO     R8
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
        DEC     R8
        GLO     R8
        LBNZ    VBQ
        LBR     VBE
VBQ2    DEC     RA
        DEC     RA
        DEC     RA
        LBR     VBS
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
VBS     GLO     RA
        PLO     R7
        LDI     HIGH (QRO)
        PHI     RA
        LDI     LOW (QRO)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     R8
        SD
        PLO     R7
        LDI     HIGH (QR)
        PHI     RA
        LDI     LOW (QR)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R5
; POLAR - angle in D, radius in R9.0 -> RE (row,col)
POLAR   ANI     63
        STR     R2
        GLO     R9
        SHL
        SHL
        SHL
        SHL
        SHL
        SHL
        ADD
        PLO     RC
        GLO     R9
        SHR
        SHR
        ADI     HIGH PTAB
        PHI     RC
        GLO     RC
        STR     R2
        LDN     R2
        PLO     RC
        LDN     RC
        PLO     RE
        GHI     RC
        ADI     5
        PHI     RC
        LDN     RC
        PHI     RE
        SEP     R5
; ESHOW - draw enemy R8 at polar EA/ER
ESHOW
        GLO     R8
        ADI     LOW EA
        PLO     RA
        LDI     HIGH EA
        PHI     RA
        LDN     RA
        PLO     R7
        GLO     R8
        ADI     LOW ER
        PLO     RA
        LDI     HIGH ER
        PHI     RA
        LDN     RA
        PLO     R9
        GLO     R7
        SEP     R4
        WORD    POLAR
        GLO     R8
        ADI     LOW EON
        PLO     RA
        LDI     HIGH EON
        PHI     RA
        LDN     RA
        LBZ     ES2
        GLO     R8
        ADI     LOW EOX
        PLO     RA
        LDI     HIGH EOX
        PHI     RA
        LDN     RA
        STR     R2
        GLO     RE
        XOR
        LBNZ    ES1
        GLO     R8
        ADI     LOW EOY
        PLO     RA
        LDI     HIGH EOY
        PHI     RA
        LDN     RA
        STR     R2
        GHI     RE
        XOR
        LBNZ    ES1
        GLO     R8
        ADI     LOW EF
        PLO     RA
        LDI     HIGH EF
        PHI     RA
        LDN     RA
        STR     R2
        LDI     HIGH (ANIM)
        PHI     RA
        LDI     LOW (ANIM)
        PLO     RA
        LDN     RA
        XOR
        LBZ     ESX
ES1     GHI     RE
        STXD
        GLO     RE
        STXD
        GLO     R8
        ADI     LOW EOY
        PLO     RA
        LDI     HIGH EOY
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     R8
        ADI     LOW EOX
        PLO     RA
        LDI     HIGH EOX
        PHI     RA
        LDN     RA
        PLO     RE
        LDI     0
        SEP     R1
        IRX
        LDXA
        PLO     RE
        LDX
        PHI     RE
ES2
        GLO     R8
        ADI     LOW EOX
        PLO     RA
        LDI     HIGH EOX
        PHI     RA
        GLO     RE
        STR     RA
        GLO     R8
        ADI     LOW EOY
        PLO     RA
        LDI     HIGH EOY
        PHI     RA
        GHI     RE
        STR     RA
        GLO     R8
        ADI     LOW EON
        PLO     RA
        LDI     HIGH EON
        PHI     RA
        LDI     1
        STR     RA
        LDI     HIGH (ANIM)
        PHI     RA
        LDI     LOW (ANIM)
        PLO     RA
        LDN     RA
        PLO     R9
        GLO     R8
        ADI     LOW EF
        PLO     RA
        LDI     HIGH EF
        PHI     RA
        GLO     R9
        STR     RA
        GLO     R8
        ADI     LOW ET
        PLO     RA
        LDI     HIGH ET
        PHI     RA
        LDN     RA
        SHL
        STR     R2
        GLO     R9
        ADD
        ADI     LOW (ECHT-2)
        PLO     RC
        LDI     HIGH (ECHT-2)
        ADCI    0
        PHI     RC
        LDN     RC
        SEP     R1
ESX     SEP     R5
EERASE
        GLO     R8
        ADI     LOW EON
        PLO     RA
        LDI     HIGH EON
        PHI     RA
        LDN     RA
        LBZ     EEX
        LDI     0
        STR     RA
        GLO     R8
        ADI     LOW EOY
        PLO     RA
        LDI     HIGH EOY
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     R8
        ADI     LOW EOX
        PLO     RA
        LDI     HIGH EOX
        PHI     RA
        LDN     RA
        PLO     RE
        LDI     0
        SEP     R1
EEX     SEP     R5
EKILL
        SEP     R4
        WORD    EERASE
        GLO     R8
        ADI     LOW ET
        PLO     RA
        LDI     HIGH ET
        PHI     RA
        LDN     RA
        PLO     R9
        LDI     0
        STR     RA
        LDI     HIGH (NALIVE)
        PHI     RA
        LDI     LOW (NALIVE)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LDI     HIGH (CHANCE)
        PHI     RA
        LDI     LOW (CHANCE)
        PLO     RA
        LDN     RA
        LBZ     EK1
        LDI     HIGH (HITS)
        PHI     RA
        LDI     LOW (HITS)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
EK1     GLO     R9
        XRI     5
        LBNZ    EK2
        LDI     HIGH (DOUBLE)
        PHI     RA
        LDI     LOW (DOUBLE)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (0A1FH)
        PHI     RC
        LDI     LOW (0A1FH)
        PLO     RC
        LDI     30
        SEP     R4
        WORD    SOUND
EK2     GLO     R9
        ADI     LOW (ESCT-1)
        PLO     RC
        LDI     HIGH (ESCT-1)
        ADCI    0
        PHI     RC
        LDN     RC
        SEP     R4
        WORD    ADDSC
        GLO     R8
        ADI     LOW EA
        PLO     RA
        LDI     HIGH EA
        PHI     RA
        LDN     RA
        PLO     R7
        GLO     R8
        ADI     LOW ER
        PLO     RA
        LDI     HIGH ER
        PHI     RA
        LDN     RA
        PLO     R9
        GLO     R7
        SEP     R4
        WORD    POLAR
        SEP     R4
        WORD    EFFECT
        LDI     HIGH (3F88H)
        PHI     RC
        LDI     LOW (3F88H)
        PLO     RC
        LDI     10
        SEP     R4
        WORD    NOISE
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     3
        STR     RA
        LDI     HIGH (201FH)
        PHI     RC
        LDI     LOW (201FH)
        PLO     RC
        LDI     8
        SEP     R4
        WORD    SOUND
        SEP     R5
EFFECT  LDI     0
        PLO     RB
EF1L    GLO     RB
        ADI     LOW EXT
        PLO     RA
        LDI     HIGH EXT
        PHI     RA
        LDN     RA
        LBZ     EF2
        INC     RB
        GLO     RB
        XRI     4
        LBNZ    EF1L
        SEP     R5
EF2     LDI     12
        STR     RA
        GLO     RB
        ADI     LOW EXX
        PLO     RA
        GLO     RE
        STR     RA
        GLO     RB
        ADI     LOW EXY
        PLO     RA
        GHI     RE
        STR     RA
        LDI     228
        SEP     R1
        SEP     R5
EFFECTS LDI     0
        PLO     RB
EFL     GLO     RB
        ADI     LOW EXT
        PLO     RA
        LDI     HIGH EXT
        PHI     RA
        LDN     RA
        LBZ     EFN
        SMI     1
        STR     RA
        PLO     R9
        GLO     RB
        ADI     LOW EXX
        PLO     RA
        LDN     RA
        PLO     RE
        GLO     RB
        ADI     LOW EXY
        PLO     RA
        LDN     RA
        PHI     RE
        GLO     R9
        LBNZ    EFL2
        SEP     R1
        LBR     EFN
EFL2    GLO     R9
        XRI     6
        LBNZ    EFN
        LDI     229
        SEP     R1
EFN     INC     RB
        GLO     RB
        XRI     4
        LBNZ    EFL
        SEP     R5
ADDSC   LBZ     ASX
        PLO     R9
AS1
        LDI     HIGH (SCORE+4)
        PHI     RA
        LDI     LOW (SCORE+4)
        PLO     RA
AS2     LDN     RA
        ADI     1
        STR     RA
        SMI     10
        LBNF    AS3
        STR     RA
        DEC     RA
        GLO     RA
        XRI     LOW (SCORE-1)
        LBNZ    AS2
AS3     DEC     R9
        GLO     R9
        LBNZ    AS1
        LDI     HIGH (HUDF)
        PHI     RA
        LDI     LOW (HUDF)
        PLO     RA
        LDI     1
        STR     RA
ASX     SEP     R5
HUDSC
        LDI     HIGH (HUDF)
        PHI     RA
        LDI     LOW (HUDF)
        PLO     RA
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
HS1     LDA     RB
        ADI     0B0H
        SEP     R1
        INC     RE
        GLO     RE
        XRI     12
        LBNZ    HS1
        SEP     R5
LIVESHOW
        LDI     HIGH (36)
        PHI     RE
        LDI     LOW (36)
        PLO     RE
        LDI     HIGH (LIVES)
        PHI     RA
        LDI     LOW (LIVES)
        PLO     RA
        LDN     RA
        PLO     R9
        LDI     4
        PLO     RB
LS1     GLO     R9
        SMI     2
        LBNF    LS2
        DEC     R9
        LDI     233
        LBR     LS3
LS2     LDI     20H
LS3     SEP     R1
        INC     RE
        DEC     RB
        GLO     RB
        LBNZ    LS1
        SEP     R5
RANDN   PLO     RB
        SEP     R4
        WORD    RAND
        STR     R2
RN1     GLO     RB
        SD
        LBNF    RN2
        STR     R2
        LBR     RN1
RN2     LDN     R2
        SEP     R5
MSGQ    LDA     RC
        LBZ     MQX
        ORI     80H
        PLO     RF
        GLO     RC
        STXD
        GHI     RC
        STXD
        GLO     RF
        SEP     R1
        GLO     RD
        PLO     RC
        GHI     RD
        ADI     0A8H
        PHI     RC
        GLO     RF
        STR     RC
        IRX
        LDXA
        PHI     RC
        LDX
        PLO     RC
        INC     RE
        LBR     MSGQ
MQX     SEP     R5
ADIFF   SM
        ANI     63
        PLO     R7
        SMI     33
        LBNF    AD1
        GLO     R7
        SDI     64
        SEP     R5
AD1     GLO     R7
        SEP     R5
SHIPQ   GLO     R8
        SHL
        ADI     LOW SPOS
        PLO     RB
        LDI     HIGH SPOS
        ADCI    0
        PHI     RB
        LDA     RB
        PHI     RE
        LDN     RB
        PLO     RE
        GLO     R8
        SHL
        SHL
        ADI     LOW SHIPT
        PLO     RB
        LDI     HIGH SHIPT
        ADCI    0
        PHI     RB
        GLO     R9
        LBZ     SQE0
        LDA     RB
        LBR     SQD0
SQE0    LDI     0
SQD0    SEP     R1
        INC     RE
        GLO     R9
        LBZ     SQE1
        LDA     RB
        LBR     SQD1
SQE1    LDI     0
SQD1    SEP     R1
        GHI     RE
        ADI     1
        PHI     RE
        DEC     RE
        GLO     R9
        LBZ     SQE2
        LDA     RB
        LBR     SQD2
SQE2    LDI     0
SQD2    SEP     R1
        INC     RE
        GLO     R9
        LBZ     SQE3
        LDA     RB
        LBR     SQD3
SQE3    LDI     0
SQD3    SEP     R1
        SEP     R5
; PLAYER - keys, orbit, fire
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
        XRI     K_LEFT
        LBZ     PLH
        GLO     R9
        XRI     K_RIGHT
        LBZ     PLH
        GLO     R9
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
        LBR     PL1
PLH     GLO     R9
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
PL1
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        LBZ     PL5
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
        LDI     3
        STR     RA
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        XRI     K_LEFT
        LBNZ    PL3
        LDI     HIGH (PA)
        PHI     RA
        LDI     LOW (PA)
        PLO     RA
        LDN     RA
        ADI     2
        ANI     63
        STR     RA
        LBR     PL5
PL3
        LDI     HIGH (PA)
        PHI     RA
        LDI     LOW (PA)
        PLO     RA
        LDN     RA
        SMI     2
        ANI     63
        STR     RA
PL5
        LDI     HIGH (AUTO)
        PHI     RA
        LDI     LOW (AUTO)
        PLO     RA
        LDN     RA
        LBZ     PL6
        LDI     HIGH (SON)
        PHI     RA
        LDI     LOW (SON)
        PLO     RA
        LDN     RA
        LBNZ    PL6
        SEP     R4
        WORD    FIRE
PL6
        LDI     HIGH (PA)
        PHI     RA
        LDI     LOW (PA)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (POA)
        PHI     RA
        LDI     LOW (POA)
        PLO     RA
        LDN     RA
        XOR
        LBNZ    PL7
        LDI     HIGH (PON)
        PHI     RA
        LDI     LOW (PON)
        PLO     RA
        LDN     RA
        LBZ     PL7
        LDI     HIGH (FRM+1)
        PHI     RA
        LDI     LOW (FRM+1)
        PLO     RA
        LDN     RA
        ANI     3
        LBNZ    PLX
        LBR     PL8
PL7
        LDI     HIGH (PON)
        PHI     RA
        LDI     LOW (PON)
        PLO     RA
        LDN     RA
        LBZ     PL8
        LDI     HIGH (POA)
        PHI     RA
        LDI     LOW (POA)
        PLO     RA
        LDN     RA
        SHR
        PLO     R8
        LDI     0
        PLO     R9
        SEP     R4
        WORD    SHIPQ
PL8
        LDI     HIGH (PA)
        PHI     RA
        LDI     LOW (PA)
        PLO     RA
        LDN     RA
        STR     R2
        PLO     R7
        LDI     HIGH (POA)
        PHI     RA
        LDI     LOW (POA)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (PON)
        PHI     RA
        LDI     LOW (PON)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (PA)
        PHI     RA
        LDI     LOW (PA)
        PLO     RA
        LDN     RA
        SHR
        PLO     R8
        LDI     1
        PLO     R9
        SEP     R4
        WORD    SHIPQ
PLX     SEP     R5
FIRE
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    FIX
        LDI     HIGH (SON)
        PHI     RA
        LDI     LOW (SON)
        PLO     RA
        LDN     RA
        LBNZ    FIX
        LDI     HIGH (SON+1)
        PHI     RA
        LDI     LOW (SON+1)
        PLO     RA
        LDN     RA
        LBNZ    FIX
        LDI     HIGH (PA)
        PHI     RA
        LDI     LOW (PA)
        PLO     RA
        LDN     RA
        SHR
        ADI     LOW SSR
        PLO     RA
        LDI     HIGH SSR
        ADCI    0
        PHI     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (PA)
        PHI     RA
        LDI     LOW (PA)
        PLO     RA
        LDN     RA
        PLO     R9
        LDI     HIGH (SA)
        PHI     RA
        LDI     LOW (SA)
        PLO     RA
        GLO     R9
        STR     RA
        LDI     HIGH (SR)
        PHI     RA
        LDI     LOW (SR)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (SON)
        PHI     RA
        LDI     LOW (SON)
        PLO     RA
        LDI     2
        STR     RA
        LDI     HIGH (DOUBLE)
        PHI     RA
        LDI     LOW (DOUBLE)
        PLO     RA
        LDN     RA
        LBZ     FI2
        LDI     HIGH (SA)
        PHI     RA
        LDI     LOW (SA)
        PLO     RA
        LDN     RA
        INC     RA
        STR     RA
        LDI     HIGH (SR)
        PHI     RA
        LDI     LOW (SR)
        PLO     RA
        GLO     R7
        SMI     1
        STR     RA
        INC     RA
        GLO     R7
        STR     RA
        LDI     HIGH (SON+1)
        PHI     RA
        LDI     LOW (SON+1)
        PLO     RA
        LDI     2
        STR     RA
FI2
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     5
        STR     RA
        LDI     HIGH (0A3FH)
        PHI     RC
        LDI     LOW (0A3FH)
        PLO     RC
        LDI     5
        SEP     R4
        WORD    SOUND
FIX     SEP     R5
SHTAB   BYTE    159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159,159
SHOTS   LDI     0
        PLO     R8
SO0
        GLO     R8
        ADI     LOW SON
        PLO     RA
        LDI     HIGH SON
        PHI     RA
        LDN     RA
        LBZ     SON_
        XRI     2
        LBZ     SO1
        GLO     R8
        ADI     LOW SOY
        PLO     RA
        LDI     HIGH SOY
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     R8
        ADI     LOW SOX
        PLO     RA
        LDI     HIGH SOX
        PHI     RA
        LDN     RA
        PLO     RE
        LDI     0
        SEP     R1
SO1
        GLO     R8
        ADI     LOW SON
        PLO     RA
        LDI     HIGH SON
        PHI     RA
        LDI     1
        STR     RA
        GLO     R8
        ADI     LOW SR
        PLO     RA
        LDI     HIGH SR
        PHI     RA
        LDN     RA
        SMI     1
        STR     RA
        LBZ     SOK
        PLO     R9
        GLO     R8
        ADI     LOW SA
        PLO     RA
        LDI     HIGH SA
        PHI     RA
        LDN     RA
        SEP     R4
        WORD    POLAR
        GLO     R8
        ADI     LOW SOX
        PLO     RA
        LDI     HIGH SOX
        PHI     RA
        GLO     RE
        STR     RA
        GLO     R8
        ADI     LOW SOY
        PLO     RA
        LDI     HIGH SOY
        PHI     RA
        GHI     RE
        STR     RA
        GLO     R8
        STXD
        SEP     R4
        WORD    HITE
        IRX
        LDX
        PLO     R8
        GLO     R7
        LBNZ    SOK
        GLO     R8
        ADI     LOW SOY
        PLO     RA
        LDI     HIGH SOY
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     R8
        ADI     LOW SOX
        PLO     RA
        LDI     HIGH SOX
        PHI     RA
        LDN     RA
        PLO     RE
        GLO     R8
        ADI     LOW SA
        PLO     RA
        LDI     HIGH SA
        PHI     RA
        LDN     RA
        SHR
        ANI     31
        ADI     LOW SHTAB
        PLO     RA
        LDI     HIGH SHTAB
        ADCI    0
        PHI     RA
        LDN     RA
        SEP     R1
        LBR     SON_
SOK
        GLO     R8
        ADI     LOW SON
        PLO     RA
        LDI     HIGH SON
        PHI     RA
        LDI     0
        STR     RA
SON_    INC     R8
        GLO     R8
        XRI     2
        LBNZ    SO0
        SEP     R5
HITE
        GLO     R8
        ADI     LOW SA
        PLO     RA
        LDI     HIGH SA
        PHI     RA
        LDN     RA
        PHI     R9
        GLO     R8
        ADI     LOW SR
        PLO     RA
        LDI     HIGH SR
        PHI     RA
        LDN     RA
        PLO     R9
        LDI     0
        PLO     R7
        PLO     R8
        LDI     HIGH ET
        PHI     RA
HE1     GLO     R8
        ADI     LOW ET
        PLO     RA
        LDN     RA
        LBZ     HE3
        GLO     RA
        SMI     10H
        PLO     RA
        LDN     RA
        STR     R2
        GLO     R9
        SD
        ADI     1
        SMI     3
        LBDF    HE3
        GLO     RA
        SMI     10H
        PLO     RA
        LDN     RA
        STR     R2
        GHI     R9
        SM
        ADI     3
        ANI     63
        SMI     7
        LBDF    HE3
        GLO     R9
        STXD
        GHI     R9
        STXD
        SEP     R4
        WORD    EKILL
        IRX
        LDXA
        PHI     R9
        LDX
        PLO     R9
        LDI     1
        PLO     R7
        SEP     R5
HE3     INC     R8
        GLO     R8
        XRI     16
        LBNZ    HE1
        LDI     0
        PLO     R7
        SEP     R5
BFIRE
        LDI     HIGH (CHANCE)
        PHI     RA
        LDI     LOW (CHANCE)
        PLO     RA
        LDN     RA
        LBNZ    BFX
        LDI     0
        PLO     RB
BF1     GLO     RB
        ADI     LOW BON
        PLO     RA
        LDI     HIGH BON
        PHI     RA
        LDN     RA
        LBZ     BF2
        INC     RB
        GLO     RB
        XRI     8
        LBNZ    BF1
BFX     SEP     R5
BF2     LDI     2
        STR     RA
        GLO     R8
        ADI     LOW EA
        PLO     RA
        LDI     HIGH EA
        PHI     RA
        LDN     RA
        PLO     R7
        GLO     R8
        ADI     LOW ER
        PLO     RA
        LDI     HIGH ER
        PHI     RA
        LDN     RA
        PLO     R9
        GLO     RB
        ADI     LOW BA
        PLO     RA
        GLO     R7
        STR     RA
        GLO     RB
        ADI     LOW BR
        PLO     RA
        GLO     R9
        STR     RA
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (3A18H)
        PHI     RC
        LDI     LOW (3A18H)
        PLO     RC
        LDI     3
        SEP     R4
        WORD    SOUND
        SEP     R5
BULLETS LDI     0
        PLO     R8
BU0
        GLO     R8
        ADI     LOW BON
        PLO     RA
        LDI     HIGH BON
        PHI     RA
        LDN     RA
        LBZ     BUN
        XRI     2
        LBZ     BU1
        GLO     R8
        ADI     LOW BOY
        PLO     RA
        LDI     HIGH BOY
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     R8
        ADI     LOW BOX
        PLO     RA
        LDI     HIGH BOX
        PHI     RA
        LDN     RA
        PLO     RE
        LDI     0
        SEP     R1
BU1
        GLO     R8
        ADI     LOW BON
        PLO     RA
        LDI     HIGH BON
        PHI     RA
        LDI     1
        STR     RA
        GLO     R8
        ADI     LOW BR
        PLO     RA
        LDI     HIGH BR
        PHI     RA
        LDN     RA
        ADI     1
        STR     RA
        SMI     16
        LBNF    BU3
        GLO     R8
        ADI     LOW BA
        PLO     RA
        LDI     HIGH BA
        PHI     RA
        LDN     RA
        STR     R2
        LDI     HIGH (PA)
        PHI     RA
        LDI     LOW (PA)
        PLO     RA
        LDN     RA
        SEP     R4
        WORD    ADIFF
        SMI     2
        LBDF    BUK
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    BUK
        SEP     R4
        WORD    KILLP
        LBR     BUK
BU3
        GLO     R8
        ADI     LOW BR
        PLO     RA
        LDI     HIGH BR
        PHI     RA
        LDN     RA
        PLO     R9
        GLO     R8
        ADI     LOW BA
        PLO     RA
        LDI     HIGH BA
        PHI     RA
        LDN     RA
        SEP     R4
        WORD    POLAR
        GLO     R8
        ADI     LOW BOX
        PLO     RA
        LDI     HIGH BOX
        PHI     RA
        GLO     RE
        STR     RA
        GLO     R8
        ADI     LOW BOY
        PLO     RA
        LDI     HIGH BOY
        PHI     RA
        GHI     RE
        STR     RA
        LDI     227
        SEP     R1
        LBR     BUN
BUK
        GLO     R8
        ADI     LOW BON
        PLO     RA
        LDI     HIGH BON
        PHI     RA
        LDI     0
        STR     RA
BUN     INC     R8
        GLO     R8
        XRI     8
        LBNZ    BU0
BUX     SEP     R5
CLRBUL  LDI     0
        PLO     R8
CB1
        GLO     R8
        ADI     LOW BON
        PLO     RA
        LDI     HIGH BON
        PHI     RA
        LDN     RA
        LBZ     CB2
        LDI     0
        STR     RA
        GLO     R8
        ADI     LOW BOY
        PLO     RA
        LDI     HIGH BOY
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     R8
        ADI     LOW BOX
        PLO     RA
        LDI     HIGH BOX
        PHI     RA
        LDN     RA
        PLO     RE
        LDI     0
        SEP     R1
CB2     INC     R8
        GLO     R8
        XRI     8
        LBNZ    CB1
        SEP     R5
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
        LDI     100
        STR     RA
        LDI     HIGH (DOUBLE)
        PHI     RA
        LDI     LOW (DOUBLE)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (1F88H)
        PHI     RC
        LDI     LOW (1F88H)
        PLO     RC
        LDI     60
        SEP     R4
        WORD    NOISE
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     2
        STR     RA
        LDI     HIGH (101FH)
        PHI     RC
        LDI     LOW (101FH)
        PLO     RC
        LDI     50
        SEP     R4
        WORD    SOUND
        LDI     HIGH (PA)
        PHI     RA
        LDI     LOW (PA)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     16
        PLO     R9
        GLO     R7
        SEP     R4
        WORD    POLAR
        SEP     R4
        WORD    EFFECT
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
        LDI     HIGH (POA)
        PHI     RA
        LDI     LOW (POA)
        PLO     RA
        LDN     RA
        SHR
        PLO     R8
        LDI     0
        PLO     R9
        SEP     R4
        WORD    SHIPQ
        LDI     HIGH (PON)
        PHI     RA
        LDI     LOW (PON)
        PLO     RA
        LDI     0
        STR     RA
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
        SEP     R4
        WORD    LIVESHOW
        SEP     R4
        WORD    CLRBUL
DTX     SEP     R5
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
QFLUSHW LDI     4
        PLO     R9
QW1
        SEP     R4
        WORD    WAITVB
        SEP     R4
        WORD    VBDRAW
        DEC     R9
        GLO     R9
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
; SPAWN - next enemy of the stage
SPAWN
        LDI     HIGH (NSPAWN)
        PHI     RA
        LDI     LOW (NSPAWN)
        PLO     RA
        LDN     RA
        LBZ     SPX
        LDI     HIGH (GTMR)
        PHI     RA
        LDI     LOW (GTMR)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    SPX
        LDI     HIGH (GTMR)
        PHI     RA
        LDI     LOW (GTMR)
        PLO     RA
        LDI     4
        STR     RA
        LDI     0
        PLO     R8
SP1
        GLO     R8
        ADI     LOW ET
        PLO     RA
        LDI     HIGH ET
        PHI     RA
        LDN     RA
        LBZ     SP2
        INC     R8
        GLO     R8
        XRI     16
        LBNZ    SP1
SPX     SEP     R5
SP2
        LDI     HIGH (GRP)
        PHI     RA
        LDI     LOW (GRP)
        PLO     RA
        LDN     RA
        PLO     R9
SP2A    GLO     R9
        SMI     3
        LBNF    SP2B
        PLO     R9
        LBR     SP2A
SP2B    GLO     R9
        ADI     1
        PLO     R9
        GLO     R8
        ADI     LOW ET
        PLO     RA
        LDI     HIGH ET
        PHI     RA
        GLO     R9
        STR     RA
        GLO     R8
        ADI     LOW ER
        PLO     RA
        LDI     HIGH ER
        PHI     RA
        LDI     0
        STR     RA
        GLO     R8
        ADI     LOW EON
        PLO     RA
        LDI     HIGH EON
        PHI     RA
        LDI     0
        STR     RA
        GLO     R8
        ADI     LOW EP
        PLO     RA
        LDI     HIGH EP
        PHI     RA
        LDI     0
        STR     RA
        LDI     HIGH (GRP)
        PHI     RA
        LDI     LOW (GRP)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SHL
        SHL
        PLO     R9
        GLO     R8
        ADI     LOW EA
        PLO     RA
        LDI     HIGH EA
        PHI     RA
        GLO     R9
        STR     RA
        LDI     HIGH (NSPAWN)
        PHI     RA
        LDI     LOW (NSPAWN)
        PLO     RA
        LDN     RA
        ANI     7
        SHL
        SHL
        SHL
        STR     R2
        LDI     HIGH (GRP)
        PHI     RA
        LDI     LOW (GRP)
        PLO     RA
        LDN     RA
        SHL
        ADD
        ANI     63
        PLO     R9
        GLO     R8
        ADI     LOW EQ_
        PLO     RA
        LDI     HIGH EQ_
        PHI     RA
        GLO     R9
        STR     RA
        LDI     HIGH (CHANCE)
        PHI     RA
        LDI     LOW (CHANCE)
        PLO     RA
        LDN     RA
        LBZ     SP3
        LDI     4
        LBR     SP4
SP3     LDI     0
SP4     PLO     R9
        LDI     HIGH (GRP)
        PHI     RA
        LDI     LOW (GRP)
        PLO     RA
        LDN     RA
        ANI     1
        LBZ     SP5
        GLO     R9
        ORI     80H
        PLO     R9
SP5
        GLO     R8
        ADI     LOW EM
        PLO     RA
        LDI     HIGH EM
        PHI     RA
        GLO     R9
        STR     RA
        LDI     HIGH (NALIVE)
        PHI     RA
        LDI     LOW (NALIVE)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (NSPAWN)
        PHI     RA
        LDI     LOW (NSPAWN)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        ANI     7
        LBNZ    SPX
        LDI     HIGH (GRP)
        PHI     RA
        LDI     LOW (GRP)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (GTMR)
        PHI     RA
        LDI     LOW (GTMR)
        PLO     RA
        LDI     50
        STR     RA
        LDI     HIGH (NSPAWN)
        PHI     RA
        LDI     LOW (NSPAWN)
        PLO     RA
        LDN     RA
        XRI     16
        LBNZ    SPX
        LDI     HIGH (CHANCE)
        PHI     RA
        LDI     LOW (CHANCE)
        PLO     RA
        LDN     RA
        LBNZ    SPX
        SEP     R4
        WORD    SATS
        SEP     R5
SATS
        SEP     R4
        WORD    RAND
        ANI     63
        PLO     R7
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (SATT)
        PHI     RA
        LDI     LOW (SATT)
        PLO     RA
        LDI     250
        STR     RA
        LDI     0
        PLO     R8
SA0A
        GLO     R8
        ADI     LOW ET
        PLO     RA
        LDI     HIGH ET
        PHI     RA
        LDN     RA
        LBZ     SA0B
        INC     R8
        GLO     R8
        XRI     16
        LBNZ    SA0A
        SEP     R5
SA0B   LDI     4
        STR     RA
        GLO     R8
        ADI     LOW ER
        PLO     RA
        LDI     HIGH ER
        PHI     RA
        LDI     3
        STR     RA
        GLO     R8
        ADI     LOW EM
        PLO     RA
        LDI     HIGH EM
        PHI     RA
        LDI     6
        STR     RA
        GLO     R8
        ADI     LOW EON
        PLO     RA
        LDI     HIGH EON
        PHI     RA
        LDI     0
        STR     RA
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        LDN     RA
        ADI     0
        PLO     R9
        GLO     R8
        ADI     LOW EA
        PLO     RA
        LDI     HIGH EA
        PHI     RA
        GLO     R9
        STR     RA
        LDI     HIGH (NALIVE)
        PHI     RA
        LDI     LOW (NALIVE)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     0
        PLO     R8
SA1A
        GLO     R8
        ADI     LOW ET
        PLO     RA
        LDI     HIGH ET
        PHI     RA
        LDN     RA
        LBZ     SA1B
        INC     R8
        GLO     R8
        XRI     16
        LBNZ    SA1A
        SEP     R5
SA1B   LDI     5
        STR     RA
        GLO     R8
        ADI     LOW ER
        PLO     RA
        LDI     HIGH ER
        PHI     RA
        LDI     3
        STR     RA
        GLO     R8
        ADI     LOW EM
        PLO     RA
        LDI     HIGH EM
        PHI     RA
        LDI     6
        STR     RA
        GLO     R8
        ADI     LOW EON
        PLO     RA
        LDI     HIGH EON
        PHI     RA
        LDI     0
        STR     RA
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        LDN     RA
        ADI     6
        PLO     R9
        GLO     R8
        ADI     LOW EA
        PLO     RA
        LDI     HIGH EA
        PHI     RA
        GLO     R9
        STR     RA
        LDI     HIGH (NALIVE)
        PHI     RA
        LDI     LOW (NALIVE)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     0
        PLO     R8
SA2A
        GLO     R8
        ADI     LOW ET
        PLO     RA
        LDI     HIGH ET
        PHI     RA
        LDN     RA
        LBZ     SA2B
        INC     R8
        GLO     R8
        XRI     16
        LBNZ    SA2A
        SEP     R5
SA2B   LDI     4
        STR     RA
        GLO     R8
        ADI     LOW ER
        PLO     RA
        LDI     HIGH ER
        PHI     RA
        LDI     3
        STR     RA
        GLO     R8
        ADI     LOW EM
        PLO     RA
        LDI     HIGH EM
        PHI     RA
        LDI     6
        STR     RA
        GLO     R8
        ADI     LOW EON
        PLO     RA
        LDI     HIGH EON
        PHI     RA
        LDI     0
        STR     RA
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        LDN     RA
        ADI     12
        PLO     R9
        GLO     R8
        ADI     LOW EA
        PLO     RA
        LDI     HIGH EA
        PHI     RA
        GLO     R9
        STR     RA
        LDI     HIGH (NALIVE)
        PHI     RA
        LDI     LOW (NALIVE)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        SEP     R5
; ENEMIES - move up to three live enemies (round robin over the 16 slots)
ENEMIES LDI     3
        PHI     R8
        LDI     16
        PHI     RB
EN0
        LDI     HIGH (TMPB)
        PHI     RA
        LDI     LOW (TMPB)
        PLO     RA
        LDN     RA
        ADI     1
        ANI     15
        STR     RA
        PLO     R8
        GLO     R8
        ADI     LOW ET
        PLO     RA
        LDI     HIGH ET
        PHI     RA
        LDN     RA
        LBZ     EN9
        GHI     RB
        STXD
        SEP     R4
        WORD    EMOVE
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
        IRX
        LDX
        PHI     RB
        GHI     R8
        SMI     1
        PHI     R8
        LBZ     ENX
EN9     GHI     RB
        SMI     1
        PHI     RB
        LBNZ    EN0
ENX     SEP     R5
EMOVE
        GLO     R8
        ADI     LOW EM
        PLO     RA
        LDI     HIGH EM
        PHI     RA
        LDN     RA
        ANI     7FH
        PLO     R9
        GLO     R9
        XRI     0
        LBZ     MV0
        GLO     R9
        XRI     1
        LBZ     MV1
        GLO     R9
        XRI     2
        LBZ     MV2
        GLO     R9
        XRI     3
        LBZ     MV3
        GLO     R9
        XRI     4
        LBZ     MV4
        GLO     R9
        XRI     5
        LBZ     MV5
        LBR     MV6
TURN3
        GLO     R8
        ADI     LOW EM
        PLO     RA
        LDI     HIGH EM
        PHI     RA
        LDN     RA
        ANI     80H
        LBZ     TU1
        LDI     61
        LBR     TU2
TU1     LDI     3
TU2     STR     R2
        GLO     R8
        ADI     LOW EA
        PLO     RA
        LDI     HIGH EA
        PHI     RA
        LDN     RA
        ADD
        ANI     63
        STR     RA
        SEP     R5
MV0
        SEP     R4
        WORD    TURN3
        GLO     R8
        ADI     LOW ER
        PLO     RA
        LDI     HIGH ER
        PHI     RA
        LDN     RA
        ADI     1
        STR     RA
        SMI     11
        LBNF    MVD
        GLO     R8
        ADI     LOW EM
        PLO     RA
        LDI     HIGH EM
        PHI     RA
        LDN     RA
        ANI     80H
        ORI     5
        STR     RA
        LBR     MVD
MV5
        GLO     R8
        ADI     LOW ER
        PLO     RA
        LDI     HIGH ER
        PHI     RA
        LDN     RA
        SMI     6
        LBZ     MV5A
        LBNF    MV5B
        LDN     RA
        SMI     1
        STR     RA
        LBR     MV5A
MV5B    LDN     RA
        ADI     1
        STR     RA
MV5A
        GLO     R8
        ADI     LOW EQ_
        PLO     RA
        LDI     HIGH EQ_
        PHI     RA
        LDN     RA
        STR     R2
        LDI     HIGH (HOLDA)
        PHI     RA
        LDI     LOW (HOLDA)
        PLO     RA
        LDN     RA
        ADD
        ANI     63
        STR     R2
        GLO     R8
        ADI     LOW EA
        PLO     RA
        LDI     HIGH EA
        PHI     RA
        LDN     RA
        SEP     R4
        WORD    STEERA
        LBNZ    MVD
        GLO     R8
        ADI     LOW ER
        PLO     RA
        LDI     HIGH ER
        PHI     RA
        LDN     RA
        XRI     6
        LBNZ    MVD
        GLO     R8
        ADI     LOW EM
        PLO     RA
        LDI     HIGH EM
        PHI     RA
        LDN     RA
        ANI     80H
        ORI     1
        STR     RA
        LBR     MVD
STEERA  PLO     R7
        SD
        ANI     63
        PLO     R9
        SMI     3
        LBNF    STA0
        GLO     R9
        SMI     62
        LBDF    STA0
        GLO     R9
        SMI     32
        LBDF    STA2
        GLO     R7
        ADI     2
        LBR     STA3
STA2    GLO     R7
        SMI     2
STA3    ANI     63
        STR     RA
        LDI     1
        SEP     R5
STA0    LDN     R2
        STR     RA
        LDI     0
        SEP     R5
MV1
        GLO     R8
        ADI     LOW EQ_
        PLO     RA
        LDI     HIGH EQ_
        PHI     RA
        LDN     RA
        STR     R2
        LDI     HIGH (HOLDA)
        PHI     RA
        LDI     LOW (HOLDA)
        PLO     RA
        LDN     RA
        ADD
        ANI     63
        PLO     R9
        GLO     R8
        ADI     LOW EA
        PLO     RA
        LDI     HIGH EA
        PHI     RA
        GLO     R9
        STR     RA
        LBR     MVD
MV2
        GLO     R8
        ADI     LOW ER
        PLO     RA
        LDI     HIGH ER
        PHI     RA
        LDN     RA
        ADI     1
        STR     RA
        XRI     9
        LBNZ    MV2A
        SEP     R4
        WORD    BFIRE
MV2A
        LDI     HIGH (PA)
        PHI     RA
        LDI     LOW (PA)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     R8
        ADI     LOW EA
        PLO     RA
        LDI     HIGH EA
        PHI     RA
        LDN     RA
        SEP     R4
        WORD    STEERA
        GLO     R8
        ADI     LOW ER
        PLO     RA
        LDI     HIGH ER
        PHI     RA
        LDN     RA
        SMI     15
        LBNF    MVD
        GLO     R8
        ADI     LOW EA
        PLO     RA
        LDI     HIGH EA
        PHI     RA
        LDN     RA
        STR     R2
        LDI     HIGH (PA)
        PHI     RA
        LDI     LOW (PA)
        PLO     RA
        LDN     RA
        SEP     R4
        WORD    ADIFF
        SMI     3
        LBDF    MV2B
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    MV2B
        SEP     R4
        WORD    KILLP
MV2B
        GLO     R8
        ADI     LOW EM
        PLO     RA
        LDI     HIGH EM
        PHI     RA
        LDN     RA
        ANI     80H
        ORI     3
        STR     RA
        LBR     MVD
MV3
        SEP     R4
        WORD    TURN3
        GLO     R8
        ADI     LOW ER
        PLO     RA
        LDI     HIGH ER
        PHI     RA
        LDN     RA
        SMI     1
        STR     RA
        SMI     6
        LBDF    MVD
        GLO     R8
        ADI     LOW EM
        PLO     RA
        LDI     HIGH EM
        PHI     RA
        LDN     RA
        ANI     80H
        ORI     5
        STR     RA
        LBR     MVD
MV4
        SEP     R4
        WORD    TURN3
        GLO     R8
        ADI     LOW ER
        PLO     RA
        LDI     HIGH ER
        PHI     RA
        LDN     RA
        ADI     1
        STR     RA
        SMI     16
        LBNF    MVD
        SEP     R4
        WORD    EERASE
        GLO     R8
        ADI     LOW ET
        PLO     RA
        LDI     HIGH ET
        PHI     RA
        LDI     0
        STR     RA
        LDI     HIGH (NALIVE)
        PHI     RA
        LDI     LOW (NALIVE)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        SEP     R5
MV6
        GLO     R8
        ADI     LOW EA
        PLO     RA
        LDI     HIGH EA
        PHI     RA
        LDN     RA
        ADI     1
        ANI     63
        STR     RA
MVD
        SEP     R4
        WORD    ESHOW
        SEP     R5
ATTACK
        LDI     HIGH (FRM+1)
        PHI     RA
        LDI     LOW (FRM+1)
        PLO     RA
        LDN     RA
        ANI     15
        XRI     1
        LBNZ    AT1
        LDI     HIGH (HOLDA)
        PHI     RA
        LDI     LOW (HOLDA)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
AT1
        LDI     HIGH (CHANCE)
        PHI     RA
        LDI     LOW (CHANCE)
        PLO     RA
        LDN     RA
        LBNZ    ATX
        LDI     HIGH (ATMR)
        PHI     RA
        LDI     LOW (ATMR)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    ATX
        LDI     HIGH (LOOP)
        PHI     RA
        LDI     LOW (LOOP)
        PLO     RA
        LDN     RA
        SHL
        SHL
        SHL
        SDI     40
        LBDF    AT2
        LDI     8
AT2
        PLO     R7
        LDI     HIGH (ATMR)
        PHI     RA
        LDI     LOW (ATMR)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     16
        SEP     R4
        WORD    RANDN
        PLO     R8
        GLO     R8
        ADI     LOW ET
        PLO     RA
        LDI     HIGH ET
        PHI     RA
        LDN     RA
        LBZ     ATR
        SMI     4
        LBDF    ATR
        GLO     R8
        ADI     LOW EM
        PLO     RA
        LDI     HIGH EM
        PHI     RA
        LDN     RA
        ANI     7FH
        XRI     1
        LBNZ    ATR
        LDN     RA
        ANI     80H
        ORI     2
        STR     RA
ATX     SEP     R5
ATR
        LDI     HIGH (ATMR)
        PHI     RA
        LDI     LOW (ATMR)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R5
SATTIME
        LDI     HIGH (SATT)
        PHI     RA
        LDI     LOW (SATT)
        PLO     RA
        LDN     RA
        LBZ     SATX
        LDI     HIGH (SATT)
        PHI     RA
        LDI     LOW (SATT)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    SATX
        LDI     0
        PLO     R8
SX1
        GLO     R8
        ADI     LOW ET
        PLO     RA
        LDI     HIGH ET
        PHI     RA
        LDN     RA
        SMI     4
        LBNF    SX2
        SEP     R4
        WORD    EERASE
        GLO     R8
        ADI     LOW ET
        PLO     RA
        LDI     HIGH ET
        PHI     RA
        LDI     0
        STR     RA
        LDI     HIGH (NALIVE)
        PHI     RA
        LDI     LOW (NALIVE)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
SX2     INC     R8
        GLO     R8
        XRI     16
        LBNZ    SX1
SATX    SEP     R5
; STARS - move one star outward
STARS   LDI     1
        PHI     R8
SR0
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        LDN     RA
        ADI     1
        ANI     7
        STR     RA
        SMI     6
        LBNF    SR0A
        STR     RA
SR0A    LDN     RA
        PLO     R8
        GLO     R8
        ADI     LOW XON
        PLO     RA
        LDI     HIGH XON
        PHI     RA
        LDN     RA
        LBZ     SR1
        GLO     R8
        ADI     LOW XOY
        PLO     RA
        LDI     HIGH XOY
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     R8
        ADI     LOW XOX
        PLO     RA
        LDI     HIGH XOX
        PHI     RA
        LDN     RA
        PLO     RE
        LDI     0
        SEP     R1
SR1
        GLO     R8
        ADI     LOW XR
        PLO     RA
        LDI     HIGH XR
        PHI     RA
        LDN     RA
        ADI     1
        STR     RA
        SMI     16
        LBNF    SR2
        SEP     R4
        WORD    RAND
        ANI     3
        ADI     2
        PLO     R9
        GLO     R8
        ADI     LOW XR
        PLO     RA
        LDI     HIGH XR
        PHI     RA
        GLO     R9
        STR     RA
        SEP     R4
        WORD    RAND
        ANI     63
        PLO     R9
        GLO     R8
        ADI     LOW XA
        PLO     RA
        LDI     HIGH XA
        PHI     RA
        GLO     R9
        STR     RA
SR2
        GLO     R8
        ADI     LOW XR
        PLO     RA
        LDI     HIGH XR
        PHI     RA
        LDN     RA
        PLO     R9
        GLO     R8
        ADI     LOW XA
        PLO     RA
        LDI     HIGH XA
        PHI     RA
        LDN     RA
        SEP     R4
        WORD    POLAR
        GLO     R8
        ADI     LOW XOX
        PLO     RA
        LDI     HIGH XOX
        PHI     RA
        GLO     RE
        STR     RA
        GLO     R8
        ADI     LOW XOY
        PLO     RA
        LDI     HIGH XOY
        PHI     RA
        GHI     RE
        STR     RA
        GLO     R8
        ADI     LOW XON
        PLO     RA
        LDI     HIGH XON
        PHI     RA
        LDI     1
        STR     RA
        GLO     R8
        ADI     LOW XR
        PLO     RA
        LDI     HIGH XR
        PHI     RA
        LDN     RA
        SMI     7
        LBDF    SR3
        LDI     103
        LBR     SR4
SR3     LDN     RA
        SMI     12
        LBDF    SR3A
        LDI     230
        LBR     SR4
SR3A    LDI     232
SR4     SEP     R1
        GHI     R8
        SMI     1
        PHI     R8
        LBNZ    SR0
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
        LDI     HIGH (HISC+1)
        PHI     RD
        LDI     LOW (HISC+1)
        PLO     RD
        LDI     1
        STR     RD
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
TITLE
        SEP     R4
        WORD    VIDOFF
        SEP     R4
        WORD    SILENCE
        SEP     R4
        WORD    CLRSCR
        LDI     HIGH (782)
        PHI     RE
        LDI     LOW (782)
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
        LDI     HIGH (1291)
        PHI     RE
        LDI     LOW (1291)
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
        LDI     HIGH (2311)
        PHI     RE
        LDI     LOW (2311)
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
        LDI     HIGH (2823)
        PHI     RE
        LDI     LOW (2823)
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
        LDI     HIGH (3079)
        PHI     RE
        LDI     LOW (3079)
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
        LDI     HIGH (3844)
        PHI     RE
        LDI     LOW (3844)
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
        LDI     HIGH (4100)
        PHI     RE
        LDI     LOW (4100)
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
        LDI     HIGH (4356)
        PHI     RE
        LDI     LOW (4356)
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
        LDI     HIGH (5134)
        PHI     RE
        LDI     LOW (5134)
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
        LDI     HIGH (5137)
        PHI     RE
        LDI     LOW (5137)
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
        LDI     HIGH (PAGE+110)
        PHI     RD
        LDI     LOW (PAGE+110)
        PLO     RD
        LDI     234
        STR     RD
        LDI     HIGH (PAGE+111)
        PHI     RD
        LDI     LOW (PAGE+111)
        PLO     RD
        LDI     235
        STR     RD
        LDI     HIGH (PAGE+112)
        PHI     RD
        LDI     LOW (PAGE+112)
        PLO     RD
        LDI     236
        STR     RD
        LDI     HIGH (PAGE+150)
        PHI     RD
        LDI     LOW (PAGE+150)
        PLO     RD
        LDI     237
        STR     RD
        LDI     HIGH (PAGE+151)
        PHI     RD
        LDI     LOW (PAGE+151)
        PLO     RD
        LDI     238
        STR     RD
        LDI     HIGH (PAGE+152)
        PHI     RD
        LDI     LOW (PAGE+152)
        PLO     RD
        LDI     239
        STR     RD
        LDI     HIGH (PAGE+190)
        PHI     RD
        LDI     LOW (PAGE+190)
        PLO     RD
        LDI     240
        STR     RD
        LDI     HIGH (PAGE+191)
        PHI     RD
        LDI     LOW (PAGE+191)
        PLO     RD
        LDI     241
        STR     RD
        LDI     HIGH (PAGE+192)
        PHI     RD
        LDI     LOW (PAGE+192)
        PLO     RD
        LDI     242
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
NEWGAME
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
        LDI     HIGH (PLANET)
        PHI     RA
        LDI     LOW (PLANET)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (WARP)
        PHI     RA
        LDI     LOW (WARP)
        PLO     RA
        LDI     3
        STR     RA
        LDI     HIGH (LOOP)
        PHI     RA
        LDI     LOW (LOOP)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (CHANCE)
        PHI     RA
        LDI     LOW (CHANCE)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (PA)
        PHI     RA
        LDI     LOW (PA)
        PLO     RA
        LDI     16
        STR     RA
NEXTST
        SEP     R4
        WORD    SSETUP
MAIN
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
        LDI     HIGH (FCNT)
        PHI     RA
        LDI     LOW (FCNT)
        PLO     RA
        LDN     RA
        SMI     2
        LBNF    MAIN
        LDI     HIGH (FCNT)
        PHI     RA
        LDI     LOW (FCNT)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R4
        WORD    VBDRAW
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
        LDI     HIGH (FRM+1)
        PHI     RA
        LDI     LOW (FRM+1)
        PLO     RA
        LDN     RA
        SHR
        SHR
        SHR
        ANI     1
        PLO     R7
        LDI     HIGH (ANIM)
        PHI     RA
        LDI     LOW (ANIM)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (WIN)
        PHI     RA
        LDI     LOW (WIN)
        PLO     RA
        LDN     RA
        LBNZ    MWIN
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
        LBR     MXQ
MXP
        SEP     R4
        WORD    PLAYER
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
        WORD    SHOTS
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
MXQ
        SEP     R4
        WORD    ENEMIES
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
        LDI     HIGH (FRM+1)
        PHI     RA
        LDI     LOW (FRM+1)
        PLO     RA
        LDN     RA
        ANI     1
        LBZ     MXQ3
        SEP     R4
        WORD    SPAWN
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
        WORD    ATTACK
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
        WORD    SATTIME
        SEP     R4
        WORD    BULLETS
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
        LBR     MXQ4
MXQ3
        SEP     R4
        WORD    EFFECTS
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
        WORD    STARS
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
MXQ4
        LDI     HIGH (HUDF)
        PHI     RA
        LDI     LOW (HUDF)
        PLO     RA
        LDN     RA
        LBZ     MXH
        SEP     R4
        WORD    HUDSC
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
MXH
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDN     RA
        LBNZ    GAMEOVER
        LDI     HIGH (NSPAWN)
        PHI     RA
        LDI     LOW (NSPAWN)
        PLO     RA
        LDN     RA
        LBNZ    MAIN
        LDI     HIGH (NALIVE)
        PHI     RA
        LDI     LOW (NALIVE)
        PLO     RA
        LDN     RA
        LBNZ    MAIN
        LDI     HIGH (WIN)
        PHI     RA
        LDI     LOW (WIN)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (WTMR)
        PHI     RA
        LDI     LOW (WTMR)
        PLO     RA
        LDI     140
        STR     RA
        SEP     R4
        WORD    CLRBUL
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     127
        STR     RA
        LDI     HIGH (1A1FH)
        PHI     RC
        LDI     LOW (1A1FH)
        PLO     RC
        LDI     30
        SEP     R4
        WORD    SOUND
        LDI     HIGH (CHANCE)
        PHI     RA
        LDI     LOW (CHANCE)
        PLO     RA
        LDN     RA
        LBZ     MW0
        LDI     HIGH (HITS)
        PHI     RA
        LDI     LOW (HITS)
        PLO     RA
        LDN     RA
        PLO     R9
MWC     GLO     R9
        LBZ     MWC2
        STXD
        LDI     10
        SEP     R4
        WORD    ADDSC
        IRX
        LDX
        SMI     1
        PLO     R9
        LBR     MWC
MWC2
        LDI     HIGH (HITS)
        PHI     RA
        LDI     LOW (HITS)
        PLO     RA
        LDN     RA
        XRI     32
        LBNZ    MW0
        LDI     250
        SEP     R4
        WORD    ADDSC
        LDI     250
        SEP     R4
        WORD    ADDSC
        LDI     250
        SEP     R4
        WORD    ADDSC
        LDI     250
        SEP     R4
        WORD    ADDSC
MW0
        LDI     HIGH (2828)
        PHI     RE
        LDI     LOW (2828)
        PLO     RE
        LDI     HIGH (TXSC)
        PHI     RC
        LDI     LOW (TXSC)
        PLO     RC
        SEP     R4
        WORD    MSGQ
        LBR     MAIN
MWIN
        SEP     R4
        WORD    SHOTS
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
        SEP     R4
        WORD    EFFECTS
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
        WORD    STARS
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
        WORD    STARS
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
        LDI     HIGH (WTMR)
        PHI     RA
        LDI     LOW (WTMR)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    MAIN
        LDI     HIGH (WIN)
        PHI     RA
        LDI     LOW (WIN)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (CHANCE)
        PHI     RA
        LDI     LOW (CHANCE)
        PLO     RA
        LDN     RA
        LBZ     NS1
        LDI     HIGH (CHANCE)
        PHI     RA
        LDI     LOW (CHANCE)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (WARP)
        PHI     RA
        LDI     LOW (WARP)
        PLO     RA
        LDI     2
        STR     RA
        LDI     HIGH (PLANET)
        PHI     RA
        LDI     LOW (PLANET)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        XRI     6
        LBNZ    NEXTST
        LDI     HIGH (PLANET)
        PHI     RA
        LDI     LOW (PLANET)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (LOOP)
        PHI     RA
        LDI     LOW (LOOP)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     NEXTST
NS1
        LDI     HIGH (WARP)
        PHI     RA
        LDI     LOW (WARP)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    NEXTST
        LDI     HIGH (CHANCE)
        PHI     RA
        LDI     LOW (CHANCE)
        PLO     RA
        LDI     1
        STR     RA
        LBR     NEXTST
SSETUP
        SEP     R4
        WORD    VIDOFF
        SEP     R4
        WORD    SILENCE
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
        LDI     HIGH (EA)
        PHI     RD
        LDI     LOW (EA)
        PLO     RD
        LDI     HIGH (138H)
        PHI     RE
        LDI     LOW (138H)
        PLO     RE
        LDI     0
        SEP     R4
        WORD    FILL
        LDI     HIGH (SON)
        PHI     RA
        LDI     LOW (SON)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (PON)
        PHI     RA
        LDI     LOW (PON)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (WIN)
        PHI     RA
        LDI     LOW (WIN)
        PLO     RA
        LDI     0
        STR     RA
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
        LDI     HIGH (NALIVE)
        PHI     RA
        LDI     LOW (NALIVE)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (NSPAWN)
        PHI     RA
        LDI     LOW (NSPAWN)
        PLO     RA
        LDI     32
        STR     RA
        LDI     HIGH (GRP)
        PHI     RA
        LDI     LOW (GRP)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (GTMR)
        PHI     RA
        LDI     LOW (GTMR)
        PLO     RA
        LDI     40
        STR     RA
        LDI     HIGH (ATMR)
        PHI     RA
        LDI     LOW (ATMR)
        PLO     RA
        LDI     60
        STR     RA
        LDI     HIGH (SATT)
        PHI     RA
        LDI     LOW (SATT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (HITS)
        PHI     RA
        LDI     LOW (HITS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TMPA)
        PHI     RA
        LDI     LOW (TMPA)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TMPB)
        PHI     RA
        LDI     LOW (TMPB)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (SON+1)
        PHI     RA
        LDI     LOW (SON+1)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (0)
        PHI     RE
        LDI     LOW (0)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX10)
        PHI     RC
        LDI     LOW (TX10)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (14)
        PHI     RE
        LDI     LOW (14)
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
        LDI     HIGH (17)
        PHI     RE
        LDI     LOW (17)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (HISC)
        PHI     RB
        LDI     LOW (HISC)
        PLO     RB
        LDI     6
        PLO     R9
SS1     LDA     RB
        ADI     30H
        STR     RD
        INC     RD
        DEC     R9
        GLO     R9
        LBNZ    SS1
        LDI     HIGH (5888)
        PHI     RE
        LDI     LOW (5888)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (CHANCE)
        PHI     RA
        LDI     LOW (CHANCE)
        PLO     RA
        LDN     RA
        LBZ     SS2
        LDI     HIGH (TXCH)
        PHI     RC
        LDI     LOW (TXCH)
        PLO     RC
        LDI     80H
        PLO     RF
        SEP     R4
        WORD    PRT
        LBR     SS3
SS2
        LDI     HIGH (WARP)
        PHI     RA
        LDI     LOW (WARP)
        PLO     RA
        LDN     RA
        ADI     0B0H
        STR     RD
        INC     RD
        LDI     HIGH (TXWT)
        PHI     RC
        LDI     LOW (TXWT)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
SS3
        LDI     HIGH (PLANET)
        PHI     RA
        LDI     LOW (PLANET)
        PLO     RA
        LDN     RA
        SHL
        ADI     LOW PNT
        PLO     RA
        LDI     HIGH PNT
        ADCI    0
        PHI     RA
        LDA     RA
        PHI     RC
        LDN     RA
        PLO     RC
        LDI     80H
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (CHANCE)
        PHI     RA
        LDI     LOW (CHANCE)
        PLO     RA
        LDN     RA
        LBZ     SS4
        LDI     HIGH (PAGE+418)
        PHI     RD
        LDI     LOW (PAGE+418)
        PLO     RD
        LDI     234
        STR     RD
        LDI     HIGH (PAGE+419)
        PHI     RD
        LDI     LOW (PAGE+419)
        PLO     RD
        LDI     235
        STR     RD
        LDI     HIGH (PAGE+420)
        PHI     RD
        LDI     LOW (PAGE+420)
        PLO     RD
        LDI     236
        STR     RD
        LDI     HIGH (PAGE+458)
        PHI     RD
        LDI     LOW (PAGE+458)
        PLO     RD
        LDI     237
        STR     RD
        LDI     HIGH (PAGE+459)
        PHI     RD
        LDI     LOW (PAGE+459)
        PLO     RD
        LDI     238
        STR     RD
        LDI     HIGH (PAGE+460)
        PHI     RD
        LDI     LOW (PAGE+460)
        PLO     RD
        LDI     239
        STR     RD
        LDI     HIGH (PAGE+498)
        PHI     RD
        LDI     LOW (PAGE+498)
        PLO     RD
        LDI     240
        STR     RD
        LDI     HIGH (PAGE+499)
        PHI     RD
        LDI     LOW (PAGE+499)
        PLO     RD
        LDI     241
        STR     RD
        LDI     HIGH (PAGE+500)
        PHI     RD
        LDI     LOW (PAGE+500)
        PLO     RD
        LDI     242
        STR     RD
SS4
        LDI     HIGH (HUDF)
        PHI     RA
        LDI     LOW (HUDF)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R4
        WORD    HUDSC
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
        SEP     R4
        WORD    LIVESHOW
        SEP     R4
        WORD    PLAYER
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
        SEP     R4
        WORD    QFLUSH
        SEP     R4
        WORD    VIDON
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (1A1FH)
        PHI     RC
        LDI     LOW (1A1FH)
        PLO     RC
        LDI     20
        SEP     R4
        WORD    SOUND
        LDI     90
        SEP     R4
        WORD    WAITN
        LDI     HIGH (CHANCE)
        PHI     RA
        LDI     LOW (CHANCE)
        PLO     RA
        LDN     RA
        LBZ     SS5
        LDI     HIGH (2578)
        PHI     RE
        LDI     LOW (2578)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (2579)
        PHI     RE
        LDI     LOW (2579)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (2580)
        PHI     RE
        LDI     LOW (2580)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (2834)
        PHI     RE
        LDI     LOW (2834)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (2835)
        PHI     RE
        LDI     LOW (2835)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (2836)
        PHI     RE
        LDI     LOW (2836)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (3090)
        PHI     RE
        LDI     LOW (3090)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (3091)
        PHI     RE
        LDI     LOW (3091)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (3092)
        PHI     RE
        LDI     LOW (3092)
        PLO     RE
        LDI     0
        SEP     R1
SS5     SEP     R5
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
        SEP     R4
        WORD    VIDOFF
        LDI     HIGH (2831)
        PHI     RE
        LDI     LOW (2831)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX12)
        PHI     RC
        LDI     LOW (TX12)
        PLO     RC
        LDI     128
        PLO     RF
        SEP     R4
        WORD    PRT
        SEP     R4
        WORD    VIDON
        LDI     HIGH (1F88H)
        PHI     RC
        LDI     LOW (1F88H)
        PLO     RC
        LDI     40
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
ECHT    BYTE    0DBH, 0DCH, 0DDH, 0DEH, 0DFH, 0E0H, 061H, 061H, 0E2H, 0E2H
ESCT    BYTE    00AH, 00FH, 014H, 01EH, 064H
SHIPT   BYTE    098H, 099H, 09AH, 09BH, 098H, 099H, 09AH, 09BH, 09CH, 085H, 09DH, 09EH, 09CH, 085H, 09DH, 09EH
        BYTE    09CH, 085H, 09DH, 09EH, 09CH, 085H, 09DH, 09EH, 081H, 082H, 083H, 084H, 081H, 082H, 083H, 084H
        BYTE    081H, 082H, 083H, 084H, 081H, 082H, 083H, 084H, 085H, 086H, 087H, 088H, 085H, 086H, 087H, 088H
        BYTE    085H, 086H, 087H, 088H, 085H, 086H, 087H, 088H, 089H, 08AH, 08BH, 08CH, 089H, 08AH, 08BH, 08CH
        BYTE    089H, 08AH, 08BH, 08CH, 089H, 08AH, 08BH, 08CH, 08DH, 08EH, 08FH, 090H, 08DH, 08EH, 08FH, 090H
        BYTE    08DH, 08EH, 08FH, 090H, 08DH, 08EH, 08FH, 090H, 091H, 092H, 093H, 094H, 091H, 092H, 093H, 094H
        BYTE    091H, 092H, 093H, 094H, 091H, 092H, 093H, 094H, 095H, 096H, 097H, 08FH, 095H, 096H, 097H, 08FH
        BYTE    095H, 096H, 097H, 08FH, 095H, 096H, 097H, 08FH, 098H, 099H, 09AH, 09BH, 098H, 099H, 09AH, 09BH
SPOS    BYTE    00CH, 026H, 00DH, 025H, 00FH, 024H, 011H, 022H, 012H, 020H, 013H, 01DH, 014H, 01AH, 015H, 016H
        BYTE    015H, 012H, 015H, 00FH, 014H, 00BH, 013H, 008H, 012H, 005H, 011H, 003H, 00FH, 001H, 00DH, 000H
        BYTE    00CH, 000H, 00AH, 000H, 008H, 001H, 006H, 003H, 005H, 005H, 004H, 008H, 003H, 00BH, 002H, 00FH
        BYTE    002H, 012H, 002H, 016H, 003H, 01AH, 004H, 01DH, 005H, 020H, 006H, 022H, 008H, 024H, 00AH, 025H
SSR     BYTE    010H, 00FH, 00FH, 00FH, 00FH, 00EH, 00FH, 010H, 00EH, 010H, 00FH, 00EH, 00FH, 00FH, 00FH, 00FH
        BYTE    00FH, 00FH, 00FH, 00FH, 00FH, 00EH, 00FH, 010H, 00EH, 010H, 00FH, 00EH, 00FH, 00FH, 00FH, 00FH
PNT
        WORD    PN0
        WORD    PN1
        WORD    PN2
        WORD    PN3
        WORD    PN4
        WORD    PN5
PN0      TEXT    "NEPTUNE"
        BYTE    0
PN1      TEXT    "URANUS"
        BYTE    0
PN2      TEXT    "SATURN"
        BYTE    0
PN3      TEXT    "JUPITER"
        BYTE    0
PN4      TEXT    "MARS"
        BYTE    0
PN5      TEXT    "EARTH"
        BYTE    0
TXWT     TEXT    " WARPS TO "
        BYTE    0
TXCH     TEXT    "CHANCE STAGE  "
        BYTE    0
TXSC     TEXT    "STAGE CLEAR"
        BYTE    0
TUNE    BYTE    021H, 008H, 018H, 008H, 015H, 008H, 014H, 010H, 015H, 008H, 018H, 008H, 010H, 018H, 012H, 008H
        BYTE    014H, 008H, 015H, 010H, 018H, 008H, 01BH, 008H, 018H, 020H, 07FH, 078H, 07FH, 078H, 000H
TX1      TEXT    "ORBITAL WAR"
        BYTE    0
TX2      TEXT    "THE ROAD TO EARTH"
        BYTE    0
TX3      TEXT    "SPACE OR 1   START"
        BYTE    0
TX4      TEXT    "ESC          BACK TO BASIC"
        BYTE    0
TX5      TEXT    "M            MUSIC ON/OFF"
        BYTE    0
TX6      TEXT    "LEFT/RIGHT  ORBIT (HOLD)"
        BYTE    0
TX7      TEXT    "SPACE       FIRE"
        BYTE    0
TX8      TEXT    "A           AUTO-FIRE ON/OFF"
        BYTE    0
TX9      TEXT    "HI"
        BYTE    0
TX10     TEXT    "SCORE"
        BYTE    0
TX11     TEXT    "HI"
        BYTE    0
TX12     TEXT    "GAME OVER"
        BYTE    0
CHTAB
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 0C0H, 0C0H, 0C1H, 0C1H, 0C1H, 0C1H, 0C3H, 0C3H
        BYTE    0C0H, 0C0H, 0E0H, 0E0H, 0E0H, 0E0H, 0F0H, 0F0H, 0C7H, 0CFH, 0DFH, 0DFH, 0D3H, 0C0H, 0C0H, 0C0H
        BYTE    0F8H, 0FCH, 0FEH, 0FEH, 0F2H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0FFH, 0FFH
        BYTE    0C0H, 0C0H, 0C0H, 0C2H, 0CCH, 0FCH, 0F8H, 0F8H, 0FFH, 0DFH, 0CFH, 0CFH, 0C3H, 0C1H, 0C1H, 0C0H
        BYTE    0F0H, 0F0H, 0F0H, 0F0H, 0F0H, 0F0H, 0E0H, 0C0H, 0C0H, 0C0H, 0C0H, 0DCH, 0CEH, 0CFH, 0DFH, 0DFH
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0F0H, 0FFH, 0DFH, 0DFH, 0CFH, 0CEH, 0DCH, 0C0H, 0C0H, 0C0H
        BYTE    0FFH, 0F0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C1H, 0C1H, 0C3H, 0CFH, 0CFH, 0DFH, 0FFH
        BYTE    0C0H, 0E0H, 0F0H, 0F0H, 0F0H, 0F0H, 0F0H, 0F0H, 0FFH, 0FFH, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    0F8H, 0F8H, 0FCH, 0CCH, 0C2H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0D3H, 0DFH, 0DFH, 0CFH, 0C7H
        BYTE    0C0H, 0C0H, 0C0H, 0F2H, 0FEH, 0FEH, 0FCH, 0F8H, 0C3H, 0C3H, 0C1H, 0C1H, 0C1H, 0C1H, 0C0H, 0C0H
        BYTE    0F0H, 0F0H, 0E0H, 0E0H, 0E0H, 0E0H, 0C0H, 0C0H, 0C0H, 0C1H, 0C3H, 0C3H, 0C3H, 0C3H, 0C3H, 0C3H
        BYTE    0C0H, 0E0H, 0E0H, 0F0H, 0FCH, 0FCH, 0FEH, 0FFH, 0C7H, 0C7H, 0CFH, 0CCH, 0D0H, 0C0H, 0C0H, 0C0H
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C3H, 0FFH, 0C0H, 0C0H, 0C0H, 0CEH, 0DCH, 0FCH, 0FEH, 0FEH
        BYTE    0FFH, 0C3H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0FEH, 0FEH, 0FCH, 0DCH, 0CEH, 0C0H, 0C0H, 0C0H
        BYTE    0C0H, 0C0H, 0C0H, 0D0H, 0CCH, 0CFH, 0C7H, 0C7H, 0C3H, 0C3H, 0C3H, 0C3H, 0C3H, 0C3H, 0C1H, 0C0H
        BYTE    0FFH, 0FEH, 0FCH, 0FCH, 0F0H, 0E0H, 0E0H, 0C0H, 080H, 080H, 080H, 08CH, 08CH, 080H, 080H, 080H
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
        BYTE    0DFH, 0C1H, 0C2H, 0C4H, 0C8H, 0D0H, 0DFH, 0C0H, 000H, 021H, 033H, 01EH, 03FH, 012H, 000H, 000H
        BYTE    000H, 012H, 03FH, 01EH, 033H, 021H, 000H, 000H, 080H, 08CH, 092H, 0ADH, 092H, 08CH, 080H, 080H
        BYTE    080H, 08CH, 09EH, 0B3H, 09EH, 08CH, 080H, 080H, 040H, 052H, 04CH, 07FH, 04CH, 052H, 040H, 040H
        BYTE    040H, 061H, 05EH, 052H, 05EH, 061H, 040H, 040H, 0C0H, 0C8H, 0DCH, 0F6H, 0DCH, 0C8H, 0C0H, 0C0H
        BYTE    080H, 088H, 094H, 0A2H, 094H, 088H, 080H, 080H, 000H, 000H, 00CH, 00CH, 000H, 000H, 000H, 000H
        BYTE    080H, 088H, 095H, 08EH, 0AAH, 08AH, 080H, 080H, 025H, 010H, 022H, 004H, 024H, 009H, 022H, 000H
        BYTE    0C0H, 0C0H, 0C0H, 0C8H, 0C0H, 0C0H, 0C0H, 0C0H, 040H, 040H, 040H, 048H, 040H, 040H, 040H, 040H
        BYTE    0C0H, 0C0H, 0C8H, 0C8H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0CCH, 0DEH, 0FFH, 0EDH, 0C0H, 0C0H, 0C0H
        BYTE    040H, 040H, 040H, 040H, 040H, 043H, 047H, 04DH, 040H, 040H, 040H, 040H, 07FH, 07FH, 07FH, 07EH
        BYTE    040H, 040H, 040H, 040H, 040H, 070H, 078H, 05CH, 04FH, 05FH, 05EH, 05FH, 05FH, 05FH, 05FH, 04FH
        BYTE    07FH, 07FH, 05FH, 07FH, 07FH, 07CH, 07FH, 07FH, 07CH, 07EH, 07EH, 07EH, 07EH, 07EH, 07EH, 07CH
        BYTE    04EH, 047H, 043H, 040H, 040H, 040H, 040H, 040H, 05FH, 07FH, 07FH, 07FH, 040H, 040H, 040H, 040H
        BYTE    07CH, 078H, 070H, 040H, 040H, 040H, 040H, 040H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        ORG     8000H
PTAB    BYTE    013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H
        BYTE    013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H
        BYTE    013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H
        BYTE    013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H, 013H
        BYTE    014H, 014H, 014H, 014H, 014H, 014H, 014H, 014H, 014H, 014H, 014H, 014H, 013H, 013H, 013H, 013H
        BYTE    013H, 013H, 013H, 013H, 013H, 012H, 012H, 012H, 012H, 012H, 012H, 012H, 012H, 012H, 012H, 012H
        BYTE    012H, 012H, 012H, 012H, 012H, 012H, 012H, 012H, 012H, 012H, 012H, 012H, 013H, 013H, 013H, 013H
        BYTE    013H, 013H, 013H, 013H, 013H, 014H, 014H, 014H, 014H, 014H, 014H, 014H, 014H, 014H, 014H, 014H
        BYTE    015H, 015H, 015H, 015H, 015H, 015H, 015H, 015H, 015H, 014H, 014H, 014H, 014H, 014H, 014H, 013H
        BYTE    013H, 013H, 012H, 012H, 012H, 012H, 012H, 012H, 011H, 011H, 011H, 011H, 011H, 011H, 011H, 011H
        BYTE    011H, 011H, 011H, 011H, 011H, 011H, 011H, 011H, 011H, 012H, 012H, 012H, 012H, 012H, 012H, 013H
        BYTE    013H, 013H, 014H, 014H, 014H, 014H, 014H, 014H, 015H, 015H, 015H, 015H, 015H, 015H, 015H, 015H
        BYTE    017H, 017H, 017H, 016H, 016H, 016H, 016H, 016H, 016H, 015H, 015H, 015H, 014H, 014H, 014H, 013H
        BYTE    013H, 013H, 012H, 012H, 012H, 011H, 011H, 011H, 010H, 010H, 010H, 010H, 010H, 010H, 00FH, 00FH
        BYTE    00FH, 00FH, 00FH, 010H, 010H, 010H, 010H, 010H, 010H, 011H, 011H, 011H, 012H, 012H, 012H, 013H
        BYTE    013H, 013H, 014H, 014H, 014H, 015H, 015H, 015H, 016H, 016H, 016H, 016H, 016H, 016H, 017H, 017H
        BYTE    018H, 018H, 018H, 018H, 018H, 017H, 017H, 017H, 016H, 016H, 016H, 015H, 015H, 014H, 014H, 014H
        BYTE    013H, 012H, 012H, 012H, 011H, 011H, 010H, 010H, 010H, 00FH, 00FH, 00FH, 00EH, 00EH, 00EH, 00EH
        BYTE    00EH, 00EH, 00EH, 00EH, 00EH, 00FH, 00FH, 00FH, 010H, 010H, 010H, 011H, 011H, 012H, 012H, 012H
        BYTE    013H, 014H, 014H, 014H, 015H, 015H, 016H, 016H, 016H, 017H, 017H, 017H, 018H, 018H, 018H, 018H
        BYTE    019H, 019H, 019H, 019H, 019H, 018H, 018H, 018H, 017H, 017H, 016H, 016H, 015H, 015H, 014H, 014H
        BYTE    013H, 012H, 012H, 011H, 011H, 010H, 010H, 00FH, 00FH, 00EH, 00EH, 00EH, 00DH, 00DH, 00DH, 00DH
        BYTE    00DH, 00DH, 00DH, 00DH, 00DH, 00EH, 00EH, 00EH, 00FH, 00FH, 010H, 010H, 011H, 011H, 012H, 012H
        BYTE    013H, 014H, 014H, 015H, 015H, 016H, 016H, 017H, 017H, 018H, 018H, 018H, 019H, 019H, 019H, 019H
        BYTE    01AH, 01AH, 01AH, 01AH, 01AH, 019H, 019H, 019H, 018H, 018H, 017H, 016H, 016H, 015H, 014H, 014H
        BYTE    013H, 012H, 012H, 011H, 010H, 010H, 00FH, 00EH, 00EH, 00DH, 00DH, 00DH, 00CH, 00CH, 00CH, 00CH
        BYTE    00CH, 00CH, 00CH, 00CH, 00CH, 00DH, 00DH, 00DH, 00EH, 00EH, 00FH, 010H, 010H, 011H, 012H, 012H
        BYTE    013H, 014H, 014H, 015H, 016H, 016H, 017H, 018H, 018H, 019H, 019H, 019H, 01AH, 01AH, 01AH, 01AH
        BYTE    01BH, 01BH, 01BH, 01BH, 01BH, 01AH, 01AH, 01AH, 019H, 018H, 018H, 017H, 016H, 016H, 015H, 014H
        BYTE    013H, 012H, 011H, 010H, 010H, 00FH, 00EH, 00EH, 00DH, 00CH, 00CH, 00CH, 00BH, 00BH, 00BH, 00BH
        BYTE    00BH, 00BH, 00BH, 00BH, 00BH, 00CH, 00CH, 00CH, 00DH, 00EH, 00EH, 00FH, 010H, 010H, 011H, 012H
        BYTE    013H, 014H, 015H, 016H, 016H, 017H, 018H, 018H, 019H, 01AH, 01AH, 01AH, 01BH, 01BH, 01BH, 01BH
        BYTE    01CH, 01CH, 01CH, 01CH, 01CH, 01CH, 01BH, 01AH, 01AH, 019H, 018H, 018H, 016H, 016H, 015H, 014H
        BYTE    013H, 012H, 011H, 010H, 010H, 00EH, 00EH, 00DH, 00CH, 00CH, 00BH, 00AH, 00AH, 00AH, 00AH, 00AH
        BYTE    00AH, 00AH, 00AH, 00AH, 00AH, 00AH, 00BH, 00CH, 00CH, 00DH, 00EH, 00EH, 010H, 010H, 011H, 012H
        BYTE    013H, 014H, 015H, 016H, 016H, 018H, 018H, 019H, 01AH, 01AH, 01BH, 01CH, 01CH, 01CH, 01CH, 01CH
        BYTE    01EH, 01EH, 01EH, 01DH, 01DH, 01DH, 01CH, 01BH, 01BH, 01AH, 019H, 018H, 017H, 016H, 015H, 014H
        BYTE    013H, 012H, 011H, 010H, 00FH, 00EH, 00DH, 00CH, 00BH, 00BH, 00AH, 009H, 009H, 009H, 008H, 008H
        BYTE    008H, 008H, 008H, 009H, 009H, 009H, 00AH, 00BH, 00BH, 00CH, 00DH, 00EH, 00FH, 010H, 011H, 012H
        BYTE    013H, 014H, 015H, 016H, 017H, 018H, 019H, 01AH, 01BH, 01BH, 01CH, 01DH, 01DH, 01DH, 01EH, 01EH
        BYTE    01FH, 01FH, 01FH, 01EH, 01EH, 01EH, 01DH, 01CH, 01CH, 01AH, 01AH, 019H, 017H, 017H, 016H, 014H
        BYTE    013H, 012H, 010H, 00FH, 00FH, 00DH, 00CH, 00CH, 00AH, 00AH, 009H, 008H, 008H, 008H, 007H, 007H
        BYTE    007H, 007H, 007H, 008H, 008H, 008H, 009H, 00AH, 00AH, 00CH, 00CH, 00DH, 00FH, 00FH, 010H, 012H
        BYTE    013H, 014H, 016H, 017H, 017H, 019H, 01AH, 01AH, 01CH, 01CH, 01DH, 01EH, 01EH, 01EH, 01FH, 01FH
        BYTE    020H, 020H, 020H, 01FH, 01FH, 01FH, 01EH, 01DH, 01DH, 01BH, 01BH, 019H, 018H, 017H, 016H, 014H
        BYTE    013H, 012H, 010H, 00FH, 00EH, 00DH, 00BH, 00BH, 009H, 009H, 008H, 007H, 007H, 007H, 006H, 006H
        BYTE    006H, 006H, 006H, 007H, 007H, 007H, 008H, 009H, 009H, 00BH, 00BH, 00DH, 00EH, 00FH, 010H, 012H
        BYTE    013H, 014H, 016H, 017H, 018H, 019H, 01BH, 01BH, 01DH, 01DH, 01EH, 01FH, 01FH, 01FH, 020H, 020H
        BYTE    021H, 021H, 021H, 020H, 020H, 020H, 01FH, 01EH, 01EH, 01CH, 01BH, 01AH, 018H, 018H, 016H, 014H
        BYTE    013H, 012H, 010H, 00EH, 00EH, 00CH, 00BH, 00AH, 008H, 008H, 007H, 006H, 006H, 006H, 005H, 005H
        BYTE    005H, 005H, 005H, 006H, 006H, 006H, 007H, 008H, 008H, 00AH, 00BH, 00CH, 00EH, 00EH, 010H, 012H
        BYTE    013H, 014H, 016H, 018H, 018H, 01AH, 01BH, 01CH, 01EH, 01EH, 01FH, 020H, 020H, 020H, 021H, 021H
        BYTE    022H, 022H, 022H, 022H, 022H, 021H, 020H, 01FH, 01EH, 01DH, 01CH, 01AH, 019H, 018H, 016H, 015H
        BYTE    013H, 011H, 010H, 00EH, 00DH, 00CH, 00AH, 009H, 008H, 007H, 006H, 005H, 004H, 004H, 004H, 004H
        BYTE    004H, 004H, 004H, 004H, 004H, 005H, 006H, 007H, 008H, 009H, 00AH, 00CH, 00DH, 00EH, 010H, 011H
        BYTE    013H, 015H, 016H, 018H, 019H, 01AH, 01CH, 01DH, 01EH, 01FH, 020H, 021H, 022H, 022H, 022H, 022H
        BYTE    024H, 024H, 024H, 023H, 023H, 022H, 021H, 020H, 01FH, 01EH, 01DH, 01BH, 019H, 018H, 016H, 015H
        BYTE    013H, 011H, 010H, 00EH, 00DH, 00BH, 009H, 008H, 007H, 006H, 005H, 004H, 003H, 003H, 002H, 002H
        BYTE    002H, 002H, 002H, 003H, 003H, 004H, 005H, 006H, 007H, 008H, 009H, 00BH, 00DH, 00EH, 010H, 011H
        BYTE    013H, 015H, 016H, 018H, 019H, 01BH, 01DH, 01EH, 01FH, 020H, 021H, 022H, 023H, 023H, 024H, 024H
        BYTE    025H, 025H, 025H, 024H, 024H, 023H, 022H, 021H, 020H, 01EH, 01DH, 01BH, 01AH, 019H, 017H, 015H
        BYTE    013H, 011H, 00FH, 00DH, 00CH, 00BH, 009H, 008H, 006H, 005H, 004H, 003H, 002H, 002H, 001H, 001H
        BYTE    001H, 001H, 001H, 002H, 002H, 003H, 004H, 005H, 006H, 008H, 009H, 00BH, 00CH, 00DH, 00FH, 011H
        BYTE    013H, 015H, 017H, 019H, 01AH, 01BH, 01DH, 01EH, 020H, 021H, 022H, 023H, 024H, 024H, 025H, 025H
        BYTE    026H, 026H, 026H, 025H, 025H, 024H, 023H, 022H, 021H, 01FH, 01EH, 01CH, 01AH, 019H, 017H, 015H
        BYTE    013H, 011H, 00FH, 00DH, 00CH, 00AH, 008H, 007H, 005H, 004H, 003H, 002H, 001H, 001H, 000H, 000H
        BYTE    000H, 000H, 000H, 001H, 001H, 002H, 003H, 004H, 005H, 007H, 008H, 00AH, 00CH, 00DH, 00FH, 011H
        BYTE    013H, 015H, 017H, 019H, 01AH, 01CH, 01EH, 01FH, 021H, 022H, 023H, 024H, 025H, 025H, 026H, 026H
        ORG     8500H
PTABR   BYTE    00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH
        BYTE    00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH
        BYTE    00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH
        BYTE    00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH
        BYTE    00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00DH, 00DH, 00DH, 00DH
        BYTE    00DH, 00DH, 00DH, 00DH, 00DH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH
        BYTE    00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00BH, 00BH, 00BH, 00BH
        BYTE    00BH, 00BH, 00BH, 00BH, 00BH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH
        BYTE    00CH, 00CH, 00CH, 00CH, 00CH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH
        BYTE    00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00CH, 00CH, 00CH, 00CH
        BYTE    00CH, 00CH, 00CH, 00CH, 00CH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH
        BYTE    00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00CH, 00CH, 00CH, 00CH
        BYTE    00CH, 00CH, 00CH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00EH, 00EH, 00EH, 00EH, 00EH, 00EH
        BYTE    00EH, 00EH, 00EH, 00EH, 00EH, 00EH, 00EH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00DH, 00CH, 00CH
        BYTE    00CH, 00CH, 00CH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00AH, 00AH, 00AH, 00AH, 00AH, 00AH
        BYTE    00AH, 00AH, 00AH, 00AH, 00AH, 00AH, 00AH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00BH, 00CH, 00CH
        BYTE    00CH, 00CH, 00CH, 00DH, 00DH, 00DH, 00DH, 00EH, 00EH, 00EH, 00EH, 00EH, 00EH, 00EH, 00EH, 00EH
        BYTE    00EH, 00EH, 00EH, 00EH, 00EH, 00EH, 00EH, 00EH, 00EH, 00EH, 00DH, 00DH, 00DH, 00DH, 00CH, 00CH
        BYTE    00CH, 00CH, 00CH, 00BH, 00BH, 00BH, 00BH, 00AH, 00AH, 00AH, 00AH, 00AH, 00AH, 00AH, 00AH, 00AH
        BYTE    00AH, 00AH, 00AH, 00AH, 00AH, 00AH, 00AH, 00AH, 00AH, 00AH, 00BH, 00BH, 00BH, 00BH, 00CH, 00CH
        BYTE    00CH, 00CH, 00DH, 00DH, 00DH, 00EH, 00EH, 00EH, 00EH, 00EH, 00EH, 00EH, 00FH, 00FH, 00FH, 00FH
        BYTE    00FH, 00FH, 00FH, 00FH, 00FH, 00EH, 00EH, 00EH, 00EH, 00EH, 00EH, 00EH, 00DH, 00DH, 00DH, 00CH
        BYTE    00CH, 00CH, 00BH, 00BH, 00BH, 00AH, 00AH, 00AH, 00AH, 00AH, 00AH, 00AH, 009H, 009H, 009H, 009H
        BYTE    009H, 009H, 009H, 009H, 009H, 00AH, 00AH, 00AH, 00AH, 00AH, 00AH, 00AH, 00BH, 00BH, 00BH, 00CH
        BYTE    00CH, 00CH, 00DH, 00DH, 00EH, 00EH, 00EH, 00EH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 010H
        BYTE    010H, 010H, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00FH, 00EH, 00EH, 00EH, 00EH, 00DH, 00DH, 00CH
        BYTE    00CH, 00CH, 00BH, 00BH, 00AH, 00AH, 00AH, 00AH, 009H, 009H, 009H, 009H, 009H, 009H, 009H, 008H
        BYTE    008H, 008H, 009H, 009H, 009H, 009H, 009H, 009H, 009H, 00AH, 00AH, 00AH, 00AH, 00BH, 00BH, 00CH
        BYTE    00CH, 00CH, 00DH, 00DH, 00EH, 00EH, 00EH, 00FH, 00FH, 00FH, 010H, 010H, 010H, 010H, 010H, 010H
        BYTE    010H, 010H, 010H, 010H, 010H, 010H, 010H, 00FH, 00FH, 00FH, 00EH, 00EH, 00EH, 00DH, 00DH, 00CH
        BYTE    00CH, 00CH, 00BH, 00BH, 00AH, 00AH, 00AH, 009H, 009H, 009H, 008H, 008H, 008H, 008H, 008H, 008H
        BYTE    008H, 008H, 008H, 008H, 008H, 008H, 008H, 009H, 009H, 009H, 00AH, 00AH, 00AH, 00BH, 00BH, 00CH
        BYTE    00CH, 00CH, 00DH, 00EH, 00EH, 00EH, 00EH, 00FH, 010H, 010H, 010H, 010H, 010H, 010H, 010H, 011H
        BYTE    011H, 011H, 010H, 010H, 010H, 010H, 010H, 010H, 010H, 00FH, 00EH, 00EH, 00EH, 00EH, 00DH, 00CH
        BYTE    00CH, 00CH, 00BH, 00AH, 00AH, 00AH, 00AH, 009H, 008H, 008H, 008H, 008H, 008H, 008H, 008H, 007H
        BYTE    007H, 007H, 008H, 008H, 008H, 008H, 008H, 008H, 008H, 009H, 00AH, 00AH, 00AH, 00AH, 00BH, 00CH
        BYTE    00CH, 00DH, 00DH, 00EH, 00EH, 00FH, 00FH, 00FH, 010H, 010H, 010H, 010H, 011H, 011H, 011H, 012H
        BYTE    012H, 012H, 011H, 011H, 011H, 010H, 010H, 010H, 010H, 00FH, 00FH, 00FH, 00EH, 00EH, 00DH, 00DH
        BYTE    00CH, 00BH, 00BH, 00AH, 00AH, 009H, 009H, 009H, 008H, 008H, 008H, 008H, 007H, 007H, 007H, 006H
        BYTE    006H, 006H, 007H, 007H, 007H, 008H, 008H, 008H, 008H, 009H, 009H, 009H, 00AH, 00AH, 00BH, 00BH
        BYTE    00CH, 00DH, 00DH, 00EH, 00EH, 00FH, 00FH, 010H, 010H, 010H, 011H, 011H, 012H, 012H, 012H, 012H
        BYTE    012H, 012H, 012H, 012H, 012H, 011H, 011H, 010H, 010H, 010H, 00FH, 00FH, 00EH, 00EH, 00DH, 00DH
        BYTE    00CH, 00BH, 00BH, 00AH, 00AH, 009H, 009H, 008H, 008H, 008H, 007H, 007H, 006H, 006H, 006H, 006H
        BYTE    006H, 006H, 006H, 006H, 006H, 007H, 007H, 008H, 008H, 008H, 009H, 009H, 00AH, 00AH, 00BH, 00BH
        BYTE    00CH, 00DH, 00DH, 00EH, 00FH, 00FH, 00FH, 010H, 011H, 011H, 012H, 012H, 012H, 012H, 012H, 013H
        BYTE    013H, 013H, 012H, 012H, 012H, 012H, 012H, 011H, 011H, 010H, 00FH, 00FH, 00FH, 00EH, 00DH, 00DH
        BYTE    00CH, 00BH, 00BH, 00AH, 009H, 009H, 009H, 008H, 007H, 007H, 006H, 006H, 006H, 006H, 006H, 005H
        BYTE    005H, 005H, 006H, 006H, 006H, 006H, 006H, 007H, 007H, 008H, 009H, 009H, 009H, 00AH, 00BH, 00BH
        BYTE    00CH, 00DH, 00EH, 00EH, 00FH, 010H, 010H, 010H, 011H, 011H, 012H, 012H, 013H, 013H, 013H, 014H
        BYTE    014H, 014H, 013H, 013H, 013H, 012H, 012H, 011H, 011H, 010H, 010H, 010H, 00FH, 00EH, 00EH, 00DH
        BYTE    00CH, 00BH, 00AH, 00AH, 009H, 008H, 008H, 008H, 007H, 007H, 006H, 006H, 005H, 005H, 005H, 004H
        BYTE    004H, 004H, 005H, 005H, 005H, 006H, 006H, 007H, 007H, 008H, 008H, 008H, 009H, 00AH, 00AH, 00BH
        BYTE    00CH, 00DH, 00EH, 00EH, 00FH, 010H, 010H, 011H, 012H, 012H, 012H, 012H, 013H, 013H, 013H, 014H
        BYTE    014H, 014H, 013H, 013H, 013H, 012H, 012H, 012H, 012H, 011H, 010H, 010H, 00FH, 00EH, 00EH, 00DH
        BYTE    00CH, 00BH, 00AH, 00AH, 009H, 008H, 008H, 007H, 006H, 006H, 006H, 006H, 005H, 005H, 005H, 004H
        BYTE    004H, 004H, 005H, 005H, 005H, 006H, 006H, 006H, 006H, 007H, 008H, 008H, 009H, 00AH, 00AH, 00BH
        BYTE    00CH, 00DH, 00EH, 00FH, 010H, 010H, 010H, 011H, 012H, 012H, 013H, 013H, 014H, 014H, 014H, 015H
        BYTE    015H, 015H, 014H, 014H, 014H, 013H, 013H, 012H, 012H, 011H, 010H, 010H, 010H, 00FH, 00EH, 00DH
        BYTE    00CH, 00BH, 00AH, 009H, 008H, 008H, 008H, 007H, 006H, 006H, 005H, 005H, 004H, 004H, 004H, 003H
        BYTE    003H, 003H, 004H, 004H, 004H, 005H, 005H, 006H, 006H, 007H, 008H, 008H, 008H, 009H, 00AH, 00BH
        BYTE    00CH, 00DH, 00EH, 00FH, 010H, 011H, 011H, 012H, 013H, 013H, 014H, 014H, 014H, 014H, 014H, 015H
        BYTE    015H, 015H, 014H, 014H, 014H, 014H, 014H, 013H, 013H, 012H, 011H, 011H, 010H, 00FH, 00EH, 00DH
        BYTE    00CH, 00BH, 00AH, 009H, 008H, 007H, 007H, 006H, 005H, 005H, 004H, 004H, 004H, 004H, 004H, 003H
        BYTE    003H, 003H, 004H, 004H, 004H, 004H, 004H, 005H, 005H, 006H, 007H, 007H, 008H, 009H, 00AH, 00BH
        BYTE    00CH, 00DH, 00EH, 00FH, 010H, 011H, 011H, 012H, 013H, 013H, 014H, 014H, 015H, 015H, 015H, 016H
        BYTE    016H, 016H, 015H, 015H, 015H, 014H, 014H, 013H, 013H, 012H, 011H, 011H, 010H, 00FH, 00EH, 00DH
        BYTE    00CH, 00BH, 00AH, 009H, 008H, 007H, 007H, 006H, 005H, 005H, 004H, 004H, 003H, 003H, 003H, 002H
        BYTE    002H, 002H, 003H, 003H, 003H, 004H, 004H, 005H, 005H, 006H, 007H, 007H, 008H, 009H, 00AH, 00BH
        END
