ASSUME CS:CODE,DS:DATA
READNO MACRO NUM
LOCAL L,L1,L2,L3,L4
        MOV DL,02H
        MOV BL,00H
    L:MOV BH,BL
       MOV AH,01H
       INT 21H
       CMP AL,39H
       JLE L1
       SUB AL,37H
       JMP L2
    L1:SUB AL,30H
    L2:MOV BL,AL
       MOV CL,04H
       SHL BL,CL
       MOV AH,01H
       INT 21H
       CMP AL,39H
       JLE L3
       SUB AL,37H
       JMP L4
    L3:SUB AL,30H
    L4:ADD BL,AL
       DEC DL
       JNZ L
       MOV NUM,BX
ENDM

DISPLAY MACRO N
LOCAL L1,L2,L3,L4
        MOV BX,N
        MOV DH,02H
     L1:MOV DL,BH
        MOV CL,04H
        SHR DL,CL
        CMP DL,09H
        JC L2
        ADD DL,37H
        JMP L3
     L2:ADD DL,30H
     L3:MOV AH,02H
        INT 21H
        MOV DL,BH
        AND DL,0FH
        CMP DL,09H
        JC L4
        ADD DL,37H
        JMP L5
     L4:ADD DL,30H
     L5:MOV AH,02H
        INT 21H
        MOV BH,BL
        DEC DH
        JNZ L1
ENDM

DATA SEGMENT
MSG1 DB 0AH,"ENTER FIRST NO:$"
MSG2 DB 0AH,"ENTER SECOND NO:$"
MSG3 DB 0AH,"RESULT IS:$"
N1 DW ?
N2 DW ?
S DW ?
DATA ENDS
CODE SEGMENT
START:MOV AX,DATA
      MOV DS,AX
      LEA DX,MSG1
      MOV AH,09H
      INT 21H
      READNO N1
      LEA DX,MSG2
      MOV AH,09H
      INT 21H
      READNO N2
      MOV AX,N1
      MOV BX,N2
      ADD AX,BX
      MOV S,AX
      LEA DX,MSG3
      MOV AH,09H
      INT 21H

      DISPLAY S
      MOV AH,4CH
      INT 21H

CODE ENDS
END START