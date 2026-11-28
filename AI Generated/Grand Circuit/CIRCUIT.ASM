;=====================================================================
; CIRCUIT.ASM - GRAND CIRCUIT for the COMX-35 (1802 machine code, A18 syntax)
; An original motor race.  Start: CALL(@4500).
;=====================================================================
PAGE    EQU     0F800H
ROWREC  EQU     0A500H
S_T     EQU     0FCH
S_PTB   EQU     0FAH
S_CVB   EQU     0F8H
S_PH    EQU     0F6H
S_CF    EQU     0F5H
S_CC    EQU     0F4H
S_RF    EQU     0F3H
S_RC    EQU     0F2H
S_LF    EQU     0F1H
S_LC    EQU     0F0H
SCOREC  EQU     0AA66H
PSTEER  EQU     0AA65H
CRX     EQU     0AA64H
VIS     EQU     0AA63H
SLOT    EQU     0AA62H
ROWN    EQU     0AA61H
CCH     EQU     0AA60H
KCH     EQU     0AA5FH
NPH     EQU     0AA5EH
NCF     EQU     0AA5DH
NCC     EQU     0AA5CH
NRF     EQU     0AA5BH
NRC     EQU     0AA5AH
NLF     EQU     0AA59H
NLC     EQU     0AA58H
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
SPR     EQU     0A400H
CRD     EQU     0A600H
CRL     EQU     0A610H
CSP     EQU     0A620H
CTS     EQU     0A628H
CLN     EQU     0A630H
CLT     EQU     0A638H
CFR     EQU     0A640H
CSS     EQU     0A648H
CSF     EQU     0A650H
MROW    EQU     0A680H
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
LASTF   EQU     0AA24H
VCAP    EQU     0AA25H
DIRECT  EQU     0AA26H
HELD    EQU     0AA27H
TMPA    EQU     0AA28H
TMPB    EQU     0AA29H
TMPC    EQU     0AA2AH
TRK     EQU     0AA2BH
PHASE   EQU     0AA2CH
PXL     EQU     0AA2DH
PST     EQU     0AA2EH
SPD     EQU     0AA2FH
GEAR    EQU     0AA30H
RD      EQU     0AA31H
FR      EQU     0AA33H
LAP     EQU     0AA34H
TIME    EQU     0AA35H
TSUB    EQU     0AA36H
POSN    EQU     0AA37H
OPOS    EQU     0AA38H
CVS     EQU     0AA39H
CVT     EQU     0AA3AH
CVQ     EQU     0AA3BH
CVB     EQU     0AA3CH
PTB     EQU     0AA3EH
GCHG    EQU     0AA40H
OCVQ    EQU     0AA41H
OPST    EQU     0AA42H
CRASH   EQU     0AA43H
STMR    EQU     0AA44H
QT      EQU     0AA45H
GRID    EQU     0AA47H
MOFF    EQU     0AA48H
MACC    EQU     0AA49H
HRR     EQU     0AA4AH
MSGT    EQU     0AA4BH
MSEG    EQU     0AA4CH
CDIRTY  EQU     0AA4DH
LFC     EQU     0AA4EH
PCNT    EQU     0AA4FH
OPCOL   EQU     0AA50H
LGTMR   EQU     0AA51H
LASTSEG EQU     0AA52H
ENG     EQU     0AA53H
FINISH  EQU     0AA54H
OFFRD   EQU     0AA55H
SQL     EQU     0AA56H
ENGL    EQU     0AA57H
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
ROADPREP
        LDI     HIGH (CVQ)
        PHI     RA
        LDI     LOW (CVQ)
        PLO     RA
        LDN     RA
        SHL
        ADI     LOW CVOFF
        PLO     RC
        LDI     HIGH CVOFF
        ADCI    0
        PHI     RC
        LDI     HIGH (ROWREC+S_CVB)
        PHI     RA
        LDI     LOW (ROWREC+S_CVB)
        PLO     RA
        LDA     RC
        STR     RA
        INC     RA
        LDN     RC
        STR     RA
        LDI     HIGH (PST)
        PHI     RA
        LDI     LOW (PST)
        PLO     RA
        LDN     RA
        SHL
        ADI     LOW PSOFF
        PLO     RC
        LDI     HIGH PSOFF
        ADCI    0
        PHI     RC
        LDI     HIGH (ROWREC+S_PTB)
        PHI     RA
        LDI     LOW (ROWREC+S_PTB)
        PLO     RA
        LDA     RC
        STR     RA
        INC     RA
        LDN     RC
        STR     RA
        LDI     HIGH (CVQ)
        PHI     RA
        LDI     LOW (CVQ)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (OCVQ)
        PHI     RA
        LDI     LOW (OCVQ)
        PLO     RA
        LDN     RA
        XOR
        LBNZ    RP1
        LDI     HIGH (PST)
        PHI     RA
        LDI     LOW (PST)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (OPST)
        PHI     RA
        LDI     LOW (OPST)
        PLO     RA
        LDN     RA
        XOR
        LBZ     RPX
RP1
        LDI     HIGH (GCHG)
        PHI     RA
        LDI     LOW (GCHG)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (CVQ)
        PHI     RA
        LDI     LOW (CVQ)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OCVQ)
        PHI     RA
        LDI     LOW (OCVQ)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (PST)
        PHI     RA
        LDI     LOW (PST)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OPST)
        PHI     RA
        LDI     LOW (OPST)
        PLO     RA
        GLO     R7
        STR     RA
RPX     SEP     R5
KCH     GLO     R9
        SMI     5
        LBNF    KC1
        LDI     4
        PLO     R9
KC1
        LDI     S_PH
        PLO     RC
        LDN     RC
        LBZ     KC2
        LDI     5
KC2     STR     R2
        GLO     R9
        ADD
        ADI     LOW KERBT
        PLO     RA
        LDI     HIGH KERBT
        ADCI    0
        PHI     RA
        LDN     RA
        SEP     R5
DCH
        LDI     S_PH
        PLO     RC
        LDN     RC
        LBZ     DC1
        LDI     32
        SEP     R5
DC1     GLO     R9
        ADI     LOW DASHT
        PLO     RA
        LDI     HIGH DASHT
        ADCI    0
        PHI     RA
        LDN     RA
        SEP     R5
ROAD
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        PLO     RC
        SHL
        PLO     RD
        LDI     0
        RSHL
        PHI     RD
        GLO     RC
        STR     R2
        GLO     RD
        ADD
        PLO     RD
        GHI     RD
        ADCI    HIGH QBUF
        PHI     RD
        LDI     0
        PHI     R8
        LDI     HIGH (ROWREC)
        PHI     RB
        LDI     LOW (ROWREC)
        PLO     RB
        LDI     HIGH ROWREC
        PHI     RC
        LDI     0
        PLO     R8
RDL
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        STR     R2
        GHI     R8
        ADD
        SMI     200
        LBNF    RDL0
        LDI     HIGH (DIRECT)
        PHI     RA
        LDI     LOW (DIRECT)
        PLO     RA
        LDN     RA
        LBNZ    RDL0
        LDI     HIGH (GCHG)
        PHI     RA
        LDI     LOW (GCHG)
        PLO     RA
        LDI     2
        STR     RA
        LBR     RDONE
RDL0
        LDI     S_T
        PLO     RC
        GLO     RD
        STR     RC
        GLO     R8
        LBNZ    RDL1
        LDI     HIGH (PAGE+320)
        PHI     RE
        LDI     LOW (PAGE+320)
        PLO     RE
        LBR     RDL2
RDL1    GLO     RE
        ADI     40
        PLO     RE
        GHI     RE
        ADCI    0
        PHI     RE
RDL2
        LDI     HIGH (RD+1)
        PHI     RA
        LDI     LOW (RD+1)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     R8
        ADI     LOW ZTAB
        PLO     RA
        LDI     HIGH ZTAB
        ADCI    0
        PHI     RA
        LDN     RA
        ADD
        ANI     40H
        PLO     RF
        LDI     S_PH
        PLO     RC
        GLO     RF
        STR     RC
        LDI     HIGH (GCHG)
        PHI     RA
        LDI     LOW (GCHG)
        PLO     RA
        LDN     RA
        LBNZ    RFULL
RSTR
        GLO     RB
        ADI     6
        PLO     RC
        LDN     RC
        STR     R2
        GLO     RF
        XOR
        LBZ     RNEXT
        GLO     RF
        STR     RC
        GLO     RB
        ADI     0
        PLO     RC
        LDN     RC
        LBZ     RPL
        SMI     41
        LBDF    RPL
        LDN     RC
        SMI     1
        PLO     R7
        GLO     RB
        ADI     7
        PLO     RC
        LDN     RC
        PLO     R9
        GLO     R9
        SMI     5
        LBNF    KI1A
        LDI     4
        PLO     R9
KI1A
        LDI     S_PH
        PLO     RC
        LDN     RC
        LBZ     KI1B
        LDI     5
KI1B    STR     R2
        GLO     R9
        ADD
        ADI     LOW KERBT
        PLO     RA
        LDI     HIGH KERBT
        ADCI    0
        PHI     RA
        LDN     RA
        PHI     R7
        GLO     RB
        ADI     1
        PLO     RC
        GHI     R7
        STR     RC
        GHI     R8
        SMI     240
        LBDF    WC1
        GHI     R8
        ADI     1
        PHI     R8
        GLO     R7
        STR     R2
        GLO     RE
        ADD
        PLO     RA
        GHI     RE
        ADCI    0
        PHI     RA
        STR     RD
        INC     RD
        GLO     RA
        STR     RD
        INC     RD
        GHI     R7
        STR     RD
        INC     RD
        GHI     RA
        ADI     0A8H
        PHI     RA
        GHI     R7
        STR     RA
WC1
RPL
        GLO     RB
        ADI     2
        PLO     RC
        LDN     RC
        LBZ     RPR
        SMI     41
        LBDF    RPR
        LDN     RC
        SMI     1
        PLO     R7
        GLO     RB
        ADI     8
        PLO     RC
        LDN     RC
        PLO     R9
        GLO     R9
        SMI     5
        LBNF    KI2A
        LDI     4
        PLO     R9
KI2A
        LDI     S_PH
        PLO     RC
        LDN     RC
        LBZ     KI2B
        LDI     5
KI2B    STR     R2
        GLO     R9
        ADD
        ADI     LOW KERBT
        PLO     RA
        LDI     HIGH KERBT
        ADCI    0
        PHI     RA
        LDN     RA
        PHI     R7
        GLO     RB
        ADI     3
        PLO     RC
        GHI     R7
        STR     RC
        GHI     R8
        SMI     240
        LBDF    WC2
        GHI     R8
        ADI     1
        PHI     R8
        GLO     R7
        STR     R2
        GLO     RE
        ADD
        PLO     RA
        GHI     RE
        ADCI    0
        PHI     RA
        STR     RD
        INC     RD
        GLO     RA
        STR     RD
        INC     RD
        GHI     R7
        STR     RD
        INC     RD
        GHI     RA
        ADI     0A8H
        PHI     RA
        GHI     R7
        STR     RA
WC2
RPR
        GLO     RB
        ADI     4
        PLO     RC
        LDN     RC
        PLO     RF
        GLO     RB
        ADI     0
        PLO     RC
        LDN     RC
        STR     R2
        GLO     RF
        SM
        LBZ     RNEXT
        LBNF    RNEXT
        GLO     RB
        ADI     2
        PLO     RC
        LDN     RC
        STR     R2
        GLO     RF
        SD
        LBZ     RNEXT
        LBNF    RNEXT
        GLO     RF
        SMI     1
        PLO     R7
        GLO     RB
        ADI     9
        PLO     RC
        LDN     RC
        PLO     R9
        LDI     S_PH
        PLO     RC
        LDN     RC
        LBZ     DI3A
        LDI     32
        LBR     DI3B
DI3A    GLO     R9
        ADI     LOW DASHT
        PLO     RA
        LDI     HIGH DASHT
        ADCI    0
        PHI     RA
        LDN     RA
DI3B
        PHI     R7
        GLO     RB
        ADI     5
        PLO     RC
        GHI     R7
        STR     RC
        GHI     R8
        SMI     240
        LBDF    WC3
        GHI     R8
        ADI     1
        PHI     R8
        GLO     R7
        STR     R2
        GLO     RE
        ADD
        PLO     RA
        GHI     RE
        ADCI    0
        PHI     RA
        STR     RD
        INC     RD
        GLO     RA
        STR     RD
        INC     RD
        GHI     R7
        STR     RD
        INC     RD
        GHI     RA
        ADI     0A8H
        PHI     RA
        GHI     R7
        STR     RA
WC3
        LBR     RNEXT
RFULL
        LDI     S_CVB
        PLO     RC
        LDA     RC
        PHI     RA
        LDN     RC
        PLO     RA
        GLO     R8
        SHL
        STR     R2
        GLO     RA
        ADD
        PLO     RA
        GHI     RA
        ADCI    0
        PHI     RA
        LDA     RA
        PHI     R9
        LDN     RA
        PLO     R9
        LDI     S_PTB
        PLO     RC
        LDA     RC
        PHI     RA
        LDN     RC
        PLO     RA
        GLO     R8
        SHL
        STR     R2
        GLO     RA
        ADD
        PLO     RA
        GHI     RA
        ADCI    0
        PHI     RA
        INC     RA
        LDN     RA
        STR     R2
        GLO     R9
        ADD
        PLO     R9
        DEC     RA
        LDN     RA
        STR     R2
        GHI     R9
        ADD
        ADI     20
        PHI     R9
        GLO     R9
        SMI     6
        LBNF    RF1
        PLO     R9
        GHI     R9
        ADI     1
        PHI     R9
RF1
        GLO     RB
        ADI     10
        PLO     RC
        LDA     RC
        STR     R2
        GHI     R9
        XOR
        LBNZ    RFG
        LDN     RC
        STR     R2
        GLO     R9
        XOR
        LBZ     RSTR
RFG
        GLO     RB
        ADI     6
        PLO     RC
        GLO     RF
        STR     RC
        GLO     RB
        ADI     10
        PLO     RC
        GHI     R9
        STR     RC
        INC     RC
        GLO     R9
        STR     RC
        GLO     R8
        SHL
        ADI     LOW HWCF
        PLO     RA
        LDI     HIGH HWCF
        ADCI    0
        PHI     RA
        LDA     RA
        STR     R2
        GHI     R9
        SM
        PHI     RF
        LDN     RA
        STR     R2
        GLO     R9
        SM
        PLO     RF
        LBDF    RF2
        ADI     6
        PLO     RF
        GHI     RF
        SMI     1
        PHI     RF
RF2
        GHI     RF
        ANI     80H
        LBZ     CL1A
        LDI     0
        LBR     CL1C
CL1A    GHI     RF
        SMI     40
        LBNF    CL1B
        LDI     41
        LBR     CL1C
CL1B    GHI     RF
        ADI     1
CL1C    PLO     R7
        LDI     S_LC
        PLO     RC
        GLO     R7
        STR     RC
        INC     RC
        GLO     RF
        STR     RC
        GLO     R8
        SHL
        ADI     LOW H2CF
        PLO     RA
        LDI     HIGH H2CF
        ADCI    0
        PHI     RA
        LDA     RA
        STR     R2
        GHI     R9
        ADD
        PHI     RF
        LDN     RA
        STR     R2
        GLO     R9
        ADD
        PLO     RF
        SMI     6
        LBNF    RF3
        PLO     RF
        GHI     RF
        ADI     1
        PHI     RF
RF3
        GHI     RF
        ANI     80H
        LBZ     CL2A
        LDI     0
        LBR     CL2C
CL2A    GHI     RF
        SMI     40
        LBNF    CL2B
        LDI     41
        LBR     CL2C
CL2B    GHI     RF
        ADI     1
CL2C    PLO     R7
        LDI     S_RC
        PLO     RC
        GLO     R7
        STR     RC
        INC     RC
        GLO     RF
        STR     RC
        GLO     R9
        PLO     RF
        GHI     R9
        PHI     RF
        GHI     RF
        ANI     80H
        LBZ     CL3A
        LDI     0
        LBR     CL3C
CL3A    GHI     RF
        SMI     40
        LBNF    CL3B
        LDI     41
        LBR     CL3C
CL3B    GHI     RF
        ADI     1
CL3C    PLO     R7
        LDI     S_CC
        PLO     RC
        GLO     R7
        STR     RC
        INC     RC
        GLO     RF
        STR     RC
        GLO     RB
        ADI     4
        PLO     RC
        LDN     RC
        PLO     RF
        LDI     S_CC
        PLO     RC
        LDN     RC
        STR     R2
        GLO     RF
        XOR
        LBZ     RC0
        GLO     RF
        LBZ     RC0
        SMI     41
        LBDF    RC0
        LDI     S_LC
        PLO     RC
        LDN     RC
        STR     R2
        GLO     RF
        SM
        LBZ     RC0
        LBNF    RC0
        LDI     S_RC
        PLO     RC
        LDN     RC
        STR     R2
        GLO     RF
        SD
        LBZ     RC0
        LBNF    RC0
        GLO     RF
        SMI     1
        PLO     R7
        LDI     32
        PHI     R7
        GHI     R8
        SMI     240
        LBDF    WC4
        GHI     R8
        ADI     1
        PHI     R8
        GLO     R7
        STR     R2
        GLO     RE
        ADD
        PLO     RA
        GHI     RE
        ADCI    0
        PHI     RA
        STR     RD
        INC     RD
        GLO     RA
        STR     RD
        INC     RD
        GHI     R7
        STR     RD
        INC     RD
        GHI     RA
        ADI     0A8H
        PHI     RA
        GHI     R7
        STR     RA
WC4
RC0
        GLO     RB
        ADI     0
        PLO     RC
        LDN     RC
        PLO     RF
        LDI     S_LC
        PLO     RC
        LDN     RC
        PHI     RF
        STR     R2
        GLO     RF
        SD
        LBZ     RL3
        LBNF    RL2
        LDI     1
        PHI     R7
