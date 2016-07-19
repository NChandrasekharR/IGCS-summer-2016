globals [
            ni-patches                                                  ;non industrial area
            cipcot-patches                                              ;Sipcot area
   crowded-patch

        ]

patches-own
       [
           land-value                                                  ; Price of land of each patch
           fertility-value                                             ;To represent fertility of each
       ]

turtles-own
     [
  money-saved
      ]

breed [ worker workers]                                                                                                  ;Workers (Sipcot)
breed [ farmer farmers]

to Setup

  clear-all
  ask patches [ set pcolor blue]
  set cipcot-patches patches with [pycor > -4 and pycor < 4 and pxcor > -4 and pxcor < 4]
  set ni-patches patches with [ pycor <= -4 or pxcor <=  -4 or pxcor >= 4 or pycor >= 4 ]
  ask patch (1) (0) [
    set crowded-patch self
    set plabel-color white                                                                                              ;To print Label Sipcot in Sipcot area
    set plabel "SIPCOT"
                    ]

  ask patches [set land-value 25]                                                                                      ;Setting the initial land value of all patches to 25
  ask patches [ if pxcor > 25 or pycor > 20 or pxcor < -25 or pycor < -20 [set land-value land-value - 1 ]]           ;Decreasing the land values as we move away from Sipcot
  ask patches [ if pxcor > 24 or pycor > 19 or pxcor < -24 or pycor < -19 [set land-value land-value - 1 ]]                         ;                        "
  ask patches [ if pxcor > 23 or pycor > 18 or pxcor < -23 or pycor < -18 [set land-value land-value - 1 ]]
  ask patches [ if pxcor > 22 or pycor > 17 or pxcor < -22 or pycor < -17 [set land-value land-value - 1 ]]
  ask patches [ if pxcor > 21 or pycor > 16 or pxcor < -21 or pycor < -16 [set land-value land-value - 1 ]]
  ask patches [ if pxcor > 20 or pycor > 15 or pxcor < -20 or pycor < -15 [set land-value land-value - 1 ]]
  ask patches [ if pxcor > 19 or pycor > 14 or pxcor < -19 or pycor < -14 [set land-value land-value - 1 ]]
  ask patches [ if pxcor > 18 or pycor > 13 or pxcor < -18 or pycor < -13 [set land-value land-value - 1 ]]
  ask patches [ if pxcor > 17 or pycor > 12 or pxcor < -17 or pycor < -12 [set land-value land-value - 1 ]]
  ask patches [ if pxcor > 16 or pycor > 11 or pxcor < -16 or pycor < -11 [set land-value land-value - 1 ]]
  ask patches [ if pxcor > 15 or pycor > 10 or pxcor < -15 or pycor < -10 [set land-value land-value - 1 ]]
  ask patches [ if pxcor > 14 or pycor > 9  or pxcor < -14 or pycor < -9  [set land-value land-value - 1 ]]
  ask patches [ if pxcor > 13 or pycor > 8  or pxcor < -13 or pycor < -8  [set land-value land-value - 1 ]]
  ask patches [ if pxcor > 12 or pycor > 7  or pxcor < -12 or pycor < -7  [set land-value land-value - 1 ]]
  ask patches [ if pxcor > 11 or pycor > 6  or pxcor < -11 or pycor < -6  [set land-value land-value - 1 ]]
  ask patches [ if pxcor > 10 or pycor > 5  or pxcor < -10 or pycor < -5  [set land-value land-value - 1 ]]
  ask patches [ if pxcor > 9  or pycor > 4  or pxcor < -9 or pycor < -4   [set land-value land-value - 1 ]]

  ask patches [ if pycor > -2 and pycor < 2 and pxcor > -2 and pxcor < 2  [set land-value land-value * 20]]              ;Increasing land value in Sipcot region


  ask patches [ set pcolor scale-color blue land-value  50 0 ]                                                    ;Background according to land value (blue)

  ask patches[ if pycor > -2 and pycor < 2 and pxcor > -2 and pxcor < 2 [ set pcolor brown - 3]]                  ;Setting Brown color for Sipcot region

  ask patches [ set fertility-value random 10]                                                                   ;Initializing random values of fertility to land patches


  create-workers                                                                                                ;Funtion to create Workers anywhere in non idustrial area

  create-farmers                                                                                            ;Funtion to create Farmers anywhere in non industrial area

  ask turtles [ set money-saved land-value + random (10)]            ;Assign Money-saved value to Workers & Farmers depending on their land value and additional savings

 reset-ticks                                                                                                                     ;Resets tick value to zero

end

to create-workers
  create-worker no-workers
[ set shape "worker"
 move-to-empty-one-of ni-patches
   set size 2

   pen-down  set color yellow
   ]

end

to create-farmers
  create-farmer no-farmers
 [ set shape "farmer"
    move-to-empty-one-of ni-patches
    set size 2
    pen-down set color black
    ]

