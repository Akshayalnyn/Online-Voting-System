org 100h

include "emu8086.inc"

main:

call clear_screen

 lea dx, scn1

mov ah, 9

 int 21h 

 printn ""

printn ""

lea dx, scn2

mov ah, 9

 int 21h

 printn ""

call scan_num

mov al,cl

cmp al,1

je s1

cmp al,2

je s2

cmp al,3

je s4

lea dx, scn3

mov ah, 9

 int 21h

 jmp main

s1:

call clear_screen

 lea dx, scn4

mov ah, 9

 int 21h

 printn ""

lea dx, scn5

mov ah, 9

 int 21h     

 printn ""

call scan_num

mov al,cl

mov cl,30

lea si,array1

 

L1:

cmp al,[si]

je check1

add si,2

dec cl

jnz L1

lea dx, scn3

mov ah, 9

 int 21h  

 jmp main

 

s2:

 call clear_screen

lea dx, scn6

mov ah, 9

 int 21h   

 printn ""

lea dx, scn5

mov ah, 9

 int 21h   

 printn ""

call scan_num

mov al,cl

mov cl,20

lea si,array2

 

L2:

cmp al,[si]

je check2

add si,2

dec cl

jnz L2

lea dx, scn3

mov ah, 9

 int 21h

 jmp main 

 

 

check1:

inc numr1                

 lea dx, scn7

mov ah, 9

 int 21h

 call clear_screen

jmp vote1

 

check2:

inc numr2

lea dx, scn7

mov ah, 9

 int 21h

  call clear_screen  

 jmp vote2

 

vote1:

mov [si],0

 lea dx, scn8

mov ah, 9

 int 21h

 printn  "" 

 printn  ""

lea dx, scn9

mov ah, 9

 int 21h

 printn     

 call scan_num

cmp cl,1

je c1

 cmp cl,2

je c2

cmp cl,3

je c3

printn ""

lea dx, scn3

mov ah, 9

 int 21h

 printn ""

jmp vote1        

 

 

 

vote2:

mov [si],0 

 lea dx, scn8

mov ah, 9

 int 21h

 printn ""  

 printn ""

lea dx, scn9

mov ah, 9

 int 21h

 printn  ""   

 call scan_num

cmp cl,1

je c1

 cmp cl,2

je c2

cmp cl,3

je c3

printn

lea dx, scn3

mov ah, 9

 int 21h

 printn

jmp vote2    

 

 

 

 

c1:

 printn ""

inc cnt1

inc tot

jmp main

 

c2:

printn ""

 inc cnt2

inc tot

jmp main

c3:

printn ""

inc cnt3

inc tot

jmp main

 

s4:

call clear_screen

lea dx, scn10

mov ah, 9

 int 21h     

 printn ""

call scan_num

 mov al,cl

cmp al,10

jnz exitadmin

printn ""

 

s6:

 call clear_screen

lea dx, scn11

mov ah, 9

 int 21h 

 printn ""

lea dx, scn12

mov ah, 9

 int 21h

 printn ""

call scan_num

 cmp cl,1

je s5

cmp cl,2                                                    

 jmp find

lea dx, scn3

mov ah, 9

 int 21h

 jmp s4

 

exitadmin:

printn ""

lea dx, scn13

mov ah, 9

 int 21h   

 jmp main

 

 

s5:

call clear_screen

lea dx, scn14

mov ah, 9

 int 21h

printn ""

lea dx, scn15

mov ah, 9

 int 21h

printn ""

 lea dx, scn16

mov ah, 9

 int 21h

 lea dx, scn17

mov ah, 9

 int 21h

 mov al,cnt1

 add al,48

 mov dl,al

 mov ah,02

 int 21h

 

lea dx, scn18

mov ah, 9

 int 21h  

 lea dx, scn17

mov ah, 9

 int 21h   

 mov al,cnt2

 add al,48

 mov dl,al

 mov ah,02

 int 21h

 

lea dx, scn19

mov ah, 9

 int 21h 

 mov al,cnt3

lea dx, scn17

mov ah, 9

 int 21h  

 add al,48

 mov dl,al

 mov ah,02

 int 21h

 