RL1     GLO     RF
        LBZ     RL1N
        SMI     41
        LBDF    RL1N
        GLO     RF
        SMI     1
        PLO     R7
        GHI     R8
        SMI     240
        LBDF    WC5
        GHI     R8
        ADI     1
        PHI     R8
        GLO     R7
        STR     R2
        GLO     RE
        ADD
        PLO     RA
        GHI     RE
        ADCI    0
        PHI     RA
        STR     RD
        INC     RD
        GLO     RA
        STR     RD
        INC     RD
        GHI     R7
        STR     RD
        INC     RD
        GHI     RA
        ADI     0A8H
        PHI     RA
        GHI     R7
        STR     RA
WC5
RL1N    INC     RF
        GLO     RF
        STR     R2
        GHI     RF
        XOR
        LBNZ    RL1
        LBR     RL3
RL2
        LDI     32
        PHI     R7
        GHI     RF
        PLO     R9
RL2A    INC     R9
        LDI     S_RC
        PLO     RC
        LDN     RC
        STR     R2
        GLO     R9
        SM
        LBDF    RL2N
        GLO     R9
        LBZ     RL2N
        SMI     41
        LBDF    RL2N
        GLO     R9
        SMI     1
        PLO     R7
        GHI     R8
        SMI     240
        LBDF    WC6
        GHI     R8
        ADI     1
        PHI     R8
        GLO     R7
        STR     R2
        GLO     RE
        ADD
        PLO     RA
        GHI     RE
        ADCI    0
        PHI     RA
        STR     RD
        INC     RD
        GLO     RA
        STR     RD
        INC     RD
        GHI     R7
        STR     RD
        INC     RD
        GHI     RA
        ADI     0A8H
        PHI     RA
        GHI     R7
        STR     RA
WC6
RL2N    GLO     R9
        STR     R2
        GLO     RF
        XOR
        LBNZ    RL2A
RL3
        LDI     S_LF
        PLO     RC
        LDN     RC
        PLO     R9
        GLO     RB
        ADI     7
        PLO     RC
        GLO     R9
        STR     RC
        GLO     R9
        SMI     5
        LBNF    KI4A
        LDI     4
        PLO     R9
KI4A
        LDI     S_PH
        PLO     RC
        LDN     RC
        LBZ     KI4B
        LDI     5
KI4B    STR     R2
        GLO     R9
        ADD
        ADI     LOW KERBT
        PLO     RA
        LDI     HIGH KERBT
        ADCI    0
        PHI     RA
        LDN     RA
        PHI     R7
        GLO     RB
        ADI     0
        PLO     RC
        LDN     RC
        PLO     RF
        LDI     S_LC
        PLO     RC
        LDN     RC
        PLO     R7
        GLO     RB
        ADI     0
        PLO     RC
        GLO     R7
        STR     RC
        GLO     RF
        STR     R2
        GLO     R7
        XOR
        PLO     RF
        GLO     RB
        ADI     1
        PLO     RC
        LDN     RC
        STR     R2
        GHI     R7
        STR     RC
        XOR
        STR     R2
        GLO     RF
        OR
        LBZ     RL4
        GLO     R7
        LBZ     RL4
        SMI     41
        LBDF    RL4
        DEC     R7
        GHI     R8
        SMI     240
        LBDF    WC7
        GHI     R8
        ADI     1
        PHI     R8
        GLO     R7
        STR     R2
        GLO     RE
        ADD
        PLO     RA
        GHI     RE
        ADCI    0
        PHI     RA
        STR     RD
        INC     RD
        GLO     RA
        STR     RD
        INC     RD
        GHI     R7
        STR     RD
        INC     RD
        GHI     RA
        ADI     0A8H
        PHI     RA
        GHI     R7
        STR     RA
WC7
RL4
        GLO     RB
        ADI     2
        PLO     RC
        LDN     RC
        PLO     RF
        LDI     S_RC
        PLO     RC
        LDN     RC
        PHI     RF
        STR     R2
        GLO     RF
        SD
        LBZ     RR3
        LBDF    RR2
        LDI     1
        PHI     R7
        GHI     RF
        PLO     R9
RR1A    INC     R9
        GLO     R9
        LBZ     RR1N
        SMI     41
        LBDF    RR1N
        GLO     R9
        SMI     1
        PLO     R7
        GHI     R8
        SMI     240
        LBDF    WC8
        GHI     R8
        ADI     1
        PHI     R8
        GLO     R7
        STR     R2
        GLO     RE
        ADD
        PLO     RA
        GHI     RE
        ADCI    0
        PHI     RA
        STR     RD
        INC     RD
        GLO     RA
        STR     RD
        INC     RD
        GHI     R7
        STR     RD
        INC     RD
        GHI     RA
        ADI     0A8H
        PHI     RA
        GHI     R7
        STR     RA
WC8
RR1N    GLO     R9
        STR     R2
        GLO     RF
        XOR
        LBNZ    RR1A
        LBR     RR3
RR2
        LDI     32
        PHI     R7
RR2A
        LDI     S_LC
        PLO     RC
        LDN     RC
        STR     R2
        GLO     RF
        SM
        LBZ     RR2N
        LBNF    RR2N
        GLO     RF
        LBZ     RR2N
        SMI     41
        LBDF    RR2N
        GLO     RF
        SMI     1
        PLO     R7
        GHI     R8
        SMI     240
        LBDF    WC9
        GHI     R8
        ADI     1
        PHI     R8
        GLO     R7
        STR     R2
        GLO     RE
        ADD
        PLO     RA
        GHI     RE
        ADCI    0
        PHI     RA
        STR     RD
        INC     RD
        GLO     RA
        STR     RD
        INC     RD
        GHI     R7
        STR     RD
        INC     RD
        GHI     RA
        ADI     0A8H
        PHI     RA
        GHI     R7
        STR     RA
WC9
RR2N    INC     RF
        GLO     RF
        STR     R2
        GHI     RF
        XOR
        LBNZ    RR2A
RR3
        LDI     S_RF
        PLO     RC
        LDN     RC
        PLO     R9
        GLO     RB
        ADI     8
        PLO     RC
        GLO     R9
        STR     RC
        GLO     R9
        SMI     5
        LBNF    KI5A
        LDI     4
        PLO     R9
KI5A
        LDI     S_PH
        PLO     RC
        LDN     RC
        LBZ     KI5B
        LDI     5
KI5B    STR     R2
        GLO     R9
        ADD
        ADI     LOW KERBT
        PLO     RA
        LDI     HIGH KERBT
        ADCI    0
        PHI     RA
        LDN     RA
        PHI     R7
        GLO     RB
        ADI     2
        PLO     RC
        LDN     RC
        PLO     RF
        LDI     S_RC
        PLO     RC
        LDN     RC
        PLO     R7
        GLO     RB
        ADI     2
        PLO     RC
        GLO     R7
        STR     RC
        GLO     RF
        STR     R2
        GLO     R7
        XOR
        PLO     RF
        GLO     RB
        ADI     3
        PLO     RC
        LDN     RC
        STR     R2
        GHI     R7
        STR     RC
        XOR
        STR     R2
        GLO     RF
        OR
        LBZ     RR4
        GLO     R7
        LBZ     RR4
        SMI     41
        LBDF    RR4
        DEC     R7
        GHI     R8
        SMI     240
        LBDF    WC10
        GHI     R8
        ADI     1
        PHI     R8
        GLO     R7
        STR     R2
        GLO     RE
        ADD
        PLO     RA
        GHI     RE
        ADCI    0
        PHI     RA
        STR     RD
        INC     RD
        GLO     RA
        STR     RD
        INC     RD
        GHI     R7
        STR     RD
        INC     RD
        GHI     RA
        ADI     0A8H
        PHI     RA
        GHI     R7
        STR     RA
WC10
RR4
        LDI     S_CF
        PLO     RC
        LDN     RC
        PLO     R9
        GLO     RB
        ADI     9
        PLO     RC
        GLO     R9
        STR     RC
        LDI     S_PH
        PLO     RC
        LDN     RC
        LBZ     DI6A
        LDI     32
        LBR     DI6B
DI6A    GLO     R9
        ADI     LOW DASHT
        PLO     RA
        LDI     HIGH DASHT
        ADCI    0
        PHI     RA
        LDN     RA
DI6B
        PHI     R7
        LDI     S_CC
        PLO     RC
        LDN     RC
        PLO     R7
        LDI     S_LC
        PLO     RC
        LDN     RC
        STR     R2
        GLO     R7
        SM
        LBZ     RC9
        LBNF    RC9
        LDI     S_RC
        PLO     RC
        LDN     RC
        STR     R2
        GLO     R7
        SD
        LBZ     RC9
        LBNF    RC9
        GLO     RB
        ADI     4
        PLO     RC
        LDN     RC
        STR     R2
        GLO     R7
        XOR
        PLO     RF
        GLO     RB
        ADI     5
        PLO     RC
        LDN     RC
        STR     R2
        GHI     R7
        XOR
        STR     R2
        GLO     RF
        OR
        LBZ     RC8
        DEC     R7
        GHI     R8
        SMI     240
        LBDF    WC11
        GHI     R8
        ADI     1
        PHI     R8
        GLO     R7
        STR     R2
        GLO     RE
        ADD
        PLO     RA
        GHI     RE
        ADCI    0
        PHI     RA
        STR     RD
        INC     RD
        GLO     RA
        STR     RD
        INC     RD
        GHI     R7
        STR     RD
        INC     RD
        GHI     RA
        ADI     0A8H
        PHI     RA
        GHI     R7
        STR     RA
WC11
        INC     R7
RC8
        GLO     RB
        ADI     5
        PLO     RC
        GHI     R7
        STR     RC
        LBR     RC10
RC9
        GLO     RB
        ADI     5
        PLO     RC
        LDI     0
        STR     RC
RC10
        GLO     RB
        ADI     4
        PLO     RC
        GLO     R7
        STR     RC
RNEXT
        LDI     S_T
        PLO     RC
        LDN     RC
        STR     R2
        GLO     RD
        XOR
        LBZ     RNXA
        GLO     R8
        SMI     12
        LBNF    RNXA
        LDI     HIGH (CDIRTY)
        PHI     RA
        LDI     LOW (CDIRTY)
        PLO     RA
        LDI     1
        STR     RA
RNXA
        LDI     HIGH (DIRECT)
        PHI     RA
        LDI     LOW (DIRECT)
        PLO     RA
        LDN     RA
        LBZ     RNX1
        SEP     R4
        WORD    RQN
        GLO     R8
        STXD
        SEP     R4
        WORD    QFLUSH
        IRX
        LDX
        PLO     R8
        LDI     HIGH (QBUF)
        PHI     RD
        LDI     LOW (QBUF)
        PLO     RD
        LDI     HIGH ROWREC
        PHI     RC
RNX1
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
        LDI     HIGH ROWREC
        PHI     RC
RNX2    GLO     RB
        ADI     16
        PLO     RB
        INC     R8
        GLO     R8
        XRI     15
        LBNZ    RDL
        LDI     HIGH (GCHG)
        PHI     RA
        LDI     LOW (GCHG)
        PLO     RA
        LDN     RA
        LBZ     RGC
        SMI     1
        STR     RA
RGC
        LBR     RDEND
RDONE
        LDI     HIGH (GCHG)
        PHI     RA
        LDI     LOW (GCHG)
        PLO     RA
        LDI     2
        STR     RA
RDEND   LDI     0
        PHI     R7
        SEP     R4
        WORD    RQN
        SEP     R5
RQN
        LDI     HIGH (QN)
        PHI     RA
        LDI     LOW (QN)
        PLO     RA
        LDN     RA
        STR     R2
        GHI     R8
        ADD
        STR     RA
        LDI     0
        PHI     R8
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
SPRITES
        LDI     HIGH (SPR)
        PHI     RB
        LDI     LOW (SPR)
        PLO     RB
SPR1    GLO     RB
        ADI     6
        PLO     RC
        GHI     RB
        PHI     RC
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
        ADI     16
        PLO     RB
        XRI     80H
        LBNZ    SPR1
        LDI     HIGH (SPR)
        PHI     RB
        LDI     LOW (SPR)
        PLO     RB
SPR2    GLO     RB
        PLO     RC
        ADI     6
        PLO     RD
        GHI     RB
        PHI     RC
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
        ADI     16
        PLO     RB
        XRI     80H
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
SPHIDE
        GLO     R8
        SHL
        SHL
        SHL
        SHL
        ADI     0
        PLO     RD
        LDI     HIGH SPR
        PHI     RD
        LDI     0
        STR     RD
        SEP     R5
PLAYERCAR
        LDI     HIGH (PXL)
        PHI     RA
        LDI     LOW (PXL)
        PLO     RA
        LDN     RA
        SHR
        PLO     R9
        LDI     HIGH (PXL)
        PHI     RA
        LDI     LOW (PXL)
        PLO     RA
        LDN     RA
        ANI     80H
        LBZ     PCa
        GLO     R9
        ORI     80H
        PLO     R9
PCa     GLO     R9
        ADI     18
        PLO     R9
        ANI     80H
        LBZ     PCb
        LDI     0
        PLO     R9
PCb     GLO     R9
        SMI     37
        LBNF    PCc
        LDI     36
        PLO     R9
PCc
        LDI     HIGH (OPCOL)
        PHI     RA
        LDI     LOW (OPCOL)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     R9
        XOR
        LBZ     PC0
        LDI     HIGH (OPCOL)
        PHI     RA
        LDI     LOW (OPCOL)
        PLO     RA
        LDN     RA
        PLO     RB
        GLO     RB
        PLO     RE
        LDI     20
        PHI     RE
        LDI     0
        SEP     R1
        INC     RE
        LDI     0
        SEP     R1
        INC     RE
        LDI     0
        SEP     R1
        INC     RE
        LDI     0
        SEP     R1
        INC     RE
        GLO     RB
        PLO     RE
        LDI     21
        PHI     RE
        LDI     0
        SEP     R1
        INC     RE
        LDI     0
        SEP     R1
        INC     RE
        LDI     0
        SEP     R1
        INC     RE
        LDI     0
        SEP     R1
        INC     RE
        GLO     R9
        PLO     R7
        LDI     HIGH (OPCOL)
        PHI     RA
        LDI     LOW (OPCOL)
        PLO     RA
        GLO     R7
        STR     RA
        LBR     PC1
PC0
        LDI     HIGH (CRASH)
        PHI     RA
        LDI     LOW (CRASH)
        PLO     RA
        LDN     RA
        LBNZ    PC1
        LDI     HIGH (CDIRTY)
        PHI     RA
        LDI     LOW (CDIRTY)
        PLO     RA
        LDN     RA
        LBNZ    PC1
        SEP     R5
PC1
        LDI     HIGH (CDIRTY)
        PHI     RA
        LDI     LOW (CDIRTY)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (OPCOL)
        PHI     RA
        LDI     LOW (OPCOL)
        PLO     RA
        LDN     RA
        PLO     RB
        LDI     HIGH (CRASH)
        PHI     RA
        LDI     LOW (CRASH)
        PLO     RA
        LDN     RA
        LBZ     PC2
        LDI     HIGH (FRM+1)
        PHI     RA
        LDI     LOW (FRM+1)
        PLO     RA
        LDN     RA
        ANI     2
        LBZ     PC2
        GLO     RB
        PLO     RE
        LDI     20
        PHI     RE
        LDI     240
        SEP     R1
        INC     RE
        LDI     241
        SEP     R1
        INC     RE
        LDI     240
        SEP     R1
        INC     RE
        LDI     241
        SEP     R1
        INC     RE
        GLO     RB
        PLO     RE
        LDI     21
        PHI     RE
        LDI     241
        SEP     R1
        INC     RE
        LDI     240
        SEP     R1
        INC     RE
        LDI     241
        SEP     R1
        INC     RE
        LDI     240
        SEP     R1
        INC     RE
        SEP     R5
PC2
        GLO     RB
        PLO     RE
        LDI     20
        PHI     RE
        LDI     28
        SEP     R1
        INC     RE
        LDI     157
        SEP     R1
        INC     RE
        LDI     158
        SEP     R1
        INC     RE
        LDI     31
        SEP     R1
        INC     RE
        GLO     RB
        PLO     RE
        LDI     21
        PHI     RE
        LDI     91
        SEP     R1
        INC     RE
        LDI     220
        SEP     R1
        INC     RE
        LDI     221
        SEP     R1
        INC     RE
        LDI     94
        SEP     R1
        INC     RE
        SEP     R5
; DRIVE - keys, speed, steering, drift in bends
DRIVE
        LDI     HIGH (CRASH)
        PHI     RA
        LDI     LOW (CRASH)
        PLO     RA
        LDN     RA
        LBZ     DR0
        SMI     1
        STR     RA
        LBNZ    DRK
        LDI     HIGH (PXL)
        PHI     RA
        LDI     LOW (PXL)
        PLO     RA
        LDI     0
        STR     RA
        LBR     DRK
DR0
        LDI     HIGH (STMR)
        PHI     RA
        LDI     LOW (STMR)
        PLO     RA
        LDN     RA
        LBNZ    DRK
        BN3     DR3
        SEX     R2
        INP     3
        PLO     R9
        SMI     61H
        LBNF    DR1
        GLO     R9
        SMI     7BH
        LBDF    DR1
        GLO     R9
        SMI     20H
        PLO     R9
DR1     GLO     R9
        SMI     82H
        LBNF    DR2
        SMI     4
        LBDF    DR2
        GLO     R9
        PLO     R7
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        GLO     R7
        STR     RA
        LBR     DR3
DR2     GLO     R9
        XRI     K_ESC
        LBNZ    DR2A
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     2
        STR     RA
        SEP     R5
DR2A
        LDI     HIGH (GEAR)
        PHI     RA
        LDI     LOW (GEAR)
        PLO     RA
        LDN     RA
        XRI     1
        STR     RA
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (3A1FH)
        PHI     RC
        LDI     LOW (3A1FH)
        PLO     RC
        LDI     3
        SEP     R4
        WORD    SOUND
DR3
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        LBZ     DR6
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        NOP
        B2      DR4
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDI     0
        STR     RA
        LBR     DR6
