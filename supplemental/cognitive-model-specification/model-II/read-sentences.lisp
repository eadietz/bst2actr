(p read-essay-to-library-suf
      =goal>
        state     read
     =imaginal>
        ;- fact nil
        - fact NOT-ESSAY
        - fact LIBRARY
       =visual>
         value     "if_essay_then_library"
       ?retrieval>
        state      free
    ==>
      =imaginal>
      +retrieval>
        value SUFFICIENT
     =goal>
       state    interpret-sentence
    !eval! ("print_output" ("read-essay-to-library-suf"))
   )


(p read-essay-to-library-nec
      =goal>
        state     read
     =imaginal>
        - fact nil
        - fact ESSAY
        - fact NOT-LIBRARY
       =visual>
         value     "if_essay_then_library"
       ?retrieval>
        state      free
    ==>
     =imaginal>
      +retrieval>
        value NECESSARY
     =goal>
       state    interpret-sentence
    !eval! ("print_output" ("read-essay-to-library-nec"))
   )
(p read-essay-to-library-nil-suf
      =goal>
        state     read
     =imaginal>
        fact nil
       =visual>
         value     "if_essay_then_library"
       ?retrieval>
        state      free
    ==>
      =imaginal>
      +retrieval>
        value SUFFICIENT
     =goal>
       state    interpret-sentence
    !eval! ("print_output" ("read-essay-to-library-suf"))
   )

; (spp read-essay-to-library-nil-suf :u 0) ;3.6
; (spp read-essay-to-library-nil-nec :u 0)

(p read-textbook-to-library-suf
      =goal>
        state     read
       =visual>
         value     "if_textbook_then_library"
       ?retrieval>
        state      free
    ==>
      +retrieval>
        value SUFFICIENT
     =goal>
       state    interpret-sentence
   !eval! ("print_output" ("if_textbook_then_library"))
   )

(p read-open-to-library-nec
      =goal>
        state     read
       =visual>
         value     "if_open_then_library"
      ?retrieval>
      state      free
    ==>
    +retrieval>
      value NECESSARY
     =goal>
       state    interpret-sentence
    !eval! ("print_output" ("if_open_then_library"))
   )