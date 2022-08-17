
(add-dm (starting-goal isa goal state idle))
 (goal-focus starting-goal)
 (chunk-type argument fact hypo position context neg-position strength)
 (chunk-type context value hypo)
(add-dm ;; the location specification for each item (label) value
 (s-sentence-info isa display-info name s-sentence screen-x 517.0 screen-y 125.5)
 (f-sentence-info isa display-info name f-sentence screen-x 517.0 screen-y 101.5)
 (fact-info isa display-info name fact screen-x 517.0 screen-y 655.5)
 (yes-info isa button-info name yes screen-x 1025.0 screen-y 665.0)
 (no-info isa button-info name no screen-x 1025.0 screen-y 715.0)
 (unknown-info isa button-info name unknown screen-x 1025.0 screen-y 765.0)

(NEC isa context value NECESSARY hypo DISABLER)
(SUF isa context value SUFFICIENT hypo ALTERNATIVE)
(DIS isa context value DISABLER)
(ALT isa context value ALTERNATIVE)

(arg-e-suf isa argument fact ESSAY hypo NONE position "YES" context SUF neg-position "UNKNOWN" strength 1)
(arg-e-nec isa argument fact ESSAY hypo DISABLER position "UNKNOWN" context NEC neg-position "YES" strength 1)

(arg-ne-suf isa argument fact NOT-ESSAY hypo ALTERNATIVE position "UNKNOWN" context SUF neg-position "NO" strength 1)
(arg-ne-nec isa argument fact NOT-ESSAY hypo NONE position "NO" context NEC neg-position "UNKNOWN" strength 1)

(arg-l-nec isa argument fact LIBRARY hypo NONE position "YES" context NEC neg-position "UNKNOWN" strength 1)
(arg-l-suf isa argument fact LIBRARY hypo ALTERNATIVE position "UNKNOWN" context SUF neg-position "YES" strength 1)

(arg-nl-nec isa argument fact NOT-LIBRARY hypo DISABLER position "UNKNOWN" context NEC NEG-POSITION "NO" strength 1)
(arg-nl-suf isa argument fact NOT-LIBRARY hypo NONE position "NO" context SUF NEG-POSITION "UNKNOWN" strength 1)

)
;(set-base-levels (NECESSARY 10000))
;(set-base-levels (SUFFICIENT 10000))
(set-base-levels (NEC 100000))
(set-base-levels (SUF 100000))
(set-base-levels (DIS 100000))
(set-base-levels (ALT 100000))