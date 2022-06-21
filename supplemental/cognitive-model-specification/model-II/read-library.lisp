
#|(p read-library-suf
      =goal>
        state     read
       =visual>
         value     "library"
     =imaginal>
     ?retrieval>
        state      free
    ==>
      +retrieval>
        value sufficient
     =imaginal>
         fact LIBRARY
     -visual>
     =goal>
       state    hypothese-fact
   )|#

(p read-library-nec
      =goal>
        state     read
       =visual>
         value     "library"
     =imaginal>
     ?retrieval>
        state      free
    ==>
      +retrieval>
        value necessary
     =imaginal>
         fact LIBRARY
     -visual>
     =goal>
       state    hypothese-fact
   )