DR4
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDN     RA
        PLO     R9
        XRI     K_LEFT
        LBNZ    DR4A
        LDI     HIGH (PXL)
        PHI     RA
        LDI     LOW (PXL)
        PLO     RA
        LDN     RA
        SMI     6
        STR     RA
        LBR     DRSQ
DR4A    GLO     R9
        XRI     K_RIGHT
        LBNZ    DR4B
        LDI     HIGH (PXL)
        PHI     RA
        LDI     LOW (PXL)
        PLO     RA
        LDN     RA
        ADI     6
        STR     RA
        LBR     DRSQ
DR4B    GLO     R9
        XRI     K_DOWN
        LBNZ    DR6
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        SMI     13
        LBDF    DR4C
        LDI     0
DR4C    STR     RA
        LBR     DR8
DRSQ
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        SMI     170
        LBNF    DR6
        LDI     HIGH (SQL)
        PHI     RA
        LDI     LOW (SQL)
        PLO     RA
        LDI     3
        STR     RA
        LBR     DR6
DR6
        LDI     HIGH (GEAR)
        PHI     RA
        LDI     LOW (GEAR)
        PLO     RA
        LDN     RA
        LBNZ    DR7
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        SMI     150
        LBDF    DR6B
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        ADI     5
        STR     RA
        LBR     DR8
DR6B
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        SMI     3
        STR     RA
        LBR     DR8
DR7
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        SMI     100
        LBDF    DR7A
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     DR8
DR7A
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        SMI     245
        LBDF    DR8
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        ADI     3
        STR     RA
DR8
        LDI     HIGH (OFFRD)
        PHI     RA
        LDI     LOW (OFFRD)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (PXL)
        PHI     RA
        LDI     LOW (PXL)
        PLO     RA
        LDN     RA
        ADI     34
        SMI     69
        LBNF    DR9
        LDI     HIGH (OFFRD)
        PHI     RA
        LDI     LOW (OFFRD)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        SMI     70
        LBNF    DR9
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        SMI     8
        STR     RA
DR9
        LDI     HIGH (LASTSEG)
        PHI     RA
        LDI     LOW (LASTSEG)
        PLO     RA
        LDN     RA
        PLO     R9
        ANI     80H
        PHI     R9
        LBZ     DR9A
        GLO     R9
        SDI     0
        PLO     R9
DR9A    LDI     0
        PLO     RB
        PHI     RB
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        STR     R2
DR9B    GLO     R9
        LBZ     DR9C
        GLO     RB
        ADD
        PLO     RB
        GHI     RB
        ADCI    0
        PHI     RB
        DEC     R9
        LBR     DR9B
DR9C    GHI     RB
        SHR
        STR     R2
        GHI     R9
        LBNZ    DR9D
        LDI     HIGH (PXL)
        PHI     RA
        LDI     LOW (PXL)
        PLO     RA
        LDN     RA
        SM
        STR     RA
        LBR     DR10
DR9D
        LDI     HIGH (PXL)
        PHI     RA
        LDI     LOW (PXL)
        PLO     RA
        LDN     RA
        ADD
        STR     RA
DR10
        LDI     HIGH (PXL)
        PHI     RA
        LDI     LOW (PXL)
        PLO     RA
        LDN     RA
        ADI     60
        SMI     121
        LBNF    DR11
        LDI     HIGH (PXL)
        PHI     RA
        LDI     LOW (PXL)
        PLO     RA
        LDN     RA
        ANI     80H
        LBZ     DR10A
        LDI     196
        STR     RA
        LBR     DR11
DR10A   LDI     60
        STR     RA
DR11
        LDI     HIGH (PST)
        PHI     RA
        LDI     LOW (PST)
        PLO     RA
        LDI     16
        STR     RA
DRK
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        PLO     R9
        LDI     0
        PHI     R9
        GLO     R9
        SHL
        PLO     RF
        GHI     R9
        RSHL
        PHI     RF
        GLO     RF
        SHL
        PLO     RF
        GHI     RF
        RSHL
        PHI     RF
        GLO     R9
        STR     R2
        GLO     RF
        ADD
        PLO     RF
        GHI     RF
        ADCI    0
        PHI     RF
        LDI     HIGH (FR)
        PHI     RA
        LDI     LOW (FR)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RF
        ADD
        PLO     RF
        GHI     RF
        ADCI    0
        PHI     RF
        GLO     RF
        ANI     63
        PLO     R7
        LDI     HIGH (FR)
        PHI     RA
        LDI     LOW (FR)
        PLO     RA
        GLO     R7
        STR     RA
        GLO     RF
        SHL
        GHI     RF
        RSHL
        SHL
        STR     R2
        GLO     RF
        SHL
        SHL
        LBNF    DRKa
        LDN     R2
        ORI     1
        STR     R2
DRKa    LDN     R2
        PLO     RF
        SHR
        SHR
        PHI     RF
        LDI     HIGH (LFC)
        PHI     RA
        LDI     LOW (LFC)
        PLO     RA
        LDN     RA
        SMI     4
        PLO     R9
DRKs    GLO     R9
        LBZ     DRKt
        GHI     RF
        STR     R2
        GLO     RF
        ADD
        PLO     RF
        DEC     R9
        LBR     DRKs
DRKt    GLO     RF
        STR     R2
        LDI     HIGH (RD+1)
        PHI     RA
        LDI     LOW (RD+1)
        PLO     RA
        LDN     RA
        ADD
        STR     RA
        DEC     RA
        LDN     RA
        PLO     R9
        ADCI    0
        STR     RA
        STR     R2
        GLO     R9
        XOR
        ANI     40H
        LBZ     DRK3
        SEP     R4
        WORD    NEWLAP
DRK3
        LDI     HIGH (RD)
        PHI     RA
        LDI     LOW (RD)
        PLO     RA
        LDN     RA
        SHL
        SHL
        PLO     R9
        LDI     HIGH (RD+1)
        PHI     RA
        LDI     LOW (RD+1)
        PLO     RA
        LDN     RA
        SHR
        SHR
        SHR
        SHR
        SHR
        SHR
        STR     R2
        GLO     R9
        OR
        PLO     R9
        GLO     R9
        STR     R2
        LDI     HIGH (SCOREC)
        PHI     RA
        LDI     LOW (SCOREC)
        PLO     RA
        LDN     RA
        XOR
        LBZ     DRK4
        LDN     R2
        STR     RA
        LDI     HIGH (PHASE)
        PHI     RA
        LDI     LOW (PHASE)
        PLO     RA
        LDN     RA
        LBZ     DRK4
        LDI     HIGH (SCORE+4)
        PHI     RB
        LDI     LOW (SCORE+4)
        PLO     RB
        LDI     1
        SEP     R4
        WORD    ADDSC
DRK4
        SEP     R4
        WORD    CMAPAT
        PLO     R7
        LDI     HIGH (LASTSEG)
        PHI     RA
        LDI     LOW (LASTSEG)
        PLO     RA
        GLO     R7
        STR     RA
        GLO     R9
        ADI     2
        PLO     R9
        SEP     R4
        WORD    CMAPAT
        PLO     R7
        LDI     HIGH (CVT)
        PHI     RA
        LDI     LOW (CVT)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (FRM+1)
        PHI     RA
        LDI     LOW (FRM+1)
        PLO     RA
        LDN     RA
        ANI     1
        LBNZ    DRK6
        LDI     HIGH (CVT)
        PHI     RA
        LDI     LOW (CVT)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (CVS)
        PHI     RA
        LDI     LOW (CVS)
        PLO     RA
        LDN     RA
        SM
        LBZ     DRK6
        ANI     80H
        LBZ     DRK5
        LDI     HIGH (CVS)
        PHI     RA
        LDI     LOW (CVS)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     DRK6
DRK5
        LDI     HIGH (CVS)
        PHI     RA
        LDI     LOW (CVS)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
DRK6
        LDI     HIGH (CVS)
        PHI     RA
        LDI     LOW (CVS)
        PLO     RA
        LDN     RA
        ADI     7
        PLO     R7
        LDI     HIGH (CVQ)
        PHI     RA
        LDI     LOW (CVQ)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (CVS)
        PHI     RA
        LDI     LOW (CVS)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        SHR
        SHR
        SHR
        SHR
        SHR
        LBZ     DRX
        PLO     R9
        LDI     HIGH (MACC)
        PHI     RA
        LDI     LOW (MACC)
        PLO     RA
        LDN     RA
DRM     ADD
        DEC     R9
        PLO     RF
        GLO     R9
        LBZ     DRM2
        GLO     RF
        LBR     DRM
DRM2    GLO     RF
        PLO     R7
        LDI     HIGH (MACC)
        PHI     RA
        LDI     LOW (MACC)
        PLO     RA
        GLO     R7
        STR     RA
        ADI     40
        SMI     80
        LBNF    DRX
        LDI     HIGH (MACC)
        PHI     RA
        LDI     LOW (MACC)
        PLO     RA
        LDN     RA
        ANI     80H
        LBZ     DRM3
        LDI     HIGH (MACC)
        PHI     RA
        LDI     LOW (MACC)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (MOFF)
        PHI     RA
        LDI     LOW (MOFF)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        SMI     40
        LBNF    DRM4
        STR     RA
        LBR     DRM4
DRM3
        LDI     HIGH (MACC)
        PHI     RA
        LDI     LOW (MACC)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (MOFF)
        PHI     RA
        LDI     LOW (MOFF)
        PLO     RA
        LDN     RA
        LBNZ    DRM3A
        LDI     40
DRM3A   SMI     1
        STR     RA
DRM4
        LDI     HIGH (MSEG)
        PHI     RA
        LDI     LOW (MSEG)
        PLO     RA
        LDI     4
        STR     RA
DRX     SEP     R5
CMAPAT  GLO     R9
        ADI     LOW CMAP
        PLO     RC
        LDI     HIGH (TRK)
        PHI     RA
        LDI     LOW (TRK)
        PLO     RA
        LDN     RA
        ADCI    HIGH CMAP
        PHI     RC
        LDN     RC
        SEP     R5
DIV3    PLO     RF
        LDI     0
        PHI     RF
DV1     GLO     RF
        SMI     3
        LBNF    DV2
        PLO     RF
        GHI     RF
        ADI     1
        PHI     RF
        LBR     DV1
DV2     GHI     RF
        SEP     R5
MOUNTQ
        LDI     HIGH (MSEG)
        PHI     RA
        LDI     LOW (MSEG)
        PLO     RA
        LDN     RA
        LBZ     MQX
        SMI     1
        STR     RA
        PLO     R9
        SHL
        SHL
        STR     R2
        GLO     R9
        ADD
        SHL
        PLO     RE
        STR     R2
        LDI     HIGH (MOFF)
        PHI     RA
        LDI     LOW (MOFF)
        PLO     RA
        LDN     RA
        ADD
        ADI     LOW MROWS
        PLO     RB
        LDI     HIGH MROWS
        ADCI    0
        PHI     RB
        LDI     7
        PHI     RE
        LDI     10
        PLO     R9
MQ1     LDA     RB
        SEP     R1
        INC     RE
        DEC     R9
        GLO     R9
        LBNZ    MQ1
MQX     SEP     R5
MOUNTALL
        LDI     HIGH (MSEG)
        PHI     RA
        LDI     LOW (MSEG)
        PLO     RA
        LDI     4
        STR     RA
MA1
        SEP     R4
        WORD    MOUNTQ
        LDI     HIGH (MSEG)
        PHI     RA
        LDI     LOW (MSEG)
        PLO     RA
        LDN     RA
        LBNZ    MA1
        SEP     R5
NEWLAP
        LDI     HIGH (LAP)
        PHI     RA
        LDI     LOW (LAP)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LDI     HIGH (PHASE)
        PHI     RA
        LDI     LOW (PHASE)
        PLO     RA
        LDN     RA
        LBNZ    NL2
        LDI     HIGH (LAP)
        PHI     RA
        LDI     LOW (LAP)
        PLO     RA
        LDN     RA
        XRI     1
        LBNZ    NL0
        LDI     HIGH (QT)
        PHI     RA
        LDI     LOW (QT)
        PLO     RA
        LDI     0
        STR     RA
        INC     RA
        STR     RA
        LDI     HIGH (TXQUAL)
        PHI     RF
        LDI     LOW (TXQUAL)
        PLO     RF
        GHI     RF
        SEP     R4
        WORD    MSG
        SEP     R5
NL0
        LDI     HIGH (TRK)
        PHI     RA
        LDI     LOW (TRK)
        PLO     RA
        LDN     RA
        SHL
        ADI     LOW PARTAB
        PLO     RC
        LDI     HIGH PARTAB
        ADCI    0
        PHI     RC
        LDI     HIGH (QT+1)
        PHI     RA
        LDI     LOW (QT+1)
        PLO     RA
        LDN     RA
        INC     RC
        SM
        PLO     RF
        DEC     RA
        DEC     RC
        LDN     RA
        STR     R2
        LDN     RC
        SDB
        PHI     RF
        LDI     1
        PLO     R9
        GHI     RF
        ANI     80H
        LBNZ    NL1
NL0B    GLO     RF
        SMI     120
        PLO     RF
        GHI     RF
        SMBI    0
        PHI     RF
        LBNF    NL1
        INC     R9
        GLO     R9
        XRI     8
        LBNZ    NL0B
NL1     GLO     R9
        PLO     R7
        LDI     HIGH (GRID)
        PHI     RA
        LDI     LOW (GRID)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (FINISH)
        PHI     RA
        LDI     LOW (FINISH)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R5
NL2
        LDI     HIGH (LAP)
        PHI     RA
        LDI     LOW (LAP)
        PLO     RA
        LDN     RA
        XRI     1
        LBNZ    NL2A
        SEP     R5
NL2A
        LDI     HIGH (LAP)
        PHI     RA
        LDI     LOW (LAP)
        PLO     RA
        LDN     RA
        SMI     5
        LBNF    NL3
        LDI     HIGH (FINISH)
        PHI     RA
        LDI     LOW (FINISH)
        PLO     RA
        LDI     2
        STR     RA
        SEP     R5
NL3
        LDI     HIGH (TIME)
        PHI     RA
        LDI     LOW (TIME)
        PLO     RA
        LDN     RA
        ADI     62
        STR     RA
        LDI     HIGH (TXEXT)
        PHI     RF
        LDI     LOW (TXEXT)
        PLO     RF
        GHI     RF
        SEP     R4
        WORD    MSG
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (201FH)
        PHI     RC
        LDI     LOW (201FH)
        PLO     RC
        LDI     20
        SEP     R4
        WORD    SOUND
        SEP     R5
MSG
        LDI     HIGH (5892)
        PHI     RE
        LDI     LOW (5892)
        PLO     RE
MS2     LDA     RF
        LBZ     MS3
        SEP     R1
        INC     RE
        LBR     MS2
MS3     GLO     RE
        XRI     34
        LBZ     MS4
        LDI     20H
        SEP     R1
        INC     RE
        LBR     MS3
MS4
        LDI     HIGH (MSGT)
        PHI     RA
        LDI     LOW (MSGT)
        PLO     RA
        LDI     45
        STR     RA
        SEP     R5
MSGCLR
        LDI     HIGH (MSGT)
        PHI     RA
        LDI     LOW (MSGT)
        PLO     RA
        LDN     RA
        LBZ     MCX
        SMI     1
        STR     RA
        LBNZ    MCX
        LDI     HIGH (5892)
        PHI     RE
        LDI     LOW (5892)
        PLO     RE
MC1     LDI     20H
        SEP     R1
        INC     RE
        GLO     RE
        XRI     34
        LBNZ    MC1
MCX     SEP     R5
; CARS - move the other cars, collisions, race position
CARS    LDI     0
        PLO     R8
        LDI     HIGH (PCNT)
        PHI     RA
        LDI     LOW (PCNT)
        PLO     RA
        LDI     1
        STR     RA
CA1
        GLO     R8
        ADI     LOW CTS
        PLO     RA
        LDI     HIGH CTS
        ADCI    0
        PHI     RA
        LDN     RA
        LBZ     CA6
        LDI     HIGH (STMR)
        PHI     RA
        LDI     LOW (STMR)
        PLO     RA
        LDN     RA
        LBNZ    CA4
        LDI     HIGH (FRM+1)
        PHI     RA
        LDI     LOW (FRM+1)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     R8
        XOR
        ANI     3
        LBNZ    CA2
        GLO     R8
        SHL
        ADI     LOW CRD
        PLO     RA
        LDI     HIGH CRD
        ADCI    0
        PHI     RA
        LDN     RA
        SHL
        SHL
        PLO     R9
        INC     RA
        LDN     RA
        SHR
        SHR
        SHR
        SHR
        SHR
        SHR
        STR     R2
        GLO     R9
        OR
        PLO     R9
        SEP     R4
        WORD    CMAPAT
        ANI     80H
        LBZ     CA1A
        LDN     RC
        SDI     0
        LBR     CA1B
CA1A    LDN     RC
CA1B    SMI     5
        LBNF    CA1C
        LDI     135
        LBR     CA1D
CA1C
        GLO     R8
        ADI     LOW CTS
        PLO     RA
        LDI     HIGH CTS
        ADCI    0
        PHI     RA
        LDN     RA
CA1D    STR     R2
        GLO     R8
        ADI     LOW CSP
        PLO     RA
        LDI     HIGH CSP
        ADCI    0
        PHI     RA
        LDN     RA
        SM
        LBZ     CA2
        LBDF    CA1E
        LDN     RA
        ADI     4
        STR     RA
        LBR     CA1F
CA1E    LDN     RA
        SMI     4
        STR     RA
CA1F    LDN     RA
        PLO     R9
        LDI     0
        PHI     R9
        GLO     R9
        SHL
        PLO     RF
        GHI     R9
        RSHL
        PHI     RF
        GLO     RF
        SHL
        PLO     RF
        GHI     RF
        RSHL
        PHI     RF
        GLO     R9
        STR     R2
        GLO     RF
        ADD
        PLO     RF
        GHI     RF
        ADCI    0
        PHI     RF
        GLO     R8
        ADI     LOW CSF
        PLO     RA
        LDI     HIGH CSF
        ADCI    0
        PHI     RA
        GLO     RF
        ANI     63
        STR     RA
        GLO     RF
        SHL
        GHI     RF
        RSHL
        SHL
        STR     R2
        GLO     RF
        SHL
        SHL
        LBNF    CA1G
        LDN     R2
        ORI     1
        STR     R2
