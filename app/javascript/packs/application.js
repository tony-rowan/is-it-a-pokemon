require("@rails/ujs").start()
require("turbolinks").start()

import Vue from 'vue'
import App from '../components/app.vue'
import TurbolinksAdapter from 'vue-turbolinks'
import axios from 'axios'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  // setup csrf token for axios
  const csrfToken = document.querySelector("meta[name=csrf-token]").content
  axios.defaults.headers.common['X-CSRF-Token'] = csrfToken

  // boot the vue app
  var element = document.getElementById("app")
  var app = new Vue({
    el: '#app',
    template: '<App/>',
    components: { App },
  })
})
