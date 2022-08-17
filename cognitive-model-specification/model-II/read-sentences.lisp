(p read-essay-to-library-suf
      =goal>
        state     read
     =imaginal>
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
        value SUFFICIENT
     =goal>
       state    interpret-sentence
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
    !eval! ("reset_visual_finsts")
   )

