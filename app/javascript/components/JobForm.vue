<template>
  <div class="pt-8 pb-16">
    <step-pagination></step-pagination>

    <div
      class="relative max-w-4xl p-4 mx-auto mb-10 bg-white border-b-2 border-l-2 border-r-2 border-black rounded-b-lg shadow-xl"
    >
      <div class="p-2 lg:px-10 lg:pt-6 lg:pb-10">
        <form @submit.prevent="submit" enctype="multipart/form-data">
          <div v-if="$store.form.step === 1">
            <JobInfo @nextStep="handleNextStep" />
          </div>

          <div v-if="$store.form.step === 2">
            <JobPreview @nextStep="handleNextStep" @prevStep="handlePrevStep" />
          </div>

          <div v-if="$store.form.step === 3">
            <JobPurchase @prevStep="handlePrevStep" />
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
// import rootData from "store";
import JobInfo from "./steps/JobInfo"
import JobPreview from "./steps/JobPreview"
import JobPurchase from "./steps/JobPurchase"
import StepPagination from "./StepPagination"
import { getMetaValue } from "helpers"

import axios from "axios"

axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded'
axios.defaults.headers.post["X-CSRF-Token"] = getMetaValue("csrf-token")

export default {
  components: {
    JobInfo,
    JobPreview,
    JobPurchase,
    StepPagination,
  },
  methods: {
    handleNextStep() {
      this.$store.form.step++
    },
    handlePrevStep() {
      this.$store.form.step--
    },
  },

  mounted() {
    this.$actions.updateForm("price", this.$store.form.job.price)

    const data = new FormData()
    data.append("upsell_type", this.$store.form.job.upsellType)

    axios({
      url: "/intents",
      method: "POST",
      data: data,
      headers: {
        Accept: "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
    }).then(response => {
      this.$store.form.paymentIntentClientSecret = response.data.client_secret
      this.$store.form.job.price = response.data.amount / 100
    }).catch(error => {
      console.log(error)
    })
  },
};
</script>
