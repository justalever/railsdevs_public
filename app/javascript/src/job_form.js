import Vue from "vue"
import { store, actions } from "../store"
import ky from "ky"
import TurbolinksAdapter from "vue-turbolinks"
import { getMetaValue } from "helpers"
Vue.use(TurbolinksAdapter)

Vue.prototype.$store = store
Vue.prototype.$actions = actions
Vue.prototype.$http = ky.extend({
  hooks: {
    beforeRequest: [
      request => {
        request.headers.set("X-CSRF-Token", getMetaValue("csrf-token"))
      }
    ]
  },
  retry: 0
})
