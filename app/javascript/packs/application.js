require("@rails/ujs").start()
require("turbolinks").start()

import Vue from 'vue'
import App from '../components/app.vue'
import TurbolinksAdapter from 'vue-turbolinks'

Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {
  var element = document.getElementById("app")
  if (element != null) {
    var app = new Vue({
      el: '#app',
      template: '<App/>',
      components: { App },
    })
  }
})

// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     render: h => h(App)
//   }).$mount()
//   document.body.appendChild(app.$el)
//
//   console.log(app)
// })
