<template>
  <div class="lg:col-span-8">
    <div class="lg:pr-6">
      <h1 class="text-4xl font-black">{{ $store.form.job.title }}</h1>
      <p class="mt-4 text-xs font-black tracking-wider text-gray-600 uppercase">
        Description
      </p>
      <div v-html="$store.form.job.description" class="mb-6"></div>

      <div v-if="$store.form.job.companyDescription">
        <p
          class="mt-4 text-xs font-black tracking-wider text-gray-600 uppercase"
        >
          Company Description
        </p>

        <div v-html="$store.form.job.companyDescription"></div>
      </div>
    </div>
    <a
      :href="$store.form.job.linkToApply"
      target="_blank"
      class="my-6 text-center btn btn-red btn-lg"
      >Apply for this role</a
    >
  </div>
</template>

<script>
export default {};
</script>
