;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |31|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 31

(require 2htdp/image)
(require rackunit)

; list-circles : ListOfInt -> ListOfImage
; GIVEN: a list of integer values that represent circle radii
; RETURNS: a list containing circles of the given radii in the previous list
; Examples:
; (list-circles empty) => (cons empty)
; (list-circles (list 1)) => (cons (circle 1 "solid" "blue") empty)
; (list-circles (list 1 2 3)) => (cons (circle 1 "solid" "blue") 
;                                      (cons (circle 2 "solid" "blue") 
;                                            (cons (circle 3 "solid" "blue") 
;                                                  empty)))
; DESIGN STRATEGY: Cases
(define (list-circles radList)
  (cond
    [(empty? radList) empty]
    [(equal? 1 (length radList)) (cons (circle (first radList) "solid" "blue") empty)]
    [else (cons (circle (first radList) "solid" "blue") (list-circles (rest radList)))]
    )
  )

(test-begin
 
 ; Tests for list-circles
 (check-equal?
  (list-circles empty)
  empty
  )
 
 (check-equal?
  (list-circles (list 1))
  (cons (circle 1 "solid" "blue") empty)
  )
 
 (check-equal?
  (list-circles (list 1 2 3))
  (cons (circle 1 "solid" "blue")
        (cons (circle 2 "solid" "blue")
              (cons (circle 3 "solid" "blue")
                    empty)))
  )
 
 )