CA1G
        GLO     R8
        ADI     LOW CSS
        PLO     RA
        LDI     HIGH CSS
        ADCI    0
        PHI     RA
        LDN     R2
        STR     RA
CA2
        GLO     R8
        ADI     LOW CSF
        PLO     RA
        LDI     HIGH CSF
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        GLO     R8
        ADI     LOW CFR
        PLO     RA
        LDI     HIGH CFR
        ADCI    0
        PHI     RA
        LDN     RA
        ADD
        ANI     63
        STR     RA
        LDN     RA
        SD
        LBDF    CA2c
        LDI     1
        LBR     CA2d
CA2c    LDI     0
CA2d    STR     R2
        GLO     R8
        ADI     LOW CSS
        PLO     RA
        LDI     HIGH CSS
        ADCI    0
        PHI     RA
        LDN     RA
        ADD
        PLO     RF
        SHR
        SHR
        PHI     RF
        LDI     HIGH (LFC)
        PHI     RA
        LDI     LOW (LFC)
        PLO     RA
        LDN     RA
        SMI     4
        PLO     R9
CA2s    GLO     R9
        LBZ     CA2t
        GHI     RF
        STR     R2
        GLO     RF
        ADD
        PLO     RF
        DEC     R9
        LBR     CA2s
CA2t    GLO     RF
        STR     R2
        GLO     R8
        SHL
        ADI     LOW CRD
        PLO     RA
        LDI     HIGH CRD
        ADCI    0
        PHI     RA
        INC     RA
        LDN     RA
        ADD
        STR     RA
        DEC     RA
        LDN     RA
        ADCI    0
        STR     RA
        GLO     R8
        ADI     LOW CLT
        PLO     RA
        LDI     HIGH CLT
        ADCI    0
        PHI     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    CA4
        SEP     R4
        WORD    RAND
        ANI     63
        ADI     40
        PLO     R9
        GLO     R8
        ADI     LOW CLT
        PLO     RA
        LDI     HIGH CLT
        ADCI    0
        PHI     RA
        GLO     R9
        STR     RA
        SEP     R4
        WORD    RAND
        ANI     3
        PLO     R9
        GLO     R8
        ADI     LOW CLN
        PLO     RA
        LDI     HIGH CLN
        ADCI    0
        PHI     RA
        LDN     RA
        STR     R2
        GLO     R9
        LBZ     CA3A
        XRI     1
        LBZ     CA3B
        LBR     CA4
CA3A    LDN     R2
        LBZ     CA4
        SMI     1
        STR     RA
        LBR     CA4
CA3B    LDN     R2
        XRI     4
        LBZ     CA4
        LDN     R2
        ADI     1
        STR     RA
CA4
        GLO     R8
        SHL
        ADI     LOW CRD
        PLO     RA
        LDI     HIGH CRD
        ADCI    0
        PHI     RA
        INC     RA
        LDN     RA
        PLO     RF
        DEC     RA
        LDN     RA
        PHI     RF
        LDI     HIGH (RD+1)
        PHI     RA
        LDI     LOW (RD+1)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RF
        SM
        PLO     RF
        DEC     RA
        LDN     RA
        STR     R2
        GHI     RF
        SMB
        PHI     RF
        GHI     RF
        ANI     80H
        LBNZ    CA6
        GHI     RF
        LBNZ    CA5
        GLO     RF
        LBZ     CA5
        GLO     RF
        SMI     12
        LBDF    CA5
        LDI     HIGH (CRASH)
        PHI     RA
        LDI     LOW (CRASH)
        PLO     RA
        LDN     RA
        LBNZ    CA5
        GLO     R8
        ADI     LOW CLN
        PLO     RA
        LDI     HIGH CLN
        ADCI    0
        PHI     RA
        LDN     RA
        ADI     LOW LANEU
        PLO     RC
        LDI     HIGH LANEU
        ADCI    0
        PHI     RC
        LDN     RC
        STR     R2
        LDI     HIGH (PXL)
        PHI     RA
        LDI     LOW (PXL)
        PLO     RA
        LDN     RA
        SM
        ADI     11
        SMI     23
        LBDF    CA5
        SEP     R4
        WORD    CRASHP
CA5
        LDI     HIGH (PCNT)
        PHI     RA
        LDI     LOW (PCNT)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
CA6
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
        INC     R8
        GLO     R8
        XRI     7
        LBNZ    CA1
        LDI     HIGH (PCNT)
        PHI     RA
        LDI     LOW (PCNT)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (POSN)
        PHI     RA
        LDI     LOW (POSN)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (POSN)
        PHI     RA
        LDI     LOW (POSN)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (OPOS)
        PHI     RA
        LDI     LOW (OPOS)
        PLO     RA
        LDN     RA
        SM
        LBZ     CA7
        LBNF    CA7
        LDI     HIGH (PHASE)
        PHI     RA
        LDI     LOW (PHASE)
        PLO     RA
        LDN     RA
        LBZ     CA7
        LDI     HIGH (SCORE+4)
        PHI     RB
        LDI     LOW (SCORE+4)
        PLO     RB
        LDI     5
        SEP     R4
        WORD    ADDSC
        LDI     HIGH (TXPASS)
        PHI     RF
        LDI     LOW (TXPASS)
        PLO     RF
        GHI     RF
        SEP     R4
        WORD    MSG
CA7
        LDI     HIGH (POSN)
        PHI     RA
        LDI     LOW (POSN)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (OPOS)
        PHI     RA
        LDI     LOW (OPOS)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R5
CDIST
        GLO     R8
        SHL
        ADI     LOW CRD
        PLO     RA
        LDI     HIGH CRD
        ADCI    0
        PHI     RA
        INC     RA
        LDN     RA
        PLO     RF
        DEC     RA
        LDN     RA
        PHI     RF
        LDI     HIGH (RD+1)
        PHI     RA
        LDI     LOW (RD+1)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RF
        SM
        PLO     RF
        DEC     RA
        LDN     RA
        STR     R2
        GHI     RF
        SMB
        PHI     RF
        SEP     R5
CRASHP
        LDI     HIGH (CRASH)
        PHI     RA
        LDI     LOW (CRASH)
        PLO     RA
        LDN     RA
        LBNZ    CRX
        LDI     HIGH (CRASH)
        PHI     RA
        LDI     LOW (CRASH)
        PLO     RA
        LDI     40
        STR     RA
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
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
CRX     SEP     R5
OBJROW  GLO     RF
        SHR
        SHR
        SHR
        STR     R2
        GHI     RF
        SHL
        SHL
        SHL
        SHL
        SHL
        OR
        ADI     LOW ROWD
        PLO     RC
        LDI     HIGH ROWD
        ADCI    0
        PHI     RC
        LDN     RC
        PLO     R9
        SEP     R5
OBJCOL  GLO     R9
        SHL
        STR     R2
        GLO     RF
        ADD
        PLO     RA
        GHI     RF
        ADCI    0
        PHI     RA
        GLO     R9
        SHL
        SHL
        SHL
        SHL
        ADI     LOW (ROWREC+10)
        PLO     RC
        LDI     HIGH ROWREC
        PHI     RC
        LDA     RA
        STR     R2
        LDA     RC
        ADD
        PHI     RF
        LDN     RA
        STR     R2
        LDN     RC
        ADD
        PLO     RF
        SMI     6
        LBNF    OC1
        PLO     RF
        GHI     RF
        ADI     1
        PHI     RF
OC1     GHI     RF
        ANI     80H
        LBZ     OC2
        LDI     0
        PHI     RF
        SEP     R5
OC2     GHI     RF
        SMI     40
        LBNF    OC3
        LDI     41
        PHI     RF
        SEP     R5
OC3     GHI     RF
        ADI     1
        PHI     RF
        SEP     R5
; OBJECTS - project the nearest cars ahead and the next sign onto the road
OBJECTS
        LDI     HIGH (SLOT)
        PHI     RA
        LDI     LOW (SLOT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TMPC)
        PHI     RA
        LDI     LOW (TMPC)
        PLO     RA
        LDI     0
        STR     RA
OB1
        LDI     HIGH (TMPC)
        PHI     RA
        LDI     LOW (TMPC)
        PLO     RA
        LDN     RA
        PLO     R8
        GLO     R8
        SHL
        ADI     LOW CRD
        PLO     RA
        LDI     HIGH CRD
        ADCI    0
        PHI     RA
        INC     RA
        LDN     RA
        PLO     RF
        DEC     RA
        LDN     RA
        PHI     RF
        LDI     HIGH (RD+1)
        PHI     RA
        LDI     LOW (RD+1)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     RF
        SM
        PLO     RF
        DEC     RA
        LDN     RA
        STR     R2
        GHI     RF
        SMB
        PHI     RF
        GHI     RF
        SMI     4
        LBDF    OBN
        GHI     RF
        LBNZ    OB1A
        GLO     RF
        SMI     14
        LBNF    OBN
OB1A
        LDI     HIGH (SLOT)
        PHI     RA
        LDI     LOW (SLOT)
        PLO     RA
        LDN     RA
        SMI     6
        LBDF    OBN
        GHI     RF
        SEP     R4
        WORD    OBJROW
        GLO     R9
        PHI     RB
        GLO     R8
        ADI     LOW CLN
        PLO     RA
        LDI     HIGH CLN
        ADCI    0
        PHI     RA
        LDN     RA
        SHL
        ADI     LOW LXOFF
        PLO     RC
        LDI     HIGH LXOFF
        ADCI    0
        PHI     RC
        LDA     RC
        PHI     RF
        LDN     RC
        PLO     RF
        GHI     RF
        SEP     R4
        WORD    OBJCOL
        GHI     RF
        PLO     RB
        GHI     RB
        ADI     8
        PHI     RE
        GLO     R8
        ANI     1
        PLO     R7
        LDI     HIGH (SLOT)
        PHI     RA
        LDI     LOW (SLOT)
        PLO     RA
        LDN     RA
        PLO     R8
        GHI     RB
        SMI     4
        LBDF    OB2
        GLO     RB
        LBZ     OBN
        SMI     41
        LBDF    OBN
        GLO     RB
        SMI     1
        PLO     RE
        GLO     R7
        LBNZ    OBF1
        LDI     223
        LBR     OBF2
OBF1    LDI     230
OBF2    PLO     R9
        LDI     0
        PHI     R9
        SEP     R4
        WORD    SPSET
        INC     R8
        SEP     R4
        WORD    SPHIDE
        LBR     OBS
OB2     GHI     RB
        SMI     8
        LBDF    OB3
        GLO     RB
        SMI     2
        LBNF    OBN
        SMI     39
        LBDF    OBN
        GLO     RB
        SMI     2
        PLO     RE
        GLO     R7
        LBNZ    OBM1
        LDI     224
        PLO     R9
        LDI     225
        PHI     R9
        LBR     OBM2
OBM1    LDI     231
        PLO     R9
        LDI     232
        PHI     R9
OBM2
        SEP     R4
        WORD    SPSET
        INC     R8
        SEP     R4
        WORD    SPHIDE
        LBR     OBS
OB3     GLO     RB
        SMI     2
        LBNF    OBN
        SMI     39
        LBDF    OBN
        GLO     RB
        SMI     2
        PLO     RE
        GHI     RE
        SMI     1
        PHI     RE
        GLO     R7
        LBNZ    OBXA
        LDI     226
        PLO     R9
        LDI     227
        PHI     R9
        LBR     OBXB
OBXA    LDI     233
        PLO     R9
        LDI     234
        PHI     R9
OBXB
        SEP     R4
        WORD    SPSET
        INC     R8
        GHI     RE
        ADI     1
        PHI     RE
        GLO     R7
        LBNZ    OBYA
        LDI     228
        PLO     R9
        LDI     229
        PHI     R9
        LBR     OBYB
OBYA    LDI     235
        PLO     R9
        LDI     236
        PHI     R9
OBYB
        SEP     R4
        WORD    SPSET
OBS
        LDI     HIGH (SLOT)
        PHI     RA
        LDI     LOW (SLOT)
        PLO     RA
        LDN     RA
        ADI     2
        STR     RA
OBN
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
        LDI     HIGH (TMPC)
        PHI     RA
        LDI     LOW (TMPC)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        XRI     7
        LBNZ    OB1
OBH
        LDI     HIGH (SLOT)
        PHI     RA
        LDI     LOW (SLOT)
        PLO     RA
        LDN     RA
        PLO     R8
OBH1    GLO     R8
        SMI     6
        LBDF    OBG
        SEP     R4
        WORD    SPHIDE
        INC     R8
        LBR     OBH1
OBG
        LDI     HIGH (RD+1)
        PHI     RA
        LDI     LOW (RD+1)
        PLO     RA
        LDN     RA
        SDI     0
        PLO     RF
        DEC     RA
        LDN     RA
        SDBI    0
        ANI     1
        PHI     RF
        GHI     RF
        LBNZ    OBG0
        GLO     RF
        SMI     10
        LBNF    OBGC
OBG0
        GHI     RF
        SEP     R4
        WORD    OBJROW
        GLO     R9
        PHI     RB
        LDI     HIGH (RD)
        PHI     RA
        LDI     LOW (RD)
        PLO     RA
        LDN     RA
        ANI     2
        LBZ     OBG1
        LDI     HIGH (SXLCF)
        PHI     RF
        LDI     LOW (SXLCF)
        PLO     RF
        LBR     OBG2
OBG1
        LDI     HIGH (SXRCF)
        PHI     RF
        LDI     LOW (SXRCF)
        PLO     RF
OBG2
        GHI     RF
        SEP     R4
        WORD    OBJCOL
        GHI     RF
        PLO     RB
        GHI     RB
        ADI     8
        PHI     RE
        LDI     6
        PLO     R8
        GLO     RB
        SMI     2
        LBNF    OBGH
        SMI     39
        LBDF    OBGH
        GLO     RB
        SMI     1
        PLO     RE
        GHI     RB
        SMI     6
        LBDF    OBG3
        LDI     237
        PLO     R9
        LDI     0
        PHI     R9
        SEP     R4
        WORD    SPSET
        SEP     R5
OBG3    DEC     RE
        LDI     238
        PLO     R9
        LDI     239
        PHI     R9
        SEP     R4
        WORD    SPSET
        SEP     R5
OBGC
        LDI     HIGH (CRASH)
        PHI     RA
        LDI     LOW (CRASH)
        PLO     RA
        LDN     RA
        LBNZ    OBGH
        LDI     HIGH (RD)
        PHI     RA
        LDI     LOW (RD)
        PLO     RA
        LDN     RA
        ANI     2
        LBZ     OBGC1
        LDI     HIGH (PXL)
        PHI     RA
        LDI     LOW (PXL)
        PLO     RA
        LDN     RA
        ADI     38
        ANI     80H
        LBZ     OBGH
        SEP     R4
        WORD    CRASHP
        LBR     OBGH
OBGC1
        LDI     HIGH (PXL)
        PHI     RA
        LDI     LOW (PXL)
        PLO     RA
        LDN     RA
        SMI     38
        ANI     80H
        LBNZ    OBGH
        SEP     R4
        WORD    CRASHP
OBGH    LDI     6
        PLO     R8
        SEP     R4
        WORD    SPHIDE
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
DIGQ    PLO     RF
        GHI     R9
        PLO     R9
DQ1     LDI     0
        PHI     RF
DQ2     GLO     RF
        SMI     10
        LBNF    DQ3
        PLO     RF
        GHI     RF
        ADI     1
        PHI     RF
        LBR     DQ2
DQ3     GLO     RF
        ADI     0B0H
        SEP     R1
        DEC     RE
        GHI     RF
        PLO     RF
        DEC     R9
        GLO     R9
        LBNZ    DQ1
        SEP     R5
HUD
        LDI     HIGH (HRR)
        PHI     RA
        LDI     LOW (HRR)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        SMI     6
        LBNF    HU0
        STR     RA
HU0     LDN     RA
        LBNZ    HU1
        LDI     HIGH (SCORE)
        PHI     RB
        LDI     LOW (SCORE)
        PLO     RB
        LDI     HIGH (6)
        PHI     RE
        LDI     LOW (6)
        PLO     RE
HU0A    LDA     RB
        ADI     0B0H
        SEP     R1
        INC     RE
        GLO     RE
        XRI     12
        LBNZ    HU0A
        SEP     R5
HU1     XRI     1
        LBNZ    HU2
        LDI     HIGH (20)
        PHI     RE
        LDI     LOW (20)
        PLO     RE
        LDI     2
        PHI     R9
        LDI     HIGH (TIME)
        PHI     RA
        LDI     LOW (TIME)
        PLO     RA
        LDN     RA
        SEP     R4
        WORD    DIGQ
        SEP     R5
HU2     XRI     3
        LBNZ    HU3
        LDI     HIGH (27)
        PHI     RE
        LDI     LOW (27)
        PLO     RE
        LDI     1
        PHI     R9
        LDI     HIGH (LAP)
        PHI     RA
        LDI     LOW (LAP)
        PLO     RA
        LDN     RA
        SMI     5
        LBNF    HU2A
        LDI     0
HU2A    ADI     5
        SEP     R4
        WORD    DIGQ
        SEP     R5
HU3     XRI     1
        LBNZ    HU4
        LDI     HIGH (37)
        PHI     RE
        LDI     LOW (37)
        PLO     RE
        LDI     1
        PHI     R9
        LDI     HIGH (POSN)
        PHI     RA
        LDI     LOW (POSN)
        PLO     RA
        LDN     RA
        SEP     R4
        WORD    DIGQ
        SEP     R5
HU4     XRI     7
        LBNZ    HU5
        LDI     HIGH (264)
        PHI     RE
        LDI     LOW (264)
        PLO     RE
        LDI     3
        PHI     R9
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        SEP     R4
        WORD    DIGQ
        SEP     R5
HU5
        LDI     HIGH (277)
        PHI     RE
        LDI     LOW (277)
        PLO     RE
        LDI     HIGH (GEAR)
        PHI     RA
        LDI     LOW (GEAR)
        PLO     RA
        LDN     RA
        LBNZ    HU5A
        LDI     'L'+80H
        SEP     R1
        INC     RE
        LDI     'O'+80H
        SEP     R1
        SEP     R5
