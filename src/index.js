require('./normalize.css')

require('./styles.css')

const { Elm } = require('./elm/Main.elm')

Elm.Main.init({
  node: document.getElementById("app")
})

