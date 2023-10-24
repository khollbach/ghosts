    1 gosub 1000
    2 end


 1000 rem main()
 1020 home : gr
 1025 let code$ = chr$(11) + chr$(11) + chr$(10) + chr$(10) + chr$(8) + chr$(21) + chr$(8) + chr$(21)
 1030 let vuln = 0
 1040 let dir = 21
 1050 let buf$ = ""
 1060 rem : loop start
 1070 if vuln = 1 then gosub 2000
 1080 if vuln = 0 then gosub 3000

 1090 get k$
 1100 let a = asc(k$)
 1110 buf$ = buf$ + k$
 1120 if len(buf$) = 16 then buf$ = right$(buf$, 8)

 1130 if right$(buf$, 8) = code$ then gosub 4000 : goto 1060
 1140 if a = dir and vuln = 0 then vuln = 1 : goto 1060
 1150 if a=21 or a=10 or a=8 or a=11 then vuln=0 : dir=a : goto 1060
 1160 if vuln = 1 then vuln = 0 : goto 1060
 1170 if dir = 21 then dir = 10 : goto 1060
 1180 if dir = 10 then dir =  8 : goto 1060
 1190 if dir =  8 then dir = 11 : goto 1060
 1200 if dir = 11 then dir = 21 : goto 1060
 1210 goto 1210 : rem unreachable


 2000 rem print_vulnerable()
 2010 print "Vulnerable"
 2020 return


 3000 rem print_ghost()
 3010 if dir = 21 then print "Blinky"
 3020 if dir = 10 then print "Pinky"
 3030 if dir =  8 then print "Inky"
 3040 if dir = 11 then print "Clyde"
 3050 return


 4000 rem easter_egg()
 4010 print "todo"
 4020 return
