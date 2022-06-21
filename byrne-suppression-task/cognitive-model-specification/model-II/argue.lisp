
 (p retrieve-argument-with-hypo
     =goal>
       state argue
     ?retrieval>
       state free
    =imaginal>
       fact =fact
       hypo =hypo
       arg-1 nil
       arg-2 nil
     ==>
    =imaginal>
       hypo-1 =hypo
    +retrieval>
       - position nil
       fact =fact
       hypo =hypo
    =goal>
        state    argue
    ; !eval! ("print_output" (list "retrieve argument"))
 )


 (p retrieve-argument-without-hypo
     =goal>
       state argue
     ?retrieval>
       state free
    =imaginal>
       fact =fact
       arg-1 nil
       arg-2 nil
     ==>
    =imaginal>
    +retrieval>
       - position nil
       fact =fact
    =goal>
        state    argue
    ; !eval! ("print_output" (list "retrieve argument"))
 )

;(spp retrieve-argument :u 0)
;(spp retrieve-argument-with-hypo :u 2)

 (p retrieve-argument-failure
    =goal>
        state     argue
    =imaginal>
       arg-1       nil
     ?retrieval>
        state     error
     ==>
    =imaginal>
    =goal>
      state scan
    ;!eval! ("print_output" (list "arg retrieval error: re-read"))
 )

 (p retrieve-counter
    =goal>
        state     argue
    =imaginal>
       arg-1       nil
     ?retrieval>
        state     free
    =retrieval>
       position  =position
       ;strength =strength
       hypo     =hypo
     ==>
    =imaginal>
       arg-1      =position
       ;strength-1 =strength
       hypo-1     =hypo
    +retrieval>
       neg-position     =position
       hypo =hypo
   =goal>
      state argue
   ;!eval! ("print_output" ("try retrieve counter"))
 )

 (p one-argument-respond
    =goal>
        state     argue
    =imaginal>
       arg-1       nil
     ?retrieval>
        state     free
    =retrieval>
       position     =position
       strength     =strength
     ==>
  =imaginal>
      value       =position
  =goal>
     state respond
   ;!eval! ("print_output" ("dont retrieve counter"))
 )

 (p retrieve-counter-failure
     =goal>
      state argue
     ?retrieval>
        state     error
    =imaginal>
       arg-1      =position
       - arg-1       nil
     ==>
  =imaginal>
      value       =position
  =goal>
     state respond
    ;!eval! ("print_output" (list "counter arg retrieval error: respond " =position))
 )

 (p retrieve-counter-failure-reread
     =goal>
      state argue
     ?retrieval>
        state     error
    =imaginal>
       arg-1      =position
    ?imaginal>
       state    free
     ==>
  +imaginal>
       fact nil
       context nil
  =goal>
     state scan
    ;!eval! ("print_output" (list "counter arg retrieval error: re-read"))
 )


 (p add-counter-to-arguments
    =goal>
        state    argue
    =retrieval>
       position     =position
       strength     =strength
       hypo         =hypo
    =imaginal>
       - arg-1      nil
       arg-2        nil
   ==>
    =imaginal>
       arg-2        =position
       ;strength-2   =strength
       hypo-1       =hypo
    +retrieval>
       - position nil
    =goal>
        state    argue
   ;!eval! ("print_output" ("retrieved counter, compare strength"))
 )

;(spp retrieve-counter :u 0)
;(spp one-argument-respond :u 0) ; 5.8
;(spp retrieve-counter-failure-reread :u 0)
;(spp retrieve-counter-failure :u 0)

#|(p arg-1-stronger
   =goal>
      state    argue
   =imaginal>
      strength-1   =val
      < strength-2 =val
      arg-1        =pos1
      arg-2        =pos2
      fact         =fact
   ==>
   =imaginal>
     value =pos1
  =goal>
     state respond
)

(p arg-2-stronger
   =goal>
      state    argue
   =imaginal>
      strength-1   =val
      > strength-2 =val
      arg-1        =pos1
      arg-2        =pos2
      fact         =fact
   ==>
   =imaginal>
     value =pos2
  =goal>
     state respond
)|#


(p arg-1-hypo
   =goal>
      state    argue
   =imaginal>
      arg-1        =pos1
      arg-2        =pos2
      fact         =fact
      - hypo-1       nil
   ==>
   =imaginal>
     value =pos1
  =goal>
     state respond
)

(p arg-2-hypo
   =goal>
      state    argue
   =imaginal>
      arg-1        =pos1
      arg-2        =pos2
      fact         =fact
      - hypo-2       nil
   ==>
   =imaginal>
     value =pos2
  =goal>
     state respond
)

#|(p choose-arg-1
   =goal>
      state    argue
   =imaginal>
      arg-1        =pos1
   ==>
   =imaginal>
     value =pos1
  =goal>
     state respond
)

(p choose-arg-2
   =goal>
      state    argue
   =imaginal>
      arg-2        =pos2
   ==>
   =imaginal>
     value =pos2
  =goal>
     state respond
)

(p choose-highest-activation
   =goal>
      state    argue
   =imaginal>
      ;strength-1   =val
      ;strength-2   =val
      ;arg-1        =pos1
      ;arg-2        =pos2
      ;fact         =fact
   =retrieval>
       position =pos
   ==>
   =imaginal>
     value =pos
  =goal>
     state respond
 )|#
