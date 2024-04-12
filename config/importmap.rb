# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "imagepreview", to: "imagepreview.js"
pin "modal", to: "modal.js"
pin "tweet", to: "tweet.js"
pin "album", to: "album.js"