   10  print "/*" : print " * $Id: TAB (" + argv$(0) + ") v " + v$ + " tabular memory inspector Tue Aug 11 18:24:28 GMT 2020 underwood $"
   20  print " */" : print
   30  if argv$(1) = "h" or arg$(1) = "/h" or argv$(1) = "?" or arg$(1) = "/?" or argv$(1) = "help" or argv$(1) = "/help" then goto 430
   40  if argv$(1) = "" then input "user? " ; t$ : if t$ = "" then goto 40
   50  if argv$(2) <> "" then se$ = argv$(2)
   60  if t$ = "*" then t$ = ""
   70  if argv$(1) <> "" then t$ = argv$(1) : if t$ = "*" then t$ = ""
   80  if se$ = "" then input "field? " ; se$ : if se$ = "" or se$ = "*" then goto 80
   90  if se$ = "term" or se$ = "stack" or se$ = "func" or se$ = "cmd" or se$ = "status" or se$ = "cmd" or se$ = "ipaddr" then print " port" + chr$(9) ;
  100  selo$ = "" : for z = 1 to len(se$) : selo$ = selo$ + chr$(32+asc(mid$(ups$(se$),z,1))) : next z
  110  print " username" + chr$(9) + selo$
  120  if se$ = "term" or se$ = "stack" or se$ = "func" or se$ = "cmd" or se$ = "status" or se$ = "cmd" or se$ = "ipaddr" then print " ----" + chr$(9) ;
  130  print " --------" + chr$(9) + string$(len(se$),"-")
  140  for i = 512 to 1e6
  150  if peek(i) = 0 and peek(i+1) = 0 and peek(i+2) = 255 and peek(i+3) = 255 then print : print "[Process complete]" : end
  160  u$ = "" : sleep 0
  170  if chr$(peek(i))+chr$(peek(i+1))+chr$(peek(i+2))+chr$(peek(i+3))+chr$(peek(i+4))+chr$(peek(i+5)) = chr$(0)+"user " then gosub 200
  180  next i
  190  end
  200  u$ = chr$(peek(i+6))+chr$(peek(i+7))+chr$(peek(i+8))+chr$(peek(i+9))+chr$(peek(i+10))+chr$(peek(i+11))+chr$(peek(i+12))+chr$(peek(i+13))+chr$(peek(i+14))
  210  if instr(u$,chr$(0)) <> -1 then u$ = left$(u$,instr(u$,chr$(0)))
  220  if instr(u$,t$) <> -1 then gosub 240
  230  return
  240  for f = i to 1e6
  250  if left$( chr$(peek(f))+chr$(peek(f+1))+chr$(peek(f+2))+chr$(peek(f+3))+chr$(peek(f+4))+chr$(peek(f+5))+chr$(peek(f+6))+chr$(peek(f+7)),len(se$) ) = se$ then gosub 280 : return
  260  next f
  270  return
  280  output$ = "" : for g = f+(len(se$)+1) to 1e6
  290  output$ = output$ + chr$(peek(g))
  300  if u$ = "guest" or u$ = "operator" or ut(u$) = 1 then return
  310  if se$ = "term" or se$ = "stack" or se$ = "func" or se$ = "cmd" or se$ = "status" or se$ = "cmd" or se$ = "ipaddr" then if chr$(peek(g)) = chr$(0) then print " " + str$(peek(i-1)) + chr$(9) ;
  320  if se$ = "tver" or se$ = "last" then if chr$(peek(g)) = chr$(0) then print " " + u$ + string$(9-len(u$)," ") + chr$(9) ; : gosub 400 : gosub 380 : goto 360
  330  if peek(g) = 0 and peek(g-1) <> 0 then print " " + u$ + string$(9-len(u$)," ") + chr$(9) + output$ : gosub 380 : goto 360
  340  next g
  350  return
  360  if t$ = "" then return
  370  end
  380  if se$ <> "stack" then ut(u$) = 1
  390  return
  400  if len(output$) < 4 then print : return
  410  for e = 1 to 4 : print str$( asc( mid$(output$,e,1) ) ) + " " ; : next e : print
  420  return
  430  print "%usage: " + argv$(0) + " [user] [field]"
  440  print " e.g: " + argv$(0) + " " + user$ + " " + "core" : print " enter '*' as the user variable to show all active users"
  450  print ""