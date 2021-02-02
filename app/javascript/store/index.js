import Vue from "vue/dist/vue.esm"
import axios from "axios"
import { getMetaValue } from "helpers"

axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded'
axios.defaults.headers.post["X-CSRF-Token"] = getMetaValue("csrf-token")

export const store = Vue.observable({
  form: {
    step: 1,
    job: {
      cardName: null,
      companyName: null,
      companyWebsite: null,
      companyLogo: null,
      companyDescription: null,
      email: null,
      compensationRange: null,
      compensationType: null,
      description: null,
      headquarters: null,
      linkToApply: null,
      price: 199,
      basePrice: 199,
      remote: "Yes",
      title: null,
      yearsOfExperience: null,
      upsellType: "No, thanks"
    },
    paymentIntentClientSecret: null,
    upsellPricing: {
      good: 49,
      better: 69,
      great: 149
    }
  }
})

export const actions = {
  updateForm(input, value) {
    store.form.job[input] = value

    let storedForm = this.openStorage()
    if (!storedForm) storedForm = {}

    storedForm[input] = value
    this.saveStorage(storedForm)
  },

  openStorage() {
    return JSON.parse(localStorage.getItem('form'))
  },

  saveStorage(form) {
    localStorage.setItem("form", JSON.stringify(form))
  },

  formattedPrice() {
    const price = new Intl.NumberFormat("en-EN", {
      style: "currency",
      currency: "USD",
    }).format(store.form.job.price)
    return price
  },

  handleBoolean(input, value) {
    if (input === value) {
      return true
    } else {
      return false
    }
  },

  handlePurchase(stripeResult) {
    const formData = new FormData()
    const job = store.form.job

    formData.append("email", job.email)
    formData.append("company_name", job.companyName)
    formData.append("company_website", job.companyWebsite)
    formData.append("company_description", job.companyDescription)
    formData.append("compensation_range", job.compensationRange)
    formData.append("compensation_type", job.compensationType)
    formData.append("description", job.description)
    formData.append("headquarters", job.headquarters)
    formData.append("link_to_apply", job.linkToApply)
    formData.append("title", job.title)
    formData.append("years_of_experience", job.yearsOfExperience)
    // formData.append("upsell_type", job.upsellType)
    formData.append("remote", actions.handleBoolean(job.remote, "Yes"))
    formData.append("price", job.price)

    if (job.companyLogo) {
      formData.append("companyLogo", job.companyLogo)
    }

    axios({
      url: "/jobs",
      method: "POST",
      data: formData
    }).then(response => {
      if (response.status === 200) {
        window.location = response.data.redirect_url
        // Success message console.log(response.data.notice)
      }
    })
      .catch(errors => {
        // @job.errors TODO: Render in view
        console.log(errors)
      })



  }
}
