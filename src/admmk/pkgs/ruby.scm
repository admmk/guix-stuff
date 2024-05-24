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
    ;; todo: fix-tests
    ;; home directody
    (arguments
     '(;; #:tests? #f
       #:test-target "spec"
       #:phases (modify-phases %standard-phases
                  (add-before 'check 'set-HOME
                    (lambda _
                      ;; Many tests invoke Bundler, and fails when Bundler
                      ;; warns that /homeless-shelter does not exist.
                      (setenv "HOME" "/tmp")
                      #t)))))
    (native-inputs
     (list ruby-activesupport
           ruby-rspec
           my-ruby-thor
           ruby-rake
           git))
    ;; (propagated-inputs
    ;;  (list ruby-thor))
    (synopsis "")
    (description "")
    (home-page "")
    (license license:expat)))

(define-public my-ruby-thor
  (package
    (name "my-ruby-thor")
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
    (arguments
     `(#:tests? #f
       ;; #:phases
       ;; (modify-phases %standard-phases
       ;;   (replace 'check
       ;;      (lambda* (#:key tests? #:allow-other-keys)
       ;;        (when tests?
       ;;          (invoke "rspec" "spec" )))))))
       ))
    ;; (arguments
    ;;  (list
    ;;   #:phases
    ;;   #~(modify-phases %standard-phases
    ;;       (add-after 'unpack 'remove-coveralls-dependency
    ;;         (lambda _
    ;;           ;; Do not hook the test suite into the online coveralls service.
    ;;           (substitute* "Gemfile"
    ;;             ((".*coveralls.*") ""))
    ;;           (substitute* "spec/helper.rb"
    ;;             (("require \"coveralls\"") "")
    ;;             (("Coveralls::SimpleCov::Formatter") ""))))
    ;;       (add-after 'unpack 'disable-problematic-tests
    ;;         (lambda _
    ;;           ;; These tests attempt to check the git repository for
    ;;           ;; tabs vs spaces, double vs single quotes, etc, and
    ;;           ;; depend on the git checkout.
    ;;           (delete-file "spec/quality_spec.rb")
    ;;           (substitute* "spec/parser/options_spec.rb"
    ;;             ;; This test fails for unknown reasons (see:
    ;;             ;; https://github.com/rails/thor/issues/814).
    ;;             (("it \"raises an error for unknown switches" all)
    ;;              (string-append "x" all)))))
          ;; (replace 'check
          ;;   (lambda* (#:key tests? #:allow-other-keys)
          ;;     (when tests?
          ;;       (invoke "rspec" "spec" )))))))
    (native-inputs (list ruby-rspec ruby-simplecov ruby-webmock))
    (synopsis "Ruby toolkit for building command-line interfaces")
    (description "Thor is a toolkit for building powerful command-line
interfaces.")
    (home-page "http://whatisthor.com/")
    (license license:expat)))
