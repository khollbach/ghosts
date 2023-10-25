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


 3000 rem draw_ghost(dir, vuln)
 3005 let c = 0
 3010 if dir = 21 then c = 1 : print "Blinky"
 3020 if dir = 10 then c = 3 : print "Pinky"
 3030 if dir =  8 then c = 6 : print "Inky"
 3040 if dir = 11 then c = 9 : print "Clyde"
 3045 if vuln = 1 then c = 2 : print "Vulnerable"
 3050 restore
 3060 for y = 0 to 13
 3070 for x = 0 to 13
 3080 read pix
 3090 if pix = 0 then color = 0
 3100 if pix = 1 then color = c
 3110 plot x,y*2
 3120 plot x,y*2+1
 3130 next x
 3140 next y
 3143 let x = 0 : y = 0
 3146 if vuln = 0 then gosub 5000 : rem draw_eyes
 3148 if vuln = 1 then gosub 9000 : rem draw_face
 3150 return

 4000 rem secret()
 4010 restore
 4020 for iy = 0 to 13
 4030 for ix = 0 to 13
 4040 read unused
 4050 next ix
 4060 next iy
 4070 for iy = 0 to 11
 4080 for ix = 0 to 11
 4090 read c
 4100 color = c
 4110 plot ix,iy*2
 4120 plot ix,iy*2+1
 4140 next ix
 4150 next iy
 4170 return

 5000 rem draw_eyes(x, y, dir)
 5010 if dir = 21 then x = x + 3 : y = y + 3
 5020 if dir =  8 then x = x + 1 : y = y + 3
 5030 if dir = 11 then x = x + 2 : y = y + 1
 5040 if dir = 10 then x = x + 2 : y = y + 4
 5050 gosub 6000 : rem draw_eye
 5060 x = x + 6
 5070 gosub 6000 : rem draw_eye
 5080 return

 6000 rem draw_eye(x, y, dir)
 6010 color = 15
 6020 x1 = x : x2 = x + 3 : y1 = y + 1 : y2 = y + 3
 6030 gosub 8000 : rem draw_rectangle
 6040 x1 = x + 1 : x2 = x + 2 : y1 = y : y2 = y + 4
 6050 gosub 8000 : rem draw_rectangle
 6060 gosub 7000 : rem draw_pupil
 6070 return

 7000 rem draw_pupil(x, y, dir)
 7010 let x1 = 0 : y1 = 0
 7020 if dir = 21 then x1 = x + 2 : y1 = y + 2
 7030 if dir =  8 then x1 = x     : y1 = y + 2
 7040 if dir = 11 then x1 = x + 1 : y1 = y
 7050 if dir = 10 then x1 = x + 1 : y1 = y + 3
 7060 x2 = x1 + 1 : y2 = y1 + 1
 7070 color = 2
 7080 gosub 8000 : rem draw_rectangle
 7090 return

    0 rem inclusive of both corners
 8000 rem draw_rectangle(x1, y1, x2, y2)
 8010 for iy = y1 to y2
 8020 for ix = x1 to x2
 8030 plot ix,iy*2
 8040 plot ix,iy*2+1
 8050 next ix
 8060 next iy
 8070 return

 9000 rem draw_face(x, y)
 9010 color = 7
 9020 rem eyes
 9030 x1 =  4 : y1 =  5 : x2 =  5 : y2 =  6
 9040 gosub 8000 : rem draw_rectangle
 9050 x1 =  8 : y1 =  5 : x2 =  9 : y2 =  6
 9060 gosub 8000 : rem draw_rectangle
 9070 rem mouth
 9080 x1 =  1 : y1 = 10 : x2 =  1 : y2 = 10
 9090 gosub 8000 : rem draw_rectangle
 9100 x1 =  2 : y1 =  9 : x2 =  3 : y2 =  9
 9110 gosub 8000 : rem draw_rectangle
 9120 x1 =  4 : y1 = 10 : x2 =  5 : y2 = 10
 9130 gosub 8000 : rem draw_rectangle
 9140 x1 =  6 : y1 =  9 : x2 =  7 : y2 =  9
 9150 gosub 8000 : rem draw_rectangle
 9160 x1 =  8 : y1 = 10 : x2 =  9 : y2 = 10
 9170 gosub 8000 : rem draw_rectangle
 9180 x1 = 10 : y1 =  9 : x2 = 11 : y2 =  9
 9190 gosub 8000 : rem draw_rectangle
 9200 x1 = 12 : y1 = 10 : x2 = 12 : y2 = 10
 9210 gosub 8000 : rem draw_rectangle
 9220 return

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

61000 data  0, 0, 0, 0, 0, 0, 0, 0, 0, 0,08,08
61010 data  0, 0, 0, 0, 0, 0, 0, 0,08,08,08,08
61020 data  0, 0, 0, 0, 0, 0,08,08, 0,08, 0, 0
61030 data  0, 0, 0, 0, 0,08, 0, 0, 0,08, 0, 0
61040 data  0,01,01,01,08, 0, 0, 0,08, 0, 0, 0
61050 data 01,01,01,08,01,01, 0,08, 0, 0, 0, 0
61060 data 01,01,01,01,01, 0,01,08,01,01, 0, 0
61070 data 01,15,01,01, 0,01,01,08,01,01,01, 0
61080 data 01,01,15,01, 0,01,01,01,01,01,01, 0
61090 data  0,01,01,01, 0,01,15,01,01,01,01, 0
61100 data  0, 0, 0, 0, 0,01,01,15,01,01,01, 0
61110 data  0, 0, 0, 0, 0, 0,01,01,01,01, 0, 0