HU5A    LDI     'H'+80H
        SEP     R1
        INC     RE
        LDI     'I'+80H
        SEP     R1
        SEP     R5
LIGHTS
        LDI     HIGH (LGTMR)
        PHI     RA
        LDI     LOW (LGTMR)
        PLO     RA
        LDN     RA
        LBZ     LGA
        SMI     1
        STR     RA
        LBNZ    LGA
        LDI     HIGH (1041)
        PHI     RE
        LDI     LOW (1041)
        PLO     RE
        LDI     20H
        SEP     R1
        INC     RE
        INC     RE
        LDI     20H
        SEP     R1
        INC     RE
        INC     RE
        LDI     20H
        SEP     R1
        INC     RE
        INC     RE
LGA
        LDI     HIGH (STMR)
        PHI     RA
        LDI     LOW (STMR)
        PLO     RA
        LDN     RA
        LBZ     LGX
        SMI     1
        STR     RA
        LBZ     LGGO
        SMI     15
        LBZ     LG2
        SMI     15
        LBZ     LG1
        SMI     15
        LBZ     LG0
LGX     SEP     R5
LG0
        LDI     HIGH (1041)
        PHI     RE
        LDI     LOW (1041)
        PLO     RE
        LDI     242
        SEP     R1
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (401FH)
        PHI     RC
        LDI     LOW (401FH)
        PLO     RC
        LDI     4
        SEP     R4
        WORD    SOUND
        SEP     R5
LG1
        LDI     HIGH (1043)
        PHI     RE
        LDI     LOW (1043)
        PLO     RE
        LDI     242
        SEP     R1
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (401FH)
        PHI     RC
        LDI     LOW (401FH)
        PLO     RC
        LDI     4
        SEP     R4
        WORD    SOUND
        SEP     R5
LG2
        LDI     HIGH (1045)
        PHI     RE
        LDI     LOW (1045)
        PLO     RE
        LDI     242
        SEP     R1
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (401FH)
        PHI     RC
        LDI     LOW (401FH)
        PLO     RC
        LDI     4
        SEP     R4
        WORD    SOUND
        SEP     R5
LGGO
        LDI     HIGH (1041)
        PHI     RE
        LDI     LOW (1041)
        PLO     RE
        LDI     115
        SEP     R1
        INC     RE
        INC     RE
        LDI     115
        SEP     R1
        INC     RE
        INC     RE
        LDI     115
        SEP     R1
        INC     RE
        INC     RE
        LDI     HIGH (LGTMR)
        PHI     RA
        LDI     LOW (LGTMR)
        PLO     RA
        LDI     45
        STR     RA
        LDI     HIGH (SNDS)
        PHI     RA
        LDI     LOW (SNDS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (201FH)
        PHI     RC
        LDI     LOW (201FH)
        PLO     RC
        LDI     12
        SEP     R4
        WORD    SOUND
        LDI     HIGH (TXGO)
        PHI     RF
        LDI     LOW (TXGO)
        PLO     RF
        GHI     RF
        SEP     R4
        WORD    MSG
        SEP     R5
ENGINE
        LDI     HIGH (SNDT)
        PHI     RA
        LDI     LOW (SNDT)
        PLO     RA
        LDN     RA
        LBZ     EG0
        LDI     HIGH (ENGL)
        PHI     RA
        LDI     LOW (ENGL)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R5
EG0
        LDI     HIGH (SQL)
        PHI     RA
        LDI     LOW (SQL)
        PLO     RA
        LDN     RA
        LBZ     EG1
        SMI     1
        STR     RA
        LDI     HIGH (ENGL)
        PHI     RA
        LDI     LOW (ENGL)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R4
        WORD    RAND
        ANI     3
        ADI     13
        PHI     RF
        LDI     33H
        PLO     RF
        SEX     RF
        OUT     4
        SEX     R2
        SEP     R5
EG1
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDN     RA
        PLO     R9
        LDI     HIGH (GEAR)
        PHI     RA
        LDI     LOW (GEAR)
        PLO     RA
        LDN     RA
        LBNZ    EN1
        GLO     R9
        SHR
        STR     R2
        GLO     R9
        ADD
        LBNF    EN0
        LDI     255
EN0     PLO     R9
EN1     GLO     R9
        XRI     0FFH
        SHR
        SHR
        SHR
        PLO     R9
        SHR
        STR     R2
        GLO     R9
        ADD
        ADI     10
        PLO     R9
        LDI     HIGH (ENG)
        PHI     RA
        LDI     LOW (ENG)
        PLO     RA
        LDN     RA
        STR     R2
        GLO     R9
        SM
        LBZ     EN5
        LBNF    EN3
        SMI     1
        LBZ     EN5
        LDI     HIGH (ENG)
        PHI     RA
        LDI     LOW (ENG)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        LBR     EN5
EN3     ADI     1
        LBZ     EN5
        LDI     HIGH (ENG)
        PHI     RA
        LDI     LOW (ENG)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
EN5
        LDI     HIGH (ENG)
        PHI     RA
        LDI     LOW (ENG)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (ENGL)
        PHI     RA
        LDI     LOW (ENGL)
        PLO     RA
        LDN     RA
        XOR
        LBZ     ENX
        LDI     HIGH (ENG)
        PHI     RA
        LDI     LOW (ENG)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (ENGL)
        PHI     RA
        LDI     LOW (ENGL)
        PLO     RA
        GLO     R7
        STR     RA
        PHI     RF
        LDI     04H
        PLO     RF
        SEX     RF
        OUT     4
        SEX     R2
ENN
ENX     SEP     R5
CLOCK
        LDI     HIGH (STMR)
        PHI     RA
        LDI     LOW (STMR)
        PLO     RA
        LDN     RA
        LBNZ    CLX
        LDI     HIGH (PHASE)
        PHI     RA
        LDI     LOW (PHASE)
        PLO     RA
        LDN     RA
        LBNZ    CL0
        LDI     HIGH (LAP)
        PHI     RA
        LDI     LOW (LAP)
        PLO     RA
        LDN     RA
        XRI     1
        LBNZ    CL0
        LDI     HIGH (LFC)
        PHI     RA
        LDI     LOW (LFC)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (QT+1)
        PHI     RA
        LDI     LOW (QT+1)
        PLO     RA
        LDN     RA
        ADD
        STR     RA
        DEC     RA
        LDN     RA
        ADCI    0
        STR     RA
CL0
        LDI     HIGH (LFC)
        PHI     RA
        LDI     LOW (LFC)
        PLO     RA
        LDN     RA
        STR     R2
        LDI     HIGH (TSUB)
        PHI     RA
        LDI     LOW (TSUB)
        PLO     RA
        LDN     RA
        SM
        STR     RA
        LBZ     CL0A
        LBDF    CLX
CL0A    ADI     60
        STR     RA
        LDI     HIGH (TIME)
        PHI     RA
        LDI     LOW (TIME)
        PLO     RA
        LDN     RA
        SMI     1
        STR     RA
        LBNZ    CL1
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R5
CL1     SMI     10
        LBDF    CLX
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
        LDI     3
        SEP     R4
        WORD    SOUND
CLX     SEP     R5
; THEME - patch the scenery characters for the chosen circuit
THEME
        LDI     HIGH (TRK)
        PHI     RA
        LDI     LOW (TRK)
        PLO     RA
        LDN     RA
        SHL
        ADI     LOW THPT
        PLO     RC
        LDI     HIGH THPT
        ADCI    0
        PHI     RC
        LDA     RC
        PHI     R7
        LDN     RC
        PLO     RC
        GHI     R7
        PHI     RC
        LDI     HIGH (THC)
        PHI     RD
        LDI     LOW (THC)
        PLO     RD
THL     LDA     RD
        LBZ     THX
        PLO     RE
        SEP     R4
        WORD    CMEMON
        LDI     8
        PHI     RE
THL2    LDA     RC
        STR     RB
        INC     RB
        GHI     RE
        SMI     1
        PHI     RE
        LBNZ    THL2
        SEP     R4
        WORD    CMEMOFF
        LBR     THL
THX     SEP     R5
SETUP
        SEP     R4
        WORD    VIDOFF
        SEP     R4
        WORD    SILENCE
        LDI     HIGH (ENG)
        PHI     RA
        LDI     LOW (ENG)
        PLO     RA
        LDI     56
        STR     RA
        LDI     HIGH (ENGL)
        PHI     RA
        LDI     LOW (ENGL)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (SQL)
        PHI     RA
        LDI     LOW (SQL)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R4
        WORD    THEME
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
        LDI     HIGH (VCAP)
        PHI     RA
        LDI     LOW (VCAP)
        PLO     RA
        LDI     60
        STR     RA
        LDI     HIGH (SPR)
        PHI     RD
        LDI     LOW (SPR)
        PLO     RD
        LDI     HIGH (100H)
        PHI     RE
        LDI     LOW (100H)
        PLO     RE
        LDI     0
        SEP     R4
        WORD    FILL
        LDI     HIGH (0)
        PHI     RE
        LDI     LOW (0)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX1)
        PHI     RC
        LDI     LOW (TX1)
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
        LDI     HIGH (TX2)
        PHI     RC
        LDI     LOW (TX2)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (23)
        PHI     RE
        LDI     LOW (23)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX3)
        PHI     RC
        LDI     LOW (TX3)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (32)
        PHI     RE
        LDI     LOW (32)
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
        LDI     HIGH (256)
        PHI     RE
        LDI     LOW (256)
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
        LDI     HIGH (272)
        PHI     RE
        LDI     LOW (272)
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
        LDI     HIGH (TRK)
        PHI     RA
        LDI     LOW (TRK)
        PLO     RA
        LDN     RA
        SHL
        ADI     LOW TNAMES
        PLO     RC
        LDI     HIGH TNAMES
        ADCI    0
        PHI     RC
        LDA     RC
        PHI     RF
        LDN     RC
        PLO     RF
        LDI     HIGH (283)
        PHI     RE
        LDI     LOW (283)
        PLO     RE
SU1     LDA     RF
        LBZ     SU2
        SEP     R1
        INC     RE
        LBR     SU1
SU2
        LDI     HIGH (774)
        PHI     RE
        LDI     LOW (774)
        PLO     RE
        LDI     153
        SEP     R1
        INC     RE
        LDI     154
        SEP     R1
        LDI     HIGH (537)
        PHI     RE
        LDI     LOW (537)
        PLO     RE
        LDI     153
        SEP     R1
        INC     RE
        LDI     154
        SEP     R1
        LDI     HIGH (1294)
        PHI     RE
        LDI     LOW (1294)
        PLO     RE
        LDI     153
        SEP     R1
        INC     RE
        LDI     154
        SEP     R1
        LDI     HIGH (801)
        PHI     RE
        LDI     LOW (801)
        PLO     RE
        LDI     155
        SEP     R1
        LDI     HIGH (2048)
        PHI     RE
        LDI     LOW (2048)
        PLO     RE
SU3
        LDI     1
        LDI     1
        PHI     R7
        SEP     R1
        INC     RE
        GLO     RE
        XRI     40
        LBNZ    SU3
        LDI     0
        PLO     RE
        GHI     RE
        ADI     1
        PHI     RE
        XRI     23
        LBNZ    SU3
        LDI     HIGH (ROWREC)
        PHI     RD
        LDI     LOW (ROWREC)
        PLO     RD
        LDI     HIGH (0F0H)
        PHI     RE
        LDI     LOW (0F0H)
        PLO     RE
        LDI     0
        SEP     R4
        WORD    FILL
        LDI     HIGH (ROWREC)
        PHI     RD
        LDI     LOW (ROWREC)
        PLO     RD
SU4     LDI     21
        STR     RD
        INC     RD
        INC     RD
        STR     RD
        INC     RD
        INC     RD
        INC     RD
        INC     RD
        LDI     0FFH
        STR     RD
        GLO     RD
        ADI     10
        PLO     RD
        XRI     0F0H
        LBNZ    SU4
        LDI     HIGH (PXL)
        PHI     RA
        LDI     LOW (PXL)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (SPD)
        PHI     RA
        LDI     LOW (SPD)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (GEAR)
        PHI     RA
        LDI     LOW (GEAR)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (CVS)
        PHI     RA
        LDI     LOW (CVS)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (FR)
        PHI     RA
        LDI     LOW (FR)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (CRASH)
        PHI     RA
        LDI     LOW (CRASH)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (MACC)
        PHI     RA
        LDI     LOW (MACC)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (MOFF)
        PHI     RA
        LDI     LOW (MOFF)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (LAP)
        PHI     RA
        LDI     LOW (LAP)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (FINISH)
        PHI     RA
        LDI     LOW (FINISH)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (OPOS)
        PHI     RA
        LDI     LOW (OPOS)
        PLO     RA
        LDI     8
        STR     RA
        LDI     HIGH (HELD)
        PHI     RA
        LDI     LOW (HELD)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (MSGT)
        PHI     RA
        LDI     LOW (MSGT)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (OCVQ)
        PHI     RA
        LDI     LOW (OCVQ)
        PLO     RA
        LDI     255
        STR     RA
        LDI     HIGH (GCHG)
        PHI     RA
        LDI     LOW (GCHG)
        PLO     RA
        LDI     1
        STR     RA
        LDI     HIGH (LGTMR)
        PHI     RA
        LDI     LOW (LGTMR)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (TSUB)
        PHI     RA
        LDI     LOW (TSUB)
        PLO     RA
        LDI     60
        STR     RA
        LDI     HIGH (STMR)
        PHI     RA
        LDI     LOW (STMR)
        PLO     RA
        LDI     46
        STR     RA
        LDI     HIGH (PST)
        PHI     RA
        LDI     LOW (PST)
        PLO     RA
        LDI     16
        STR     RA
        LDI     HIGH (CVQ)
        PHI     RA
        LDI     LOW (CVQ)
        PLO     RA
        LDI     7
        STR     RA
        SEP     R4
        WORD    ROADPREP
        LDI     HIGH (GCHG)
        PHI     RA
        LDI     LOW (GCHG)
        PLO     RA
        LDI     2
        STR     RA
        SEP     R4
        WORD    ROAD
        LDI     HIGH (FRM+1)
        PHI     RA
        LDI     LOW (FRM+1)
        PLO     RA
        LDN     RA
        ADI     1
        STR     RA
        SEP     R4
        WORD    ROAD
        LDI     HIGH (OPCOL)
        PHI     RA
        LDI     LOW (OPCOL)
        PLO     RA
        LDI     18
        STR     RA
        LDI     HIGH (CDIRTY)
        PHI     RA
        LDI     LOW (CDIRTY)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R4
        WORD    MOUNTALL
        SEP     R4
        WORD    PLAYERCAR
        LDI     0
        PLO     R7
        LDI     HIGH (HRR)
        PHI     RA
        LDI     LOW (HRR)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    HUD
        LDI     1
        PLO     R7
        LDI     HIGH (HRR)
        PHI     RA
        LDI     LOW (HRR)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    HUD
        LDI     2
        PLO     R7
        LDI     HIGH (HRR)
        PHI     RA
        LDI     LOW (HRR)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    HUD
        LDI     3
        PLO     R7
        LDI     HIGH (HRR)
        PHI     RA
        LDI     LOW (HRR)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    HUD
        LDI     4
        PLO     R7
        LDI     HIGH (HRR)
        PHI     RA
        LDI     LOW (HRR)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    HUD
        LDI     5
        PLO     R7
        LDI     HIGH (HRR)
        PHI     RA
        LDI     LOW (HRR)
        PLO     RA
        GLO     R7
        STR     RA
        SEP     R4
        WORD    HUD
        LDI     HIGH (DIRECT)
        PHI     RA
        LDI     LOW (DIRECT)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R4
        WORD    VIDON
        SEP     R5
CARSET
        GLO     R8
        SHL
        ADI     LOW CRD
        PLO     RA
        LDI     HIGH CRD
        ADCI    0
        PHI     RA
        GHI     RF
        STR     RA
        INC     RA
        GLO     RF
        STR     RA
        GLO     R8
        ADI     LOW CLN
        PLO     RA
        LDI     HIGH CLN
        ADCI    0
        PHI     RA
        GLO     R9
        STR     RA
        LDI     HIGH (TRK)
        PHI     RA
        LDI     LOW (TRK)
        PLO     RA
        LDN     RA
        STR     R2
        SHL
        ADD
        STR     R2
        GHI     R9
        LBZ     CST1
        ADD
