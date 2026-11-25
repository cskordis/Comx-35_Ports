;=====================================================================
; CR.ASM - CRATER RUN for the COMX-35 (1802 machine code, A18 syntax)
; An original lunar-buggy game.  The obstacle and alien course is taken
; from the owner's C64 file; graphics, sound and code are new.
; Start: CALL(@4500).  SCRT: SEP R4 / WORD addr = call, SEP R5 = return.
;=====================================================================
PAGE    EQU     0F800H
CRAM    EQU     0F400H
R3ON    EQU     000C0H
R3OFF   EQU     000D0H
R4OFF   EQU     00080H
R5NORM  EQU     08080H
R5CMEM  EQU     08081H
LDCELL  EQU     00089H
K_UP    EQU     00082H
K_RIGHT EQU     00083H
K_LEFT  EQU     00084H
K_DOWN  EQU     00085H
K_ESC   EQU     00081H
K_CR    EQU     00080H
GA0     EQU     0A000H
GS0     EQU     0A080H
GA1     EQU     0A100H
GS1     EQU     0A180H
GT      EQU     0A200H
MR0     EQU     0A280H
MR1     EQU     0A300H
HR0     EQU     0A380H
HR1     EQU     0A400H
STARS   EQU     0A480H
QBUF    EQU     0A800H
CSAVE   EQU     09C00H
VARS    EQU     0A700H
SAVESP  EQU     0A700H
RND     EQU     0A702H
LASTK   EQU     0A704H
RPT     EQU     0A705H
GPOS    EQU     0A706H
GSUB    EQU     0A707H
MPOS    EQU     0A708H
HPOS    EQU     0A709H
MCNT    EQU     0A70AH
HCNT    EQU     0A70BH
SPD     EQU     0A70CH
ACC     EQU     0A70DH
GFLAG   EQU     0A70EH
PROWS   EQU     0A70FH
PDUE    EQU     0A710H
QN      EQU     0A711H
YOFF    EQU     0A712H
JT      EQU     0A713H
BFR     EQU     0A714H
BROW    EQU     0A715H
BTYP    EQU     0A716H
BDRAWN  EQU     0A717H
DEAD    EQU     0A718H
DTMR    EQU     0A719H
LIVES   EQU     0A71AH
SCORE   EQU     0A71BH
HISC    EQU     0A721H
QR      EQU     0A727H
QRO     EQU     0A728H
CPTR    EQU     0A729H
CDIST   EQU     0A72BH
RPTR    EQU     0A72CH
LETTER  EQU     0A72EH
FPTR    EQU     0A72FH
FQN     EQU     0A731H
FQ      EQU     0A732H
COURSE  EQU     0A73AH
SNDT    EQU     0A73BH
SNDS    EQU     0A73CH
SNDW    EQU     0A73DH
NSDT    EQU     0A73FH
FRM     EQU     0A740H
SECS    EQU     0A742H
SECT    EQU     0A744H
BONUS   EQU     0A745H
WVT     EQU     0A747H
WVN     EQU     0A748H
WVTM    EQU     0A749H
FX      EQU     0A74AH
FY      EQU     0A74BH
FOX     EQU     0A74CH
FOY     EQU     0A74DH
FON     EQU     0A74EH
TKT     EQU     0A74FH
HUDF    EQU     0A750H
MSGT    EQU     0A751H
TMPA    EQU     0A752H
TMPB    EQU     0A753H
TMPC    EQU     0A754H
LOOPS   EQU     0A755H
PAUSE   EQU     0A756H
MUSP    EQU     0A757H
MUST    EQU     0A759H
GOVER   EQU     0A75AH
SUB60   EQU     0A75BH
JPT     EQU     0A75CH
CHKF    EQU     0A75DH
PPTR    EQU     0A75EH
BARF    EQU     0A760H
BUGMAP  EQU     0A761H
PH      EQU     0A770H
AT      EQU     0A780H
AX      EQU     0A784H
AY      EQU     0A788H
AOX     EQU     0A78CH
AOY     EQU     0A790H
AON     EQU     0A794H
AF      EQU     0A798H
AD      EQU     0A79CH
ATM     EQU     0A7A0H
AL      EQU     0A7A4H
BX      EQU     0A7A8H
BY      EQU     0A7ABH
BOX     EQU     0A7AEH
BOY     EQU     0A7B1H
BON     EQU     0A7B4H
BT      EQU     0A7B7H
UX      EQU     0A7BAH
UY      EQU     0A7BCH
UOX     EQU     0A7BEH
UOY     EQU     0A7C0H
UON     EQU     0A7C2H
SX      EQU     0A7C4H
SY      EQU     0A7C6H
SOX     EQU     0A7C8H
SOY     EQU     0A7CAH
SON     EQU     0A7CCH
EX      EQU     0A7CEH
EY      EQU     0A7D1H
ET      EQU     0A7D4H
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
        LBNZ    QP2
        GHI     RE
        SMI     2
        LBNF    QPB
        SMI     10
        LBDF    QPG
        GHI     RE
        SMI     2
        SHL
        ADI     LOW STROW
        PLO     RA
        LDI     HIGH STROW
        ADCI    0
        PHI     RA
        LDA     RA
        PHI     RC
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        PLO     RA
        GHI     RC
        ADCI    0
        PHI     RA
        LDN     RA
        LBR     QPS
QPG     SMI     4
        LBDF    QPR
        ADI     4
        LBZ     QPM0
        SMI     1
        LBZ     QPM1
        SMI     1
        LBZ     QPH0
QPH1
        LDI     HIGH (HPOS)
        PHI     RA
        LDI     LOW (HPOS)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        SDI     127
        ADI     LOW HR1
        PLO     RA
        LDI     HIGH HR1
        PHI     RA
        LDN     RA
        LBR     QPS
QPM0
        LDI     HIGH (MPOS)
        PHI     RA
        LDI     LOW (MPOS)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        SDI     127
        ADI     LOW MR0
        PLO     RA
        LDI     HIGH MR0
        PHI     RA
        LDN     RA
        LBR     QPS
QPM1
        LDI     HIGH (MPOS)
        PHI     RA
        LDI     LOW (MPOS)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        SDI     127
        ADI     LOW MR1
        PLO     RA
        LDI     HIGH MR1
        PHI     RA
        LDN     RA
        LBR     QPS
QPH0
        LDI     HIGH (HPOS)
        PHI     RA
        LDI     LOW (HPOS)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        SDI     127
        ADI     LOW HR0
        PLO     RA
        LDI     HIGH HR0
        PHI     RA
        LDN     RA
        LBR     QPS
QPR     SMI     4
        LBNZ    QPB
        LDI     HIGH (GSUB)
        PHI     RA
        LDI     LOW (GSUB)
        PLO     RA
        LDN     RA
        LBZ     QPR0
        LDI     HIGH (GPOS)
        PHI     RA
        LDI     LOW (GPOS)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        SDI     127
        ADI     LOW GA1
        PLO     RA
        LDI     HIGH GA1
        PHI     RA
        LDN     RA
        LBR     QPS
QPR0
        LDI     HIGH (GPOS)
        PHI     RA
        LDI     LOW (GPOS)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        SDI     127
        ADI     LOW GA0
        PLO     RA
        LDI     HIGH GA0
        PHI     RA
        LDN     RA
        LBR     QPS
QPB     LDI     20H
QPS     PLO     R7
QP2
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        SMI     80
        LBDF    QPRET
        LDN     RA
        ADI     1
        STR     RA
        SMI     1
        STR     R2
        SHL
        ADD
        PLO     RD
        GHI     RE
        SHL
        ADI     LOW ROWTAB
        PLO     RC
        LDI     HIGH ROWTAB
        ADCI    0
        PHI     RC
        LDI     HIGH QBUF
        PHI     RA
        GLO     RD
        PLO     RA
        LDA     RC
        PHI     RD
        LDN     RC
        STR     R2
        GLO     RE
        ADD
        PLO     RD
        GHI     RD
        ADCI    0
        STR     RA
        INC     RA
        GLO     RD
        STR     RA
        INC     RA
        GLO     R7
        STR     RA
        LBR     QPRET
VBDRAW
        LDI     HIGH (GFLAG)
        PHI     RA
        LDI     LOW (GFLAG)
        PLO     RA
        LDN     RA
        LBZ     VB2
        LDI     HIGH (GFLAG)
        PHI     RA
        LDI     LOW (GFLAG)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (GSUB)
        PHI     RA
        LDI     LOW (GSUB)
        PLO     RA
        LDN     RA
        LBNZ    VB1
        SEP     R4
        WORD    CPA0
        SEP     R4
        WORD    CPS0
        LBR     VB1A
VB1
        SEP     R4
        WORD    CPA1
        SEP     R4
        WORD    CPS1
VB1A
        LDI     HIGH (BUGMAP+12)
        PHI     RA
        LDI     LOW (BUGMAP+12)
        PLO     RA
        LDI     HIGH (PAGE+20*40+5)
        PHI     RD
        LDI     LOW (PAGE+20*40+5)
        PLO     RD
        LDA     RA
        LBZ     VBB0
        STR     RD
VBB0  INC     RD
        LDA     RA
        LBZ     VBB1
        STR     RD
VBB1  INC     RD
        LDA     RA
        LBZ     VBB2
        STR     RD
VBB2  INC     RD
VB2
        LDI     HIGH (PROWS)
        PHI     RA
        LDI     LOW (PROWS)
        PLO     RA
        LDN     RA
        PLO     R8
        ANI     1
        LBZ     VB3
        SEP     R4
        WORD    CPM0
VB3     GLO     R8
        ANI     2
        LBZ     VB4
        SEP     R4
        WORD    CPM1
VB4     GLO     R8
        ANI     4
        LBZ     VB5
        SEP     R4
        WORD    CPH0
VB5     GLO     R8
        ANI     8
        LBZ     VB6
        SEP     R4
        WORD    CPH1
VB6
        LDI     HIGH (PROWS)
        PHI     RA
        LDI     LOW (PROWS)
        PLO     RA
        LDI     0
        STR     RA
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
        STR     RD
        BN1     VBQ1
        DEC     RA
        DEC     RA
        DEC     RA
        LBR     VBS
VBQ1    DEC     R8
        GLO     R8
        LBNZ    VBQ
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
CPA0
        LDI     HIGH (GPOS)
        PHI     RA
        LDI     LOW (GPOS)
        PLO     RA
        LDN     RA
        SDI     88
        ADI     LOW GA0
        PLO     RA
        LDI     HIGH GA0
        PHI     RA
        LDI     HIGH (PAGE+20*40+39)
        PHI     RD
        LDI     LOW (PAGE+20*40+39)
        PLO     RD
        SEX     RD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        SEX     R2
        SEP     R5
CPS0
        LDI     HIGH (GPOS)
        PHI     RA
        LDI     LOW (GPOS)
        PLO     RA
        LDN     RA
        SDI     88
        ADI     LOW GS0
        PLO     RA
        LDI     HIGH GS0
        PHI     RA
        LDI     HIGH (PAGE+21*40+39)
        PHI     RD
        LDI     LOW (PAGE+21*40+39)
        PLO     RD
        SEX     RD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        SEX     R2
        SEP     R5
CPA1
        LDI     HIGH (GPOS)
        PHI     RA
        LDI     LOW (GPOS)
        PLO     RA
        LDN     RA
        SDI     88
        ADI     LOW GA1
        PLO     RA
        LDI     HIGH GA1
        PHI     RA
        LDI     HIGH (PAGE+20*40+39)
        PHI     RD
        LDI     LOW (PAGE+20*40+39)
        PLO     RD
        SEX     RD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        SEX     R2
        SEP     R5
CPS1
        LDI     HIGH (GPOS)
        PHI     RA
        LDI     LOW (GPOS)
        PLO     RA
        LDN     RA
        SDI     88
        ADI     LOW GS1
        PLO     RA
        LDI     HIGH GS1
        PHI     RA
        LDI     HIGH (PAGE+21*40+39)
        PHI     RD
        LDI     LOW (PAGE+21*40+39)
        PLO     RD
        SEX     RD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        SEX     R2
        SEP     R5
CPM0
        LDI     HIGH (MPOS)
        PHI     RA
        LDI     LOW (MPOS)
        PLO     RA
        LDN     RA
        SDI     88
        ADI     LOW MR0
        PLO     RA
        LDI     HIGH MR0
        PHI     RA
        LDI     HIGH (PAGE+12*40+39)
        PHI     RD
        LDI     LOW (PAGE+12*40+39)
        PLO     RD
        SEX     RD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        SEX     R2
        SEP     R5
CPM1
        LDI     HIGH (MPOS)
        PHI     RA
        LDI     LOW (MPOS)
        PLO     RA
        LDN     RA
        SDI     88
        ADI     LOW MR1
        PLO     RA
        LDI     HIGH MR1
        PHI     RA
        LDI     HIGH (PAGE+13*40+39)
        PHI     RD
        LDI     LOW (PAGE+13*40+39)
        PLO     RD
        SEX     RD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        SEX     R2
        SEP     R5
CPH0
        LDI     HIGH (HPOS)
        PHI     RA
        LDI     LOW (HPOS)
        PLO     RA
        LDN     RA
        SDI     88
        ADI     LOW HR0
        PLO     RA
        LDI     HIGH HR0
        PHI     RA
        LDI     HIGH (PAGE+14*40+39)
        PHI     RD
        LDI     LOW (PAGE+14*40+39)
        PLO     RD
        SEX     RD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        SEX     R2
        SEP     R5
CPH1
        LDI     HIGH (HPOS)
        PHI     RA
        LDI     LOW (HPOS)
        PLO     RA
        LDN     RA
        SDI     88
        ADI     LOW HR1
        PLO     RA
        LDI     HIGH HR1
        PHI     RA
        LDI     HIGH (PAGE+15*40+39)
        PHI     RD
        LDI     LOW (PAGE+15*40+39)
        PLO     RD
        SEX     RD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        LDA     RA
        STXD
        SEX     R2
        SEP     R5
; BG - background character for row RE.1, column RE.0
BG      GHI     RE
        SMI     2
        LBNF    BGB
        SMI     10
        LBDF    BG2
        GHI     RE
        SMI     2
        SHL
        ADI     LOW STROW
        PLO     RA
        LDI     HIGH STROW
        ADCI    0
        PHI     RA
        LDA     RA
        PHI     RC
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        PLO     RA
        GHI     RC
        ADCI    0
        PHI     RA
        LDN     RA
        SEP     R5
BG2     SMI     4
        LBDF    BGB
        ADI     4
        PLO     RC
        LBZ     BGM0
        SMI     1
        LBZ     BGM1
        SMI     1
        LBZ     BGH0
BGH1
        LDI     HIGH (HPOS)
        PHI     RA
        LDI     LOW (HPOS)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        SDI     127
        ADI     LOW HR1
        PLO     RA
        LDI     HIGH HR1
        PHI     RA
        LDN     RA
        SEP     R5
BGM0
        LDI     HIGH (MPOS)
        PHI     RA
        LDI     LOW (MPOS)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        SDI     127
        ADI     LOW MR0
        PLO     RA
        LDI     HIGH MR0
        PHI     RA
        LDN     RA
        SEP     R5
BGM1
        LDI     HIGH (MPOS)
        PHI     RA
        LDI     LOW (MPOS)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        SDI     127
        ADI     LOW MR1
        PLO     RA
        LDI     HIGH MR1
        PHI     RA
        LDN     RA
        SEP     R5
BGH0
        LDI     HIGH (HPOS)
        PHI     RA
        LDI     LOW (HPOS)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        SDI     127
        ADI     LOW HR0
        PLO     RA
        LDI     HIGH HR0
        PHI     RA
        LDN     RA
        SEP     R5
BGB     LDI     20H
        SEP     R5
