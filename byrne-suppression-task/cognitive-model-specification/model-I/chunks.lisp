
;; Define the chunk types for the chunks
(chunk-type goal state)
(chunk-type display-info name screen-x screen-y)
(chunk-type button-info name screen-x screen-y)
(chunk-type image-info name screen-x screen-y)
(chunk-type sound-info name)
(chunk-type sa-level val)
(chunk-type SA event aoi eeg action1 action2 action3 time)
(chunk-type list-info current-on-list next-on-list)
(chunk-type collector name probe associate)
; 'conversion' from string (word, e.g. "essay") to chunk (context, can be either SUFFICIENT or NECESSARY)
(chunk-type meaning word context)
(chunk-type argument fact position context neg-position)
(chunk-type interpretation word)

(define-chunks ;; define the chunk for each item (label)
 (s-sentence)
 (f-sentence)
 (fact)
 (yes)
 (no)
 (unknown)
; arg-1 used to store position of (first) argument in imaginal
; arg-2 used to store position of (second; counter of first) argument in imaginal
 (arg-1)
 (arg-2)
 (SUFFICIENT)
 (NECESSARY)
)