CST1    PHI     R9
        GLO     R8
        ADI     LOW CTS
        PLO     RA
        LDI     HIGH CTS
        ADCI    0
        PHI     RA
        GHI     R9
        STR     RA
        GLO     R8
        ADI     LOW CSP
        PLO     RA
        LDI     HIGH CSP
        ADCI    0
        PHI     RA
        LDI     0
        STR     RA
        GLO     R8
        ADI     LOW CLT
        PLO     RA
        LDI     HIGH CLT
        ADCI    0
        PHI     RA
        GLO     R8
        SHL
        SHL
        SHL
        ADI     30
        STR     RA
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
        LDI     2
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
TITLE
        SEP     R4
        WORD    VIDOFF
        SEP     R4
        WORD    SILENCE
        SEP     R4
        WORD    CLRSCR
        LDI     HIGH (525)
        PHI     RE
        LDI     LOW (525)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX7)
        PHI     RC
        LDI     LOW (TX7)
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
        LDI     HIGH (TX8)
        PHI     RC
        LDI     LOW (TX8)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (1801)
        PHI     RE
        LDI     LOW (1801)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX9)
        PHI     RC
        LDI     LOW (TX9)
        PLO     RC
        LDI     128
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (2315)
        PHI     RE
        LDI     LOW (2315)
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
        LDI     HIGH (2571)
        PHI     RE
        LDI     LOW (2571)
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
        LDI     HIGH (2827)
        PHI     RE
        LDI     LOW (2827)
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
        LDI     HIGH (3083)
        PHI     RE
        LDI     LOW (3083)
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
        LDI     HIGH (3844)
        PHI     RE
        LDI     LOW (3844)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX14)
        PHI     RC
        LDI     LOW (TX14)
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
        LDI     HIGH (TX15)
        PHI     RC
        LDI     LOW (TX15)
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
        LDI     HIGH (TX16)
        PHI     RC
        LDI     LOW (TX16)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (4612)
        PHI     RE
        LDI     LOW (4612)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX17)
        PHI     RC
        LDI     LOW (TX17)
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
        LDI     HIGH (TX18)
        PHI     RC
        LDI     LOW (TX18)
        PLO     RC
        LDI     0
        PLO     RF
        SEP     R4
        WORD    PRT
        LDI     HIGH (5390)
        PHI     RE
        LDI     LOW (5390)
        PLO     RE
        SEP     R4
        WORD    POS
        LDI     HIGH (TX19)
        PHI     RC
        LDI     LOW (TX19)
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
        LDI     HIGH (PAGE+73)
        PHI     RD
        LDI     LOW (PAGE+73)
        PLO     RD
        LDI     28
        STR     RD
        LDI     HIGH (PAGE+74)
        PHI     RD
        LDI     LOW (PAGE+74)
        PLO     RD
        LDI     157
        STR     RD
        LDI     HIGH (PAGE+75)
        PHI     RD
        LDI     LOW (PAGE+75)
        PLO     RD
        LDI     158
        STR     RD
        LDI     HIGH (PAGE+76)
        PHI     RD
        LDI     LOW (PAGE+76)
        PLO     RD
        LDI     31
        STR     RD
        LDI     HIGH (PAGE+113)
        PHI     RD
        LDI     LOW (PAGE+113)
        PLO     RD
        LDI     91
        STR     RD
        LDI     HIGH (PAGE+114)
        PHI     RD
        LDI     LOW (PAGE+114)
        PLO     RD
        LDI     220
        STR     RD
        LDI     HIGH (PAGE+115)
        PHI     RD
        LDI     LOW (PAGE+115)
        PLO     RD
        LDI     221
        STR     RD
        LDI     HIGH (PAGE+116)
        PHI     RD
        LDI     LOW (PAGE+116)
        PLO     RD
        LDI     94
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
        SMI     '1'
        LBNF    TW1
        SMI     4
        LBDF    TW1
        GLO     R9
        SMI     '1'
        PLO     R7
        LDI     HIGH (TRK)
        PHI     RA
        LDI     LOW (TRK)
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
        LDI     HIGH (PHASE)
        PHI     RA
        LDI     LOW (PHASE)
        PLO     RA
        LDI     0
        STR     RA
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     0
        STR     RA
        SEP     R4
        WORD    SETUP
        LDI     HIGH (RD)
        PHI     RA
        LDI     LOW (RD)
        PLO     RA
        LDI     0FFH
        STR     RA
        INC     RA
        LDI     0C0H
        STR     RA
        LDI     HIGH (TIME)
        PHI     RA
        LDI     LOW (TIME)
        PLO     RA
        LDI     90
        STR     RA
        LDI     0
        PLO     R8
        LDI     HIGH (900)
        PHI     RF
        LDI     LOW (900)
        PLO     RF
        LDI     1
        PLO     R9
        LDI     175
        PHI     R9
        GHI     RF
        SEP     R4
        WORD    CARSET
        LDI     1
        PLO     R8
        LDI     HIGH (4200)
        PHI     RF
        LDI     LOW (4200)
        PLO     RF
        LDI     3
        PLO     R9
        LDI     185
        PHI     R9
        GHI     RF
        SEP     R4
        WORD    CARSET
        LDI     2
        PLO     R8
        LDI     HIGH (9000)
        PHI     RF
        LDI     LOW (9000)
        PLO     RF
        LDI     2
        PLO     R9
        LDI     180
        PHI     R9
        GHI     RF
        SEP     R4
        WORD    CARSET
        LDI     3
        PLO     R8
        LDI     HIGH (32768)
        PHI     RF
        LDI     LOW (32768)
        PLO     RF
        LDI     0
        PLO     R9
        LDI     0
        PHI     R9
        GHI     RF
        SEP     R4
        WORD    CARSET
        LDI     4
        PLO     R8
        LDI     HIGH (32768)
        PHI     RF
        LDI     LOW (32768)
        PLO     RF
        LDI     0
        PLO     R9
        LDI     0
        PHI     R9
        GHI     RF
        SEP     R4
        WORD    CARSET
        LDI     5
        PLO     R8
        LDI     HIGH (32768)
        PHI     RF
        LDI     LOW (32768)
        PLO     RF
        LDI     0
        PLO     R9
        LDI     0
        PHI     R9
        GHI     RF
        SEP     R4
        WORD    CARSET
        LDI     6
        PLO     R8
        LDI     HIGH (32768)
        PHI     RF
        LDI     LOW (32768)
        PLO     RF
        LDI     0
        PLO     R9
        LDI     0
        PHI     R9
        GHI     RF
        SEP     R4
        WORD    CARSET
        LDI     HIGH (TXQSTART)
        PHI     RF
        LDI     LOW (TXQSTART)
        PLO     RF
        GHI     RF
        SEP     R4
        WORD    MSG
        LBR     MAIN
RACE
        LDI     HIGH (GRID)
        PHI     RA
        LDI     LOW (GRID)
        PLO     RA
        LDN     RA
        PLO     R7
        LDI     HIGH (TMPB)
        PHI     RA
        LDI     LOW (TMPB)
        PLO     RA
        GLO     R7
        STR     RA
        LDI     HIGH (TXGRID)
        PHI     RF
        LDI     LOW (TXGRID)
        PLO     RF
        GHI     RF
        SEP     R4
        WORD    MSG
        LDI     HIGH (5906)
        PHI     RE
        LDI     LOW (5906)
        PLO     RE
        LDI     HIGH (GRID)
        PHI     RA
        LDI     LOW (GRID)
        PLO     RA
        LDN     RA
        ADI     0B0H
        SEP     R1
        SEP     R4
        WORD    QFLUSHW
        LDI     100
        SEP     R4
        WORD    WAITN
        LDI     HIGH (PHASE)
        PHI     RA
        LDI     LOW (PHASE)
        PLO     RA
        LDI     1
        STR     RA
        SEP     R4
        WORD    SETUP
        LDI     HIGH (TIME)
        PHI     RA
        LDI     LOW (TIME)
        PLO     RA
        LDI     80
        STR     RA
        LDI     HIGH (POSN)
        PHI     RA
        LDI     LOW (POSN)
        PLO     RA
        LDI     8
        STR     RA
        LDI     HIGH (GRID)
        PHI     RA
        LDI     LOW (GRID)
        PLO     RA
        LDN     RA
        PLO     R9
        LDI     HIGH (0)
        PHI     RF
        LDI     LOW (0)
        PLO     RF
        LDI     1
        PLO     RB
RG1     GLO     RF
        SMI     36
        PLO     RF
        GHI     RF
        SMBI    0
        PHI     RF
        GLO     RB
        STR     R2
        GLO     R9
        XOR
        LBZ     RG2
        INC     RB
        LBR     RG1
RG2
        LDI     HIGH (RD)
        PHI     RA
        LDI     LOW (RD)
        PLO     RA
        GHI     RF
        STR     RA
        INC     RA
        GLO     RF
        STR     RA
        LDI     0
        PLO     R8
        LDI     1
        PLO     RB
        LDI     0
        PHI     RF
        PLO     RF
RG3     GLO     RF
        SMI     36
        PLO     RF
        GHI     RF
        SMBI    0
        PHI     RF
        GLO     RB
        STR     R2
        LDI     HIGH (GRID)
        PHI     RA
        LDI     LOW (GRID)
        PLO     RA
        LDN     RA
        XOR
        LBZ     RG4
        GLO     RB
        ANI     1
        SHL
        ADI     1
        PLO     R9
        GLO     R8
        SHL
        SHL
        ADI     205
        PHI     R9
        GLO     RF
        STXD
        GHI     RF
        STXD
        GHI     RF
        SEP     R4
        WORD    CARSET
        IRX
        LDXA
        PHI     RF
        LDX
        PLO     RF
        INC     R8
RG4     INC     RB
        GLO     R8
        XRI     7
        LBNZ    RG3
        LDI     HIGH (TXRSTART)
        PHI     RF
        LDI     LOW (TXRSTART)
        PLO     RF
        GHI     RF
        SEP     R4
        WORD    MSG
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
        SMI     4
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
        LDN     RA
        SMI     8
        LBNF    MG9
        LDI     0
MG9     ADI     8
        PLO     R7
        LDI     HIGH (LFC)
        PHI     RA
        LDI     LOW (LFC)
        PLO     RA
        GLO     R7
        STR     RA
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
        SEP     R4
        WORD    SNDTICK
        LDI     HIGH (MUTE)
        PHI     RA
        LDI     LOW (MUTE)
        PLO     RA
        LDN     RA
        LBNZ    MG0
        SEP     R4
        WORD    ENGINE
MG0
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
        LDI     HIGH (FINISH)
        PHI     RA
        LDI     LOW (FINISH)
        PLO     RA
        LDN     RA
        LBZ     MG1
        XRI     1
        LBZ     RACE
        LBR     FINISHED
MG1
        SEP     R4
        WORD    DRIVE
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
        SEP     R4
        WORD    CARS
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
        WORD    ROADPREP
        SEP     R4
        WORD    ROAD
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
        WORD    OBJECTS
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
        WORD    SPRITES
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
        WORD    PLAYERCAR
        SEP     R4
        WORD    MOUNTQ
        SEP     R4
        WORD    HUD
        SEP     R4
        WORD    MSGCLR
        SEP     R4
        WORD    LIGHTS
        SEP     R4
        WORD    CLOCK
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
        LBR     MAIN
FINISHED
        SEP     R4
        WORD    SILENCE
        LDI     HIGH (TIME)
        PHI     RA
        LDI     LOW (TIME)
        PLO     RA
        LDN     RA
        PLO     RB
FN1     GLO     RB
        LBZ     FN2
        GLO     RB
        STXD
        LDI     HIGH (SCORE+3)
        PHI     RB
        LDI     LOW (SCORE+3)
        PLO     RB
        LDI     1
        SEP     R4
        WORD    ADDSC
        IRX
        LDX
        PLO     RB
        DEC     RB
        LBR     FN1
FN2
        LDI     HIGH (SCORE+2)
        PHI     RB
        LDI     LOW (SCORE+2)
        PLO     RB
        LDI     HIGH (POSN)
        PHI     RA
        LDI     LOW (POSN)
        PLO     RA
        LDN     RA
        SMI     1
        ADI     LOW PLBON
        PLO     RC
        LDI     HIGH PLBON
        ADCI    0
        PHI     RC
        LDN     RC
        SEP     R4
        WORD    ADDSC
        LDI     HIGH (TXFIN)
        PHI     RF
        LDI     LOW (TXFIN)
        PLO     RF
        GHI     RF
        SEP     R4
        WORD    MSG
        LDI     HIGH (5911)
        PHI     RE
        LDI     LOW (5911)
        PLO     RE
        LDI     HIGH (POSN)
        PHI     RA
        LDI     LOW (POSN)
        PLO     RA
        LDN     RA
        ADI     0B0H
        SEP     R1
        LDI     HIGH (HRR)
        PHI     RA
        LDI     LOW (HRR)
        PLO     RA
        LDI     5
        STR     RA
        SEP     R4
        WORD    HUD
        SEP     R4
        WORD    QFLUSHW
        LDI     200
        SEP     R4
        WORD    WAITN
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDI     3
        STR     RA
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
        LDI     HIGH (GOVER)
        PHI     RA
        LDI     LOW (GOVER)
        PLO     RA
        LDN     RA
        XRI     3
        LBZ     TITLE
        LDI     HIGH (PHASE)
        PHI     RA
        LDI     LOW (PHASE)
        PLO     RA
        LDN     RA
        LBNZ    GO4
        LDI     HIGH (TXNQ)
        PHI     RF
        LDI     LOW (TXNQ)
        PLO     RF
        LBR     GO5
GO4
        LDI     HIGH (TXTUP)
        PHI     RF
        LDI     LOW (TXTUP)
        PLO     RF
GO5
        GHI     RF
        SEP     R4
        WORD    MSG
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
CTW     BYTE    0EEH, 005H, 0F1H, 001H, 0F3H, 002H, 0F5H, 002H, 0F7H, 002H, 0F8H, 005H, 0FAH, 002H, 0FBH, 004H
        BYTE    0FCH, 005H, 0FDH, 005H, 0FEH, 004H, 0FFH, 001H, 0FFH, 004H, 0FFH, 005H, 000H, 000H, 0F1H, 002H
        BYTE    0F3H, 002H, 0F5H, 001H, 0F7H, 000H, 0F8H, 003H, 0FAH, 000H, 0FBH, 001H, 0FCH, 002H, 0FDH, 002H
        BYTE    0FEH, 001H, 0FEH, 005H, 0FFH, 002H, 0FFH, 004H, 000H, 000H, 000H, 000H, 0F3H, 004H, 0F5H, 003H
        BYTE    0F7H, 000H, 0F8H, 003H, 0F9H, 004H, 0FBH, 000H, 0FCH, 000H, 0FDH, 000H, 0FDH, 004H, 0FEH, 003H
        BYTE    0FFH, 000H, 0FFH, 003H, 0FFH, 004H, 000H, 000H, 000H, 000H, 0F6H, 001H, 0F7H, 003H, 0F8H, 005H
        BYTE    0FAH, 000H, 0FBH, 000H, 0FCH, 000H, 0FCH, 005H, 0FDH, 003H, 0FEH, 001H, 0FEH, 004H, 0FFH, 001H
        BYTE    0FFH, 003H, 0FFH, 005H, 000H, 000H, 000H, 000H, 0F8H, 004H, 0F9H, 004H, 0FAH, 004H, 0FBH, 003H
        BYTE    0FCH, 002H, 0FDH, 000H, 0FDH, 004H, 0FEH, 001H, 0FEH, 004H, 0FFH, 000H, 0FFH, 002H, 0FFH, 004H
        BYTE    0FFH, 005H, 000H, 000H, 000H, 000H, 0FBH, 001H, 0FBH, 005H, 0FCH, 002H, 0FDH, 000H, 0FDH, 003H
        BYTE    0FEH, 000H, 0FEH, 002H, 0FEH, 005H, 0FFH, 001H, 0FFH, 002H, 0FFH, 004H, 0FFH, 005H, 0FFH, 005H
        BYTE    000H, 000H, 000H, 000H, 0FDH, 003H, 0FDH, 005H, 0FEH, 001H, 0FEH, 003H, 0FEH, 004H, 0FFH, 000H
        BYTE    0FFH, 001H, 0FFH, 002H, 0FFH, 003H, 0FFH, 004H, 0FFH, 005H, 0FFH, 005H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    002H, 003H, 002H, 001H, 001H, 005H, 001H, 003H, 001H, 002H, 001H, 000H, 000H, 005H, 000H, 004H
        BYTE    000H, 003H, 000H, 002H, 000H, 001H, 000H, 001H, 000H, 000H, 000H, 000H, 000H, 000H, 004H, 005H
        BYTE    004H, 001H, 003H, 004H, 003H, 000H, 002H, 003H, 002H, 000H, 001H, 004H, 001H, 001H, 000H, 005H
        BYTE    000H, 004H, 000H, 002H, 000H, 001H, 000H, 001H, 000H, 000H, 000H, 000H, 007H, 002H, 006H, 002H
        BYTE    005H, 002H, 004H, 003H, 003H, 004H, 003H, 000H, 002H, 002H, 001H, 005H, 001H, 002H, 001H, 000H
        BYTE    000H, 004H, 000H, 002H, 000H, 001H, 000H, 000H, 000H, 000H, 009H, 005H, 008H, 003H, 007H, 001H
        BYTE    006H, 000H, 005H, 000H, 004H, 000H, 003H, 001H, 002H, 003H, 001H, 005H, 001H, 002H, 000H, 005H
        BYTE    000H, 003H, 000H, 001H, 000H, 000H, 000H, 000H, 00CH, 002H, 00AH, 003H, 009H, 000H, 007H, 003H
        BYTE    006H, 002H, 005H, 000H, 004H, 000H, 003H, 000H, 002H, 002H, 001H, 003H, 001H, 000H, 000H, 003H
        BYTE    000H, 002H, 000H, 000H, 000H, 000H, 00EH, 004H, 00CH, 004H, 00AH, 005H, 009H, 000H, 007H, 003H
        BYTE    006H, 000H, 004H, 005H, 003H, 004H, 002H, 004H, 001H, 005H, 001H, 001H, 000H, 004H, 000H, 002H
        BYTE    000H, 000H, 000H, 000H, 011H, 001H, 00EH, 005H, 00CH, 004H, 00AH, 004H, 008H, 004H, 007H, 001H
        BYTE    005H, 004H, 004H, 002H, 003H, 001H, 002H, 001H, 001H, 002H, 000H, 005H, 000H, 002H, 000H, 001H
        BYTE    000H, 000H