; SETCELL - R8.0 = cell index 0-63, R8.1 = type
SETCELL
        GLO     R8
        ANI     63
        PLO     R8
        ADI     LOW GT
        PLO     RA
        LDI     HIGH GT
        PHI     RA
        GHI     R8
        STR     RA
        GLO     RA
        ADI     64
        PLO     RA
        GHI     R8
        STR     RA
        GHI     R8
        ADI     LOW C0A
        PLO     RC
        LDI     HIGH C0A
        ADCI    0
        PHI     RC
        LDN     RC
        PLO     R9
        GHI     R8
        ADI     LOW C0S
        PLO     RC
        LDI     HIGH C0S
        ADCI    0
        PHI     RC
        LDN     RC
        PHI     R9
        GLO     R8
        SDI     127
        PLO     RA
        LDI     HIGH GA0
        PHI     RA
        GLO     R9
        STR     RA
        GLO     RA
        SMI     64
        PLO     RA
        GLO     R9
        STR     RA
        GLO     RA
        ADI     80H
        PLO     RA
        GHI     R9
        STR     RA
        GLO     RA
        ADI     64
        PLO     RA
        GHI     R9
        STR     RA
        GLO     R8
        SMI     1
        ANI     63
        PLO     RB
        ADI     LOW GT
        PLO     RA
        LDI     HIGH GT
        PHI     RA
        LDN     RA
        PHI     RB
        SEP     R4
        WORD    SETPAIR
        GLO     R8
        PLO     RB
        ADI     1
        ANI     63
        ADI     LOW GT
        PLO     RA
        LDI     HIGH GT
        PHI     RA
        LDN     RA
        PLO     R9
        GHI     R8
        PHI     RB
        GHI     R8
        PHI     R9
        GHI     R8
        STXD
        GLO     R9
        PHI     R8
        SEP     R4
        WORD    SETPAIR
        IRX
        LDX
        PHI     R8
        SEP     R5
SETPAIR
        GHI     RB
        ADI     LOW MULNT
        PLO     RA
        LDI     HIGH MULNT
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        GHI     R8
        ADD
        PLO     R9
        LDI     0
        ADCI    0
        PHI     R9
        GLO     R9
        ADI     LOW P1A
        PLO     RC
        GHI     R9
        ADCI    HIGH P1A
        PHI     RC
        LDN     RC
        PLO     R7
        GLO     R9
        ADI     LOW P1S
        PLO     RC
        GHI     R9
        ADCI    HIGH P1S
        PHI     RC
        LDN     RC
        PHI     R7
        GLO     RB
        SDI     127
        PLO     RA
        LDI     HIGH GA1
        PHI     RA
        GLO     R7
        STR     RA
        GLO     RA
        SMI     64
        PLO     RA
        GLO     R7
        STR     RA
        GLO     RA
        ADI     80H
        PLO     RA
        GHI     R7
        STR     RA
        GLO     RA
        ADI     64
        PLO     RA
        GHI     R7
        STR     RA
        SEP     R5
CELLT   ANI     63
        ADI     LOW GT
        PLO     RA
        LDI     HIGH GT
        PHI     RA
        LDN     RA
        SEP     R5
; NEWCELL - next ground cell from the feature queue
NEWCELL
        LDI     HIGH (FPTR)
        PHI     RA
        LDI     LOW (FPTR)
        PLO     RA
        LDA     RA
        PHI     RC
        LDN     RA
        PLO     RC
        GHI     RC
        LBZ     NC2
        LDA     RC
        LBZ     NC1
        PHI     R8
        LDI     HIGH (FPTR)
        PHI     RA
        LDI     LOW (FPTR)
        PLO     RA
        GHI     RC
        STR     RA
        INC     RA
        GLO     RC
        STR     RA
        LBR     NC9
NC1
        LDI     HIGH (FPTR)
        PHI     RA
        LDI     LOW (FPTR)
        PLO     RA
        LDI     0
        STR     RA
        LBR     NCF
NC2
        LDI     HIGH (FQN)
        PHI     RA
        LDI     LOW (FQN)
        PLO     RA
        LDN     RA
        LBZ     NCF
        LDI     HIGH (FQ)
        PHI     RA
        LDI     LOW (FQ)
        PLO     RA
        LDN     RA
        PLO     R9
        LDI     7
        PLO     RC
NC3     INC     RA
        LDN     RA
        DEC     RA
        STR     RA
        INC     RA
        DEC     RC
        GLO     RC
        LBNZ    NC3
        LDI     HIGH (FQN)
        PHI     RA
        LDI     LOW (FQN)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        GLO     R9
        SHL
        ADI     LOW FEATT
        PLO     RA
        LDI     HIGH FEATT
        ADCI    0
        PHI     RA
        LDA     RA
        PHI     RC
        LDN     RA
        PLO     RC
        LDA     RC
        PHI     R8
        LDI     HIGH (FPTR)
        PHI     RA
        LDI     LOW (FPTR)
        PLO     RA
        GHI     RC
        STR     RA
        INC     RA
        GLO     RC
        STR     RA
        LBR     NC9
NCF     LDI     0
        PHI     R8
NC9
        LDI     HIGH (GPOS)
        PHI     RA
        LDI     LOW (GPOS)
        PLO     RA
        LDN     RA
        ADI     41
        PLO     R8
        SEP     R4
        WORD    SETCELL
        SEP     R5
FEATQ   PLO     R9
        LDI     HIGH (FQN)
        PHI     RA
        LDI     LOW (FQN)
        PLO     RA
        LDN     RA
        SMI     8
        LBDF    FQF
        LDN     RA
        ADI     1
        STR     RA
        SMI     1
        ADI     LOW FQ
        PLO     RA
        LDI     HIGH FQ
        ADCI    0
        PHI     RA
        GLO     R9
        STR     RA
        ADI     0
        SEP     R5
FQF     SEP     R5
; COURSE - process course events for one ground column
CSTEP
        LDI     HIGH (CDIST)
        PHI     RA
        LDI     LOW (CDIST)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
CS0
        LDI     HIGH (CPTR)
        PHI     RA
        LDI     LOW (CPTR)
        PLO     RA
        LDA     RA
        PHI     RC
        LDN     RA
        PLO     RC
        LDA     RC
        ANI     7
        STR     R2
        LDI     HIGH (CDIST)
        PHI     RA
        LDI     LOW (CDIST)
        PLO     RA
        LDN     RA
        SM
        LBNF    CSX
        LDN     RC
        SHR
        SHR
        SHR
        PLO     R9
        GLO     R9
        XRI     0
        LBZ     OP0
        GLO     R9
        XRI     1
        LBZ     OP1
        GLO     R9
        XRI     2
        LBZ     OP2
        GLO     R9
        XRI     3
        LBZ     OP3
        GLO     R9
        XRI     4
        LBZ     OP4
        GLO     R9
        XRI     5
        LBZ     OP5
        GLO     R9
        XRI     6
        LBZ     OP6
        GLO     R9
        XRI     7
        LBZ     OP7
        GLO     R9
        XRI     8
        LBZ     OP8
        GLO     R9
        XRI     9
        LBZ     OP9
        GLO     R9
        XRI     10
        LBZ     OP10
        GLO     R9
        XRI     11
        LBZ     OP11
        GLO     R9
        XRI     12
        LBZ     OP12
        GLO     R9
        XRI     13
        LBZ     OP13
        GLO     R9
        XRI     14
        LBZ     OP14
        GLO     R9
        XRI     15
        LBZ     OP15
        GLO     R9
        XRI     16
        LBZ     OP16
        GLO     R9
        XRI     17
        LBZ     OP17
        GLO     R9
        XRI     18
        LBZ     OP18
        GLO     R9
        XRI     19
        LBZ     OP19
        GLO     R9
        XRI     20
        LBZ     OP20
        GLO     R9
        XRI     21
        LBZ     OP21
        GLO     R9
        XRI     22
        LBZ     OP22
        GLO     R9
        XRI     23
        LBZ     OP23
        GLO     R9
        XRI     24
        LBZ     OP24
        GLO     R9
        XRI     25
        LBZ     OP25
        GLO     R9
        XRI     26
        LBZ     OP26
        GLO     R9
        XRI     27
        LBZ     OP27
        GLO     R9
        XRI     28
        LBZ     OP28
        LBR     EVOK
CSX     SEP     R5
EVOK
        LDI     HIGH (CPTR+1)
        PHI     RA
        LDI     LOW (CPTR+1)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        DEC     RA
        LDN     RA
        ADCI    0
        STR     RA
        LDI     HIGH (CDIST)
        PHI     RA
        LDI     LOW (CDIST)
        PLO     RA
        LDI     0
        STR     RA
        LBR     CS0
EVFAIL  SEP     R5
OP1   LDI     3
        SEP     R4
        WORD    FEATQ
        LBDF    EVFAIL
        LBR     EVOK
OP2   LDI     3
        SEP     R4
        WORD    FEATQ
        LBDF    EVFAIL
        LBR     EVOK
OP3   LDI     1
        SEP     R4
        WORD    FEATQ
        LBDF    EVFAIL
        LBR     EVOK
OP4   LDI     2
        SEP     R4
        WORD    FEATQ
        LBDF    EVFAIL
        LBR     EVOK
OP5   LDI     6
        SEP     R4
        WORD    FEATQ
        LBDF    EVFAIL
        LBR     EVOK
OP6   LDI     5
        SEP     R4
        WORD    FEATQ
        LBDF    EVFAIL
        LBR     EVOK
OP7   LDI     4
        SEP     R4
        WORD    FEATQ
        LBDF    EVFAIL
        LBR     EVOK
OP8   LDI     7
        SEP     R4
        WORD    FEATQ
        LBDF    EVFAIL
        LBR     EVOK
OP16   LDI     8
        SEP     R4
        WORD    FEATQ
        LBDF    EVFAIL
        LBR     EVOK
OP15   LDI     9
        SEP     R4
        WORD    FEATQ
        LBDF    EVFAIL
        LBR     EVCP
OP19   LDI     9
        SEP     R4
        WORD    FEATQ
        LBDF    EVFAIL
        LBR     EVCP
OP20   LDI     9
        SEP     R4
        WORD    FEATQ
        LBDF    EVFAIL
        LBR     EVCP
OP27   LDI     9
        SEP     R4
        WORD    FEATQ
        LBDF    EVFAIL
        LBR     EVCP
OP28   LDI     9
        SEP     R4
        WORD    FEATQ
        LBDF    EVFAIL
        LBR     EVCP
EVCP
        LDI     HIGH (CPTR)
        PHI     RA
        LDI     LOW (CPTR)
        PLO     RA
        LDA     RA
        PHI     RC
        LDN     RA
        PLO     RC
        INC     RC
        LDI     HIGH (PPTR)
        PHI     RA
        LDI     LOW (PPTR)
        PLO     RA
        GHI     RC
        STR     RA
        INC     RA
        GLO     RC
        STR     RA
        LBR     EVOK
OP0
        LDI     HIGH (CPTR)
        PHI     RA
        LDI     LOW (CPTR)
        PLO     RA
        LDI     HIGH (CRS+14AH)
        STR     RA
        INC     RA
        LDI     LOW (CRS+14AH)
        STR     RA
        LDI     HIGH (LOOPS)
        PHI     RA
        LDI     LOW (LOOPS)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     EVOK
OP18   LBR     EVOK
OP9   LDI     1
        SEP     R4
        WORD    SPAWN
        LBDF    EVFAIL
        LBR     EVOK
OP10   LDI     3
        SEP     R4
        WORD    SPAWN
        LBDF    EVFAIL
        LBR     EVOK
OP11   LDI     2
        SEP     R4
        WORD    SPAWN
        LBDF    EVFAIL
        LBR     EVOK
OP12   LDI     4
        SEP     R4
        WORD    SPAWN
        LBDF    EVFAIL
        LBR     EVOK
OP13   LDI     1
        SEP     R4
        WORD    SPAWN
        LBDF    EVFAIL
        LBR     EVOK
OP14   LDI     2
        SEP     R4
        WORD    SPAWN
        LBDF    EVFAIL
        LBR     EVOK
OP17   LDI     4
        SEP     R4
        WORD    SPAWN
        LBDF    EVFAIL
        LBR     EVOK
OP21
        LDI     HIGH (WVN)
        PHI     RA
        LDI     LOW (WVN)
        PLO     RA
        LDN     RA
        LBNZ    EVFAIL
        LDI     HIGH (WVT)
        PHI     RA
        LDI     LOW (WVT)
        PLO     RA
        LDI     3
        STR     RA
        LDI     HIGH (WVN)
        PHI     RA
        LDI     LOW (WVN)
        PLO     RA
        LDI     3
        STR     RA
        LDI     HIGH (WVTM)
        PHI     RA
        LDI     LOW (WVTM)
        PLO     RA
        LDI     1
        STR     RA
        LBR     EVOK
OP22
        LDI     HIGH (WVN)
        PHI     RA
        LDI     LOW (WVN)
        PLO     RA
        LDN     RA
        LBNZ    EVFAIL
        LDI     HIGH (WVT)
        PHI     RA
        LDI     LOW (WVT)
        PLO     RA
        LDI     3
        STR     RA
        LDI     HIGH (WVN)
        PHI     RA
        LDI     LOW (WVN)
        PLO     RA
        LDI     5
        STR     RA
        LDI     HIGH (WVTM)
        PHI     RA
        LDI     LOW (WVTM)
        PLO     RA
        LDI     1
        STR     RA
        LBR     EVOK
OP23
        LDI     HIGH (WVN)
        PHI     RA
        LDI     LOW (WVN)
        PLO     RA
        LDN     RA
        LBNZ    EVFAIL
        LDI     HIGH (WVT)
        PHI     RA
        LDI     LOW (WVT)
        PLO     RA
        LDI     3
        STR     RA
        LDI     HIGH (WVN)
        PHI     RA
        LDI     LOW (WVN)
        PLO     RA
        LDI     8
        STR     RA
        LDI     HIGH (WVTM)
        PHI     RA
        LDI     LOW (WVTM)
        PLO     RA
        LDI     1
        STR     RA
        LBR     EVOK
OP24
        LDI     HIGH (WVN)
        PHI     RA
        LDI     LOW (WVN)
        PLO     RA
        LDN     RA
        LBNZ    EVFAIL
        LDI     HIGH (WVT)
        PHI     RA
        LDI     LOW (WVT)
        PLO     RA
        LDI     2
        STR     RA
        LDI     HIGH (WVN)
        PHI     RA
        LDI     LOW (WVN)
        PLO     RA
        LDI     3
        STR     RA
        LDI     HIGH (WVTM)
        PHI     RA
        LDI     LOW (WVTM)
        PLO     RA
        LDI     1
        STR     RA
        LBR     EVOK
OP25
        LDI     HIGH (WVN)
        PHI     RA
        LDI     LOW (WVN)
        PLO     RA
        LDN     RA
        LBNZ    EVFAIL
        LDI     HIGH (WVT)
        PHI     RA
        LDI     LOW (WVT)
        PLO     RA
        LDI     2
        STR     RA
        LDI     HIGH (WVN)
        PHI     RA
        LDI     LOW (WVN)
        PLO     RA
        LDI     5
        STR     RA
        LDI     HIGH (WVTM)
        PHI     RA
        LDI     LOW (WVTM)
        PLO     RA
        LDI     1
        STR     RA
        LBR     EVOK
OP26
        LDI     HIGH (WVN)
        PHI     RA
        LDI     LOW (WVN)
        PLO     RA
        LDN     RA
        LBNZ    EVFAIL
        LDI     HIGH (WVT)
        PHI     RA
        LDI     LOW (WVT)
        PLO     RA
        LDI     2
        STR     RA
        LDI     HIGH (WVN)
        PHI     RA
        LDI     LOW (WVN)
        PLO     RA
        LDI     8
        STR     RA
        LDI     HIGH (WVTM)
        PHI     RA
        LDI     LOW (WVTM)
        PLO     RA
        LDI     1
        STR     RA
        LBR     EVOK
; SPAWN - start an alien of kind D (1-4); DF=1 when all slots are busy
SPAWN   PLO     R9
        LDI     0
        PLO     R8
SP1     GLO     R8
        ADI     LOW AT
        PLO     RA
        LDI     HIGH AT
        PHI     RA
        LDN     RA
        LBZ     SP2
        INC     R8
        GLO     R8
        XRI     3
        LBNZ    SP1
        SMI     0
        SEP     R5