end

to move-to-empty-one-of [locations]                                                                                              ;Randomly assigning initial positions to
  move-to one-of locations                                                                                                       ; Workers and Farmers in the non-industrial area
  while [any? other turtles-here] [
    move-to one-of locations
  ]
end

to Go

  ask patches [ set land-value land-value * inflation-rate-land]                                                    ;Updating land price after each tick where the inflation rate is taken from user
  ask worker [ set money-saved money-saved + (inf-rate-income * 25)]
  ask worker [ if xcor > 25 or ycor > 20 or xcor < -25 or ycor < -20 [set money-saved money-saved - 1 ]]                         ;Decreasing the land values as we move away from Sipcot
  ask worker [ if xcor > 24 or ycor > 19 or xcor < -24 or ycor < -19 [set money-saved money-saved - 1 ]]                         ;                        "
  ask worker [ if xcor > 23 or ycor > 18 or xcor < -23 or ycor < -18 [set money-saved money-saved - 1 ]]
  ask worker [ if xcor > 22 or ycor > 17 or xcor < -22 or ycor < -17 [set money-saved money-saved - 1 ]]
  ask worker [ if xcor > 21 or ycor > 16 or xcor < -21 or ycor < -16 [set money-saved money-saved - 1 ]]
  ask worker [ if xcor > 20 or ycor > 15 or xcor < -20 or ycor < -15 [set money-saved money-saved - 1 ]]
  ask worker [ if xcor > 19 or ycor > 14 or xcor < -19 or ycor < -14 [set money-saved money-saved - 1 ]]
  ask worker [ if xcor > 18 or ycor > 13 or xcor < -18 or ycor < -13 [set money-saved money-saved - 1 ]]
  ask worker [ if xcor > 17 or ycor > 12 or xcor < -17 or ycor < -12 [set money-saved money-saved - 1 ]]
  ask worker [ if xcor > 16 or ycor > 11 or xcor < -16 or ycor < -11 [set money-saved money-saved - 1 ]]
  ask worker [ if xcor > 15 or ycor > 10 or xcor < -15 or ycor < -10 [set money-saved money-saved - 1 ]]
  ask worker [ if xcor > 14 or ycor > 9  or xcor < -14 or ycor < -9  [set money-saved money-saved - 1 ]]
  ask worker [ if xcor > 13 or ycor > 8  or xcor < -13 or ycor < -8  [set money-saved money-saved - 1 ]]
  ask worker [ if xcor > 12 or ycor > 7  or xcor < -12 or ycor < -7  [set money-saved money-saved - 1 ]]
  ask worker [ if xcor > 11 or ycor > 6  or xcor < -11 or ycor < -6  [set money-saved money-saved - 1 ]]
  ask worker [ if xcor > 10 or ycor > 5  or xcor < -10 or ycor < -5  [set money-saved money-saved - 1 ]]
  ask worker [ if xcor > 9  or ycor > 4  or xcor < -9 or  ycor < -4  [set money-saved money-saved - 1 ]]

  ask farmer [ set money-saved money-saved + (inf-rate-income * fertility-value) ]                              ;Setting the income of farmer depending on the fertility of land

  ask turtles [ set money-saved money-saved - (inf-rate-expenditure * random 5)]                                ;Reducing the money saved depending on expenditure

  ifelse display-label = "Money-Saved"
   [ ask turtles [ set label money-saved]]
    [ifelse display-label = "Land-Value"
     [ask patches [ set plabel land-value ]]
      [if display-label = "Fertility"
       [ask patches [ set pcolor scale-color green fertility-value 10 0 ]]]]

  ask worker [ if xcor < 12 or ycor < 7  or xcor > -12 or ycor > -7  [if count turtles > 5  [set money-saved money-saved - (inf-rate-expenditure * random 3) ]]]
  ask worker [ if xcor < 11 or ycor < 6  or xcor > -11 or ycor > -6  [if count turtles > 5  [set money-saved money-saved - (inf-rate-expenditure * random 3) ]]]
  ask worker [ if xcor < 10 or ycor < 5  or xcor > -10 or ycor > -5  [if count turtles > 5  [set money-saved money-saved - (inf-rate-expenditure * random 3) ]]]
  ask worker [ if xcor < 9  or ycor < 4  or xcor > -9 or  ycor > -4  [if count turtles > 5  [set money-saved money-saved - (inf-rate-expenditure * random 3) ]]]
  ask worker [ if xcor < 10 or ycor < 5  or xcor > -10 or ycor > -5  [if count turtles > 10 [set money-saved money-saved - (inf-rate-expenditure * random 5) ]]]
  ask worker [ if xcor < 9  or ycor < 4  or xcor > -9 or  ycor > -4  [if count turtles > 10 [set money-saved money-saved - (inf-rate-expenditure * random 5) ]]]



  worker-shift-up                                                                                 ; function to shift workers near cipcot

  worker-shift-down                                                                              ; function to shift workers away from cipcot


  farmer-shift

 if ticks > 5 [farmer-transform]                                                                                ; farmer-transform function comes into play after 5 ticks ( years)

 farmer-die                                                                                                     ; function for farmer suicide

 ask worker [ if money-saved < 0 [set money-saved random 3 + 1] ]

 tick

