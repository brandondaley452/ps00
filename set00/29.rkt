;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |29|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 29

(require 2htdp/image)
(require rackunit)

; constant Image that represents the 
; connected arms, legs, body, and head of a person
(define WHOLE_BODY (above 
                    (beside
                     ; left arm (looking at Image)
                     (rectangle 30 10 "solid" "brown")
                     (above
                      ; head above the body
                      (circle 15 "solid" "brown") 
                      (rectangle 45 60 "solid" "brown")
                      )
                     ; right arm (looking at Image)
                     (rectangle 30 10 "solid" "brown")
                     )
                    (beside
                     ; two legs, separated by whitespace
                     (rectangle 10 50 "solid" "brown")
                     (rectangle 10 50 "solid" "white")
                     (rectangle 10 50 "solid" "brown")
                     )
                    ))

; group-photo : ListofPerson -> Image
; GIVEN: a list of Person structures
; WHERE: the initial list is not empty
; RETURNS: an Image containing images of each person in line, like a group photo
; Examples:
; (group-photo (list (make-person "First" "Last" 50 75 190))) => (person-image (make-person "First" "Last" 50 75 190))
; (group-photo (list (make-person "Brandon" "Daley" 21 69 165)
;                     (make-person "Brandon" "Daley" 21 69 165)) => (beside/align "bottom"
;                                                                                 (person-image (make-person "Brandon" "Daley" 21 69 165))
;                                                                                 (person-image (make-person "Brandon" "Daley" 21 69 165)))
; DESIGN STRATEGY: Cases
(define (group-photo listOfPeople)
  (cond
    [(equal? (length listOfPeople) 1) (person-image(first listOfPeople))]
    [else (beside/align "bottom" (person-image(first listOfPeople)) (group-photo (rest listOfPeople)))]
    )
  )

(define-struct person (first-name last-name age height weight))
; A Person is a (make-person String String PosInt PosInt PosInt)
; It represents a given person.
; Interpretation:
;   first-name = the first name of the given person
;   last-name = the last name of the given person
;   age = the age of the person in years
;   height = the height of the person in inches, rounded to the nearest inch
;   weight = the weight of the person in pounds, rounded to the nearest pound

; person-image : Person -> Image
; GIVEN: a Person structure
; RETURNS: a basic Image representing that person proportioned to the person-weight and person-height
; Examples:
; (person-image (make-person "First" "Last" 50 75 190)) => (scale/xy 1.9 1.5 WHOLE_BODY)
; (person-image (make-person "Brandon" "Daley" 21 69 165)) => (scale/xy 1.65 1.38 WHOLE_BODY)
; DESIGN STRATEGY: Function Composition
(define (person-image person)
  (scale/xy (* 0.01 (person-weight person)) (* 0.02 (person-height person)) 
            WHOLE_BODY
            )
  )

(test-begin
 
 ; Tests for person-image
 (check-equal?
  (person-image (make-person "First" "Last" 50 75 190))
  (scale/xy 1.9 1.5 WHOLE_BODY)
  )  

 (check-equal?
  (person-image (make-person "Brandon" "Daley" 21 69 165))
  (scale/xy 1.65 1.38 WHOLE_BODY)
  )
 
 ; Tests for group-photo
 (check-equal?
  (group-photo (list (make-person "First" "Last" 50 75 190)))
  (person-image (make-person "First" "Last" 50 75 190))
 )
 
 (check-equal?
  (group-photo (list (make-person "Brandon" "Daley" 21 69 165)
                     (make-person "Brandon" "Daley" 21 69 165)))
  (beside/align "bottom"
                (person-image (make-person "Brandon" "Daley" 21 69 165))
                (person-image (make-person "Brandon" "Daley" 21 69 165)))
  )
 )