SP2     GLO     R9
        STR     RA
        GLO     R8
        ADI     LOW AX
        PLO     RA
        LDI     HIGH AX
        PHI     RA
        LDI     39
        STR     RA
        GLO     R8
        ADI     LOW AON
        PLO     RA
        LDI     HIGH AON
        PHI     RA
        LDI     0
        STR     RA
        GLO     R8
        ADI     LOW ATM
        PLO     RA
        LDI     HIGH ATM
        PHI     RA
        LDI     1
        STR     RA
        GLO     R8
        ADI     LOW AL
        PLO     RA
        LDI     HIGH AL
        PHI     RA
        LDI     250
        STR     RA
        GLO     R8
        ADI     LOW AD
        PLO     RA
        LDI     HIGH AD
        PHI     RA
        LDI     0FFH
        STR     RA
        GLO     R8
        ADI     LOW AF
        PLO     RA
        LDI     HIGH AF
        PHI     RA
        LDI     0
        STR     RA
        GLO     R9
        XRI     4
        LBNZ    SP3
        GLO     R8
        ADI     LOW AY
        PLO     RA
        LDI     HIGH AY
        PHI     RA
        LDI     19
        STR     RA
        LBR     SP5
SP3
        SEP     R4
        WORD    RAND
        ANI     3
        PLO     R7
        GLO     R9
        XRI     3
        LBNZ    SP4
        GLO     R7
        ADI     4
        PLO     R7
SP4     GLO     R7
        ADI     3
        PLO     R7
        GLO     R8
        ADI     LOW AY
        PLO     RA
        LDI     HIGH AY
        PHI     RA
        GLO     R7
        STR     RA
SP5
        ADI     0
        SEP     R5
; ALIENS - move, bomb and draw
ALIENS
        LDI     HIGH (WVN)
        PHI     RA
        LDI     LOW (WVN)
        PLO     RA
        LDN     RA
        LBZ     AW2
        LDI     HIGH (WVTM)
        PHI     RA
        LDI     LOW (WVTM)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    AW2
        LDI     HIGH (WVTM)
        PHI     RA
        LDI     LOW (WVTM)
        PLO     RA
        LDI     45
        STR     RA
        LDI     HIGH (WVT)
        PHI     RA
        LDI     LOW (WVT)
        PLO     RA
        LDN     RA
        SEP     R4
        WORD    SPAWN
        LBDF    AW2
        LDI     HIGH (WVN)
        PHI     RA
        LDI     LOW (WVN)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
AW2     LDI     0
        PLO     R8
AL0
        GLO     R8
        ADI     LOW AT
        PLO     RA
        LDI     HIGH AT
        PHI     RA
        LDN     RA
        LBZ     ALN
        PHI     R9
        GLO     R8
        ADI     LOW ATM
        PLO     RA
        LDI     HIGH ATM
        PHI     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    ALN
        GHI     R9
        ADI     LOW (KSPD-1)
        PLO     RC
        LDI     HIGH (KSPD-1)
        ADCI    0
        PHI     RC
        LDN     RC
        STR     RA
        GLO     R8
        ADI     LOW AL
        PLO     RA
        LDI     HIGH AL
        PHI     RA
        LDN     RA
        LBZ     AL1
        SMI     1
        STR     RA
AL1     GHI     R9
        XRI     4
        LBNZ    ALS
        GLO     R8
        ADI     LOW AX
        PLO     RA
        LDI     HIGH AX
        PHI     RA
        LDN     RA
        LBZ     AKILL0
        SMI     1
        STR     RA
        LBR     ALD
ALS
        GLO     R8
        ADI     LOW AX
        PLO     RA
        LDI     HIGH AX
        PHI     RA
        LDN     RA
        PLO     R7
        GLO     R8
        ADI     LOW AD
        PLO     RA
        LDI     HIGH AD
        PHI     RA
        LDN     RA
        STR     R2
        GLO     R7
        ADD
        PLO     R7
        GLO     R8
        ADI     LOW AL
        PLO     RA
        LDI     HIGH AL
        PHI     RA
        LDN     RA
        LBNZ    ALS2
        GLO     R7
        XRI     0FFH
        LBZ     AKILL0
        LBR     ALS4
ALS2    GLO     R7
        SMI     2
        LBNF    ALS3
        GLO     R7
        SMI     39
        LBNF    ALS4
ALS3
        GLO     R8
        ADI     LOW AD
        PLO     RA
        LDI     HIGH AD
        PHI     RA
        LDN     RA
        SDI     0
        STR     RA
        LBR     ALS5
ALS4
        GLO     R8
        ADI     LOW AX
        PLO     RA
        LDI     HIGH AX
        PHI     RA
        GLO     R7
        STR     RA
ALS5
        SEP     R4
        WORD    RAND
        PHI     RB
        ANI     1FH
        LBNZ    ALS6
        GLO     R8
        ADI     LOW AD
        PLO     RA
        LDI     HIGH AD
        PHI     RA
        LDN     RA
        SDI     0
        STR     RA
ALS6    GHI     RB
        ANI     0E0H
        LBNZ    ALB
        GLO     R8
        ADI     LOW AY
        PLO     RA
        LDI     HIGH AY
        PHI     RA
        LDN     RA
        PLO     R7
        GHI     RB
        ANI     10H
        LBZ     ALS7
        GLO     R7
        SMI     3
        LBNF    ALB
        GLO     R7
        SMI     1
        STR     RA
        LBR     ALB
ALS7    GHI     R9
        XRI     3
        LBZ     ALS8
        GLO     R7
        SMI     7
        LBDF    ALB
        LBR     ALS9
ALS8    GLO     R7
        SMI     10
        LBDF    ALB
ALS9    GLO     R7
        ADI     1
        STR     RA
ALB     GHI     R9
        XRI     2
        LBZ     ALD
        GHI     R9
        XRI     3
        LBZ     ALB2
        GHI     RB
        XRI     55H
        ANI     1FH
        LBNZ    ALD
        LBR     ALB3
ALB2    GHI     RB
        XRI     0AAH
        ANI     0FH
        LBNZ    ALD
ALB3
        GLO     R8
        ADI     LOW AX
        PLO     RA
        LDI     HIGH AX
        PHI     RA
        LDN     RA
        PLO     RE
        GLO     R8
        ADI     LOW AY
        PLO     RA
        LDI     HIGH AY
        PHI     RA
        LDN     RA
        ADI     1
        PHI     RE
        GHI     R9
        XRI     3
        LBZ     ALB4
        LDI     0
        LBR     ALB5
ALB4    LDI     1
ALB5
        SEP     R4
        WORD    DROPB
ALD
        GLO     R8
        ADI     LOW AX
        PLO     RA
        LDI     HIGH AX
        PHI     RA
        LDN     RA
        PLO     RE
        GLO     R8
        ADI     LOW AY
        PLO     RA
        LDI     HIGH AY
        PHI     RA
        LDN     RA
        PHI     RE
        SEP     R4
        WORD    SPRMOVE_A
ALN     INC     R8
        GLO     R8
        XRI     3
        LBNZ    AL0
        SEP     R5
AKILL0
        SEP     R4
        WORD    AKILL
        LBR     ALN
AKILL
        GLO     R8
        ADI     LOW AT
        PLO     RA
        LDI     HIGH AT
        PHI     RA
        LDI     0
        STR     RA
        GLO     R8
        ADI     LOW AON
        PLO     RA
        LDI     HIGH AON
        PHI     RA
        LDN     RA
        LBZ     AKX
        LDI     0
        STR     RA
        GLO     R8
        ADI     LOW AOX
        PLO     RA
        LDI     HIGH AOX
        PHI     RA
        LDN     RA
        PLO     RE
        GLO     R8
        ADI     LOW AOY
        PLO     RA
        LDI     HIGH AOY
        PHI     RA
        LDN     RA
        PHI     RE
        LDI     0
        SEP     R1
AKX     SEP     R5
SPRMOVE_A
        GLO     R8
        ADI     LOW AON
        PLO     RA
        LDI     HIGH AON
        PHI     RA
        LDN     RA
        LBZ     SMA2
        GLO     R8
        ADI     LOW AOX
        PLO     RA
        LDI     HIGH AOX
        PHI     RA
        LDN     RA
        STR     R2
        GLO     RE
        XOR
        LBNZ    SMA1
        GLO     R8
        ADI     LOW AOY
        PLO     RA
        LDI     HIGH AOY
        PHI     RA
        LDN     RA
        STR     R2
        GHI     RE
        XOR
        LBZ     SMA3
SMA1    GHI     RE
        STXD
        GLO     RE
        STXD
        GLO     R8
        ADI     LOW AOX
        PLO     RA
        LDI     HIGH AOX
        PHI     RA
        LDN     RA
        PLO     RE
        GLO     R8
        ADI     LOW AOY
        PLO     RA
        LDI     HIGH AOY
        PHI     RA
        LDN     RA
        PHI     RE
        LDI     0
        SEP     R1
        IRX
        LDXA
        PLO     RE
        LDX
        PHI     RE
SMA2
        GLO     R8
        ADI     LOW AOX
        PLO     RA
        LDI     HIGH AOX
        PHI     RA
        GLO     RE
        STR     RA
        GLO     R8
        ADI     LOW AOY
        PLO     RA
        LDI     HIGH AOY
        PHI     RA
        GHI     RE
        STR     RA
        GLO     R8
        ADI     LOW AON
        PLO     RA
        LDI     HIGH AON
        PHI     RA
        LDI     1
        STR     RA
SMA4
        GLO     R8
        ADI     LOW AT
        PLO     RA
        LDI     HIGH AT
        PHI     RA
        LDN     RA
        ADI     LOW (KCHR-1)
        PLO     RC
        LDI     HIGH (KCHR-1)
        ADCI    0
        PHI     RC
        LDN     RC
        SEP     R1
        SEP     R5
SMA3
        LDI     HIGH (PROWS)
        PHI     RA
        LDI     LOW (PROWS)
        PLO     RA
        LDN     RA
        LBZ     SMX
        GHI     RE
        SMI     12
        LBNF    SMX
        SMI     4
        LBDF    SMX
        LBR     SMA4
SMX     SEP     R5
; DROPB - new bomb at RE (row,col), D = 1 makes craters
DROPB   ADI     1
        PLO     R9
        LDI     0
        PLO     RB
DB1     GLO     RB
        ADI     LOW BT
        PLO     RA
        LDI     HIGH BT
        PHI     RA
        LDN     RA
        LBZ     DB2
        INC     RB
        GLO     RB
        XRI     3
        LBNZ    DB1
        SEP     R5
DB2     GLO     R9
        STR     RA
        GLO     RB
        ADI     LOW BX
        PLO     RA
        GLO     RE
        STR     RA
        GLO     RB
        ADI     LOW BY
        PLO     RA
        GHI     RE
        STR     RA
        GLO     RB
        ADI     LOW BON
        PLO     RA
        LDI     0
        STR     RA
        SEP     R5
; BOMBS - fall one row every 4 frames
BOMBS
        LDI     HIGH (FRM+1)
        PHI     RA
        LDI     LOW (FRM+1)
        PLO     RA
        LDN     RA
        ANI     3
        LBNZ    BMX
        LDI     0
        PLO     R8
BM0
        GLO     R8
        ADI     LOW BT
        PLO     RA
        LDI     HIGH BT
        PHI     RA
        LDN     RA
        LBZ     BMN
        GLO     R8
        ADI     LOW BY
        PLO     RA
        LDI     HIGH BY
        PHI     RA
        LDN     RA
        ADI     1
        STR     RA
        PHI     RE
        GLO     R8
        ADI     LOW BX
        PLO     RA
        LDI     HIGH BX
        PHI     RA
        LDN     RA
        PLO     RE
        GHI     RE
        SMI     20
        LBNF    BM3
        GLO     R8
        ADI     LOW BT
        PLO     RA
        LDI     HIGH BT
        PHI     RA
        LDN     RA
        XRI     2
        LBNZ    BM2
        GLO     RE
        SMI     11
        LBNF    BM2
        SEP     R4
        WORD    BCRATER
BM2
        GLO     R8
        ADI     LOW BX
        PLO     RA
        LDI     HIGH BX
        PHI     RA
        LDN     RA
        SMI     5
        LBNF    BM2A
        SMI     3
        LBDF    BM2A
        LDI     HIGH (YOFF)
        PHI     RA
        LDI     LOW (YOFF)
        PLO     RA
        LDN     RA
        LBNZ    BM2A
        SEP     R4
        WORD    KILLBUG
BM2A
        SEP     R4
        WORD    BKILL
        GLO     R8
        ADI     LOW BX
        PLO     RA
        LDI     HIGH BX
        PHI     RA
        LDN     RA
        PLO     RE
        LDI     19
        PHI     RE
        SEP     R4
        WORD    EFFECT
        LDI     HIGH (2780H)
        PHI     RC
        LDI     LOW (2780H)
        PLO     RC
        LDI     8
        SEP     R4
        WORD    NOISE
        LBR     BMN
BM3
        SEP     R4
        WORD    SPRMOVE_B
        GHI     RE
        SMI     15
        LBNF    BMN
        GLO     R8
        ADI     LOW BX
        PLO     RA
        LDI     HIGH BX
        PHI     RA
        LDN     RA
        SMI     5
        LBNF    BMN
        SMI     3
        LBDF    BMN
        GLO     R8
        ADI     LOW BY
        PLO     RA
        LDI     HIGH BY
        PHI     RA
        LDN     RA
        PHI     RE
        SEP     R4
        WORD    BUGROW
        LBZ     BMN
        SEP     R4
        WORD    KILLBUG
BMN     INC     R8
        GLO     R8
        XRI     3
        LBNZ    BM0
BMX     SEP     R5
BKILL
        GLO     R8
        ADI     LOW BT
        PLO     RA
        LDI     HIGH BT
        PHI     RA
        LDI     0
        STR     RA
        GLO     R8
        ADI     LOW BON
        PLO     RA
        LDI     HIGH BON
        PHI     RA
        LDN     RA
        LBZ     BKX
        LDI     0
        STR     RA
        GLO     R8
        ADI     LOW BOX
        PLO     RA
        LDI     HIGH BOX
        PHI     RA
        LDN     RA
        PLO     RE
        GLO     R8
        ADI     LOW BOY
        PLO     RA
        LDI     HIGH BOY
        PHI     RA
        LDN     RA
        PHI     RE
        LDI     0
        SEP     R1
BKX     SEP     R5
SPRMOVE_B
        GLO     R8
        ADI     LOW BON
        PLO     RA
        LDI     HIGH BON
        PHI     RA
        LDN     RA
        LBZ     SMB2
        GLO     R8
        ADI     LOW BOX
        PLO     RA
        LDI     HIGH BOX
        PHI     RA
        LDN     RA
        PLO     RE
        GLO     R8
        ADI     LOW BOY
        PLO     RA
        LDI     HIGH BOY
        PHI     RA
        LDN     RA
        PHI     RE
        LDI     0
        SEP     R1
SMB2
        GLO     R8
        ADI     LOW BY
        PLO     RA
        LDI     HIGH BY
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     R8
        ADI     LOW BX
        PLO     RA
        LDI     HIGH BX
        PHI     RA
        LDN     RA
        PLO     RE
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
        GLO     R8
        ADI     LOW BON
        PLO     RA
        LDI     HIGH BON
        PHI     RA
        LDI     1
        STR     RA
        LDI     255
        SEP     R1
        GLO     R8
        ADI     LOW BY
        PLO     RA
        LDI     HIGH BY
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     R8
        ADI     LOW BX
        PLO     RA
        LDI     HIGH BX
        PHI     RA
        LDN     RA
        PLO     RE
        SEP     R5
BCRATER GLO     R8
        STXD
        LDI     HIGH (GPOS)
        PHI     RA
        LDI     LOW (GPOS)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        PLO     RB
        LDI     HIGH (GSUB)
        PHI     RA
        LDI     LOW (GSUB)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RB
        ADD
        SMI     1
        PLO     RB
        GLO     RB
        ADI     0
        ANI     63
        ADI     LOW GT
        PLO     RA
        LDI     HIGH GT
        PHI     RA
        LDN     RA
        LBNZ    BCX
        GLO     RB
        ADI     1
        ANI     63
        ADI     LOW GT
        PLO     RA
        LDI     HIGH GT
        PHI     RA
        LDN     RA
        LBNZ    BCX
        GLO     RB
        ADI     2
        ANI     63
        ADI     LOW GT
        PLO     RA
        LDI     HIGH GT
        PHI     RA
        LDN     RA
        LBNZ    BCX
        GLO     RB
        ADI     0
        PLO     R8
        LDI     1
        PHI     R8
        GLO     RB
        STXD
        SEP     R4
        WORD    SETCELL
        IRX
        LDX
        PLO     RB
        GLO     RB
        ADI     1
        PLO     R8
        LDI     2
        PHI     R8
        GLO     RB
        STXD
        SEP     R4
        WORD    SETCELL
        IRX
        LDX
        PLO     RB
        GLO     RB
        ADI     2
        PLO     R8
        LDI     3
        PHI     R8
        GLO     RB
        STXD
        SEP     R4
        WORD    SETCELL
        IRX
        LDX
        PLO     RB
