;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |28|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 28

(require 2htdp/image)
(require rackunit)

; lines-of-lines : ListOfList -> Image
; GIVEN: a list of lists of strings
; RETURNS: an Image where each string list is a below the next string list as a line of text
; Examples:
; (lines-of-lines empty) => (text "" 15 "red")
; (lines-of-lines (list (list "This" "is" "a" "test."))) => (text "This is a test." 15 "red")
; (lines-of-lines (list (list "This" "is" "a" "test.")
;                       (list "This" "is" "only" "a" "test."))) => (above (text "This is a test." 15 "red")
;                                                                         (text "This is only a test." 15 "red"))
; DESIGN STRATEGY: Cases
(define (lines-of-lines listOfLists)
  (cond
    [(empty? listOfLists) (text "" 15 "red")]
    [(equal? 1 (length listOfLists)) (draw-text (first listOfLists))]
    [else (above (draw-text (first listOfLists)) (lines-of-lines (rest listOfLists)))]
    )
  )

; draw-text : ListOfString -> Image
; GIVEN: a list of Strings
; RETURNS: an Image containing the combined list of String, where each string is separated by a space char
; Examples:
; (draw-text empty) => (text "" 15 "red")
; (draw-text (list "This" "is" "a" "test.")) => (text "This is a test." 15 "red")
; (draw-text (list "This" "is" "only" "a" "test.")) => (text "This is only a test." 15 "red")
; DESIGN STRATEGY: Function Composition
(define (draw-text lst)
  (text (append-list lst) 15 "red")
  )

; append-list : ListOfString -> String
; GIVEN: a list of Strings
; RETURNS: a String of each list element concatenated, with a space between each element
; Examples:
; (append-list empty) => ""
; (append-list (list "This" "is" "a" "test.")) => "This is a test."
; (append-list (list "This" "is" "only" "a" "test.")) => "This is only a test."
; DESIGN STRATEGY: Cases
(define (append-list lst)
  (cond
    [(empty? lst) ""]
    [(equal? 1 (length lst)) (first lst)]
    [else (string-append (first lst) " " (append-list (rest lst)))]
    )
  )

(test-begin
 ; Tests for lines-of-lines
 (check-equal?
  (lines-of-lines empty)
  (text "" 15 "red")
  )
 
 (check-equal?
  (lines-of-lines (list (list "This" "is" "a" "test.")))
  (text "This is a test." 15 "red")
  )
 
 (check-equal?
  (lines-of-lines (list (list "This" "is" "a" "test.")
                        (list "This" "is" "only" "a" "test.")))
  (above (text "This is a test." 15 "red")
         (text "This is only a test." 15 "red")
         )
  )
 
 ; Tests for draw-text
 (check-equal?
  (draw-text empty)
  (text "" 15 "red")
  )

 (check-equal?
  (draw-text (list "This" "is" "a" "test."))
  (text (string-append "This is a test." "") 15 "red")
  )

 (check-equal?
  (draw-text (list "This" "is" "only" "a" "test."))
  (text "This is only a test." 15 "red")
  )

 ; Tests for append-list
 (check-equal?
  (append-list empty)
  ""
  )

 (check-equal?
  (append-list (list "This" "is" "a" "test."))
  "This is a test."
  )

 (check-equal?
  (append-list (list "This" "is" "only" "a" "test."))
  "This is only a test."
  )
)