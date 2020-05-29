;autor: Uch Noh Dany Daniel y Alejandro Cupul
;fecha: 29/05/2020

PantallaEtext macro color,xyI,xyF
    ;pintar pantalla fondo de pantalla menu
    mov ah,06h
    mov al,0
    mov bh,color
    mov cx,xyI
    mov dx,xyF
    int 10h
    
    
PantallaEtext endm
;fin de macro uno

textoImpreso macro pag,fila,col,letra
    
    ;texto en pantalla menu
    mov ah,02h
    mov bh,pag
    mov dh,fila
    mov dl,col
    int 10h
    
    mov ah,09h
    mov dx,offset letra
    int 21h
    

textoImpreso endm
             ;efecto de animacion en macro
             ;xy xy numVueltas texto  nombreCiclo
Vueltas macro INI, FIN,TOTAL, MSJ, NOMBRECI
    MOV AH,02H
    MOV BH,0
    MOV DH,INI
    MOV DL,FIN
    INT 10H 
    
    MOV CX,TOTAL
    MOV DX, OFFSET MSJ
    
  NOMBRECI:
    MOV AH,09H
    INT 21H
   LOOP NOMBRECI
   
Vueltas endm
     


dat segment
    titulo db 'OPERACIONES BASICAS$'
    suma db '[1]SUMA$'
    resta db '[2]RESTA$'
    multiplicacion db '[3]MULTIPLICACION$'
    division db '[4]DIVISION$'
    icono db 2ah,'$'
    seleccion db 'SELECCIONE UNA OPCION: []$'
    valorA db 'Ingrese el primer valor: $'
    valorB db 'Ingrese el segundo valor: $'
    Result db 'Resultado: $'
    ts db 'Suma de dos numeros$'
    tr db 'Resta de dos numeros$'
    tm db 'Mutiplicacion de dos numeros$'
    td db 'Division de dos numeros$'
    op db 'Presione la tecla 1 para seguir$'
    NUM1 db 100 DUP('$')
    NUM2 db 100 DUP('$')
    ;arte2 db 0fh,0ah,08h,'$'
dat ends

