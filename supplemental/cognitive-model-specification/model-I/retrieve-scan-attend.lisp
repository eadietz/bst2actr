
 (p retrieve-item-from-list
      =goal>
        state    idle
      ?retrieval>
        state     free
     ?imaginal>
       state    free
     ==>
      +retrieval>
        - current-on-list    nil
      +imaginal>
       f-sentence nil
       s-sentence nil
       fact     nil
      =goal>
  )

  (p scan-if-item-retrieved
       =goal>
        state    idle
       =retrieval>
         current-on-list       =name
       ?visual-location>
         state     free
       ?visual>
         state     free
       =imaginal>
     ==>
      +visual-location>
         color =name
     +visual>
         clear     t ;; Stop visual buffer from updating without explicit requests
      =retrieval>
     =goal>
       state    attend
     =imaginal>
     )

 (p attend
     =goal>
       state    attend
     =visual-location>
     ?visual>
        state   free
     =imaginal>
     ==>
     =visual-location>
     +visual>
       cmd       move-attention
       screen-pos =visual-location
     =goal>
       state    read
     =imaginal>
   )

   (p read-info
      =goal>
        state     read
      =retrieval>
       current-on-list  =current
       next-on-list  =next
       =visual>
         value     =val
     =imaginal>
     ==>
     =imaginal>
         =current =val
     +retrieval>
       current-on-list  =next
     =goal>
       state    idle
   )