printn ""

 lea dx, scn4

mov ah, 9

 int 21h  

 lea dx, scn20

mov ah, 9

 int 21h 

 mov al,numr1

 add al,48

 mov dl,al

 mov ah,02

 int 21h

 

printn ""

 lea dx, scn6

mov ah, 9

 int 21h    

 lea dx, scn20

mov ah, 9

 int 21h 

 mov al,numr2

 add al,48

 mov dl,al

 mov ah,02

 int 21h

 

 

 

printn ""

lea dx, scn21

mov ah, 9

 int 21h

 mov al,tot

 add al,48

 mov dl,al

 mov ah,02

 int 21h

 

 

delay:

  mov cx,250

f1:                                                     

  dec cx

  jnz f1

jmp s6

 

result:

                                                           

 mov dx,0

MOV AL,cnt1

MOV LRGT,AL

mov dl,cnt1

CMP AL,cnt2

JGE SKIP1

MOV AL,cnt2

MOV LRGT,AL

mov dl,cnt2                                                      

 SKIP1:

MOV AL,LRGT

CMP AL,cnt3

JGE SKIP2

MOV AL,cnt3

mov dl,cnt3

skip2:

hlt

res:

  cmp dl,cnt1

   jz cont1

 

  cmp dl,cnt2

   jz cont2

 

  cmp dl,cnt3

   jz cont3

 

cont1:

  call clear_screen

  printn ""

  lea dx, scn23

  mov ah, 9

  int 21h

  lea dx, scn20

  mov ah, 9

  int 21h

  mov al,cnt1

  add al,48

  mov dl,al

  mov ah,02

  int 21h

  jmp s6

 

cont2:    

  call clear_screen

  printn ""

  lea dx, scn24

  mov ah, 9

  int 21h

  lea dx, scn20

  mov ah, 9

  int 21h

  mov al,cnt2

  add al,48

  mov dl,al

  mov ah,02

  int 21h

  jmp s6

 

cont3:

  call clear_screen

  printn ""

  lea dx, scn25

  mov ah, 9

  int 21h                                       

  lea dx, scn20

  mov ah, 9

  int 21h

  mov al,cnt3

  add al,48

  mov dl,al

  mov ah,02

  int 21h

  jmp s6 

 

find:

mov al,0

mov al,cnt2

cmp cnt1,al

jz reelection

 

mov al,0

mov al,cnt1

cmp al,cnt3

jz reelection

 

reelection: 

lea dx, scn21

mov ah, 9

int 21h

mov cnt1,0

mov cnt2,0

mov cnt2,0

mov numr1 ,0

mov numr2,0

mov numr3,0

mov tot,0

jmp main

 

 

 

ret      

define_pthis

define_print_num

define_print_num_uns

define_scan_num

define_clear_screen

 

array1 dw 101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130

array2 dw 201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220

cnt1  db 0

numr1 db ?

cnt2  db 0

numr2 db ?

cnt3  db 0

numr3 db ?

tot db   0

lrgt  db 0

 

 

scn1 db "             Online Voting System $"

scn2 db "      1.Audience   2.Constestants  3.Admin $"    

scn3 db "   Invalid Option!! $"     

scn4 db "  Audience Voting.. $"   

scn5 db "Enter Your Login ID: $"                

scn6 db "Contestant Voting..  $"  

scn7 db "The entered login ID is valid $"          

scn8 db "        Vote For The Contestant $"            

scn9 db "     1.Con1  2.Con2  3.Con3 $"      

scn10 db "Enter Password $"

scn11 db "Admin Login $"

scn12 db "1.Summary 2.Re-Election $"     

scn13 db "Enter Admin password properly $"                

scn14 db "    Summary $"

scn15 db "Individual votes $"

scn16 db "contestant 1: $"

scn18 db "contestant 2: $"             

scn19 db "contestant 3: $"

scn17 db "Votes: $"

scn20 db "No of votes: $"

scn21 db "Total votes received: $"

scn22 db "You have opted for Re-election $"

scn23 db " Election Winner :: Contestant 1 $"

scn24 db " Election Winner :: Contestant 2 $"

scn25 db " Election Winner :: Contestant 3 $"

 