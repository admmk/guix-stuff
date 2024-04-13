(define-module (gnu packages ruby)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (guix packages)
  #:use-module (guix build-system ruby))

(define-public ruby-jbuilder
  (package
    (name "ruby-jbuilder")
    (version "2.11.5")
    (source
     (origin
       (method url-fetch)
       (uri (rubygems-uri "jbuilder" version))
       (sha256
        (base32
         "01v6jjpvh3gnq6sgllpfqahlgxzj50ailwhj9b3cd20hi2dx0vxp"))))
    (build-system ruby-build-system)
    ;; (arguments '(#:tests? #f))
    (synopsis "")
    (description "")
    (home-page "")
    (license license:expat)))
