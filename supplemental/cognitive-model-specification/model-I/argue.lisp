
 ;;;;;;;;;;;;;;;;;;;;;;;; RETRIEVE, COMPARE AND CHOOSE ARGUMENTS ;;;;;;;;;;;;;;;;;;;;;;;;

 (p retrieve-argument
      =goal>
        state     search-for-args
     ?retrieval>
       state free
    =imaginal>
       fact =fact
     ==>
    =imaginal>
       arg-1 nil
       arg-2 nil
    +retrieval>
       - position nil
       fact =fact
    =goal>
        state    retrieve-counter
 )

 (p retrieve-counter
      =goal>
        state     retrieve-counter
    =imaginal>
    =retrieval>
       fact         =fact
       position     =position
       neg-position =neg-position
     ==>
    =imaginal>
       arg-1   =position
    +retrieval>
       fact =fact
       neg-position =position
    =goal>
        state    imagine-counter
 )

 (p imagine-counter
    =goal>
        state    imagine-counter
    =retrieval>
       position     =position
    =imaginal>
   ==>
    =imaginal>
       arg-2    =position
    =retrieval>
    =goal>
        state    retrieve-most-likely
 )

 (p retrieve-most-likely-arg
    =goal>
        state    retrieve-most-likely
    =retrieval>
    =imaginal>
       fact =fact
       - arg-1   nil
       - arg-2   nil
   ==>
    =imaginal>
    +retrieval>
       fact =fact
       - position nil
    =goal>
        state    choose-strongest
 )


 (p choose
    =goal>
     state       choose-strongest
    =retrieval>
       position =val
       fact     =fact
       context     =context
    =imaginal>
     value  nil
     arg-1   =arg1
     arg-2   =arg2
   ==>
    =retrieval>
    =imaginal>
      value =val
   =goal>
      state prepare-mouse
 )