BCX     IRX
        LDX
        PLO     R8
        SEP     R5
; EFFECT - explosion at RE (row,col)
EFFECT  LDI     0
        PLO     RB
EF1L    GLO     RB
        ADI     LOW ET
        PLO     RA
        LDI     HIGH ET
        PHI     RA
        LDN     RA
        LBZ     EF2
        INC     RB
        GLO     RB
        XRI     3
        LBNZ    EF1L
        SEP     R5
EF2     LDI     12
        STR     RA
        GLO     RB
        ADI     LOW EX
        PLO     RA
        GLO     RE
        STR     RA
        GLO     RB
        ADI     LOW EY
        PLO     RA
        GHI     RE
        STR     RA
        LDI     165
        SEP     R1
        SEP     R5
EFFECTS LDI     0
        PLO     R8
EFL     GLO     R8
        ADI     LOW ET
        PLO     RA
        LDI     HIGH ET
        PHI     RA
        LDN     RA
        LBZ     EFN
        SMI     1
        STR     RA
        PLO     R9
        GLO     R8
        ADI     LOW EX
        PLO     RA
        LDN     RA
        PLO     RE
        GLO     R8
        ADI     LOW EY
        PLO     RA
        LDN     RA
        PHI     RE
        GLO     R9
        LBNZ    EFL2
        LDI     0
        SEP     R1
        LBR     EFN
EFL2    GLO     R9
        XRI     6
        LBNZ    EFN
        LDI     166
        SEP     R1
EFN     INC     R8
        GLO     R8
        XRI     3
        LBNZ    EFL
        SEP     R5
BUGROW
        LDI     HIGH (YOFF)
        PHI     RA
        LDI     LOW (YOFF)
        PLO     RA
        LDN     RA
        PLO     R7
        ANI     7
        LBNZ    BR3
        GLO     R7
        SHR
        SHR
        SHR
        SDI     19
        STR     R2
        GHI     RE
        SM
        LBNF    BR0
        SMI     2
        LBDF    BR0
        LDI     1
        SEP     R5
BR0     LDI     0
        SEP     R5
BR3     GLO     R7
        SDI     148
        SHR
        SHR
        SHR
        STR     R2
        GHI     RE
        SM
        LBNF    BR0
        SMI     3
        LBDF    BR0
        LDI     1
        SEP     R5
; BUGDRAW - bring the buggy cells (rows 15-19, cols 5-7) up to date; D=1 forces a full redraw
BUGDRAW LBZ     BD0
        LDI     HIGH (BUGMAP)
        PHI     RD
        LDI     LOW (BUGMAP)
        PLO     RD
        LDI     HIGH (15)
        PHI     RE
        LDI     LOW (15)
        PLO     RE
        LDI     0FFH
        SEP     R4
        WORD    FILL
BD0
        LDI     HIGH (YOFF)
        PHI     RA
        LDI     LOW (YOFF)
        PLO     RA
        LDN     RA
        PLO     R7
        ANI     7
        LBZ     BD1
        GLO     R7
        SDI     148
        SHR
        SHR
        SHR
        PHI     R8
        LDI     2
        PLO     R8
        LBR     BD2
BD1     GLO     R7
        SHR
        SHR
        SHR
        SDI     19
        PHI     R8
        LDI     HIGH (BFR)
        PHI     RA
        LDI     LOW (BFR)
        PLO     RA
        LDN     RA
        ANI     1
        PLO     R8
BD2
        LDI     HIGH (BDRAWN)
        PHI     RA
        LDI     LOW (BDRAWN)
        PLO     RA
        LDN     RA
        LBZ     BD3
        LDI     HIGH (BROW)
        PHI     RA
        LDI     LOW (BROW)
        PLO     RA
        LDN     RA
        STR     R2
        GHI     R8
        XOR
        LBNZ    BD3
        LDI     HIGH (BTYP)
        PHI     RA
        LDI     LOW (BTYP)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     R8
        XOR
        LBNZ    BD3
        SEP     R5
        GLO     R8
        SMI     2
        LBDF    BD3
        LDI     HIGH (BTYP)
        PHI     RA
        LDI     LOW (BTYP)
        PLO     RA
        LDN     RA
        SMI     2
        LBDF    BD3
        LDI     HIGH (BROW)
        PHI     RA
        LDI     LOW (BROW)
        PLO     RA
        LDN     RA
        STR     R2
        GHI     R8
        XOR
        LBNZ    BD3
        LDI     HIGH (BTYP)
        PHI     RA
        LDI     LOW (BTYP)
        PLO     RA
        GLO     R8
        STR     RA
        SHL
        SHL
        SHL
        STR     R2
        GLO     R8
        ADD
        ADI     LOW (SHP+3)
        PLO     RB
        LDI     HIGH (SHP+3)
        ADCI    0
        PHI     RB
        GHI     R8
        ADI     1
        PHI     RE
        SMI     16
        STR     R2
        SHL
        ADD
        ADI     LOW BUGMAP
        PLO     R9
        LDI     HIGH BUGMAP
        ADCI    0
        PHI     R9
        LDI     5
        PLO     RE
        LDA     RB
        STR     R9
        INC     R9
        SEP     R1
        LDI     6
        PLO     RE
        LDA     RB
        STR     R9
        INC     R9
        SEP     R1
        LDI     7
        PLO     RE
        LDA     RB
        STR     R9
        INC     R9
        SEP     R1
        SEP     R5
BD3
        LDI     HIGH (BDRAWN)
        PHI     RA
        LDI     LOW (BDRAWN)
        PLO     RA
        LDN     RA
        LBZ     BD3S
        LDI     HIGH (BROW)
        PHI     RA
        LDI     LOW (BROW)
        PLO     RA
        LDN     RA
        STR     R2
        GHI     R8
        SD
        LBNF    BD3T
        GHI     R8
        LBR     BD3U
BD3T    LDN     R2
        LBR     BD3U
BD3S    LDI     16
BD3U    PHI     R9
        SMI     16
        STR     R2
        SHL
        ADD
        ADI     LOW BUGMAP
        PLO     RB
        LDI     HIGH BUGMAP
        ADCI    0
        PHI     RB
        LDI     HIGH (BROW)
        PHI     RA
        LDI     LOW (BROW)
        PLO     RA
        GHI     R8
        STR     RA
        LDI     HIGH (BTYP)
        PHI     RA
        LDI     LOW (BTYP)
        PLO     RA
        GLO     R8
        STR     RA
        LDI     HIGH (BDRAWN)
        PHI     RA
        LDI     LOW (BDRAWN)
        PLO     RA
        LDI     1
        STR     RA
BD4     GHI     R9
        STR     R2
        GHI     R8
        SD
        LBNF    BD4N
        PLO     R7
        GLO     R8
        XRI     2
        LBZ     BD4A
        GLO     R7
        SMI     2
        LBDF    BD4N
        LBR     BD4B
BD4A    GLO     R7
        SMI     3
        LBDF    BD4N
BD4B    GLO     R8
        SHL
        SHL
        SHL
        STR     R2
        GLO     R8
        ADD
        STR     R2
        GLO     R7
        SHL
        ADD
        STR     R2
        GLO     R7
        ADD
        ADI     LOW SHP
        PLO     RC
        LDI     HIGH SHP
        ADCI    0
        PHI     RC
        LDI     1
        LBR     BD4C
BD4N    LDI     0
BD4C    PLO     R8
        LDI     5
        PLO     R9
BD5     GLO     R8
        LBZ     BD5Z
        LDA     RC
        XRI     20H
        LBZ     BD5Z
        XRI     20H
        LBR     BD5Y
BD5Z    LDI     0
BD5Y    STR     R2
        LDN     RB
        XOR
        LBZ     BD6
        LDN     R2
        STR     RB
        PLO     RF
        GHI     R9
        PHI     RE
        GLO     R9
        PLO     RE
        GLO     RC
        STXD
        GHI     RC
        STXD
        GLO     RF
        SEP     R1
        IRX
        LDXA
        PHI     RC
        LDX
        PLO     RC
BD6     INC     RB
        INC     R9
        GLO     R9
        XRI     8
        LBNZ    BD5
        LDI     HIGH (BTYP)
        PHI     RA
        LDI     LOW (BTYP)
        PLO     RA
        LDN     RA
        PLO     R8
        GHI     R9
        ADI     1
        PHI     R9
        XRI     21
        LBNZ    BD4
        SEP     R5
QPUSHNZ XRI     20H
        LBZ     QPZ
        XRI     20H
        SEP     R1
QPZ     SEP     R5
; KEYS - read the keyboard
KEYS
        SEP     R4
        WORD    GETKEY
        LBZ     KYX
        PLO     R9
        XRI     K_RIGHT
        LBNZ    KY1
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        XRI     3
        LBZ     KYX
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
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
        LDI     4
        SEP     R4
        WORD    SOUND
        LBR     KYX
KY1     GLO     R9
        XRI     K_LEFT
        LBNZ    KY2
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        XRI     1
        LBZ     KYX
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (2A1FH)
        PHI     RC
        LDI     LOW (2A1FH)
        PLO     RC
        LDI     4
        SEP     R4
        WORD    SOUND
        LBR     KYX
KY2     GLO     R9
        XRI     K_UP
        LBZ     KYJ
        GLO     R9
        XRI     'J'
        LBZ     KYJ
        GLO     R9
        XRI     K_DOWN
        LBZ     KYF
        GLO     R9
        XRI     5FH
        LBZ     KYF
        GLO     R9
        XRI     20H
        LBZ     KYF
        GLO     R9
        XRI     'F'
        LBZ     KYF
        GLO     R9
        XRI     K_ESC
        LBNZ    KYX
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     2
        STR     RA
KYX     SEP     R5
KYJ
        LDI     HIGH (JT)
        PHI     RA
        LDI     LOW (JT)
        PLO     RA
        LDN     RA
        LBNZ    KYX
        LDI     HIGH (YOFF)
        PHI     RA
        LDI     LOW (YOFF)
        PLO     RA
        LDN     RA
        LBNZ    KYX
        LDI     HIGH (JT)
        PHI     RA
        LDI     LOW (JT)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     126
        STR     RA
        LDI     HIGH (3C2FH)
        PHI     RC
        LDI     LOW (3C2FH)
        PLO     RC
        LDI     18
        SEP     R4
        WORD    SOUND
        LBR     KYX
KYF
        SEP     R4
        WORD    FIRE
        SEP     R5
