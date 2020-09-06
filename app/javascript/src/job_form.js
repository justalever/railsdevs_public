import Vue from "vue"
import ky from "ky"
import TurbolinksAdapter from "vue-turbolinks"
import { getMetaValue } from "helpers"
Vue.use(TurbolinksAdapter)

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
