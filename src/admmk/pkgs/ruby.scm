(define-module (admmk pkgs ruby)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages rails)
  #:use-module (guix download)
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
         "1h58xgmp0fqpnd6mvw0zl0f76119v8lnf4xabqhckbzl6jrk8qpa"))))
    (build-system ruby-build-system)
    (native-inputs
     (list ruby-mocha
           ruby-appraisal
           ruby-activesupport))
    ;; (arguments '(#:tests? #f))
    (synopsis "")
    (description "")
    (home-page "")
    (license license:expat)))

(define-public ruby-appraisal
  (package
    (name "ruby-appraisal")
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (rubygems-uri "appraisal" version))
       (sha256
        (base32
         "1knkxrjagaqf418lkgd7xvfb5rh143d19ld8vfq16y8jpqhr561n"))))
    (build-system ruby-build-system)
    ;; todo: fix-tests
    (arguments
     '(#:tests? #f))
    (native-inputs
     (list ruby-activesupport
           ruby-rspec))
    (propagated-inputs
     (list ruby-thor))
    (synopsis "")
    (description "")
    (home-page "")
    (license license:expat)))
