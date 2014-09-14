;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |31|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 31

(require 2htdp/image)

(define (draw-circles radList)
  (cond
    [(equal? 1 (length radList)) empty]
    [else (cons (circle (first radList) "solid" "blue") (draw-circles (rest radList)))]
    )
  )