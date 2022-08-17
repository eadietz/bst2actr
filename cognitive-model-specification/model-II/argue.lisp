 (p retrieve-argument
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
 )

 (p one-argument-respond
    =goal>
        state     argue
    =imaginal>
       arg-1       nil
       fact       =fact
     ?retrieval>
        state     free
    =retrieval>
       position     =position
       strength =strength
       hypo     =hypo
     ==>
  =imaginal>
      value       =position
  =goal>
     state respond
   !eval! ("print_output" ("one argument respond" =position))
 )

(spp one-argument-respond :u 2.8)

 (p retrieve-counter
    =goal>
        state     argue
    =imaginal>
       arg-1      nil
       fact       =fact
     ?retrieval>
        state     free
    =retrieval>
       position  =position
       strength =strength
       hypo     =hypo
     ==>
    =imaginal>
       arg-1      =position
       strength-1 =strength
       hypo-1     =hypo
    +retrieval>
       fact =fact
       neg-position     =position
   =goal>
      state argue
   !eval! ("print_output" ("try retrieve counter"))
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
    !eval! ("print_output" (list "counter arg retrieval error: re-read"))
 )

 (p add-counter-to-imaginal
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
       strength-2   =strength
       hypo-2       =hypo
    =retrieval>
    =goal>
        state    argue
   !eval! ("print_output" ("retrieved counter, compare arguments"))
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
    !eval! ("print_output" (list "counter arg retrieval error: respond " =position))
 )


(p arg-1-hypo
   =goal>
      state    argue
   =imaginal>
      - arg-1      nil
      arg-1        =pos
      - arg-2      nil
      hypo-2     NONE
   ==>
   =imaginal>
     value =pos
  =goal>
     state respond
   !eval! ("print_output" ("argo-1-hypo"))
)

(p arg-2-hypo
   =goal>
      state    argue
   =imaginal>
      - arg-2      nil
      arg-2        =pos
      - arg-1      nil
      hypo-1     NONE
   ==>
   =imaginal>
     value =pos
  =goal>
     state respond
   !eval! ("print_output" ("argo-2-hypo"))
)

(p arg-1-stronger
   =goal>
      state    argue
   =imaginal>
      strength-1   =val
      < strength-2 =val
      arg-1        =pos1
      arg-2        =pos2
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
   ==>
   =imaginal>
     value =pos2
  =goal>
     state respond
)

#|
(p choose-with-highest activation
   =goal>
      state    argue
   =imaginal>
      - arg-1       nil
      - arg-2       nil
      fact         =fact
   ==>
   =imaginal>
   +retrieval>
      fact =fact
      - position nil
  =goal>
     state respond
   !eval! ("print_output" ("highest activation"))
 )


(p failed-to-choose-highest-activation
   =goal>
     ?retrieval>
        state     error
    ?imaginal>
       state    free
     ==>
  +imaginal>
       fact nil
       context nil
  =goal>
     state scan
    !eval! ("print_output" (list "arg with highest activation retrieval error: re-read"))
 )


; randomly choose either position of arg-1 or arg-2
(p choose-arg-1
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
)|#
