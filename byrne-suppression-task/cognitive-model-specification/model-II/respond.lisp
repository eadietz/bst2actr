
 (p prepare-mouse
      =goal>
        state    respond
     =imaginal>
      value =val
    ==>
    -imaginal>
    +visual-location>
        kind  oval
        value =val
      =goal>
        state    respond
      !eval! ("print_output" (list =val))
 )

 (p move-mouse
    =goal>
       state      respond
    =visual-location>
        kind  oval
    ?visual>
       state      free
    ?manual>
       state      free
   ==>
    +visual>
       isa        move-attention
       screen-pos =visual-location
    +manual>
       isa        move-cursor
       loc        =visual-location
    =goal>
       state      respond)



#| (p dont-move-mouse-clock
    =goal>
       state      respond
    =visual-location>
        kind  oval
    =manual>
       loc        =visual-location
    ?manual>
       state      free
   ==>
    -goal>
    +manual>
       isa    click-mouse)|#



 (p click-mouse
    =goal>
       state  respond
    ?manual>
      last-command   move-cursor
      state  free
   ==>
    -goal>
    +manual>
       isa    click-mouse
 )

