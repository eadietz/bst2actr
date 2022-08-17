(clear-all)
(define-model suppression-task
 (sgp
   :v t ;; -model-output
   :esc t ; enables subsymbolic computations
   :rt 0  ; minimum activation threshold, default 0.0
   ;:ol t    ; optimized learning parameter that approximates learning rule
   :act nil   ; prints out activation trace
   :ans 0.2 ; instantaneous/ transient noise for each retrieval request, recommended range [0.2,0.8]
   :pas nil ; permanent noise associated with each chunk when entered in dm
   :mas 3; spreading activation
   :nsji nil ; t allows negative sji values from the strength of association calculation
   ;:bll 0.5 ; base-level learning enabled, also sets decay d
   :retrieval-activation 1.0 ; default 0.0
   :imaginal-activation 3.0 ; default 1.0
   :show-focus t
   ;:time-master-start-increment 1.0
   ;:trace-detail low
   :ul t
   :egs 0.95  ; noise in utility based choosing production rules
   ;:unstuff-aural-location t
   ;:visual-activation 10
   ;:tone-detect-delay 1.0
   :needs-mouse t
   ;:visual-num-finsts 8
   ;:visual-finst-span 3.0 ; controls how long a finst marker will remain on defaults to 3.0.
   ;:visual-onset-span 0.5 ; default 0.5
   :needs-mouse t
   )

(sgp :seed (200 4))

(add-word-characters ".")
(add-word-characters "_")
(add-word-characters "-")
(set-visloc-default)

(load (merge-pathnames "chunks.lisp" *load-truename*))
(load (merge-pathnames "dm.lisp" *load-truename*))
(load (merge-pathnames "scan-attend.lisp" *load-truename*))
(load (merge-pathnames "read-sentences.lisp" *load-truename*))
(load (merge-pathnames "read-essay.lisp" *load-truename*))
(load (merge-pathnames "read-not-essay.lisp" *load-truename*))
(load (merge-pathnames "read-library.lisp" *load-truename*))
(load (merge-pathnames "read-not-library.lisp" *load-truename*))
(load (merge-pathnames "interpret-fact.lisp" *load-truename*))
(load (merge-pathnames "argue.lisp" *load-truename*))
(load (merge-pathnames "respond.lisp" *load-truename*))

)