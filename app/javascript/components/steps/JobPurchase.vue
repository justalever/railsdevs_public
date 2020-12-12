<template>
  <div>
    <h2 class="text-2xl font-black">Order details</h2>
    <div class="pt-4 pb-4 mb-4 border-b-2">
      <span class="block text-sm tracking-wide text-gray-600"
        >1x Job Listing</span
      >

      <div class="flex flex-wrap items-baseline justify-between">
        <div class="lg:flex-1">
          <h2 class="m-0 text-xl font-black">{{ $store.form.job.title }}</h2>
          <p class="font-bold">{{ $store.form.job.companyName }}</p>

          <div class="text-sm text-gray-700">
            <span v-if="$store.form.job.remote == 'Yes'">Remote role</span>
            <span v-else>On-site</span>
            <span class="px-px text-gray-600">&bull;</span>
            <span>{{ $store.form.job.compensationType }}</span>
            <p>{{ $store.form.job.yearsOfExperience }} years of experience</p>
            <div v-if="$store.form.job.compensationType === 'Full-time'">
              {{ $store.form.job.compensationRange }}
            </div>
          </div>
        </div>
        <div>
          {{ $actions.formattedPrice() }}
        </div>
      </div>
    </div>

    <div class="text-right">
      <p class="text-2xl font-black">Total: {{ $actions.formattedPrice() }}</p>
    </div>

    <div>
      <h2 class="text-2xl font-black">Payment Information</h2>
      <StripeForm />
      <p class="pt-6 text-xs text-gray-600">
        Powered by <a href="https://stripe.com" target="_blank">Stripe</a>
      </p>
    </div>

    <form-pagination position="end">
      <a @click.prevent="prev()" class="btn btn-white btn-outline btn-lg"
        >Back</a
      >
    </form-pagination>
  </div>
</template>

<script>
import FormPagination from "../FormPagination";
import StripeForm from "../StripeForm";

export default {
  components: {
    FormPagination,
    StripeForm,
  },
  methods: {
    prev() {
      this.$emit("prevStep");
    },
  },
};
</script>
