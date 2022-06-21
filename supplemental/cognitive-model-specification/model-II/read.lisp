
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
  ==>
    +visual-location>
      :attended nil
      < screen-y 300
    =goal>
      state    attend
)

(p attend
     =goal>
       state    attend
     =visual-location>
     ?visual>
        state   free
     ==>
     =visual-location>
     +visual>
       cmd       move-attention
       screen-pos =visual-location
       clear     t ;; Stop visual buffer from updating without explicit requests
     =goal>
       state    read
   )

(p read-essay
      =goal>
        state     read
       =visual>
         value     "essay"
     =imaginal>
     ?retrieval>
        state      free
    ==>
      +retrieval>
        value sufficient
     =imaginal>
         fact ESSAY
     -visual>
     =goal>
       state    read
   )

(p read-not-essay-nec
      =goal>
        state     read
       =visual>
         value     "not_essay"
     =imaginal>
     ?retrieval>
        state      free
    ==>
      +retrieval>
        value necessary
     =imaginal>
         fact NOT-ESSAY
     -visual>
     =goal>
       state    read
    !eval! ("print_output" ("nec"))
   )

(p read-not-essay-suf
      =goal>
        state     read
       =visual>
         value     "not_essay"
     =imaginal>
     ?retrieval>
        state      free
    ==>
      +retrieval>
        value sufficient
     =imaginal>
         fact NOT-ESSAY
     -visual>
     =goal>
       state    scan
    !eval! ("print_output" ("suf"))
)


(p read-essay-to-library-suf
      =goal>
        state     read
     =imaginal>
         - fact nil
       =visual>
         value     "if_essay_then_library"
       ?retrieval>
        state      free
    ==>
      +retrieval>
        value sufficient
     =imaginal>
     =goal>
       state    read
     =goal>
       state    attend
    !eval! ("print_output" ("read-essay-to-library-suf"))
   )


(p read-essay-to-library-nec
      =goal>
        state     read
     =imaginal>
         fact NOT-ESSAY
       =visual>
         value     "if_essay_then_library"
       ?retrieval>
        state      free
    ==>
      +retrieval>
        value necessary
     =imaginal>
     =goal>
       state    read
    !eval! ("print_output" ("read-essay-to-library-nec"))
   )

(p read-essay-to-library-first
      =goal>
        state     read
     =imaginal>
         fact     nil
       =visual>
         value    "if_essay_then_library"
    ?visual-location>
      state        free
    ==>
     =imaginal>
    +visual-location>
      color FACT
     =goal>
       state    attend
   )



(p read-textbook-to-library-suf
      =goal>
        state     read
       =visual>
         value     "if_textbook_then_library"
       ?retrieval>
        state      free
    ==>
      +retrieval>
        value sufficient
     =goal>
       state    read
   )

(p read-open-to-library-nec
      =goal>
        state     read
       =visual>
         value     "if_open_then_library"
    ?retrieval>
      state      free
     =imaginal>
      fact       essay
    ==>
     =imaginal>
    +retrieval>
      isa context
      value necessary
     =goal>
       state    read
   )


(p read-open-to-library-first
      =goal>
        state     read
     =imaginal>
         fact     nil
       =visual>
         value    "if_open_then_library"
    ?visual-location>
      state        free
    ==>
     =imaginal>
    +visual-location>
      color FACT
     =goal>
       state    attend
   )


(p retrieval-failure
      =goal>
        state     read
     ?retrieval>
        state     error
    ==>
     =goal>
       state    scan
   )


(p done-with-reading
    =goal>
      state    attend
    ?visual-location>
      buffer      failure
    =imaginal>
      fact =fact
    ==>
    =imaginal>
       fact =fact
       arg-1 nil
       arg-2 nil
    =goal>
       state   argue
)


(p yes-button
      =goal>
        state     read
       =visual>
         value     "yes"
     ==>
     =goal>
       state    attend
)

(p no-button
      =goal>
        state     read
       =visual>
         value     "no"
     ==>
     =goal>
       state    attend
)

(p unknown-button
      =goal>
        state     read
       =visual>
         value     "unknown"
     ==>
     =goal>
       state    attend
)
