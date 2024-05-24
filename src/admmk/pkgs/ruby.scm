(define-module (admmk pkgs ruby)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages rails)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix build-system ruby)
  #:use-module (gnu packages version-control))

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
           ruby-activesupport
           ruby-actionview))
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
    ;; Tests need Internet access.
    (arguments '(#:tests? #f))
    (native-inputs
     (list ruby-activesupport
           ruby-rspec
           ;; my-ruby-thor
           ))
    (synopsis "")
    (description "")
    (home-page "")
    (license license:expat)))

(define-public ruby-thor-0.14
  (package
    (name "ruby-thor")
    (version "0.14.6")
    (source (origin
              ;; Pull from git because the gem has no tests.
              (method git-fetch)
              (uri (git-reference
                    (url "https://github.com/rails/thor")
                    (commit (string-append "v" version))))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "0frqmnf0qkhww3pd0w7j29jzpagsg78lr553nwa9znf69c2gdsbl"))))
    (build-system ruby-build-system)
    ;; (arguments
    ;;  `(#:tests? #f
    ;;    ;; #:phases
    ;;    ;; (modify-phases %standard-phases
    ;;    ;;   (replace 'check
    ;;    ;;      (lambda* (#:key tests? #:allow-other-keys)
    ;;    ;;        (when tests?
    ;;    ;;          (invoke "rspec" "spec" )))))))
    ;;    ))
    (native-inputs (list ruby-rspec ruby-simplecov ruby-webmock))
    (synopsis "Ruby toolkit for building command-line interfaces")
    (description "Thor is a toolkit for building powerful command-line
interfaces.")
    (home-page "http://whatisthor.com/")
    (license license:expat)))
