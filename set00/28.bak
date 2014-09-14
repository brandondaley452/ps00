;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |28|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 28

(require 2htdp/image)

(define (lines-of-lines listOfLists)
  (cond
    [(empty? listOfLists) (text "" 15 "red")]
    [else (above (draw-text (first listOfLists)) (lines-of-lines (rest listOfLists)))]
    )
  )

(define (draw-text lst)
  (text (append-list lst) 15 "red")
  )

(define (append-list lst)
  (cond
    [(empty? lst) ""]
    [else (string-append (first lst) " " (append-list (rest lst)))]
    )
  )