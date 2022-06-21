
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
      < screen-y 300
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
    ==>
    =imaginal>
       arg-1 nil
       arg-2 nil
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


(p interpret-sentence-hypo
      =goal>
        state     interpret-sentence
     =retrieval>
       hypo =val
     =imaginal>
    ==>
    @imaginal>
       value =retrieval
    +retrieval>
       value =val
     =goal>
       state    hypothese
   )

(p hypothese
      =goal>
        state     hypothese
     =retrieval>
        value =hypo
     =imaginal>
    ==>
    =imaginal>
       hypo =hypo
    =retrieval>
     =goal>
       state    scan
   )

#|(p interpret-sentence
      =goal>
        state     interpret-sentence
     =retrieval>
       hypo =val
     =imaginal>
    ==>
    @imaginal>
       value =retrieval
    =retrieval>
     =goal>
       state    scan
   )|#

(p hypothese-fact
      =goal>
        state     hypothese-fact
      =retrieval>
    ==>
     @retrieval>
     =goal>
       state     scan
   )


