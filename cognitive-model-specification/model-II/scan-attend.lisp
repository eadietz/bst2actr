(p set-defaults
    =goal>
      state    idle
    ?visual-location>
      state        free
    ?imaginal>
       buffer empty
  ==>
     +imaginal>
       fact nil
       context nil
    +visual-location>
      :attended nil
      < screen-y 200
    =goal>
      state    scan
)

(p scan
    =goal>
      state    scan
    ?visual-location>
      state        free
    =imaginal>
  ==>
    =imaginal>
    +visual-location>
      :attended nil
      < screen-y 200
    =goal>
      state    attend
)


(p done-with-reading
    =goal>
      state    scan
    =imaginal>
      fact =fact
      - fact nil
      hypo =hypo
      - hypo nil
    ==>
    =imaginal>
       arg-1 nil
       arg-2 nil
       hypo =hypo
    =goal>
       state   argue
)

(p attend
     =goal>
       state    attend
     =visual-location>
     ?visual>
        state   free
    =imaginal>
     ==>
    =imaginal>
     =visual-location>
     +visual>
       cmd       move-attention
       screen-pos =visual-location
       clear     t ;; Stop visual buffer from updating without explicit requests
     =goal>
       state    read
   )