end

to worker-shift-up

  ask worker[ if money-saved > land-value [ uphill land-value ]]                       ; Worker will shift closer to sipcot if he has money saved more than the land value

end

to worker-shift-down

  ask worker[ if  50 > random 100 and  money-saved < land-value  [ downhill land-value ]]          ; Worker will move away from sipcot if he has less money saved than the land value

end

to farmer-shift

  ask farmer [ if land-value > money-saved  [ downhill land-value]]                             ;Farmer will sell his land and move away if he has less money saved up than his land value

end


to farmer-transform

 ask farmer [if random 100 < 50 and land-value > money-saved[set breed worker set shape "farker" ]]        ;There is a 50% chance that the farmer will become a worker if his
                                                                                                           ;land value is more than his money saved

end

to farmer-die

  ask farmer [ if money-saved + random 5 < 0 [die]]                                                   ;If a farmer runs out of his savings and a certain amount of debt he may suicide

end
@#$#@#$#@
GRAPHICS-WINDOW
294
10
1083
597
31
22
12.37
1
10
1
1
1
0
0
0
1
-31
31
-22
22
0
0
1
ticks
30.0

BUTTON
63
33
127
66
NIL
Setup\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

SLIDER
14
98
187
131
no-workers
no-workers
0
100
49
1
1
NIL
HORIZONTAL

SLIDER
14
155
187
188
no-farmers
no-farmers
0
100
100
1
1
NIL
HORIZONTAL

CHOOSER
29
210
168
255
display-label
display-label
"Money-Saved" "Land-Value" "Fertility" "No-Label"
2

SLIDER
20
302
270
335
inflation-rate-land
inflation-rate-land
0.90
1.07
1.01
0.005
1
NIL
HORIZONTAL

SLIDER
29
385
264
418
inf-rate-income
inf-rate-income
0.90
1.07
1.005
0.005
1
NIL
HORIZONTAL

SLIDER
14
447
278
480
inf-rate-expenditure
inf-rate-expenditure
0.90
1.07
1.02
0.005
1
NIL
HORIZONTAL

BUTTON
1222
53
1285
86
NIL
Go
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

PLOT
1111
168
1311
318
plot 1
Ticks
Populations
0.0
100.0
0.0
100.0
true
true
"" ""
PENS
"Workers" 1.0 0 -16777216 true "" "plot count worker"
"Farmers" 1.0 0 -7500403 true "" "plot count farmer"

MONITOR
1123
358
1208
403
Farmer
count farmer
0
1
11

MONITOR
1157
424
1214
469
Worker
count worker
0
1
11

MONITOR
1233
362
1290
407
Suicides
no-workers + no-farmers - count turtles
0
1
11

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

farker
false
15
Circle -2674135 true false 110 5 80
Polygon -2674135 true false 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -16777216 true false 127 79 172 94
Polygon -2674135 true false 195 90 240 150 225 180 165 105
Polygon -2674135 true false 105 90 60 150 75 180 135 105
Rectangle -16777216 true false 150 90 150 135
Rectangle -16777216 true false 135 90 165 105
Polygon -16777216 true false 135 105 150 180 165 105
Polygon -16777216 true false 60 90 60 150 45 150 45 75 60 75 60 90
Rectangle -7500403 true false 30 45 75 75

farmer
false
15
Circle -1184463 true false 110 5 80
Polygon -1184463 true false 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -2674135 true false 127 79 172 94
Polygon -1184463 true false 195 90 240 150 225 180 165 105
Polygon -1184463 true false 105 90 60 150 75 180 135 105
Polygon -2674135 true false 60 120 60 150 45 150 45 120 30 90 30 60 60 30 60 45 45 60 45 90 60 120

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

worker
false
15
Circle -11221820 true false 110 5 80
Polygon -11221820 true false 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -16777216 true false 127 79 172 94
Polygon -11221820 true false 195 90 240 150 225 180 165 105
Polygon -11221820 true false 105 90 60 150 75 180 135 105
Rectangle -16777216 true false 150 90 150 135
Rectangle -2674135 true false 135 90 165 105
Polygon -2674135 true false 135 105 150 180 165 105
Polygon -2674135 true false 60 90 60 150 45 150 45 75 60 75 60 90
Rectangle -7500403 true false 30 45 75 75

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270

@#$#@#$#@
NetLogo 5.3.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180

@#$#@#$#@
0
@#$#@#$#@