JUMP
        LDI     HIGH (JT)
        PHI     RA
        LDI     LOW (JT)
        PLO     RA
        LDN     RA
        LBZ     JPX
        ADI     LOW (JTAB-1)
        PLO     RC
        LDI     HIGH (JTAB-1)
        ADCI    0
        PHI     RC
        LDN     RC
        PLO     R7
        LDI     HIGH (YOFF)
        PHI     RA
        LDI     LOW (YOFF)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (JT)
        PHI     RA
        LDI     LOW (JT)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        XRI     31
        LBNZ    JPX
        LDI     HIGH (JT)
        PHI     RA
        LDI     LOW (JT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (YOFF)
        PHI     RA
        LDI     LOW (YOFF)
        PLO     RA
        LDI     0
        STR     RA
JPX     SEP     R5
FIRE    LDI     0
        PLO     R8
FI1
        GLO     R8
        ADI     LOW UON
        PLO     RA
        LDI     HIGH UON
        PHI     RA
        LDN     RA
        LBZ     FI2
        INC     R8
        GLO     R8
        XRI     1
        LBNZ    FI1
        LBR     FI3
FI2
        GLO     R8
        ADI     LOW UON
        PLO     RA
        LDI     HIGH UON
        PHI     RA
        LDI     2
        STR     RA
        GLO     R8
        ADI     LOW UX
        PLO     RA
        LDI     HIGH UX
        PHI     RA
        LDI     6
        STR     RA
        LDI     HIGH (BROW)
        PHI     RA
        LDI     LOW (BROW)
        PLO     RA
        LDN     RA
        SMI     1
        PLO     R7
        GLO     R8
        ADI     LOW UY
        PLO     RA
        LDI     HIGH UY
        PHI     RA
        GLO     R7
        STR     RA
FI3     LDI     0
        PLO     R8
FI4
        GLO     R8
        ADI     LOW SON
        PLO     RA
        LDI     HIGH SON
        PHI     RA
        LDN     RA
        LBZ     FI5
        INC     R8
        GLO     R8
        XRI     1
        LBNZ    FI4
        LBR     FI6
FI5
        GLO     R8
        ADI     LOW SON
        PLO     RA
        LDI     HIGH SON
        PHI     RA
        LDI     2
        STR     RA
        GLO     R8
        ADI     LOW SX
        PLO     RA
        LDI     HIGH SX
        PHI     RA
        LDI     8
        STR     RA
        LDI     HIGH (BROW)
        PHI     RA
        LDI     LOW (BROW)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (BTYP)
        PHI     RA
        LDI     LOW (BTYP)
        PLO     RA
        LDN     RA
        XRI     2
        LBNZ    FI5A
        INC     R7
FI5A    NOP
        GLO     R8
        ADI     LOW SY
        PLO     RA
        LDI     HIGH SY
        PHI     RA
        GLO     R7
        STR     RA
FI6
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     4
        STR     RA
        LDI     HIGH (0C3FH)
        PHI     RC
        LDI     LOW (0C3FH)
        PLO     RC
        LDI     5
        SEP     R4
        WORD    SOUND
        SEP     R5
; UPSHOTS - move the anti-aircraft shots
UPSHOTS LDI     0
        PLO     R8
US0
        GLO     R8
        ADI     LOW UON
        PLO     RA
        LDI     HIGH UON
        PHI     RA
        LDN     RA
        LBZ     USN
        XRI     1
        LBNZ    US1
        GLO     R8
        ADI     LOW UY
        PLO     RA
        LDI     HIGH UY
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     R8
        ADI     LOW UX
        PLO     RA
        LDI     HIGH UX
        PHI     RA
        LDN     RA
        PLO     RE
        LDI     0
        SEP     R1
        GLO     R8
        ADI     LOW UY
        PLO     RA
        LDI     HIGH UY
        PHI     RA
        LDN     RA
        SMI     2
        STR     RA
        SMI     2
        LBNF    USK
        ADI     2
        SMI     0F0H
        LBDF    USK
US1
        GLO     R8
        ADI     LOW UON
        PLO     RA
        LDI     HIGH UON
        PHI     RA
        LDI     1
        STR     RA
        GLO     R8
        ADI     LOW UY
        PLO     RA
        LDI     HIGH UY
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     R8
        ADI     LOW UX
        PLO     RA
        LDI     HIGH UX
        PHI     RA
        LDN     RA
        PLO     RE
        GHI     RE
        STXD
        GLO     RE
        STXD
        SEP     R4
        WORD    HITAIR
        IRX
        LDXA
        PLO     RE
        LDX
        PHI     RE
        GLO     R7
        LBNZ    USK
        LDI     162
        SEP     R1
        LBR     USN
USK
        GLO     R8
        ADI     LOW UON
        PLO     RA
        LDI     HIGH UON
        PHI     RA
        LDI     0
        STR     RA
USN     INC     R8
        GLO     R8
        XRI     1
        LBNZ    US0
        SEP     R5
HITAIR  LDI     0
        PLO     R7
        GLO     R8
        STXD
        LDI     0
        PLO     R8
HA1
        GLO     R8
        ADI     LOW AT
        PLO     RA
        LDI     HIGH AT
        PHI     RA
        LDN     RA
        LBZ     HA3
        PLO     R9
        GLO     R8
        ADI     LOW AX
        PLO     RA
        LDI     HIGH AX
        PHI     RA
        LDN     RA
        STR     R2
        GLO     RE
        SM
        LBNZ    HA3
        GLO     R8
        ADI     LOW AY
        PLO     RA
        LDI     HIGH AY
        PHI     RA
        LDN     RA
        STR     R2
        GHI     RE
        SM
        ADI     1
        SMI     3
        LBDF    HA3
        GLO     R9
        ADI     LOW (KSCORE-1)
        PLO     RC
        LDI     HIGH (KSCORE-1)
        ADCI    0
        PHI     RC
        LDN     RC
        SEP     R4
        WORD    ADDSC
        GLO     R8
        ADI     LOW AX
        PLO     RA
        LDI     HIGH AX
        PHI     RA
        LDN     RA
        PLO     RE
        GLO     R8
        ADI     LOW AY
        PLO     RA
        LDI     HIGH AY
        PHI     RA
        LDN     RA
        PHI     RE
        GHI     RE
        STXD
        GLO     RE
        STXD
        SEP     R4
        WORD    AKILL
        IRX
        LDXA
        PLO     RE
        LDX
        PHI     RE
        SEP     R4
        WORD    EFFECT
        LDI     HIGH (3F80H)
        PHI     RC
        LDI     LOW (3F80H)
        PLO     RC
        LDI     12
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
        LDI     12
        SEP     R4
        WORD    SOUND
        LDI     1
        PLO     R7
        LBR     HAX
HA3     INC     R8
        GLO     R8
        XRI     3
        LBNZ    HA1
        LDI     0
        PLO     R8
HB1
        GLO     R8
        ADI     LOW BT
        PLO     RA
        LDI     HIGH BT
        PHI     RA
        LDN     RA
        LBZ     HB3
        GLO     R8
        ADI     LOW BX
        PLO     RA
        LDI     HIGH BX
        PHI     RA
        LDN     RA
        STR     R2
        GLO     RE
        SM
        LBNZ    HB3
        GLO     R8
        ADI     LOW BY
        PLO     RA
        LDI     HIGH BY
        PHI     RA
        LDN     RA
        STR     R2
        GHI     RE
        SM
        ADI     1
        SMI     3
        LBDF    HB3
        GHI     RE
        STXD
        GLO     RE
        STXD
        SEP     R4
        WORD    BKILL
        IRX
        LDXA
        PLO     RE
        LDX
        PHI     RE
        SEP     R4
        WORD    EFFECT
        LDI     5
        SEP     R4
        WORD    ADDSC
        LDI     1
        PLO     R7
        LBR     HAX
HB3     INC     R8
        GLO     R8
        XRI     3
        LBNZ    HB1
HAX     IRX
        LDX
        PLO     R8
        SEP     R5
; FWSHOTS - move the forward shots
FWSHOTS LDI     0
        PLO     R8
FS0
        GLO     R8
        ADI     LOW SON
        PLO     RA
        LDI     HIGH SON
        PHI     RA
        LDN     RA
        LBZ     FSN
        XRI     1
        LBNZ    FS1
        GLO     R8
        ADI     LOW SY
        PLO     RA
        LDI     HIGH SY
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     R8
        ADI     LOW SX
        PLO     RA
        LDI     HIGH SX
        PHI     RA
        LDN     RA
        PLO     RE
        LDI     0
        SEP     R1
        GLO     R8
        ADI     LOW SX
        PLO     RA
        LDI     HIGH SX
        PHI     RA
        LDN     RA
        ADI     1
        STR     RA
        PLO     RE
        GLO     R8
        ADI     LOW SY
        PLO     RA
        LDI     HIGH SY
        PHI     RA
        LDN     RA
        PHI     RE
        SEP     R4
        WORD    HITGND
        GLO     R7
        LBNZ    FSK
        GLO     R8
        ADI     LOW SX
        PLO     RA
        LDI     HIGH SX
        PHI     RA
        LDN     RA
        ADI     1
        STR     RA
        SMI     34
        LBDF    FSK
FS1
        GLO     R8
        ADI     LOW SON
        PLO     RA
        LDI     HIGH SON
        PHI     RA
        LDI     1
        STR     RA
        GLO     R8
        ADI     LOW SY
        PLO     RA
        LDI     HIGH SY
        PHI     RA
        LDN     RA
        PHI     RE
        GLO     R8
        ADI     LOW SX
        PLO     RA
        LDI     HIGH SX
        PHI     RA
        LDN     RA
        PLO     RE
        GHI     RE
        STXD
        GLO     RE
        STXD
        SEP     R4
        WORD    HITGND
        IRX
        LDXA
        PLO     RE
        LDX
        PHI     RE
        GLO     R7
        LBNZ    FSK
        LDI     163
        SEP     R1
        LBR     FSN
FSK
        GLO     R8
        ADI     LOW SON
        PLO     RA
        LDI     HIGH SON
        PHI     RA
        LDI     0
        STR     RA
FSN     INC     R8
        GLO     R8
        XRI     1
        LBNZ    FS0
        SEP     R5
HITGND  LDI     0
        PLO     R7
        GHI     RE
        XRI     19
        LBNZ    HG5
        LDI     HIGH (GPOS)
        PHI     RA
        LDI     LOW (GPOS)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        ADD
        PLO     RB
        LDI     HIGH (GSUB)
        PHI     RA
        LDI     LOW (GSUB)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RB
        ADD
        PLO     RB
        ANI     63
        ADI     LOW GT
        PLO     RA
        LDI     HIGH GT
        PHI     RA
        LDN     RA
        PLO     R9
        ADI     LOW OBJLEN
        PLO     RC
        LDI     HIGH OBJLEN
        ADCI    0
        PHI     RC
        LDN     RC
        LBZ     HG5
        PHI     R9
        GLO     R9
        ADI     LOW OBJOFS
        PLO     RC
        LDI     HIGH OBJOFS
        ADCI    0
        PHI     RC
        LDN     RC
        STR     R2
        GLO     RB
        SM
        PLO     RB
        GLO     R9
        ADI     LOW OBJSC
        PLO     RC
        LDI     HIGH OBJSC
        ADCI    0
        PHI     RC
        LDN     RC
        SEP     R4
        WORD    ADDSC
        GLO     R8
        STXD
HG2     GLO     RB
        PLO     R8
        LDI     0
        PHI     R8
        GLO     RB
        STXD
        GHI     R9
        STXD
        SEP     R4
        WORD    SETCELL
        IRX
        LDXA
        PHI     R9
        LDX
        PLO     RB
        INC     RB
        GHI     R9
        SMI     1
        PHI     R9
        LBNZ    HG2
        IRX
        LDX
        PLO     R8
        LDI     1
        PLO     R7
        SEP     R4
        WORD    EFFECT
        LDI     HIGH (2F80H)
        PHI     RC
        LDI     LOW (2F80H)
        PLO     RC
        LDI     10
        SEP     R4
        WORD    NOISE
        LBR     HG9
HG5     LDI     0
        PLO     RB
HG6     GLO     RB
        ADI     LOW AT
        PLO     RA
        LDI     HIGH AT
        PHI     RA
        LDN     RA
        XRI     4
        LBNZ    HG7
        GLO     RB
        ADI     LOW AY
        PLO     RA
        LDN     RA
        STR     R2
        GHI     RE
        XOR
        LBNZ    HG7
        GLO     RB
        ADI     LOW AX
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RE
        SD
        SMI     2
        LBDF    HG7
        GLO     R8
        STXD
        GLO     RB
        PLO     R8
        SEP     R4
        WORD    AKILL
        IRX
        LDX
        PLO     R8
        LDI     15
        SEP     R4
        WORD    ADDSC
        LDI     1
        PLO     R7
        SEP     R4
        WORD    EFFECT
        LDI     HIGH (2F80H)
        PHI     RC
        LDI     LOW (2F80H)
        PLO     RC
        LDI     10
        SEP     R4
        WORD    NOISE
        LBR     HG9
HG7     INC     RB
        GLO     RB
        XRI     3
        LBNZ    HG6
HG9     SEP     R5
TANKS
        LDI     HIGH (TKT)
        PHI     RA
        LDI     LOW (TKT)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    TKX
        LDI     HIGH (TKT)
        PHI     RA
        LDI     LOW (TKT)
        PLO     RA
        LDI     90
        STR     RA
        LDI     12
        PLO     RB
TK1L
        LDI     HIGH (GPOS)
        PHI     RA
        LDI     LOW (GPOS)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RB
        ADD
        ANI     63
        ADI     LOW GT
        PLO     RA
        LDI     HIGH GT
        PHI     RA
        LDN     RA
        XRI     11
        LBZ     TKF
        INC     RB
        GLO     RB
        XRI     38
        LBNZ    TK1L
TKX     SEP     R5
TKF     LDI     4
        SEP     R4
        WORD    SPAWN
        LBDF    TKX
        GLO     R8
        ADI     LOW AX
        PLO     RA
        LDI     HIGH AX
        PHI     RA
        GLO     RB
        SMI     1
        STR     RA
        LDI     HIGH (4880H)
        PHI     RC
        LDI     LOW (4880H)
        PLO     RC
        LDI     6
        SEP     R4
        WORD    NOISE
        SEP     R5
; ADDSC - add D x 10 points
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
        LDN     RA
        LBZ     HSX
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
HS1     GLO     RE
        STXD
        LDA     RB
        ADI     30H
        PLO     R9
        LDI     0
        PHI     RE
        GLO     R9
        SEP     R1
        IRX
        LDX
        PLO     RE
        INC     RE
        GLO     RE
        XRI     12
        LBNZ    HS1
HSX     SEP     R5
HUDTM
        LDI     HIGH (SECT)
        PHI     RA
        LDI     LOW (SECT)
        PLO     RA
        LDN     RA
        PLO     R9
        LDI     0
        PLO     RB
HT1     GLO     R9
        SMI     100
        LBNF    HT2
        PLO     R9
        INC     RB
        LBR     HT1
HT2     LDI     0
        PHI     RB
HT3     GLO     R9
        SMI     10
        LBNF    HT4
        PLO     R9
        GHI     RB
        ADI     1
        PHI     RB
        LBR     HT3
HT4
        LDI     HIGH (31)
        PHI     RE
        LDI     LOW (31)
        PLO     RE
        GLO     RB
        ADI     30H
        SEP     R1
        LDI     HIGH (32)
        PHI     RE
        LDI     LOW (32)
        PLO     RE
        GHI     RB
        ADI     30H
        SEP     R1
        LDI     HIGH (33)
        PHI     RE
        LDI     LOW (33)
        PLO     RE
        GLO     R9
        ADI     30H
        SEP     R1
        SEP     R5
; MOVE - advance the ground by half-columns according to the speed
MOVE
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    MVX
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        ADI     LOW (SPDV-1)
        PLO     RC
        LDI     HIGH (SPDV-1)
        ADCI    0
        PHI     RC
        LDN     RC
        STR     R2
        LDI     HIGH (ACC)
        PHI     RA
        LDI     LOW (ACC)
        PLO     RA
        LDN     RA
        ADD
        STR     RA
        LBNF    MVX
        LDI     HIGH (GFLAG)
        PHI     RA
        LDI     LOW (GFLAG)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (GSUB)
        PHI     RA
        LDI     LOW (GSUB)
        PLO     RA
        LDN     RA
        XRI     1
        STR     RA
        LBZ     MVC
        SEP     R4
        WORD    NEWCELL
        SEP     R4
        WORD    CSTEP
        LBR     MV2
MVC
        LDI     HIGH (GPOS)
        PHI     RA
        LDI     LOW (GPOS)
        PLO     RA
        LDN     RA
        ADI     1
        ANI     63
        STR     RA
        SEP     R4
        WORD    CHKPASS
        LDI     HIGH (BFR)
        PHI     RA
        LDI     LOW (BFR)
        PLO     RA
        LDN     RA
        XRI     1
        PLO     R7
        LDI     HIGH (BFR)
        PHI     RA
        LDI     LOW (BFR)
        PLO     RA
        GLO     R7
        STR     RA
MV2
        LDI     HIGH (HCNT)
        PHI     RA
        LDI     LOW (HCNT)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        ANI     3
        LBNZ    MV3
        LDI     HIGH (HPOS)
        PHI     RA
        LDI     LOW (HPOS)
        PLO     RA
        LDN     RA
        ADI     1
        ANI     63
        STR     RA
        LDI     HIGH (PDUE)
        PHI     RA
        LDI     LOW (PDUE)
        PLO     RA
        LDN     RA
        ORI     0CH
        STR     RA
MV3
        LDI     HIGH (MCNT)
        PHI     RA
        LDI     LOW (MCNT)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        ANI     7
        LBNZ    MVX
        LDI     HIGH (MPOS)
        PHI     RA
        LDI     LOW (MPOS)
        PLO     RA
        LDN     RA
        ADI     1
        ANI     63
        STR     RA
        LDI     HIGH (PDUE)
        PHI     RA
        LDI     LOW (PDUE)
        PLO     RA
        LDN     RA
        ORI     3
        STR     RA
MVX     SEP     R5
PSCHED
        LDI     HIGH (PDUE)
        PHI     RA
        LDI     LOW (PDUE)
        PLO     RA
        LDN     RA
        LBZ     PSX
        PLO     R9
        LDI     HIGH (GFLAG)
        PHI     RA
        LDI     LOW (GFLAG)
        PLO     RA
        LDN     RA
        LBZ     PS2
        LDI     1
        PLO     R7
PS1     GLO     R9
        STR     R2
        GLO     R7
        AND
        LBNZ    PS3
        GLO     R7
        SHL
        PLO     R7
        LBR     PS1
PS3     GLO     R7
        PLO     R7
        LDI     HIGH (PROWS)
        PHI     RA
        LDI     LOW (PROWS)
        PLO     RA
        GLO     R7
        STR     RA
        GLO     R7
        XRI     0FFH
        STR     R2
        GLO     R9
        AND
        PLO     R7
        LDI     HIGH (PDUE)
        PHI     RA
        LDI     LOW (PDUE)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R5
PS2     GLO     R9
        ANI     3
        LBZ     PS4
        PLO     R7
        LDI     HIGH (PROWS)
        PHI     RA
        LDI     LOW (PROWS)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (PDUE)
        PHI     RA
        LDI     LOW (PDUE)
        PLO     RA
        LDN     RA
        ANI     0CH
        PLO     R7
        LDI     HIGH (PDUE)
        PHI     RA
        LDI     LOW (PDUE)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R5
PS4     GLO     R9
        PLO     R7
        LDI     HIGH (PROWS)
        PHI     RA
        LDI     LOW (PROWS)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (PDUE)
        PHI     RA
        LDI     LOW (PDUE)
        PLO     RA
        LDI     0
        STR     RA
PSX     SEP     R5
REPAINT
        LDI     HIGH (PROWS)
        PHI     RA
        LDI     LOW (PROWS)
        PLO     RA
        LDN     RA
        ANI     8
        LBZ     RPX
        LDI     HIGH (BROW)
        PHI     RA
        LDI     LOW (BROW)
        PLO     RA
        LDN     RA
        SMI     16
        LBDF    RPX
        LDI     HIGH (BUGMAP)
        PHI     RA
        LDI     LOW (BUGMAP)
        PLO     RA
        LDI     0FFH
        STR     RA
        INC     RA
        STR     RA
        INC     RA
        STR     RA
        LDI     HIGH (BDRAWN)
        PHI     RA
        LDI     LOW (BDRAWN)
        PLO     RA
        LDI     0
        STR     RA
        LDI     0
        SEP     R4
        WORD    BUGDRAW
RPX     SEP     R5
CHKPASS
        LDI     HIGH (GPOS)
        PHI     RA
        LDI     LOW (GPOS)
        PLO     RA
        LDN     RA
        ADI     6
        ANI     63
        ADI     LOW GT
        PLO     RA
        LDI     HIGH GT
        PHI     RA
        LDN     RA
        XRI     13
        LBNZ    CPX
        LDI     HIGH (GPOS)
        PHI     RA
        LDI     LOW (GPOS)
        PLO     RA
        LDN     RA
        ADI     6
        PLO     R8
        LDI     0
        PHI     R8
        SEP     R4
        WORD    SETCELL
        LDI     HIGH (PPTR)
        PHI     RA
        LDI     LOW (PPTR)
        PLO     RA
        LDA     RA
        PHI     RC
        LDN     RA
        PLO     RC
        LDI     HIGH (RPTR)
        PHI     RA
        LDI     LOW (RPTR)
        PLO     RA
        GHI     RC
        STR     RA
        INC     RA
        GLO     RC
        STR     RA
        LDI     HIGH (LETTER)
        PHI     RA
        LDI     LOW (LETTER)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        SMI     27
        LBNF    CP1
        LDI     HIGH (LETTER)
        PHI     RA
        LDI     LOW (LETTER)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (COURSE)
        PHI     RA
        LDI     LOW (COURSE)
        PLO     RA
        LDI     1
        STR     RA
CP1
        SEP     R4
        WORD    SHOWPT
        LDI     HIGH (LETTER)
        PHI     RA
        LDI     LOW (LETTER)
        PLO     RA
        LDN     RA
        PLO     R9
        LDI     LOW MAJOR
        PLO     RA
        LDI     HIGH MAJOR
        PHI     RA
CP2     LDA     RA
        LBZ     CP4
        STR     R2
        GLO     R9
        XOR
        LBNZ    CP2
        LDI     HIGH (SECT)
        PHI     RA
        LDI     LOW (SECT)
        PLO     RA
        LDN     RA
        SMI     100
        LBNF    CP3
        LDI     0
        LBR     CP3A
CP3     ADI     100
        SDI     99
CP3A    PLO     R9
        SEP     R4
        WORD    ADDSC
        LDI     HIGH (SECT)
        PHI     RA
        LDI     LOW (SECT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (101FH)
        PHI     RC
        LDI     LOW (101FH)
        PLO     RC
        LDI     30
        SEP     R4
        WORD    SOUND
        SEP     R5
CP4
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (181FH)
        PHI     RC
        LDI     LOW (181FH)
        PLO     RC
        LDI     10
        SEP     R4
        WORD    SOUND
CPX     SEP     R5
SHOWPT
        LDI     HIGH (LETTER)
        PHI     RA
        LDI     LOW (LETTER)
        PLO     RA
        LDN     RA
        PLO     R9
        LDI     0
        PHI     R9
SWP1    GLO     R9
        SMI     10
        LBNF    SWP2
        PLO     R9
        GHI     R9
        ADI     1
        PHI     R9
        LBR     SWP1
SWP2
        LDI     HIGH (0106H)
        PHI     RE
        LDI     LOW (0106H)
        PLO     RE
        GHI     R9
        ADI     30H
        SEP     R1
        LDI     HIGH (0107H)
        PHI     RE
        LDI     LOW (0107H)
        PLO     RE
        GLO     R9
        ADI     30H
        ORI     80H
        SEP     R1
        SEP     R5
; COLLIDE - buggy against craters, rocks and missiles
COLLIDE
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    COX
        LDI     5
        PLO     RB
CO1
        LDI     HIGH (GPOS)
        PHI     RA
        LDI     LOW (GPOS)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (GSUB)
        PHI     RA
        LDI     LOW (GSUB)
        PLO     RA
        LDN     RA
        ADD
        STR     R2
        GLO     RB
        ADD
        ANI     63
        ADI     LOW GT
        PLO     RA
        LDI     HIGH GT
        PHI     RA
        LDN     RA
        PLO     R9
        XRI     2
        LBNZ    CO2
        LDI     HIGH (YOFF)
        PHI     RA
        LDI     LOW (YOFF)
        PLO     RA
        LDN     RA
        LBNZ    CO2
        GLO     RB
        XRI     5
        LBZ     CO2
        SEP     R4
        WORD    KILLBUG
        SEP     R5
CO2     GLO     R9
        ADI     LOW OBJHT
        PLO     RC
        LDI     HIGH OBJHT
        ADCI    0
        PHI     RC
        LDN     RC
        LBZ     CO3
        STR     R2
        LDI     HIGH (YOFF)
        PHI     RA
        LDI     LOW (YOFF)
        PLO     RA
        LDN     RA
        SM
        LBDF    CO3
        SEP     R4
        WORD    KILLBUG
        SEP     R5
CO3     INC     RB
        GLO     RB
        XRI     8
        LBNZ    CO1
        LDI     0
        PLO     R8
CO4
        GLO     R8
        ADI     LOW AT
        PLO     RA
        LDI     HIGH AT
        PHI     RA
        LDN     RA
        XRI     4
        LBNZ    CO5
        GLO     R8
        ADI     LOW AX
        PLO     RA
        LDI     HIGH AX
        PHI     RA
        LDN     RA
        SMI     5
        LBNF    CO5
        SMI     4
        LBDF    CO5
        LDI     HIGH (YOFF)
        PHI     RA
        LDI     LOW (YOFF)
        PLO     RA
        LDN     RA
        SMI     8
        LBDF    CO5
        SEP     R4
        WORD    KILLBUG
        SEP     R5
CO5     INC     R8
        GLO     R8
        XRI     3
        LBNZ    CO4
COX     SEP     R5
KILLBUG
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    KBX
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
        LDI     HIGH (JT)
        PHI     RA
        LDI     LOW (JT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (1F80H)
        PHI     RC
        LDI     LOW (1F80H)
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
KBX     SEP     R5
DEATH
        LDI     HIGH (DTMR)
        PHI     RA
        LDI     LOW (DTMR)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBZ     DTH9
        ANI     7
        LBNZ    DTX
        LDI     HIGH (DTMR)
        PHI     RA
        LDI     LOW (DTMR)
        PLO     RA
        LDN     RA
        ANI     8
        LBZ     DT1
        LDI     165
        LBR     DT2
DT1     LDI     166
DT2     PLO     R9
        LDI     HIGH (BROW)
        PHI     RA
        LDI     LOW (BROW)
        PLO     RA
        LDN     RA
        PHI     RB
        LDI     5
        PLO     RB
DT3     GHI     RB
        PHI     RE
        GLO     RB
        PLO     RE
        GLO     R9
        SEP     R1
        INC     RB
        GLO     RB
        XRI     8
        LBNZ    DT3
        LDI     HIGH (BROW)
        PHI     RA
        LDI     LOW (BROW)
        PLO     RA
        LDN     RA
        ADI     1
        PHI     RB
        LDI     5
        PLO     RB
DT4     GHI     RB
        PHI     RE
        GLO     RB
        PLO     RE
        GLO     R9
        XRI     3
        SEP     R1
        INC     RB
        GLO     RB
        XRI     8
        LBNZ    DT4
DTX     SEP     R5
DTH9
        LDI     HIGH (LIVES)
        PHI     RA
        LDI     LOW (LIVES)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    DTH8
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R5
DTH8
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     3
        STR     RA
        SEP     R5
EXC1    EQU     165
EXC2    EQU     166
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
        LDI     HIGH (STARS)
        PHI     RD
        LDI     LOW (STARS)
        PLO     RD
        LDI     HIGH (400)
        PHI     RE
        LDI     LOW (400)
        PLO     RE
IS1
        SEP     R4
        WORD    RAND
        SMI     14
        LBDF    IS2
        SEP     R4
        WORD    RAND
        ANI     1
        LBZ     IS3
        LDI     167
        LBR     IS4
IS3     LDI     42
        LBR     IS4
IS2     LDI     20H
IS4     STR     RD
        INC     RD
        DEC     RE
        GLO     RE
        LBNZ    IS1
        GHI     RE
        LBNZ    IS1
        LDI     HIGH (MRT0)
        PHI     RC
        LDI     LOW (MRT0)
        PLO     RC
        LDI     HIGH (MR0)
        PHI     RD
        LDI     LOW (MR0)
        PLO     RD
        LDI     HIGH (128)
        PHI     RE
        LDI     LOW (128)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
        LDI     HIGH (MRT1)
        PHI     RC
        LDI     LOW (MRT1)
        PLO     RC
        LDI     HIGH (MR1)
        PHI     RD
        LDI     LOW (MR1)
        PLO     RD
        LDI     HIGH (128)
        PHI     RE
        LDI     LOW (128)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
        LDI     HIGH (HRT0)
        PHI     RC
        LDI     LOW (HRT0)
        PLO     RC
        LDI     HIGH (HR0)
        PHI     RD
        LDI     LOW (HR0)
        PLO     RD
        LDI     HIGH (128)
        PHI     RE
        LDI     LOW (128)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
        LDI     HIGH (HRT1)
        PHI     RC
        LDI     LOW (HRT1)
        PLO     RC
        LDI     HIGH (HR1)
        PHI     RD
        LDI     LOW (HR1)
        PLO     RD
        LDI     HIGH (128)
        PHI     RE
        LDI     LOW (128)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
TITLE
        SEP     R4
        WORD    VIDOFF
        SEP     R4
        WORD    SILENCE
        SEP     R4
        WORD    CLRSCR
        LDI     HIGH (527)
        PHI     RE
        LDI     LOW (527)
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
        LDI     HIGH (1034)
        PHI     RE
        LDI     LOW (1034)
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
        LDI     HIGH (2056)
        PHI     RE
        LDI     LOW (2056)
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
        LDI     HIGH (2568)
        PHI     RE
        LDI     LOW (2568)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX4)
        PHI     RC
        LDI     LOW (TX4)
        PLO     RC
        LDI     128
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (3080)
        PHI     RE
        LDI     LOW (3080)
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
        LDI     HIGH (4878)
        PHI     RE
        LDI     LOW (4878)
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
        LDI     HIGH (4881)
        PHI     RE
        LDI     LOW (4881)
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
        LDI     HIGH (PAGE+22*40)
        PHI     RD
        LDI     LOW (PAGE+22*40)
        PLO     RD
        LDI     HIGH (40)
        PHI     RE
        LDI     LOW (40)
        PLO     RE
        LDI     129
        SEP     R4
        WORD    FILL
        LDI     HIGH (PAGE+23*40)
        PHI     RD
        LDI     LOW (PAGE+23*40)
        PLO     RD
        LDI     HIGH (40)
        PHI     RE
        LDI     LOW (40)
        PLO     RE
        LDI     221
        SEP     R4
        WORD    FILL
        LDI     HIGH (PAGE+804)
        PHI     RD
        LDI     LOW (PAGE+804)
        PLO     RD
        LDI     235
        STR     RD
        LDI     HIGH (PAGE+805)
        PHI     RD
        LDI     LOW (PAGE+805)
        PLO     RD
        LDI     236
        STR     RD
        LDI     HIGH (PAGE+806)
        PHI     RD
        LDI     LOW (PAGE+806)
        PLO     RD
        LDI     237
        STR     RD
        LDI     HIGH (PAGE+844)
        PHI     RD
        LDI     LOW (PAGE+844)
        PLO     RD
        LDI     238
        STR     RD
        LDI     HIGH (PAGE+845)
        PHI     RD
        LDI     LOW (PAGE+845)
        PLO     RD
        LDI     239
        STR     RD
        LDI     HIGH (PAGE+846)
        PHI     RD
        LDI     LOW (PAGE+846)
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
        SEP     R4
        WORD    MUSIC
        SEP     R4
        WORD    GETKEY
        LBZ     TW1
        PLO     R9
        XRI     K_ESC
        LBZ     EXIT
        GLO     R9
        XRI     '1'
        LBZ     TB
        GLO     R9
        XRI     '2'
        LBZ     TC
        LBR     TW1
TB      LDI     0
        LBR     TS
TC      LDI     1
TS
        PLO     R7
        LDI     HIGH (COURSE)
        PHI     RA
        LDI     LOW (COURSE)
        PLO     RA
        GLO     R7
        STR     RA
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
        LDI     3
        STR     RA
        LDI     HIGH (LETTER)
        PHI     RA
        LDI     LOW (LETTER)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (LOOPS)
        PHI     RA
        LDI     LOW (LOOPS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (COURSE)
        PHI     RA
        LDI     LOW (COURSE)
        PLO     RA
        LDN     RA
        LBZ     NG1
        LDI     HIGH (CRS+14BH)
        PHI     RC
        LDI     LOW (CRS+14BH)
        PLO     RC
        LBR     NG2
NG1
        LDI     HIGH (CRS)
        PHI     RC
        LDI     LOW (CRS)
        PLO     RC
NG2
        LDI     HIGH (RPTR)
        PHI     RA
        LDI     LOW (RPTR)
        PLO     RA
        GHI     RC
        STR     RA
        INC     RA
        GLO     RC
        STR     RA
RESTART
        SEP     R4
        WORD    VIDOFF
        SEP     R4
        WORD    SILENCE
        LDI     HIGH (VARS+8)
        PHI     RD
        LDI     LOW (VARS+8)
        PLO     RD
        LDI     HIGH (8)
        PHI     RE
        LDI     LOW (8)
        PLO     RE
        LDI     0
        SEP     R4
        WORD    FILL
        LDI     HIGH (GPOS)
        PHI     RA
        LDI     LOW (GPOS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (GSUB)
        PHI     RA
        LDI     LOW (GSUB)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (MPOS)
        PHI     RA
        LDI     LOW (MPOS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (HPOS)
        PHI     RA
        LDI     LOW (HPOS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (MCNT)
        PHI     RA
        LDI     LOW (MCNT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (HCNT)
        PHI     RA
        LDI     LOW (HCNT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDI     2
        STR     RA
        LDI     HIGH (ACC)
        PHI     RA
        LDI     LOW (ACC)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (GFLAG)
        PHI     RA
        LDI     LOW (GFLAG)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (PROWS)
        PHI     RA
        LDI     LOW (PROWS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (PDUE)
        PHI     RA
        LDI     LOW (PDUE)
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
        LDI     HIGH (YOFF)
        PHI     RA
        LDI     LOW (YOFF)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (JT)
        PHI     RA
        LDI     LOW (JT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (BFR)
        PHI     RA
        LDI     LOW (BFR)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (BDRAWN)
        PHI     RA
        LDI     LOW (BDRAWN)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (CDIST)
        PHI     RA
        LDI     LOW (CDIST)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (FQN)
        PHI     RA
        LDI     LOW (FQN)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (FPTR)
        PHI     RA
        LDI     LOW (FPTR)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (WVN)
        PHI     RA
        LDI     LOW (WVN)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TKT)
        PHI     RA
        LDI     LOW (TKT)
        PLO     RA
        LDI     90
        STR     RA
        LDI     HIGH (SECT)
        PHI     RA
        LDI     LOW (SECT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (HUDF)
        PHI     RA
        LDI     LOW (HUDF)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (SUB60)
        PHI     RA
        LDI     LOW (SUB60)
        PLO     RA
        LDI     60
        STR     RA
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
        LDI     HIGH (RPTR)
        PHI     RA
        LDI     LOW (RPTR)
        PLO     RA
        LDA     RA
        PHI     RC
        LDN     RA
        PLO     RC
        LDI     HIGH (CPTR)
        PHI     RA
        LDI     LOW (CPTR)
        PLO     RA
        GHI     RC
        STR     RA
        INC     RA
        GLO     RC
        STR     RA
        LDI     HIGH (AT)
        PHI     RD
        LDI     LOW (AT)
        PLO     RD
        LDI     HIGH (87)
        PHI     RE
        LDI     LOW (87)
        PLO     RE
        LDI     0
        SEP     R4
        WORD    FILL
        LDI     0
        PLO     RB
RS1     GLO     RB
        PLO     R8
        LDI     0
        PHI     R8
        SEP     R4
        WORD    SETCELL
        INC     RB
        GLO     RB
        XRI     64
        LBNZ    RS1
        SEP     R4
        WORD    CLRSCR
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
        LDI     HIGH (26)
        PHI     RE
        LDI     LOW (26)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX12)
        PHI     RC
        LDI     LOW (TX12)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (256)
        PHI     RE
        LDI     LOW (256)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX13)
        PHI     RC
        LDI     LOW (TX13)
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
RS2     LDA     RB
        ADI     30H
        STR     RD
        INC     RD
        DEC     R9
        GLO     R9
        LBNZ    RS2
        LDI     HIGH (LIVES)
        PHI     RA
        LDI     LOW (LIVES)
        PLO     RA
        LDN     RA
        SMI     1
        LBZ     RS8
        PLO     R9
        LDI     HIGH (PAGE+37)
        PHI     RD
        LDI     LOW (PAGE+37)
        PLO     RD
RS7     LDI     171
        STR     RD
        INC     RD
        DEC     R9
        GLO     R9
        LBNZ    RS7
RS8
        LDI     HIGH (STARS)
        PHI     RC
        LDI     LOW (STARS)
        PLO     RC
        LDI     HIGH (PAGE+2*40)
        PHI     RD
        LDI     LOW (PAGE+2*40)
        PLO     RD
        LDI     HIGH (400)
        PHI     RE
        LDI     LOW (400)
        PLO     RE
        SEP     R4
        WORD    COPYMEM
        LDI     HIGH (PAGE+22*40)
        PHI     RD
        LDI     LOW (PAGE+22*40)
        PLO     RD
        LDI     HIGH (40)
        PHI     RE
        LDI     LOW (40)
        PLO     RE
        LDI     221
        SEP     R4
        WORD    FILL
        LDI     HIGH (PAGE+23*40)
        PHI     RD
        LDI     LOW (PAGE+23*40)
        PLO     RD
        LDI     HIGH (40)
        PHI     RE
        LDI     LOW (40)
        PLO     RE
        LDI     222
        SEP     R4
        WORD    FILL
        SEP     R4
        WORD    CPA0
        SEP     R4
        WORD    CPS0
        SEP     R4
        WORD    CPM0
        SEP     R4
        WORD    CPM1
        SEP     R4
        WORD    CPH0
        SEP     R4
        WORD    CPH1
        LDI     1
        SEP     R4
        WORD    BUGDRAW
        SEP     R4
        WORD    HUDSC
        SEP     R4
        WORD    HUDTM
        SEP     R4
        WORD    SHOWPT
        SEP     R4
        WORD    QFLUSH
        LDI     HIGH (1551)
        PHI     RE
        LDI     LOW (1551)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX14)
        PHI     RC
        LDI     LOW (TX14)
        PLO     RC
        LDI     128
        PLO     RF
        SEP     R4
        WORD    PRT
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
        LDI     HIGH (1551)
        PHI     RE
        LDI     LOW (1551)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (1552)
        PHI     RE
        LDI     LOW (1552)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (1553)
        PHI     RE
        LDI     LOW (1553)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (1554)
        PHI     RE
        LDI     LOW (1554)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (1555)
        PHI     RE
        LDI     LOW (1555)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (1556)
        PHI     RE
        LDI     LOW (1556)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (1557)
        PHI     RE
        LDI     LOW (1557)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (1558)
        PHI     RE
        LDI     LOW (1558)
        PLO     RE
        LDI     0
        SEP     R1
        LDI     HIGH (1559)
        PHI     RE
        LDI     LOW (1559)
        PLO     RE
        LDI     0
        SEP     R1
MAIN
MW1     BN1     MW1
MW2     B1      MW2
        SEP     R4
        WORD    VBDRAW
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
        LDI     HIGH (SUB60)
        PHI     RA
        LDI     LOW (SUB60)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    MN1
        LDI     HIGH (SUB60)
        PHI     RA
        LDI     LOW (SUB60)
        PLO     RA
        LDI     60
        STR     RA
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBNZ    MN1
        LDI     HIGH (SECT)
        PHI     RA
        LDI     LOW (SECT)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LBNZ    MN0
        LDI     HIGH (SECT)
        PHI     RA
        LDI     LOW (SECT)
        PLO     RA
        LDI     255
        STR     RA
MN0
        SEP     R4
        WORD    HUDTM
MN1
        LDI     HIGH (DEAD)
        PHI     RA
        LDI     LOW (DEAD)
        PLO     RA
        LDN     RA
        LBZ     MN2
        SEP     R4
        WORD    DEATH
        SEP     R4
        WORD    EFFECTS
        LBR     MN3
MN2     B3      MXK1
        LDI     HIGH (LASTK)
        PHI     RA
        LDI     LOW (LASTK)
        PLO     RA
        LDN     RA
        LBZ     MXK2
MXK1
        SEP     R4
        WORD    KEYS
MXK2
        LDI     HIGH (JT)
        PHI     RA
        LDI     LOW (JT)
        PLO     RA
        LDN     RA
        LBZ     MXJ1
        SEP     R4
        WORD    JUMP
MXJ1
        SEP     R4
        WORD    MOVE
        LDI     HIGH (PDUE)
        PHI     RA
        LDI     LOW (PDUE)
        PLO     RA
        LDN     RA
        LBZ     MXP1
        SEP     R4
        WORD    PSCHED
MXP1
        LDI     HIGH (GFLAG)
        PHI     RA
        LDI     LOW (GFLAG)
        PLO     RA
        LDN     RA
        LBNZ    MXC1
        LDI     HIGH (JT)
        PHI     RA
        LDI     LOW (JT)
        PLO     RA
        LDN     RA
        LBZ     MXC2
MXC1
        SEP     R4
        WORD    COLLIDE
MXC2    LDI     0
        SEP     R4
        WORD    BUGDRAW
        LDI     HIGH (PROWS)
        PHI     RA
        LDI     LOW (PROWS)
        PLO     RA
        LDN     RA
        ANI     8
        LBZ     MXR1
        SEP     R4
        WORD    REPAINT
MXR1
        LDI     HIGH (PH)
        PHI     RA
        LDI     LOW (PH)
        PLO     RA
        LDN     RA
        ADI     1
        ANI     3
        STR     RA
        LBZ     MN2B
        SMI     1
        LBZ     MN2C
        SMI     1
        LBZ     MN2D
        SEP     R4
        WORD    FWSHOTS
        SEP     R4
        WORD    BOMBS
        SEP     R4
        WORD    EFFECTS
        SEP     R4
        WORD    TANKS
        LBR     MN3
MN2D
        SEP     R4
        WORD    ALIENS
        LBR     MN3
MN2B
        SEP     R4
        WORD    UPSHOTS
        LDI     HIGH (HUDF)
        PHI     RA
        LDI     LOW (HUDF)
        PLO     RA
        LDN     RA
        LBZ     MN3
        SEP     R4
        WORD    HUDSC
        LBR     MN3
MN2C
        SEP     R4
        WORD    FWSHOTS
MN3
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDN     RA
        LBZ     MAIN
        XRI     3
        LBZ     RESTART
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
        LDI     HIGH (1551)
        PHI     RE
        LDI     LOW (1551)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX15)
        PHI     RC
        LDI     LOW (TX15)
        PLO     RC
        LDI     128
        PLO     RF
        SEP     R4
        WORD    PRT
        SEP     R4
        WORD    VIDON
        LDI     HIGH (1F80H)
        PHI     RC
        LDI     LOW (1F80H)
        PLO     RC
        LDI     40
        SEP     R4
        WORD    NOISE
        LDI     200
        SEP     R4
        WORD    WAITN
        LBR     TITLE
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
        LDI     2FH
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
STROW
        WORD    STARS+0
        WORD    STARS+40
        WORD    STARS+80
        WORD    STARS+120
        WORD    STARS+160
        WORD    STARS+200
        WORD    STARS+240
        WORD    STARS+280
        WORD    STARS+320
        WORD    STARS+360
C0A     BYTE    020H, 020H, 020H, 020H, 085H, 086H, 087H, 088H, 089H, 08AH, 08BH, 08CH, 08DH, 08EH
C0S     BYTE    081H, 082H, 083H, 084H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H
MULNT   BYTE    000H, 00EH, 01CH, 02AH, 038H, 046H, 054H, 062H, 070H, 07EH, 08CH, 09AH, 0A8H, 0B6H
P1A     BYTE    020H, 020H, 020H, 020H, 098H, 099H, 020H, 098H, 020H, 020H, 095H, 09AH, 020H, 097H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 09DH, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 09EH, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 09FH, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 09BH, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 09CH, 020H, 020H, 020H, 020H, 09DH, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 08FH, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 0DBH, 020H, 0DCH, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 093H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H
P1S     BYTE    090H, 096H, 081H, 081H, 090H, 090H, 081H, 090H, 081H, 081H, 090H, 090H, 081H, 090H, 081H, 081H
        BYTE    092H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 083H, 091H
        BYTE    081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 094H, 081H, 081H, 081H, 081H, 081H
        BYTE    081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 090H, 081H, 081H, 081H, 081H, 081H, 081H, 081H
        BYTE    081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 090H, 081H, 081H, 081H
        BYTE    081H, 081H, 081H, 081H, 090H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H
        BYTE    081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 090H, 081H, 081H, 081H, 081H, 081H
        BYTE    081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 090H, 081H, 081H, 081H, 081H, 090H, 081H
        BYTE    081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 090H, 081H, 081H, 081H
        BYTE    081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H
        BYTE    081H, 081H, 081H, 081H, 081H, 081H, 090H, 081H, 090H, 081H, 081H, 081H, 081H, 081H, 081H, 081H
        BYTE    081H, 081H, 081H, 081H, 081H, 081H, 090H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H
        BYTE    081H, 081H, 081H, 081H
FEATT   WORD    0
        WORD    FS_CS
        WORD    FS_CM
        WORD    FS_CG
        WORD    FS_RS
        WORD    FS_RM
        WORD    FS_RB
        WORD    FS_BO
        WORD    FS_TK
        WORD    FS_CP
FS_CS   BYTE    001H, 002H, 003H, 000H
FS_CM   BYTE    001H, 002H, 002H, 003H, 000H
FS_CG   BYTE    001H, 002H, 002H, 002H, 002H, 002H, 002H, 003H, 000H
FS_RS   BYTE    004H, 000H
FS_RM   BYTE    005H, 006H, 000H
FS_RB   BYTE    007H, 008H, 009H, 000H
FS_BO   BYTE    00AH, 000H
FS_TK   BYTE    00BH, 00CH, 000H
FS_CP   BYTE    00DH, 000H
OBJLEN  BYTE    000H, 000H, 000H, 000H, 001H, 002H, 002H, 003H, 003H, 003H, 001H, 002H, 002H, 000H
OBJOFS  BYTE    000H, 000H, 000H, 000H, 000H, 000H, 001H, 000H, 001H, 002H, 000H, 000H, 001H, 000H
OBJSC   BYTE    000H, 000H, 000H, 000H, 005H, 008H, 008H, 00AH, 00AH, 00AH, 005H, 014H, 014H, 000H
OBJHT   BYTE    000H, 000H, 000H, 000H, 003H, 005H, 005H, 008H, 008H, 008H, 005H, 006H, 006H, 000H
KSPD    BYTE    003H, 002H, 004H, 002H
KCHR    BYTE    0FBH, 07CH, 0FDH, 0FEH
KSCORE  BYTE    00AH, 014H, 01EH, 00FH
SPDV    BYTE    055H, 080H, 0FFH
JTAB    BYTE    004H, 004H, 008H, 008H, 00CH, 00CH, 010H, 010H, 010H, 014H, 014H, 014H, 018H, 018H, 018H, 018H
        BYTE    018H, 018H, 014H, 014H, 014H, 010H, 010H, 010H, 00CH, 00CH, 008H, 008H, 004H, 004H
SHP     BYTE    0EBH, 0ECH, 0EDH, 0EEH, 0EFH, 0F0H, 020H, 020H, 020H, 0EBH, 0ECH, 0EDH, 0F1H, 0F2H, 0F3H, 020H
        BYTE    020H, 020H, 020H, 0F4H, 020H, 0F5H, 0F6H, 0F7H, 0F8H, 0F9H, 0FAH
MAJOR   BYTE    005H, 00AH, 00FH, 014H, 01AH, 000H
BARCOL  BYTE    000H, 009H, 00AH, 00BH, 00CH, 00DH, 00EH, 00FH, 010H, 011H, 012H, 013H, 014H, 015H, 016H, 017H
        BYTE    018H, 019H, 01AH, 01BH, 01CH, 01DH, 01EH, 01FH, 020H, 021H, 022H
MRT0    BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 060H, 062H, 05FH, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 060H, 062H, 05FH, 020H, 020H, 020H, 020H, 060H, 062H, 061H, 062H, 05FH, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 060H, 062H, 05FH, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 060H, 062H, 061H, 062H, 05FH, 020H, 020H, 020H, 020H, 020H, 020H, 060H, 062H, 05FH, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 060H, 062H, 05FH, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 060H, 062H, 05FH, 020H, 020H, 020H, 020H, 060H, 062H, 061H, 062H, 05FH, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 060H, 062H, 05FH, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 060H, 062H, 061H, 062H, 05FH, 020H, 020H, 020H, 020H, 020H, 020H, 060H, 062H, 05FH, 020H
MRT1    BYTE    020H, 020H, 020H, 020H, 060H, 05FH, 020H, 060H, 061H, 061H, 061H, 05FH, 020H, 020H, 060H, 05FH
        BYTE    020H, 060H, 061H, 061H, 061H, 05FH, 020H, 020H, 060H, 061H, 061H, 061H, 061H, 061H, 05FH, 020H
        BYTE    020H, 060H, 05FH, 020H, 020H, 060H, 061H, 061H, 061H, 05FH, 020H, 020H, 060H, 05FH, 020H, 020H
        BYTE    060H, 061H, 061H, 061H, 061H, 061H, 05FH, 020H, 020H, 060H, 05FH, 060H, 061H, 061H, 061H, 05FH
        BYTE    020H, 020H, 020H, 020H, 060H, 05FH, 020H, 060H, 061H, 061H, 061H, 05FH, 020H, 020H, 060H, 05FH
        BYTE    020H, 060H, 061H, 061H, 061H, 05FH, 020H, 020H, 060H, 061H, 061H, 061H, 061H, 061H, 05FH, 020H
        BYTE    020H, 060H, 05FH, 020H, 020H, 060H, 061H, 061H, 061H, 05FH, 020H, 020H, 060H, 05FH, 020H, 020H
        BYTE    060H, 061H, 061H, 061H, 061H, 061H, 05FH, 020H, 020H, 060H, 05FH, 060H, 061H, 061H, 061H, 05FH
HRT0    BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 06AH, 069H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 06AH, 069H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 06AH, 069H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 06AH, 069H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 06AH, 069H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 06AH, 069H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 06AH, 069H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 020H, 020H, 020H, 020H, 06AH, 069H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        BYTE    020H, 06AH, 069H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 06AH, 069H, 020H
HRT1    BYTE    020H, 020H, 020H, 06AH, 067H, 067H, 069H, 020H, 020H, 020H, 06AH, 067H, 067H, 069H, 020H, 020H
        BYTE    06AH, 067H, 067H, 069H, 020H, 020H, 020H, 06AH, 067H, 067H, 069H, 020H, 020H, 06AH, 067H, 067H
        BYTE    069H, 020H, 020H, 020H, 06AH, 067H, 067H, 069H, 020H, 020H, 06AH, 067H, 067H, 069H, 020H, 020H
        BYTE    06AH, 067H, 067H, 069H, 020H, 020H, 06AH, 067H, 067H, 069H, 020H, 020H, 06AH, 067H, 067H, 069H
        BYTE    020H, 020H, 020H, 06AH, 067H, 067H, 069H, 020H, 020H, 020H, 06AH, 067H, 067H, 069H, 020H, 020H
        BYTE    06AH, 067H, 067H, 069H, 020H, 020H, 020H, 06AH, 067H, 067H, 069H, 020H, 020H, 06AH, 067H, 067H
        BYTE    069H, 020H, 020H, 020H, 06AH, 067H, 067H, 069H, 020H, 020H, 06AH, 067H, 067H, 069H, 020H, 020H
        BYTE    06AH, 067H, 067H, 069H, 020H, 020H, 06AH, 067H, 067H, 069H, 020H, 020H, 06AH, 067H, 067H, 069H
TUNE    BYTE    02EH, 00AH, 027H, 00AH, 01CH, 014H, 01FH, 00AH, 027H, 00AH, 022H, 014H, 07FH, 00AH, 02EH, 00AH
        BYTE    02BH, 00AH, 027H, 014H, 02EH, 00AH, 034H, 00AH, 03AH, 01EH, 07FH, 028H, 000H
CRS     BYTE    097H, 037H, 093H, 01FH, 097H, 02DH, 097H, 07FH, 096H, 04CH, 049H, 056H, 057H, 01CH, 097H, 07FH
        BYTE    094H, 059H, 05DH, 01EH, 02FH, 01CH, 01FH, 025H, 07BH, 093H, 036H, 02CH, 04CH, 04AH, 04DH, 097H
        BYTE    01DH, 097H, 07AH, 093H, 0C1H, 059H, 05CH, 054H, 052H, 097H, 01CH, 036H, 097H, 036H, 09EH, 093H
        BYTE    0C1H, 059H, 05BH, 049H, 049H, 034H, 01CH, 024H, 024H, 01DH, 01CH, 01CH, 024H, 02BH, 01CH, 01CH
        BYTE    07AH, 092H, 03BH, 02BH, 024H, 01CH, 01CH, 01CH, 01CH, 034H, 02AH, 01CH, 097H, 034H, 07BH, 093H
        BYTE    02CH, 02AH, 01CH, 01CH, 0C1H, 059H, 059H, 01CH, 0AAH, 052H, 052H, 01CH, 097H, 024H, 07EH, 093H
        BYTE    059H, 05DH, 0ACH, 051H, 051H, 0C3H, 05AH, 05FH, 097H, 07EH, 092H, 02BH, 01CH, 032H, 024H, 024H
        BYTE    01CH, 01CH, 02CH, 036H, 034H, 02CH, 03DH, 09AH, 093H, 043H, 043H, 044H, 043H, 043H, 043H, 043H
        BYTE    044H, 044H, 042H, 07BH, 092H, 041H, 043H, 043H, 041H, 044H, 042H, 044H, 043H, 043H, 044H, 042H
        BYTE    043H, 044H, 07AH, 094H, 042H, 043H, 041H, 044H, 043H, 042H, 043H, 041H, 044H, 042H, 044H, 044H
        BYTE    07AH, 094H, 0B5H, 051H, 051H, 055H, 0C7H, 05CH, 05FH, 097H, 07EH, 093H, 0C6H, 05BH, 05DH, 04DH
        BYTE    04CH, 04FH, 097H, 0DFH, 092H, 0C2H, 059H, 059H, 04DH, 04BH, 04FH, 097H, 07FH, 092H, 00BH, 089H
        BYTE    089H, 062H, 062H, 08BH, 08AH, 061H, 062H, 089H, 064H, 08BH, 089H, 061H, 08BH, 08FH, 097H, 07FH
        BYTE    095H, 097H, 049H, 049H, 049H, 049H, 01CH, 01CH, 024H, 01CH, 032H, 01CH, 027H, 097H, 07FH, 094H
        BYTE    049H, 049H, 0B4H, 051H, 017H, 097H, 054H, 057H, 097H, 07BH, 094H, 0B4H, 052H, 0C2H, 05AH, 05AH
        BYTE    054H, 057H, 097H, 0DDH, 093H, 024H, 01CH, 034H, 024H, 032H, 01CH, 01CH, 02CH, 033H, 02CH, 097H
        BYTE    033H, 032H, 07CH, 093H, 01CH, 01CH, 03BH, 06BH, 06DH, 06DH, 031H, 06BH, 02CH, 06AH, 06CH, 097H
        BYTE    07BH, 092H, 02BH, 034H, 03BH, 034H, 00CH, 062H, 061H, 08CH, 089H, 061H, 063H, 08BH, 089H, 089H
        BYTE    08BH, 061H, 08FH, 097H, 07CH, 097H, 097H, 017H, 097H, 0B5H, 051H, 051H, 051H, 04CH, 04AH, 04FH
        BYTE    097H, 07FH, 094H, 0B4H, 051H, 051H, 052H, 0C4H, 059H, 059H, 04EH, 049H, 049H, 01FH, 097H, 07FH
        BYTE    094H, 0C1H, 059H, 05BH, 02CH, 033H, 097H, 01CH, 01FH, 094H, 0A2H, 097H, 0AAH, 051H, 054H, 095H
        BYTE    04AH, 049H, 04FH, 097H, 097H, 097H, 07BH, 095H, 077H, 097H, 097H, 097H, 097H, 07AH, 095H, 06CH
        BYTE    01CH, 01CH, 024H, 06BH, 033H, 02CH, 02FH, 07BH, 092H, 06CH, 06BH, 06BH, 06CH, 06DH, 02DH, 06DH
        BYTE    06BH, 02BH, 06BH, 06AH, 06DH, 02BH, 03AH, 07CH, 094H, 0B3H, 052H, 051H, 051H, 03CH, 02CH, 02BH
        BYTE    01EH, 01CH, 02AH, 024H, 097H, 0DCH, 094H, 0D3H, 059H, 05FH, 059H, 05AH, 097H, 097H, 033H, 07AH
        BYTE    093H, 01CH, 01CH, 02BH, 01CH, 02CH, 01CH, 033H, 02BH, 01CH, 03AH, 03AH, 024H, 03AH, 03FH, 07BH
        BYTE    093H, 0CAH, 059H, 059H, 05FH, 0ACH, 051H, 051H, 02FH, 085H, 01CH, 085H, 095H, 084H, 07CH, 094H
        BYTE    04BH, 049H, 04EH, 0ABH, 051H, 051H, 02BH, 032H, 026H, 02BH, 02FH, 07AH, 093H, 0CAH, 05AH, 05AH
        BYTE    05FH, 02CH, 01CH, 02AH, 01CH, 01CH, 085H, 086H, 085H, 084H, 01CH, 0DCH, 095H, 00AH, 062H, 089H
        BYTE    089H, 064H, 061H, 08AH, 08AH, 08BH, 089H, 089H, 064H, 089H, 061H, 08CH, 08FH, 07DH, 094H, 0B9H
        BYTE    051H, 053H, 051H, 053H, 097H, 049H, 049H, 04BH, 04FH, 097H, 07BH, 042H, 041H, 043H, 042H, 043H
        BYTE    043H, 041H, 043H, 042H, 043H, 041H, 044H, 042H, 043H, 041H, 044H, 07CH, 094H, 041H, 043H, 042H
        BYTE    043H, 043H, 044H, 043H, 042H, 043H, 044H, 043H, 043H, 041H, 043H, 042H, 042H, 07AH, 094H, 0D2H
        BYTE    059H, 059H, 059H, 05BH, 096H, 04AH, 049H, 049H, 04FH, 02CH, 03BH, 01CH, 01CH, 097H, 0E1H, 093H
        BYTE    04AH, 049H, 049H, 04CH, 0B3H, 051H, 051H, 057H, 01CH, 01CH, 02AH, 01CH, 024H, 02FH, 07DH, 01CH
        BYTE    02AH, 01CH, 02AH, 071H, 033H, 02AH, 097H, 02DH, 097H, 097H, 07CH, 094H, 01CH, 01CH, 01CH, 02AH
        BYTE    01CH, 01CH, 01CH, 02DH, 043H, 041H, 042H, 043H, 041H, 042H, 047H, 07CH, 06AH, 02BH, 01CH, 01CH
        BYTE    032H, 01CH, 01CH, 06AH, 02AH, 01CH, 085H, 084H, 01CH, 085H, 085H, 07AH, 01CH, 01CH, 01CH, 02AH
        BYTE    01CH, 01CH, 0D1H, 059H, 059H, 059H, 05FH, 04CH, 049H, 04FH, 01CH, 01EH, 01CH, 0E1H, 01CH, 01CH
        BYTE    02AH, 071H, 03FH, 02DH, 02EH, 097H, 096H, 07CH, 043H, 041H, 044H, 041H, 043H, 041H, 042H, 01CH
        BYTE    01CH, 042H, 042H, 01CH, 042H, 043H, 041H, 043H, 047H, 07AH, 0D4H, 059H, 059H, 059H, 05FH, 0A9H
        BYTE    051H, 056H, 01CH, 01CH, 02AH, 01FH, 07CH, 082H, 01DH, 084H, 086H, 01CH, 01CH, 01CH, 01CH, 01CH
        BYTE    01CH, 082H, 01EH, 083H, 01CH, 02CH, 01CH, 01CH, 07BH, 0D3H, 059H, 059H, 059H, 05FH, 0B1H, 051H
        BYTE    051H, 057H, 01CH, 01DH, 01CH, 01CH, 01DH, 07AH, 01CH, 01CH, 01CH, 02AH, 01CH, 06AH, 02AH, 01CH
        BYTE    02CH, 083H, 01CH, 06AH, 06AH, 02AH, 06AH, 01CH, 083H, 0A4H, 007H
TX1      TEXT    "CRATER RUN"
        BYTE    0
TX2      TEXT    "A LUNAR PATROL GAME"
        BYTE    0
TX3      TEXT    "1  BEGINNER COURSE"
        BYTE    0
TX4      TEXT    "2  CHAMPION COURSE"
        BYTE    0
TX5      TEXT    "ESC  BACK TO BASIC"
        BYTE    0
TX6      TEXT    "LEFT/RIGHT  SLOWER / FASTER"
        BYTE    0
TX7      TEXT    "UP OR J     JUMP"
        BYTE    0
TX8      TEXT    "SPACE OR F  FIRE UP AND AHEAD"
        BYTE    0
TX9      TEXT    "HI"
        BYTE    0
TX10     TEXT    "SCORE"
        BYTE    0
TX11     TEXT    "HI"
        BYTE    0
TX12     TEXT    "TIME"
        BYTE    0
TX13     TEXT    "POINT 00/26"
        BYTE    0
TX14     TEXT    "GET READY"
        BYTE    0
TX15     TEXT    "GAME OVER"
        BYTE    0
CHTAB
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 07FH, 06AH, 055H, 06AH, 055H, 06AH, 055H, 06AH
        BYTE    07CH, 06AH, 04AH, 045H, 042H, 041H, 040H, 07FH, 040H, 040H, 040H, 040H, 040H, 040H, 040H, 07FH
        BYTE    04FH, 055H, 054H, 068H, 068H, 060H, 040H, 07FH, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0CCH, 0DEH, 0FFH
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0C3H, 0C7H, 0CFH, 0DFH, 0C0H, 0C0H, 0C0H, 0C0H, 0F0H, 0F8H, 0FCH, 0FEH
        BYTE    0C0H, 0C0H, 0C1H, 0C3H, 0C7H, 0CFH, 0DFH, 0FFH, 0CCH, 0DEH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH
        BYTE    0C0H, 0C0H, 0E0H, 0F0H, 0F8H, 0FCH, 0FEH, 0FFH, 080H, 080H, 080H, 09EH, 0B5H, 0ADH, 0B5H, 09EH
        BYTE    000H, 000H, 001H, 00FH, 03FH, 03FH, 02AH, 015H, 000H, 000H, 03FH, 038H, 03CH, 03FH, 02AH, 02AH
        BYTE    08EH, 08FH, 08EH, 088H, 088H, 088H, 088H, 088H, 080H, 080H, 080H, 0B0H, 0A8H, 0A8H, 0A8H, 0B0H
        BYTE    07FH, 055H, 06AH, 055H, 06AH, 055H, 06AH, 055H, 041H, 042H, 042H, 045H, 045H, 044H, 040H, 07FH
        BYTE    060H, 050H, 050H, 068H, 050H, 048H, 040H, 07FH, 0B0H, 0B8H, 0B0H, 080H, 080H, 080H, 080H, 080H
        BYTE    07FH, 06DH, 062H, 045H, 042H, 045H, 042H, 07DH, 080H, 080H, 080H, 083H, 086H, 085H, 086H, 083H
        BYTE    07FH, 055H, 069H, 050H, 068H, 050H, 068H, 057H, 081H, 081H, 081H, 081H, 081H, 081H, 081H, 081H
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C1H, 0C3H, 0C7H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C1H, 0C3H
        BYTE    000H, 000H, 000H, 001H, 007H, 007H, 005H, 002H, 0C1H, 0C3H, 0CFH, 0DFH, 0FFH, 0FFH, 0FFH, 0FFH
        BYTE    0E0H, 0F0H, 0FCH, 0FEH, 0FFH, 0FFH, 0FFH, 0FFH, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0E0H, 0F0H, 0F8H
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0DEH, 0FFH, 0FFH, 0FFH, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0E0H, 0F0H
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C4H, 0C4H, 0C4H, 0C4H, 0C4H, 0C0H, 0C4H, 0C0H
        BYTE    0C8H, 0C8H, 0C8H, 0C0H, 0C8H, 0C8H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0F9H, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    000H, 000H, 000H, 00CH, 00CH, 000H, 000H, 000H, 080H, 088H, 095H, 08EH, 0AAH, 08AH, 080H, 080H
        BYTE    025H, 010H, 022H, 004H, 024H, 009H, 022H, 000H, 0C0H, 0C0H, 0C0H, 0C8H, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    0C2H, 0C4H, 0C8H, 0C8H, 0C8H, 0C4H, 0C2H, 0C0H, 0C8H, 0C4H, 0C2H, 0C2H, 0C2H, 0C4H, 0C8H, 0C0H
        BYTE    040H, 040H, 040H, 040H, 040H, 042H, 040H, 040H, 0C0H, 0C0H, 0CCH, 0DEH, 0FFH, 0D2H, 0C0H, 0C0H
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
        BYTE    0DFH, 0C1H, 0C2H, 0C4H, 0C8H, 0D0H, 0DFH, 0C0H, 000H, 000H, 00FH, 03FH, 03FH, 03FH, 015H, 02DH
        BYTE    000H, 000H, 038H, 000H, 020H, 038H, 010H, 010H, 06AH, 055H, 06AH, 055H, 062H, 055H, 06AH, 051H
        BYTE    055H, 06AH, 051H, 06AH, 055H, 06AH, 045H, 06AH, 041H, 043H, 047H, 04FH, 05FH, 07FH, 07FH, 07FH
        BYTE    060H, 070H, 078H, 07CH, 07EH, 07FH, 07FH, 07FH, 07FH, 07FH, 07FH, 07FH, 07FH, 07FH, 07FH, 07FH
        BYTE    040H, 04CH, 05EH, 07FH, 07FH, 07FH, 07FH, 07FH, 040H, 040H, 040H, 041H, 047H, 04FH, 05FH, 07FH
        BYTE    040H, 040H, 040H, 060H, 078H, 07CH, 07EH, 07FH, 0C1H, 0C3H, 0C7H, 0CFH, 0DFH, 0FFH, 0FFH, 0FFH
        BYTE    0E0H, 0F0H, 0F8H, 0FCH, 0FEH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH
        BYTE    0C0H, 0CCH, 0DEH, 0FFH, 0FFH, 0FFH, 0FFH, 0FFH, 0C0H, 0C0H, 0C0H, 0C1H, 0C7H, 0CFH, 0DFH, 0FFH
        BYTE    0C0H, 0C0H, 0C0H, 0E0H, 0F8H, 0FCH, 0FEH, 0FFH, 0C0H, 0C0H, 0C0H, 0C0H, 0C1H, 0C3H, 0C7H, 0DFH
        BYTE    0C0H, 0C0H, 0C0H, 0F0H, 0F8H, 0CCH, 0FFH, 0FFH, 0C0H, 0C0H, 0C0H, 0C0H, 0C2H, 0C4H, 0F8H, 0FEH
        BYTE    0FFH, 0DFH, 0C9H, 0DDH, 0EAH, 0F7H, 0EAH, 0DDH, 0FFH, 0FFH, 0C1H, 0F3H, 0EDH, 0DFH, 0EDH, 0F3H
        BYTE    0FFH, 0FEH, 0C8H, 0EEH, 0D5H, 0F6H, 0D5H, 0EEH, 0FFH, 0DFH, 0C9H, 0DDH, 0F7H, 0EAH, 0F7H, 0DDH
        BYTE    0FFH, 0FFH, 0C1H, 0F3H, 0DFH, 0EDH, 0DFH, 0F3H, 0FFH, 0FEH, 0C8H, 0EEH, 0F6H, 0D5H, 0F6H, 0EEH
        BYTE    0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0F0H, 0C1H, 0C3H, 0C7H, 0DFH, 0FFH, 0DFH, 0C9H, 0DDH
        BYTE    0F8H, 0CCH, 0FFH, 0FFH, 0FFH, 0FFH, 0C1H, 0F3H, 0C2H, 0C4H, 0F8H, 0FEH, 0FFH, 0FEH, 0C8H, 0EEH
        BYTE    0EAH, 0F7H, 0EAH, 0DDH, 0C0H, 0C0H, 0C0H, 0C0H, 0EDH, 0DFH, 0EDH, 0F3H, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    0D5H, 0F6H, 0D5H, 0EEH, 0C0H, 0C0H, 0C0H, 0C0H, 000H, 00CH, 01EH, 03FH, 02DH, 01EH, 000H, 000H
        BYTE    080H, 08CH, 092H, 0BFH, 09EH, 0A1H, 080H, 080H, 040H, 052H, 04CH, 07FH, 04CH, 052H, 040H, 040H
        BYTE    0C0H, 0C0H, 0E0H, 0FFH, 0DFH, 0E0H, 0C0H, 0C0H, 000H, 000H, 00CH, 01EH, 01EH, 00CH, 000H, 000H
        END
