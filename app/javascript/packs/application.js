require("@rails/ujs").start()
require("turbolinks").start()

import Vue from 'vue'
import App from '../components/app.vue'
import TurbolinksAdapter from 'vue-turbolinks'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  var element = document.getElementById("app")
  var app = new Vue({
    el: '#app',
    template: '<App/>',
    components: { App },
  })
})
