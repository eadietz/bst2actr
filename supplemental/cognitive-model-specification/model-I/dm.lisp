
(add-dm
 (starting-goal isa goal state idle)
 (goal-focus starting-goal)
;; the location specification for each item (label) value
 (s-sentence-info isa display-info name s-sentence screen-x 517.0 screen-y 125.5)
 (f-sentence-info isa display-info name f-sentence screen-x 517.0 screen-y 101.5)
 (fact-info isa display-info name fact screen-x 517.0 screen-y 655.5)
 (yes-info isa button-info name yes screen-x 1025.0 screen-y 665.0)
 (no-info isa button-info name no screen-x 1025.0 screen-y 715.0)
 (unknown-info isa button-info name unknown screen-x 1025.0 screen-y 765.0)

 (info-0 ISA list-info current-on-list f-sentence next-on-list s-sentence)
 (info-1 ISA list-info current-on-list s-sentence next-on-list fact)
 (info-2 ISA list-info current-on-list fact next-on-list f-sentence)

 ; if "essay" is given as a fact (together with "if essay then library", then "essay" will
 ; always be understood as SUFFICIENT, i.e. everyone recognizes modus ponens)
 (ESSAY isa meaning word "essay" context SUFFICIENT)

 (NOT-ESSAY-NEC isa meaning word "not_essay" context NECESSARY)
 (NOT-ESSAY-SUF isa meaning word "not_essay" context SUFFICIENT)

 (LIBRARY-NEC isa meaning word "library" context NECESSARY)
 (LIBRARY-SUF isa meaning word "library" context SUFFICIENT)
 (NOT-LIBRARY isa meaning word "not_library" context SUFFICIENT)

 (SIMPLE-NEC isa meaning word "----------" context NECESSARY)
 (SIMPLE-SUF isa meaning word "----------" context SUFFICIENT)

 (OPEN-NEC isa meaning word "If_open_then_library" context NECESSARY)
 (OPEN-SUF isa meaning word "If_open_then_library" context SUFFICIENT)

 (TEXTBOOK-SUF isa meaning word "If_textbook_then_library" context SUFFICIENT)
 (TEXTBOOK-NEC isa meaning word "If_textbook_then_library" context NECESSARY)

 (arg-e-suf isa argument fact "ESSAY" position "YES" context SUFFICIENT neg-position "UNKNOWN")
 (arg-e-nec isa argument fact "ESSAY" position "UNKNOWN" context NECESSARY neg-position "YES")

 (arg-ne-suf isa argument fact "NOT_ESSAY" position "UNKNOWN" context SUFFICIENT neg-position "NO")
 (arg-ne-nec isa argument fact "NOT_ESSAY" position "NO" context NECESSARY neg-position "UNKNOWN")

 (arg-l-nec isa argument fact "LIBRARY" position "YES" context NECESSARY neg-position "UNKNOWN")
 (arg-l-suf isa argument fact "LIBRARY" position "UNKNOWN" context SUFFICIENT neg-position "YES")

 (arg-nl-nec isa argument fact "NOT_LIBRARY" position "UNKNOWN" context NECESSARY NEG-POSITION "NO")
 (arg-nl-suf isa argument fact "NOT_LIBRARY" position "NO" context SUFFICIENT NEG-POSITION "UNKNOWN")
 )

(set-base-levels (OPEN-NEC 2.1))
(set-base-levels (OPEN-SUF 1))
(set-base-levels (TEXTBOOK-SUF 1.9))
