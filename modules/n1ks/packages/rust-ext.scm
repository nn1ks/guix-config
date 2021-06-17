(define-module (n1ks packages rust-ext)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc)
  #:use-module (guix packages)
  #:use-module (guix download)
  ;; #:use-module (gnu packages rust) ;; Used for clippy package
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (nonguix build-system binary))

(define-public rust-src
  (package
    (name "rust-src")
    (version "1.52.0")
    (source
      (origin
        (method url-fetch)
        (uri (string-append "https://static.rust-lang.org/dist/2021-05-06/rust-src-"
                            version ".tar.gz"))
        (file-name (string-append name "-" version ".tar.gz"))
        (sha256 (base32 "09z2z5in9hxzcyp39g80msjbsg25ryxsbzisbrdwmypjzbqwn7c6"))))
    (build-system binary-build-system)
    (arguments
     `(#:install-plan
       `(("rust-src/lib" "./"))))
    (synopsis "Source for the Rust programming language")
    (description "Rust is a systems programming language that provides memory safety and thread safety guarantees.")
    (home-page "https://rust-lang.org")
    (license (list license:asl2.0 license:expat))))

;; (define-public rust-clippy-bin
;;   (package
;;     (name "rust-clippy-bin")
;;     (version "1.50.0")
;;     (source
;;       (origin
;;         (method url-fetch)
;;         (uri (string-append "https://static.rust-lang.org/dist/2021-02-11/clippy-"
;;                             version "-x86_64-unknown-linux-gnu.tar.gz"))
;;         (file-name (string-append name "-" version ".tar.gz"))
;;         (sha256 (base32 "0f7am39k5zzvlpifjv2diz7gv5ya2g2p0cx601ikcrwxngyrhh7g"))))
;;     (build-system binary-build-system)
;;     (arguments
;;      `(#:patchelf-plan
;;        `(("clippy-preview/bin/cargo-clippy"
;;           ("glibc" "gcc:lib"))
;;          ("clippy-preview/bin/clippy-driver"
;;           ("gcc:lib" "rust")))
;;        #:install-plan
;;        `(("clippy-preview/bin" "bin")
;;          ("clippy-preview/share" "share"))))
;;     (inputs
;;      `(("glibc" ,glibc)
;;        ("gcc:lib" ,gcc "lib")
;;        ("rust" ,rust-1.50)))
;;     (home-page "https://github.com/rust-lang/rust-clippy")
;;     (synopsis "Lints to avoid common pitfalls in Rust")
;;     (description "This package provides a bunch of helpful lints to avoid common
;; pitfalls in Rust.")
;;     (license (list license:expat license:asl2.0))))
