import data from "../store"
import { Controller } from "stimulus"
import Vue from "vue"
const VueComponent = (component) => class extends Controller {
  static targets = ["mount"]

  connect() {
    const el = this.mountTarget

    window.jobForm = new Vue({
      el,
      render: h => h(component),
      data: data.store
    })
  }
}

export default VueComponent