PTW     BYTE    001H, 003H, 003H, 002H, 005H, 000H, 006H, 004H, 008H, 003H, 00AH, 002H, 00CH, 000H, 00DH, 004H
        BYTE    00FH, 003H, 011H, 002H, 013H, 000H, 014H, 004H, 016H, 003H, 018H, 002H, 01AH, 000H, 001H, 002H
        BYTE    003H, 000H, 004H, 004H, 006H, 002H, 008H, 000H, 009H, 004H, 00BH, 002H, 00CH, 005H, 00EH, 003H
        BYTE    010H, 001H, 011H, 005H, 013H, 003H, 015H, 001H, 016H, 004H, 018H, 002H, 001H, 002H, 002H, 005H
        BYTE    004H, 002H, 005H, 005H, 007H, 003H, 009H, 000H, 00AH, 003H, 00CH, 000H, 00DH, 003H, 00FH, 001H
        BYTE    010H, 004H, 012H, 001H, 013H, 004H, 015H, 001H, 016H, 004H, 001H, 001H, 002H, 004H, 004H, 000H
        BYTE    005H, 003H, 006H, 005H, 008H, 002H, 009H, 004H, 00BH, 001H, 00CH, 004H, 00EH, 000H, 00FH, 003H
        BYTE    010H, 005H, 012H, 002H, 013H, 004H, 015H, 001H, 001H, 001H, 002H, 003H, 003H, 004H, 005H, 000H
        BYTE    006H, 002H, 007H, 004H, 009H, 000H, 00AH, 002H, 00BH, 004H, 00DH, 000H, 00EH, 002H, 00FH, 003H
        BYTE    010H, 005H, 012H, 001H, 013H, 003H, 001H, 000H, 002H, 001H, 003H, 003H, 004H, 004H, 005H, 005H
        BYTE    007H, 000H, 008H, 002H, 009H, 003H, 00AH, 004H, 00BH, 005H, 00DH, 000H, 00EH, 002H, 00FH, 003H
        BYTE    010H, 004H, 011H, 005H, 001H, 000H, 002H, 000H, 003H, 001H, 004H, 001H, 005H, 002H, 006H, 002H
        BYTE    007H, 003H, 008H, 004H, 009H, 004H, 00AH, 005H, 00BH, 005H, 00DH, 000H, 00EH, 000H, 00FH, 001H
        BYTE    010H, 002H, 000H, 005H, 001H, 005H, 002H, 005H, 003H, 005H, 004H, 005H, 005H, 005H, 006H, 004H
        BYTE    007H, 004H, 008H, 004H, 009H, 004H, 00AH, 004H, 00BH, 004H, 00CH, 004H, 00DH, 004H, 00EH, 004H
        BYTE    000H, 004H, 001H, 004H, 002H, 003H, 003H, 002H, 004H, 002H, 005H, 001H, 006H, 000H, 006H, 005H
        BYTE    007H, 004H, 008H, 004H, 009H, 003H, 00AH, 002H, 00BH, 002H, 00CH, 001H, 00DH, 000H, 000H, 004H
        BYTE    001H, 003H, 002H, 001H, 003H, 000H, 003H, 004H, 004H, 003H, 005H, 002H, 006H, 000H, 006H, 005H
        BYTE    007H, 003H, 008H, 002H, 009H, 000H, 009H, 005H, 00AH, 004H, 00BH, 002H, 000H, 003H, 001H, 001H
        BYTE    001H, 005H, 002H, 003H, 003H, 001H, 003H, 005H, 004H, 003H, 005H, 001H, 005H, 005H, 006H, 003H
        BYTE    007H, 001H, 007H, 005H, 008H, 003H, 009H, 001H, 009H, 004H, 000H, 003H, 001H, 000H, 001H, 003H
        BYTE    002H, 001H, 002H, 004H, 003H, 001H, 003H, 004H, 004H, 002H, 004H, 005H, 005H, 002H, 006H, 000H
        BYTE    006H, 003H, 007H, 000H, 007H, 003H, 008H, 001H, 000H, 002H, 000H, 005H, 001H, 002H, 001H, 004H
        BYTE    002H, 001H, 002H, 003H, 003H, 000H, 003H, 003H, 003H, 005H, 004H, 002H, 004H, 004H, 005H, 001H
        BYTE    005H, 004H, 006H, 000H, 006H, 003H, 000H, 002H, 000H, 004H, 001H, 000H, 001H, 002H, 001H, 004H
        BYTE    002H, 000H, 002H, 002H, 002H, 003H, 002H, 005H, 003H, 001H, 003H, 003H, 003H, 005H, 004H, 001H
        BYTE    004H, 003H, 004H, 005H, 000H, 001H, 000H, 002H, 000H, 004H, 000H, 005H, 001H, 000H, 001H, 002H
        BYTE    001H, 003H, 001H, 004H, 002H, 000H, 002H, 001H, 002H, 002H, 002H, 004H, 002H, 005H, 003H, 000H
        BYTE    003H, 002H, 000H, 001H, 000H, 001H, 000H, 002H, 000H, 003H, 000H, 003H, 000H, 004H, 000H, 004H
        BYTE    000H, 005H, 001H, 000H, 001H, 000H, 001H, 001H, 001H, 002H, 001H, 002H, 001H, 003H, 001H, 004H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 0FFH, 005H
        BYTE    0FFH, 005H, 0FFH, 004H, 0FFH, 003H, 0FFH, 003H, 0FFH, 002H, 0FFH, 002H, 0FFH, 001H, 0FFH, 000H
        BYTE    0FFH, 000H, 0FEH, 005H, 0FEH, 004H, 0FEH, 004H, 0FEH, 003H, 0FEH, 002H, 0FFH, 005H, 0FFH, 004H
        BYTE    0FFH, 002H, 0FFH, 001H, 0FFH, 000H, 0FEH, 004H, 0FEH, 003H, 0FEH, 002H, 0FEH, 000H, 0FDH, 005H
        BYTE    0FDH, 004H, 0FDH, 002H, 0FDH, 001H, 0FDH, 000H, 0FCH, 004H, 0FFH, 004H, 0FFH, 002H, 0FFH, 000H
        BYTE    0FEH, 004H, 0FEH, 002H, 0FEH, 000H, 0FDH, 004H, 0FDH, 003H, 0FDH, 001H, 0FCH, 005H, 0FCH, 003H
        BYTE    0FCH, 001H, 0FBH, 005H, 0FBH, 003H, 0FBH, 001H, 0FFH, 004H, 0FFH, 001H, 0FEH, 004H, 0FEH, 002H
        BYTE    0FDH, 005H, 0FDH, 003H, 0FDH, 000H, 0FCH, 003H, 0FCH, 001H, 0FBH, 004H, 0FBH, 002H, 0FAH, 005H
        BYTE    0FAH, 002H, 0FAH, 000H, 0F9H, 003H, 0FFH, 003H, 0FFH, 000H, 0FEH, 003H, 0FDH, 005H, 0FDH, 002H
        BYTE    0FCH, 005H, 0FCH, 002H, 0FBH, 004H, 0FBH, 001H, 0FAH, 004H, 0FAH, 000H, 0F9H, 003H, 0F9H, 000H
        BYTE    0F8H, 003H, 0F7H, 005H, 0FFH, 003H, 0FEH, 005H, 0FEH, 001H, 0FDH, 003H, 0FCH, 005H, 0FCH, 001H
        BYTE    0FBH, 003H, 0FAH, 005H, 0FAH, 001H, 0F9H, 003H, 0F8H, 005H, 0F8H, 001H, 0F7H, 003H, 0F6H, 005H
        BYTE    0F6H, 002H, 0FFH, 002H, 0FEH, 003H, 0FDH, 005H, 0FDH, 000H, 0FCH, 002H, 0FBH, 003H, 0FAH, 004H
        BYTE    0FAH, 000H, 0F9H, 001H, 0F8H, 003H, 0F7H, 004H, 0F7H, 000H, 0F6H, 001H, 0F5H, 002H, 0F4H, 004H
        BYTE    0FFH, 002H, 0FEH, 002H, 0FDH, 003H, 0FCH, 004H, 0FBH, 004H, 0FAH, 005H, 0FAH, 000H, 0F9H, 001H
        BYTE    0F8H, 002H, 0F7H, 002H, 0F6H, 003H, 0F5H, 004H, 0F4H, 004H, 0F3H, 005H, 0F3H, 000H, 0FFH, 001H
        BYTE    0FEH, 001H, 0FDH, 001H, 0FCH, 001H, 0FBH, 001H, 0FAH, 001H, 0F9H, 002H, 0F8H, 002H, 0F7H, 002H
        BYTE    0F6H, 002H, 0F5H, 002H, 0F4H, 002H, 0F3H, 002H, 0F2H, 002H, 0F1H, 002H, 0FFH, 000H, 0FEH, 000H
        BYTE    0FCH, 005H, 0FBH, 005H, 0FAH, 004H, 0F9H, 004H, 0F8H, 003H, 0F7H, 002H, 0F6H, 002H, 0F5H, 001H
        BYTE    0F4H, 001H, 0F3H, 000H, 0F2H, 000H, 0F0H, 005H, 0EFH, 004H, 0FFH, 000H, 0FDH, 005H, 0FCH, 003H
        BYTE    0FBH, 002H, 0FAH, 001H, 0F9H, 000H, 0F7H, 004H, 0F6H, 003H, 0F5H, 002H, 0F4H, 001H, 0F3H, 000H
        BYTE    0F1H, 004H, 0F0H, 003H, 0EFH, 002H, 0EEH, 001H, 0FEH, 005H, 0FDH, 003H, 0FCH, 002H, 0FBH, 000H
        BYTE    0F9H, 004H, 0F8H, 002H, 0F7H, 000H, 0F5H, 004H, 0F4H, 002H, 0F3H, 000H, 0F1H, 004H, 0F0H, 003H
        BYTE    0EFH, 001H, 0EDH, 005H, 0ECH, 003H, 0FEH, 005H, 0FDH, 002H, 0FCH, 000H, 0FAH, 003H, 0F9H, 001H
        BYTE    0F7H, 004H, 0F6H, 002H, 0F4H, 005H, 0F3H, 002H, 0F2H, 000H, 0F0H, 003H, 0EFH, 001H, 0EDH, 004H
        BYTE    0ECH, 002H, 0EAH, 005H, 0FEH, 004H, 0FDH, 001H, 0FBH, 004H, 0FAH, 001H, 0F8H, 003H, 0F7H, 000H
        BYTE    0F5H, 003H, 0F4H, 000H, 0F2H, 003H, 0F0H, 005H, 0EFH, 002H, 0EDH, 005H, 0ECH, 002H, 0EAH, 005H
        BYTE    0E9H, 002H, 0FEH, 004H, 0FDH, 000H, 0FBH, 002H, 0F9H, 004H, 0F8H, 000H, 0F6H, 002H, 0F4H, 004H
        BYTE    0F3H, 001H, 0F1H, 003H, 0EFH, 005H, 0EEH, 001H, 0ECH, 003H, 0EAH, 005H, 0E9H, 002H, 0E7H, 004H
        BYTE    0FEH, 003H, 0FCH, 004H, 0FBH, 000H, 0F9H, 002H, 0F7H, 003H, 0F5H, 004H, 0F4H, 000H, 0F2H, 002H
        BYTE    0F0H, 003H, 0EEH, 004H, 0EDH, 000H, 0EBH, 002H, 0E9H, 003H, 0E7H, 004H, 0E6H, 000H
LXW     BYTE    0FFH, 002H, 0FEH, 002H, 0FDH, 003H, 0FCH, 004H, 0FBH, 004H, 0FAH, 005H, 0FAH, 000H, 0F9H, 001H
        BYTE    0F8H, 002H, 0F7H, 002H, 0F6H, 003H, 0F5H, 004H, 0F4H, 004H, 0F3H, 005H, 0F3H, 000H, 0FFH, 004H
        BYTE    0FFH, 001H, 0FEH, 004H, 0FEH, 002H, 0FDH, 005H, 0FDH, 003H, 0FDH, 000H, 0FCH, 003H, 0FCH, 001H
        BYTE    0FBH, 004H, 0FBH, 002H, 0FAH, 005H, 0FAH, 002H, 0FAH, 000H, 0F9H, 003H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 002H, 000H, 005H, 001H, 002H
        BYTE    001H, 004H, 002H, 001H, 002H, 003H, 003H, 000H, 003H, 003H, 003H, 005H, 004H, 002H, 004H, 004H
        BYTE    005H, 001H, 005H, 004H, 006H, 000H, 006H, 003H, 000H, 004H, 001H, 004H, 002H, 003H, 003H, 002H
        BYTE    004H, 002H, 005H, 001H, 006H, 000H, 006H, 005H, 007H, 004H, 008H, 004H, 009H, 003H, 00AH, 002H
        BYTE    00BH, 002H, 00CH, 001H, 00DH, 000H
CVOFF
        WORD    CTW+0
        WORD    CTW+30
        WORD    CTW+60
        WORD    CTW+90
        WORD    CTW+120
        WORD    CTW+150
        WORD    CTW+180
        WORD    CTW+210
        WORD    CTW+240
        WORD    CTW+270
        WORD    CTW+300
        WORD    CTW+330
        WORD    CTW+360
        WORD    CTW+390
        WORD    CTW+420
PSOFF
        WORD    PTW+0
        WORD    PTW+30
        WORD    PTW+60
        WORD    PTW+90
        WORD    PTW+120
        WORD    PTW+150
        WORD    PTW+180
        WORD    PTW+210
        WORD    PTW+240
        WORD    PTW+270
        WORD    PTW+300
        WORD    PTW+330
        WORD    PTW+360
        WORD    PTW+390
        WORD    PTW+420
        WORD    PTW+450
        WORD    PTW+480
        WORD    PTW+510
        WORD    PTW+540
        WORD    PTW+570
        WORD    PTW+600
        WORD    PTW+630
        WORD    PTW+660
        WORD    PTW+690
        WORD    PTW+720
        WORD    PTW+750
        WORD    PTW+780
        WORD    PTW+810
        WORD    PTW+840
        WORD    PTW+870
        WORD    PTW+900
        WORD    PTW+930
        WORD    PTW+960
LXOFF
        WORD    LXW+0
        WORD    LXW+30
        WORD    LXW+60
        WORD    LXW+90
        WORD    LXW+120
SXRCF   BYTE    001H, 003H, 003H, 001H, 004H, 005H, 006H, 003H, 008H, 001H, 009H, 005H, 00BH, 003H, 00DH, 001H
        BYTE    00EH, 005H, 010H, 003H, 012H, 001H, 013H, 005H, 015H, 003H, 017H, 001H, 019H, 000H
SXLCF   BYTE    0FEH, 003H, 0FCH, 005H, 0FBH, 001H, 0F9H, 003H, 0F7H, 005H, 0F6H, 001H, 0F4H, 003H, 0F2H, 005H
        BYTE    0F1H, 001H, 0EFH, 003H, 0EDH, 005H, 0ECH, 001H, 0EAH, 003H, 0E8H, 005H, 0E7H, 000H
HWCF    BYTE    001H, 000H, 002H, 001H, 003H, 002H, 004H, 003H, 005H, 004H, 006H, 005H, 008H, 000H, 009H, 001H
        BYTE    00AH, 002H, 00BH, 003H, 00CH, 004H, 00DH, 005H, 00FH, 000H, 010H, 001H, 011H, 002H
H2CF    BYTE    000H, 004H, 001H, 005H, 003H, 000H, 004H, 001H, 005H, 002H, 006H, 003H, 007H, 004H, 008H, 005H
        BYTE    00AH, 000H, 00BH, 001H, 00CH, 002H, 00DH, 003H, 00EH, 004H, 00FH, 005H, 011H, 000H
HWT     BYTE    006H, 00DH, 014H, 01BH, 022H, 029H, 030H, 037H, 03EH, 045H, 04CH, 053H, 05AH, 061H, 068H
ZTAB    BYTE    0ACH, 06CH, 0BAH, 049H, 0FBH, 0C1H, 095H, 073H, 057H, 03FH, 02CH, 01BH, 00DH, 001H, 0F6H
ROWD    BYTE    00CH, 00CH, 00BH, 00BH, 00AH, 00AH, 009H, 009H, 008H, 008H, 008H, 007H, 007H, 007H, 007H, 006H
        BYTE    006H, 006H, 006H, 005H, 005H, 005H, 005H, 005H, 005H, 004H, 004H, 004H, 004H, 004H, 004H, 004H
        BYTE    003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 002H, 002H, 002H, 002H, 002H, 002H
        BYTE    002H, 002H, 002H, 002H, 002H, 002H, 002H, 002H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H
        BYTE    001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 001H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH
KERBT   BYTE    082H, 083H, 084H, 085H, 086H, 087H, 088H, 089H, 08AH, 08BH
DASHT   BYTE    08CH, 08DH, 08EH, 08FH, 090H, 091H
LANEU   BYTE    0E8H, 0F4H, 000H, 00CH, 018H
PARTAB  BYTE    00EH, 0B0H, 010H, 040H, 011H, 058H, 00DH, 0E8H
THC     BYTE    001H, 012H, 013H, 014H, 015H, 016H, 017H, 018H, 019H, 01AH, 01BH, 000H
THPT
        WORD    THM+0
        WORD    THM+88
        WORD    THM+176
        WORD    THM+264
