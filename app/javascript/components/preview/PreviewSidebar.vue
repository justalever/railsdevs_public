<template>
  <div class="text-center lg:col-span-4">
    <div class="p-3 bg-gray-100 rounded-lg shadow">
      <img
        v-if="logoImage"
        :src="logoImage"
        :alt="$store.form.job.companyName"
        class="inline w-16 h-16 border-2 border-black rounded-full"
      />
      <h3 class="mt-3 text-lg font-black leading-tight">
        {{ $store.form.job.title }}
      </h3>
      <p class="mb-1 text-gray-800">
        <span v-if="$store.form.job.companyWebsite">
          <a
            :href="$store.form.job.companyWebsite"
            target="_blank"
            class="underline"
            >{{ $store.form.job.companyName }}</a
          >
        </span>
        <span v-else>
          {{ $store.form.job.companyName }}
        </span>
      </p>
      <div class="text-left">
        <p
          class="mt-4 text-xs font-black tracking-wider text-gray-600 uppercase"
        >
          Job details
        </p>

        <span v-if="$store.form.job.remote == 'Yes'" class="text-sm"
          >Remote</span
        >
        <span v-else class="text-sm">On Location</span>

        <div
          class="text-sm"
          v-if="$store.form.job.compensationType == 'Full-time'"
        >
          {{ $store.form.job.compensationType }}
        </div>
        <div class="text-sm" v-else>
          <p>
            {{ $store.form.job.compensationType }}, ~{{
              $store.form.job.estimatedHours
            }}
            hours
          </p>
        </div>

        <p class="text-sm">
          {{ $store.form.job.yearsOfExperience }} years of experience required
        </p>
      </div>
      <a
        :href="$store.form.job.linkToApply"
        target="_blank"
        class="mt-6 text-center btn btn-red btn-expanded"
        >Apply</a
      >
    </div>
  </div>
</template>

<script>
export default {
  computed: {
    logoImage() {
      return JSON.parse(localStorage.getItem("logoImage"));
    },
  },
};
</script>
