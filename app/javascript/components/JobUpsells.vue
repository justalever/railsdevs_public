<template>
  <div class="pt-6 mt-10 border-t">
    <h3 class="text-2xl font-black">Make your job stand out</h3>
    <p class="mb-6">
      Upgrade your job listing to stand out from the crowd. Each tier unlocks
      more potential.
    </p>

    <div class="grid grid-cols-3 gap-10">
      <div>
        <input
          type="radio"
          id="upsell_good"
          :checked="$store.form.job.upsellType == 'Good'"
          class="hidden"
          value="Good"
        />
        <label
          for="upsell_good"
          class="block w-full p-6 text-center transition duration-300 ease-in-out border rounded-lg shadow cursor-pointer hover:border-black"
          @click="setUpsellType($event.target)"
          :class="setActiveUpsell('Good')"
        >
          <h3
            class="inline-block px-3 py-px text-sm italic font-bold text-white uppercase bg-red-500 rounded pointer-events-none select-none"
          >
            Good
          </h3>

          <div class="flex justify-center pointer-events-none">
            <span
              class="flex items-center text-5xl font-black leading-tight pointer-events-none select-none"
            >
              <span class="text-base font-normal">+</span>
              <sup class="text-lg pointer-events-none select-none">$</sup>
              {{ $store.form.upsellPricing.good }}
            </span>
          </div>
          <ul
            class="pt-4 mt-2 text-sm text-left text-gray-700 border-t border-gray-300 pointer-events-none select-none"
          >
            <li>Highlight your listing</li>
            <li>Display your company logo</li>
            <li>Pin to top for one week</li>
          </ul>
        </label>
      </div>
      <div>
        <input
          type="radio"
          id="upsell_better"
          :checked="$store.form.job.upsellType == 'Better'"
          class="hidden"
          value="Better"
        />
        <label
          for="upsell_better"
          class="block w-full p-6 text-center transition duration-300 ease-in-out border rounded-lg shadow cursor-pointer hover:border-black"
          @click="setUpsellType($event.target)"
          :class="setActiveUpsell('Better')"
        >
          <h3
            class="inline-block px-3 py-px text-sm italic font-bold text-white uppercase bg-teal-600 rounded pointer-events-none select-none"
          >
            Better
          </h3>

          <div class="flex justify-center pointer-events-none">
            <span
              class="flex items-center text-5xl font-black leading-tight pointer-events-none select-none"
            >
              <span class="text-base font-normal">+</span>
              <sup class="text-lg pointer-events-none select-none">$</sup>
              {{ $store.form.upsellPricing.better }}
            </span>
          </div>
          <ul
            class="pt-4 mt-2 text-sm text-left text-gray-700 border-t border-gray-300 pointer-events-none select-none"
          >
            <li>Highlight your listing</li>
            <li>Display your company logo</li>
            <li>Pin to top for one week</li>
          </ul>
        </label>
      </div>
      <div>
        <input
          type="radio"
          id="upsell_great"
          :checked="$store.form.job.upsellType == 'Great'"
          class="hidden"
          value="Great"
        />
        <label
          for="upsell_great"
          class="block w-full p-6 text-center transition duration-300 ease-in-out border rounded-lg shadow cursor-pointer hover:border-black"
          :class="setActiveUpsell('Great')"
          @click="setUpsellType($event.target)"
        >
          <h3
            class="inline-block px-3 py-px text-sm italic font-bold text-white uppercase bg-indigo-600 rounded pointer-events-none select-none"
          >
            Great
          </h3>

          <div class="flex justify-center pointer-events-none select-none">
            <span
              class="flex items-center text-5xl font-black leading-tight pointer-events-none select-none"
            >
              <span class="text-base font-normal">+</span>
              <sup class="text-lg pointer-events-none select-none">$</sup>
              {{ $store.form.upsellPricing.great }}
            </span>
          </div>
          <ul
            class="pt-4 mt-2 text-sm text-left text-gray-700 border-t border-gray-300 pointer-events-none select-none"
          >
            <li class="pointer-events-none">Highlight your listing</li>
            <li class="pointer-events-none">Display your company logo</li>
            <li class="pointer-events-none">Pin to top for one week</li>
          </ul>
        </label>
      </div>
    </div>

    <div class="flex justify-center mt-10">
      <input
        type="radio"
        id="upsell_none"
        :checked="$store.form.job.upsellType === 'No thanks'"
        value="No thanks"
      />
      <label
        for="upsell_none"
        class="ml-1 text-sm text-gray-500 cursor-pointer"
        @click="setUpsellType($event.target)"
        >No thanks</label
      >
    </div>
  </div>
</template>

<script>
import axios from "axios"

export default {
  methods: {
    setUpsellType(target) {
      console.log(target)
      this.$actions.updateForm("upsellType", target.control.value)
      this.setJobPriceIntent(target.control.value)
    },

    setJobPriceIntent(value) {
      const data = new FormData()
      data.append("upsell_type", value)

      axios({
        url: "/intents",
        data: data,
        method: "POST",
        headers: {
          Accept: "application/json",
          "Content-Type": "application/x-www-form-urlencoded",
        },

      }).then(response => {
        this.$store.form.paymentIntentClientSecret = response.data.client_secret
        this.$actions.updateForm("price", response.data.amount / 100)
      }).catch(error => {
        console.log(error)
      })
    },
    setActiveUpsell(upsellType) {
      if (this.$store.form.job.upsellType === upsellType) {
        return "border-black bg-gray-100"
      } else {
        return "border-gray-300 bg-white"
      }
    }
  },
  computed: {

  }
}
</script>
