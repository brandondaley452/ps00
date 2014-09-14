;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |16|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
; Ex 16
(require 2htdp/image)

(define my-image (bitmap "pika.jpg"))

(beside (circle 50 "outline" "red") my-image)

(place-image (rectangle 50 80 "solid" "blue") 80 80 my-image)

(above my-image my-image my-image)