#lang racket

(define (square x) (* x x))

(define (sum-of-square x y) (+ (square x) (square y)))

(define (ex_1_3 x y z)
  (cond ((and (< x y) (< x z)) (sum-of-square y z))
        ((and (< y x) (< y z)) (sum-of-square x z))
        ((and (< z x) (< z z)) (sum-of-square x y)) )
  )


(define (average x y)
  (/ (+ x y) 2))

(define (sqrt x)

  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))

  (define (improve guess)
    (average guess (/ x guess)))

  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))

  (sqrt-iter 1.0))

; 2 * 2 + 3 * 3 =>
; 4 + 9 =>
; 13
; (ex_1_3 1 2 3)

(sqrt 9)