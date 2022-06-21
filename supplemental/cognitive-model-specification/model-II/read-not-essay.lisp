
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
        value NECESSARY
     =imaginal>
         fact NOT-ESSAY
     -visual>
     =goal>
       state    hypothese-fact
   )

#|(p read-not-essay-suf
      =goal>
        state     read
       =visual>
         value     "not_essay"
     =imaginal>
     ?retrieval>
        state      free
    ==>
      +retrieval>
        value SUFFICIENT
     =imaginal>
         fact NOT-ESSAY
     -visual>
     =goal>
       state    hypothese-fact
   )|#
