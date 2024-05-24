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
           ruby-actionview
           ruby-thor-0.14.6))
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
    ;; tests need Internet access.
    (arguments '(#:tests? #f))
    (native-inputs
     (list ruby-activesupport
           ruby-rspec
           ruby-thor-0.14.6))
    (synopsis "A Ruby library for testing your library against different versions of dependencies")
    (description "Appraisal integrates with bundler and rake to test
your library against different versions of dependencies in repeatable
scenarios called \"appraisals\".  Appraisal is designed to make it
easy to check for regressions in your library without interfering
 with day-to-day development using Bundler.")
    (home-page "https://github.com/thoughtbot/appraisal")
    (license license:expat)))

(define-public ruby-thor-0.14.6
  (package
    (name "ruby-thor")
    (version "0.14.6")
    (source
     (origin
       (method url-fetch)
       (uri (rubygems-uri "thor" version))
       (sha256
        (base32
         "18qmgv38gfw9clhq6szyw5kcxkkk8xr7c0klp3pk3cyznzbapif7"))))
    (build-system ruby-build-system)
    ;; couldn't run tests
    ;; "No Rakefile found"
    (arguments `(#:tests? #f))
    (native-inputs (list ruby-rspec ruby-simplecov ruby-webmock))
    (synopsis "Ruby toolkit for building command-line interfaces")
    (description "Thor is a toolkit for building powerful command-line
interfaces.")
    (home-page "http://whatisthor.com/")
    (license license:expat)))
