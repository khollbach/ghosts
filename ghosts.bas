    1 gosub 1000
    2 end


 1000 rem main()
 1020 home : gr
 1025 let code$ = chr$(11) + chr$(11) + chr$(10) + chr$(10) + chr$(8) + chr$(21) + chr$(8) + chr$(21)
 1030 let vuln = 0
 1040 let dir = 21
 1050 let buf$ = ""
 1060 rem : loop start
 1080 gosub 3000

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


 3000 rem print_ghost()
 3005 let c = 0
 3010 if dir = 21 then c = 1 : print "Blinky"
 3020 if dir = 10 then c = 3 : print "Pinky"
 3030 if dir =  8 then c = 6 : print "Inky"
 3040 if dir = 11 then c = 12 : print "Clyde"
 3045 if vuln = 1 then c = 2 : print "Vulnerable"
 3050 restore
 3060 for y = 0 to 13
 3070 for x = 0 to 13
 3080 read pix
 3090 if pix = 0 then color = 0
 3100 if pix = 1 then color = c
 3110 plot x,y*2
 3120 plot x,y*2+1
 3125 for tm = 1 to 1000 : next : rem the emulator needs us to slow down
 3130 next x
 3140 next y
 3150 return


 4000 rem easter_egg()
 4010 print "todo"
 4020 return


60000 data 0,0,0,0,0,1,1,1,1,0,0,0,0,0
60010 data 0,0,0,1,1,1,1,1,1,1,1,0,0,0
60020 data 0,0,1,1,1,1,1,1,1,1,1,1,0,0
60030 data 0,1,1,1,1,1,1,1,1,1,1,1,1,0
60040 data 0,1,1,1,1,1,1,1,1,1,1,1,1,0
60050 data 0,1,1,1,1,1,1,1,1,1,1,1,1,0
60060 data 1,1,1,1,1,1,1,1,1,1,1,1,1,1
60070 data 1,1,1,1,1,1,1,1,1,1,1,1,1,1
60080 data 1,1,1,1,1,1,1,1,1,1,1,1,1,1
60090 data 1,1,1,1,1,1,1,1,1,1,1,1,1,1
60100 data 1,1,1,1,1,1,1,1,1,1,1,1,1,1
60110 data 1,1,1,1,1,1,1,1,1,1,1,1,1,1
60120 data 1,1,1,1,0,1,1,1,1,0,1,1,1,1
60130 data 0,1,1,0,0,0,1,1,0,0,0,1,1,0