code segment
    ;--------------------
    main proc far
        
    
    assume ds:dat,cs:code
    mov ax,dat
    mov ds,ax
    
    menu:
    
    ;         fondo/tex  xy(P)
    PantallaEtext 0e2h,0000,18afh
    PantallaEtext 0ch,0213h,123dh
    PantallaEtext 0e1h,0416h,103ah
    
    Vueltas 06h, 1dh,25, icono, ciclo1
    Vueltas 08h, 1dh,25, icono, ciclo2
    
    textoImpreso 0,07h,20h,titulo
    textoImpreso 0,0bh,19h,suma
    textoImpreso 0,0ch,19h,resta
    textoImpreso 0,0dh,19h,multiplicacion
    textoImpreso 0,0eh,19h,division
    
    textoImpreso 0,11h,21h,seleccion
    
    
    mov AH,0H
    int 16H
    cmp al,'1'
    je OpSuma
    cmp al,'2'
    je OpResta
    cmp al,'3'
    je OpMult
    cmp al,'4'
    je OpDiv
    
    
    call salir
    
    main endp
    
    ;--------------------
    salir proc near
        mov ah,4ch
        int 21h
    salir endp
    
    OpSuma proc near
        
        
        PantallaEtext 90h,0000h,18afh
        textoImpreso 0,07h,1ch,ts
        textoImpreso 0,0ah,1ch,valorA
        ;ingresar dato
        mov ah,01h
        int 21h
        
        ;convertir dato
        mov NUM1,al
        sub NUM1,30h
        
        
        textoImpreso 0,0bh,1ch,valorB
        
        ;ingresar dato
        mov ah,01h
        int 21h
        
        ;convertir dato
        mov NUM2,al
        sub NUM2,30h
        
        
        mov ah,0
        
        
        mov al,NUM1
        mov bl,NUM2
        add al,bl

        AAA
        
        
        add AL,30H

        add AH,30H

        mov NUM1,AH

        mov NUM2,AL
        
        textoImpreso 0,0ch,1ch,Result
        textoImpreso 0,0ch,26h,NUM1
        textoImpreso 0,0ch,27h,NUM2
        
        textoImpreso 0,0dh,1ch,op
        ;pide dato
        mov ah,0H                  
        int 16H
        
        cmp al,'1'
        je menu 
        
        ret
    OpSuma endp
    
    
    
    OpResta proc near
        
        
        PantallaEtext 90h,0000h,18afh
        textoImpreso 0,07h,1ch,tr
        textoImpreso 0,0ah,1ch,valorA
        ;ingresar dato
        mov ah,01h
        int 21h
        
        ;convertir dato
        mov NUM1,al
        sub NUM1,30h
        
        
        textoImpreso 0,0bh,1ch,valorB
        
        ;ingresar dato
        mov ah,01h
        int 21h
        
        ;convertir dato
        mov NUM2,al
        sub NUM2,30h
        
        
        mov ah,0
        
        ;Resta
        mov al,NUM1
        mov bl,NUM2
        sub al,bl

        AAS
        
        
        add AL,30H

        add AH,30H

        mov NUM1,AH

        mov NUM2,AL
        
        textoImpreso 0,0ch,1ch,Result
        textoImpreso 0,0ch,26h,NUM1
        textoImpreso 0,0ch,27h,NUM2
        
        textoImpreso 0,0dh,1ch,op
        ;pide dato
        mov ah,0H                  
        int 16H
        
        cmp al,'1'
        je menu 
        
        ret
    OpResta endp
    
    
    OpMult proc near
        
        
        PantallaEtext 90h,0000h,18afh
        textoImpreso 0,07h,1ch,tm
        textoImpreso 0,0ah,1ch,valorA
        ;ingresar dato
        mov ah,01h
        int 21h
        
        ;convertir dato
        mov NUM1,al
        sub NUM1,30h
        
        
        textoImpreso 0,0bh,1ch,valorB
        
        ;ingresar dato
        mov ah,01h
        int 21h
        
        ;convertir dato
        mov NUM2,al
        sub NUM2,30h
        
        
        mov ah,0
        
        ;Multiplicacion
        mov al,NUM1
        mov bl,NUM2
        mul bl

        AAM
        
        
        add AL,30H

        add AH,30H

        mov NUM1,AH

        mov NUM2,AL
        
        textoImpreso 0,0ch,1ch,Result
        textoImpreso 0,0ch,26h,NUM1
        textoImpreso 0,0ch,27h,NUM2
        
        textoImpreso 0,0dh,1ch,op
        ;pide dato
        mov ah,0H                  
        int 16H
        
        cmp al,'1'
        je menu 
        
        ret
    OpMult endp
    
    
    OpDiv proc near
        
        
        PantallaEtext 90h,0000h,18afh
        textoImpreso 0,07h,1ch,td
        textoImpreso 0,0ah,1ch,valorA
        ;ingresar dato
        mov ah,01h
        int 21h
        
        ;convertir dato
        mov NUM1,al
        sub NUM1,30h
        
        
        textoImpreso 0,0bh,1ch,valorB
        
        ;ingresar dato
        mov ah,01h
        int 21h
        
        ;convertir dato
        mov NUM2,al
        sub NUM2,30h
        
        
        mov ah,0
        
        ;Division
        mov al,NUM1
        mov bl,NUM2
        div bl

        AAD
        
        
        add AL,30H

        add AH,30H

        mov NUM1,AH

        mov NUM2,AL
        
        textoImpreso 0,0ch,1ch,Result
        textoImpreso 0,0ch,26h,NUM1
        textoImpreso 0,0ch,27h,NUM2
        
        textoImpreso 0,0dh,1ch,op
        ;pide dato
        mov ah,0H                  
        int 16H
        
        cmp al,'1'
        je menu 
        
        ret
    OpDiv endp
    
    
    
        


code ends
    end main        