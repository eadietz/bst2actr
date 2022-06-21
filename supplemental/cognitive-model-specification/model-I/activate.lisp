


 (p enough-values-to-reason
     =goal>
        state    idle
     ?retrieval>
        state  free
     =imaginal>
       - f-sentence nil
       - s-sentence nil
       - fact nil
       f-sentence =f
       s-sentence =s
       fact =fact
     ==>
     +retrieval>
       isa meaning
       word =fact
     =imaginal>
     =goal>
        state    retrieve-fact
     !output! (enough values to reason =f =s =fact +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++)
   )

 ;;;;;;;;;;;;;;;;;;;;;;;; RETRIEVE SENTENCE SEMANTICS ;;;;;;;;;;;;;;;;;;;;;;;;


 (p activate-fact-semantics
     =goal>
        state     retrieve-fact
     =retrieval>
       word    =fact
       context =context
     =imaginal>
       s-sentence =s
    ==>
     =imaginal>
       fact =fact
       interpretation =retrieval
       context =context
     +retrieval>
       isa meaning
       word =s
     =goal>
        state     activate-context
 )

 (p activate-context-semantics
      =goal>
        state     activate-context
     =retrieval>
        context =context
     =imaginal>
     ==>
     =imaginal>
       context  =context
     =retrieval>
     =goal>
        state    search-for-args
 )