THM     BYTE    0BFH, 0B7H, 0BFH, 0BBH, 0BFH, 0AFH, 0BFH, 0BDH, 040H, 040H, 040H, 040H, 040H, 041H, 043H, 047H
        BYTE    040H, 040H, 04CH, 05EH, 07FH, 07FH, 07FH, 07FH, 040H, 040H, 040H, 040H, 060H, 070H, 078H, 07CH
        BYTE    040H, 040H, 040H, 040H, 040H, 040H, 040H, 07FH, 040H, 040H, 040H, 040H, 040H, 048H, 05CH, 07FH
        BYTE    040H, 040H, 040H, 041H, 043H, 047H, 04FH, 07FH, 040H, 040H, 040H, 060H, 070H, 078H, 07CH, 07FH
        BYTE    0DEH, 0FFH, 0FFH, 0DFH, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0CEH, 0FFH, 0FEH, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    080H, 08CH, 09EH, 0BFH, 0BFH, 09EH, 08CH, 080H, 0BFH, 02FH, 0BFH, 03DH, 0BFH, 037H, 0BFH, 03BH
        BYTE    0C0H, 0C0H, 0C1H, 0C3H, 047H, 04FH, 05FH, 07FH, 0CCH, 0DEH, 0FFH, 07FH, 07FH, 07FH, 07FH, 07FH
        BYTE    0C0H, 0C0H, 0E0H, 0F0H, 078H, 07CH, 07EH, 07FH, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0D8H, 07FH, 07FH
        BYTE    0C0H, 0C0H, 0CCH, 0DEH, 07FH, 07FH, 07FH, 07FH, 0C0H, 0C1H, 0C3H, 047H, 04FH, 05FH, 07FH, 07FH
        BYTE    0C0H, 0E0H, 0F0H, 078H, 07CH, 07EH, 07FH, 07FH, 0DEH, 0FFH, 0FFH, 0DFH, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    0C0H, 0CEH, 0FFH, 0FEH, 0C0H, 0C0H, 0C0H, 0C0H, 080H, 08CH, 09EH, 0BFH, 0BFH, 09EH, 08CH, 080H
        BYTE    0BFH, 0F7H, 0BFH, 0FBH, 0BFH, 0EFH, 0BFH, 0FDH, 0FFH, 0D1H, 0D0H, 0D0H, 0D0H, 0D0H, 0D0H, 07FH
        BYTE    05EH, 052H, 05EH, 052H, 05EH, 052H, 05EH, 07FH, 0C0H, 0C0H, 0C0H, 0FFH, 0EAH, 0FFH, 0EAH, 0FFH
        BYTE    040H, 040H, 040H, 040H, 040H, 040H, 0FFH, 06DH, 0C0H, 0C0H, 0C0H, 0C8H, 0CCH, 0FFH, 0DEH, 07FH
        BYTE    040H, 04FH, 049H, 04FH, 049H, 04FH, 049H, 07FH, 0C0H, 0FCH, 0E4H, 0FCH, 0E4H, 0FCH, 0E4H, 0FFH
        BYTE    0DEH, 0FFH, 0FFH, 0DFH, 0C0H, 0C0H, 0C0H, 0C0H, 0C0H, 0CEH, 0FFH, 0FEH, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    080H, 08CH, 09EH, 0BFH, 0BFH, 09EH, 08CH, 080H, 0BFH, 077H, 0BFH, 07BH, 0BFH, 06FH, 0BFH, 07DH
        BYTE    040H, 040H, 040H, 040H, 040H, 041H, 043H, 047H, 040H, 040H, 040H, 04CH, 05EH, 07FH, 07FH, 07FH
        BYTE    040H, 040H, 040H, 040H, 060H, 070H, 078H, 07CH, 040H, 040H, 040H, 040H, 040H, 040H, 040H, 07FH
        BYTE    040H, 040H, 040H, 040H, 040H, 048H, 05CH, 07FH, 040H, 040H, 040H, 041H, 043H, 047H, 04FH, 07FH
        BYTE    040H, 040H, 040H, 060H, 070H, 078H, 07CH, 07FH, 040H, 040H, 05FH, 07FH, 040H, 007H, 00FH, 000H
        BYTE    040H, 040H, 07FH, 07EH, 040H, 03FH, 030H, 000H, 09EH, 0BFH, 0BFH, 03FH, 03FH, 03FH, 01EH, 000H
PLBON   BYTE    005H, 003H, 002H, 001H, 000H, 000H, 000H, 000H
MROWS   BYTE    012H, 013H, 014H, 015H, 015H, 016H, 015H, 017H, 013H, 013H, 018H, 015H, 015H, 015H, 016H, 015H
        BYTE    012H, 013H, 013H, 013H, 014H, 015H, 017H, 018H, 015H, 015H, 016H, 015H, 015H, 012H, 013H, 014H
        BYTE    015H, 015H, 017H, 013H, 018H, 015H, 016H, 015H, 012H, 013H, 014H, 015H, 015H, 016H, 015H, 017H
        BYTE    013H, 013H, 018H, 015H, 015H, 015H, 016H, 015H, 012H, 013H, 013H, 013H, 014H, 015H, 017H, 018H
        BYTE    015H, 015H, 016H, 015H, 015H, 012H, 013H, 014H, 015H, 015H, 017H, 013H, 018H, 015H, 016H, 015H
TNAMES
        WORD    TN0
        WORD    TN1
        WORD    TN2
        WORD    TN3
TN0      TEXT    "LAKESIDE"
        BYTE    0
TN1      TEXT    "HIGHLANDS"
        BYTE    0
TN2      TEXT    "HARBOUR"
        BYTE    0
TN3      TEXT    "SUNSET RUN"
        BYTE    0
TXQSTART TEXT    "WARM-UP LAP: CROSS THE LINE"
        BYTE    0
TXQUAL   TEXT    "QUALIFYING LAP - GO!"
        BYTE    0
TXGRID   TEXT    "GRID POSITION"
        BYTE    0
TXRSTART TEXT    "RACE  -  4 LAPS"
        BYTE    0
TXGO     TEXT    "GO!"
        BYTE    0
TXEXT    TEXT    "EXTENDED PLAY"
        BYTE    0
TXPASS   TEXT    "PASSING BONUS 50"
        BYTE    0
TXFIN    TEXT    "FINISHED  POSITION"
        BYTE    0
TXNQ     TEXT    "NOT QUALIFIED - GAME OVER"
        BYTE    0
TXTUP    TEXT    "TIME UP - GAME OVER"
        BYTE    0
TX1      TEXT    "SCORE"
        BYTE    0
TX2      TEXT    "TIME"
        BYTE    0
TX3      TEXT    "LAP  /4"
        BYTE    0
TX4      TEXT    "POS"
        BYTE    0
TX5      TEXT    "SPEED     KM/H"
        BYTE    0
TX6      TEXT    "GEAR"
        BYTE    0
TX7      TEXT    "GRAND CIRCUIT"
        BYTE    0
TX8      TEXT    "QUALIFY  THEN  RACE"
        BYTE    0
TX9      TEXT    "CHOOSE A CIRCUIT  1-4"
        BYTE    0
TX10     TEXT    "1  LAKESIDE"
        BYTE    0
TX11     TEXT    "2  HIGHLANDS"
        BYTE    0
TX12     TEXT    "3  HARBOUR"
        BYTE    0
TX13     TEXT    "4  SUNSET RUN"
        BYTE    0
TX14     TEXT    "LEFT/RIGHT  STEER (HOLD)"
        BYTE    0
TX15     TEXT    "DOWN        BRAKE (HOLD)"
        BYTE    0
TX16     TEXT    "SPACE       GEAR LOW/HIGH"
        BYTE    0
TX17     TEXT    "M           MUSIC ON/OFF"
        BYTE    0
TX18     TEXT    "ESC         QUIT"
        BYTE    0
TX19     TEXT    "HI"
        BYTE    0
TUNE    BYTE    014H, 010H, 010H, 008H, 00DH, 008H, 010H, 010H, 014H, 010H, 012H, 008H, 010H, 008H, 00FH, 010H
        BYTE    010H, 010H, 012H, 010H, 014H, 010H, 012H, 008H, 010H, 008H, 012H, 010H, 01BH, 010H, 015H, 010H
        BYTE    014H, 010H, 010H, 008H, 00DH, 008H, 00CH, 010H, 00DH, 010H, 00FH, 008H, 010H, 008H, 012H, 010H
        BYTE    010H, 010H, 014H, 010H, 012H, 010H, 015H, 010H, 014H, 020H, 07FH, 010H, 014H, 010H, 010H, 008H
        BYTE    00DH, 008H, 010H, 010H, 014H, 010H, 012H, 008H, 010H, 008H, 00FH, 010H, 010H, 010H, 012H, 010H
        BYTE    014H, 010H, 012H, 008H, 010H, 008H, 012H, 010H, 01BH, 010H, 015H, 010H, 014H, 010H, 010H, 008H
        BYTE    00DH, 008H, 00CH, 010H, 00DH, 010H, 00FH, 008H, 010H, 008H, 012H, 010H, 010H, 010H, 014H, 010H
        BYTE    012H, 010H, 015H, 010H, 014H, 020H, 07FH, 010H, 018H, 010H, 014H, 010H, 00FH, 010H, 00CH, 010H
        BYTE    00DH, 010H, 00FH, 008H, 010H, 008H, 012H, 020H, 01BH, 010H, 015H, 010H, 012H, 010H, 00DH, 010H
        BYTE    00FH, 010H, 010H, 008H, 012H, 008H, 010H, 020H, 018H, 010H, 014H, 010H, 010H, 010H, 00CH, 010H
        BYTE    00DH, 010H, 010H, 010H, 00FH, 010H, 012H, 010H, 00DH, 018H, 00FH, 008H, 010H, 010H, 012H, 010H
        BYTE    00DH, 020H, 07FH, 010H, 014H, 010H, 010H, 008H, 00DH, 008H, 010H, 010H, 014H, 010H, 012H, 008H
        BYTE    010H, 008H, 00FH, 010H, 010H, 010H, 012H, 010H, 014H, 010H, 012H, 008H, 010H, 008H, 012H, 010H
        BYTE    01BH, 010H, 015H, 010H, 014H, 010H, 010H, 008H, 00DH, 008H, 00CH, 010H, 00DH, 010H, 00FH, 008H
        BYTE    010H, 008H, 012H, 010H, 010H, 010H, 014H, 010H, 012H, 010H, 015H, 010H, 014H, 020H, 07FH, 010H
        BYTE    07FH, 030H, 000H
CMAP
        BYTE    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2,2,2,2,2,2,2,2,2,2,2
        BYTE    2,2,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0,0,0,0,0,254,254,254,254,254,254,254,254
        BYTE    254,254,254,254,254,254,254,254,252,252,252,252,252,252,252,252,252,252,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        BYTE    0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,5,5,5,5,5,5,5,5,0,0,0,0,0,0,0,0
        BYTE    0,0,0,0,0,0,253,253,253,253,253,253,253,253,253,253,254,254,254,254,254,254,254,254,254,254,254,254,0,0,0,0
        BYTE    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,4,4,2,2
        BYTE    2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,253,253,253,253,253,253,253,253,253,253
        BYTE    253,253,251,251,251,251,251,251,251,251,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        BYTE    0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,4,4,4,4,4,4,4,4,4,6,6,6,6,6,6,6,6
        BYTE    0,0,0,0,0,0,0,0,0,0,251,251,251,251,251,251,251,251,251,251,253,253,253,253,253,253,253,253,0,0,0,0
        BYTE    0,0,0,0,0,0,0,0,5,5,5,5,5,5,5,5,5,5,0,0,0,0,0,0,0,0,0,0,250,250,250,250
        BYTE    250,250,250,250,252,252,252,252,252,252,252,252,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3
        BYTE    3,3,3,3,3,3,6,6,6,6,6,6,6,6,6,6,0,0,0,0,0,0,0,0,0,0,0,0,252,252,252,252
        BYTE    252,252,252,252,252,252,0,0,0,0,0,0,0,0,0,0,0,0,5,5,5,5,5,5,5,5,251,251,251,251,251,251
        BYTE    251,251,251,251,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,0,0,0,0,0,0
        BYTE    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        BYTE    0,0,0,0,0,0,0,0,0,0,5,5,5,5,5,5,5,5,7,7,7,7,7,7,7,7,0,0,0,0,0,0
        BYTE    0,0,250,250,250,250,250,250,250,250,249,249,249,249,249,249,249,249,0,0,0,0,0,0,0,0,4,4,4,4,4,4
        BYTE    4,4,4,4,0,0,0,0,0,0,251,251,251,251,251,251,251,251,251,251,0,0,0,0,0,0,0,0,6,6,6,6
        BYTE    6,6,6,6,7,7,7,7,7,7,7,7,0,0,0,0,0,0,0,0,0,0,252,252,252,252,252,252,252,252,250,250
        BYTE    250,250,250,250,250,250,0,0,0,0,0,0,0,0,5,5,5,5,5,5,5,5,5,5,0,0,0,0,0,0,0,0
        BYTE    249,249,249,249,249,249,249,249,253,253,253,253,253,253,253,253,0,0,0,0,0,0,0,0,0,0,0,0,6,6,6,6
        BYTE    6,6,6,6,0,0,0,0,0,0,0,0,251,251,251,251,251,251,251,251,0,0,0,0,0,0,0,0,0,0,0,0
        BYTE    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        BYTE    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,2
        BYTE    2,2,2,2,2,2,2,2,2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,253,253
        BYTE    253,253,253,253,253,253,253,253,253,253,253,253,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        BYTE    0,0,0,0,0,0,4,4,4,4,4,4,4,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        BYTE    254,254,254,254,254,254,254,254,254,254,254,254,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
        BYTE    0,0,0,0,0,0,0,0,0,0,3,3,3,3,3,3,3,3,3,3,3,3,3,3,0,0,0,0,0,0,0,0
        BYTE    0,0,0,0,0,0,0,0,0,0,252,252,252,252,252,252,252,252,252,252,0,0,0,0,0,0,0,0,0,0,0,0
        BYTE    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
CHTAB
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 0BFH, 0B7H, 0BFH, 0BBH, 0BFH, 0AFH, 0BFH, 0BDH
        BYTE    030H, 030H, 030H, 030H, 030H, 030H, 030H, 030H, 018H, 018H, 018H, 018H, 018H, 018H, 018H, 018H
        BYTE    00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 00CH, 006H, 006H, 006H, 006H, 006H, 006H, 006H, 006H
        BYTE    003H, 003H, 003H, 003H, 003H, 003H, 003H, 003H, 0F0H, 0F0H, 0F0H, 0F0H, 0F0H, 0F0H, 0F0H, 0F0H
        BYTE    0D8H, 0D8H, 0D8H, 0D8H, 0D8H, 0D8H, 0D8H, 0D8H, 0CCH, 0CCH, 0CCH, 0CCH, 0CCH, 0CCH, 0CCH, 0CCH
        BYTE    0C6H, 0C6H, 0C6H, 0C6H, 0C6H, 0C6H, 0C6H, 0C6H, 0C3H, 0C3H, 0C3H, 0C3H, 0C3H, 0C3H, 0C3H, 0C3H
        BYTE    0E0H, 0E0H, 0E0H, 0E0H, 0E0H, 0E0H, 0E0H, 0E0H, 0D0H, 0D0H, 0D0H, 0D0H, 0D0H, 0D0H, 0D0H, 0D0H
        BYTE    0C8H, 0C8H, 0C8H, 0C8H, 0C8H, 0C8H, 0C8H, 0C8H, 0C4H, 0C4H, 0C4H, 0C4H, 0C4H, 0C4H, 0C4H, 0C4H
        BYTE    0C2H, 0C2H, 0C2H, 0C2H, 0C2H, 0C2H, 0C2H, 0C2H, 0C1H, 0C1H, 0C1H, 0C1H, 0C1H, 0C1H, 0C1H, 0C1H
        BYTE    040H, 040H, 040H, 040H, 040H, 041H, 043H, 047H, 040H, 040H, 04CH, 05EH, 07FH, 07FH, 07FH, 07FH
        BYTE    040H, 040H, 040H, 040H, 060H, 070H, 078H, 07CH, 040H, 040H, 040H, 040H, 040H, 040H, 040H, 07FH
        BYTE    040H, 040H, 040H, 040H, 040H, 048H, 05CH, 07FH, 040H, 040H, 040H, 041H, 043H, 047H, 04FH, 07FH
        BYTE    040H, 040H, 040H, 060H, 070H, 078H, 07CH, 07FH, 0DEH, 0FFH, 0FFH, 0DFH, 0C0H, 0C0H, 0C0H, 0C0H
        BYTE    0C0H, 0CEH, 0FFH, 0FEH, 0C0H, 0C0H, 0C0H, 0C0H, 080H, 08CH, 09EH, 0BFH, 0BFH, 09EH, 08CH, 080H
        BYTE    040H, 040H, 040H, 040H, 07EH, 07EH, 07EH, 07EH, 000H, 0FFH, 0FFH, 0E1H, 083H, 007H, 01FH, 03FH
        BYTE    000H, 0FFH, 0FFH, 0E1H, 0B0H, 038H, 03EH, 03FH, 040H, 040H, 040H, 040H, 05FH, 05FH, 05FH, 05FH
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
        BYTE    0DFH, 0C1H, 0C2H, 0C4H, 0C8H, 0D0H, 0DFH, 0C0H, 07EH, 07EH, 07EH, 07EH, 07EH, 07EH, 040H, 040H
        BYTE    033H, 03FH, 01FH, 00CH, 08FH, 0C0H, 000H, 000H, 033H, 03FH, 03EH, 00CH, 0BCH, 0C0H, 000H, 000H
        BYTE    05FH, 05FH, 05FH, 05FH, 05FH, 05FH, 040H, 040H, 000H, 000H, 0FFH, 0D2H, 02DH, 02DH, 021H, 000H
        BYTE    0FFH, 0D1H, 033H, 027H, 037H, 022H, 030H, 000H, 0FFH, 0E2H, 033H, 039H, 03BH, 011H, 003H, 000H
        BYTE    000H, 0FFH, 0FFH, 0D1H, 031H, 037H, 027H, 037H, 000H, 0FFH, 0FFH, 0E2H, 023H, 03BH, 039H, 03BH
        BYTE    027H, 037H, 022H, 033H, 030H, 000H, 000H, 000H, 039H, 03BH, 011H, 033H, 003H, 000H, 000H, 000H
        BYTE    000H, 000H, 0FFH, 0D2H, 0ADH, 0ADH, 0A1H, 080H, 0FFH, 0D1H, 0B3H, 0A7H, 0B7H, 0A2H, 0B0H, 080H
        BYTE    0FFH, 0E2H, 0B3H, 0B9H, 0BBH, 091H, 083H, 080H, 000H, 0FFH, 0FFH, 0D1H, 0B1H, 0B7H, 0A7H, 0B7H
        BYTE    000H, 0FFH, 0FFH, 0E2H, 0A3H, 0BBH, 0B9H, 0BBH, 0A7H, 0B7H, 0A2H, 0B3H, 0B0H, 000H, 000H, 000H
        BYTE    0B9H, 0BBH, 091H, 0B3H, 083H, 000H, 000H, 000H, 0C0H, 0C0H, 0DEH, 01EH, 008H, 008H, 008H, 000H
        BYTE    0BFH, 0A6H, 0BFH, 081H, 001H, 001H, 001H, 001H, 0BFH, 099H, 0BFH, 0A0H, 020H, 020H, 020H, 020H
        BYTE    080H, 08AH, 01EH, 03FH, 01CH, 02AH, 080H, 080H, 022H, 094H, 022H, 089H, 011H, 0A4H, 009H, 080H
        BYTE    000H, 01EH, 03FH, 03FH, 03FH, 03FH, 01EH, 000H, 080H, 09EH, 0BFH, 0BFH, 0BFH, 0BFH, 09EH, 080H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        BYTE    000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H
        END
