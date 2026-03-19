#lang racket

; For my own sanity

(define reduce foldr)

; Helpers ---

(define (read-matrix filename)
  (call-with-input-file filename
    (lambda (in)
      (let loop ((lines '()))
        (let ((line (read-line in 'any)))
          (if (eof-object? line)
              (reverse lines)
              (loop (cons (string->list line) lines))))))))

(define (pad-right lst len)
  (append lst (make-list (- len (length lst)) #\space)))

(define (normalize-matrix mat)
  (let ((max-len (apply max (map length mat))))
    (map (lambda (row)
           (pad-right row max-len))
         mat)))

(define (print-matrix mat)
  (for-each
   (lambda (row)
     (displayln
      (string-join (map ~a row) " ")))
   mat))

(define (read-normalized-matrix file)
  (normalize-matrix (read-matrix file)))

; stuff here

(define (transpose mat)
  (reduce-n cons '() mat))

(define (reduce-n op init seqs)
  (if (null? (first seqs))
      '()
      (cons (reduce op init (map first seqs))
            (reduce-n op init (map rest seqs)))))

(define (rotate-90 mat)
  (map reverse (transpose mat)))

(define mat (read-normalized-matrix "./lab5/art.txt"))

; (print-matrix mat)

; (print-matrix (rotate-90 (rotate-90 mat)))


(define num-mat '((1 2 3)
                  (4 5 6)
                  (7 8 9)))


(displayln "Original")
(print-matrix num-mat)

(displayln "\nTranposed")
(print-matrix (transpose num-mat))

(displayln "\nTranpose + reverse (Rotated)")
(print-matrix (rotate-90 num-mat))