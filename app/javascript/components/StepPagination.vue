<template>
  <div
    class="max-w-4xl mx-auto bg-gray-100 border-t-2 border-l-2 border-r-2 border-black rounded-t-lg shadow-sm"
  >
    <div class="grid grid-cols-1 lg:grid-cols-12">
      <div
        class="px-2 pt-4 pb-2 border-b-4 border-transparent lg:col-span-4 lg:pt-6 lg:px-6 lg:pb-4"
        :class="{
          'border-red-500 bg-white rounded-tl-lg shadow-sm':
            $store.form.step === 1,
        }"
      >
        <p class="text-xs text-gray-600 uppercase lg:text-sm">Step 1</p>
        <h3 class="text-sm font-black lg:text-xl">Job Details</h3>
      </div>
      <div
        class="px-2 pt-4 pb-2 border-b-4 border-transparent lg:col-span-4 lg:pt-6 lg:px-6 lg:pb-4"
        :class="{ 'border-red-500 bg-white shadow-sm': $store.form.step === 2 }"
      >
        <p class="text-xs text-gray-600 uppercase lg:text-sm">Step 2</p>
        <h3 class="text-sm font-black lg:text-xl">Preview</h3>
      </div>
      <div
        class="px-2 pt-4 pb-2 border-b-4 border-transparent lg:col-span-4 lg:pt-6 lg:px-6 lg:pb-4"
        :class="{
          'border-red-500 bg-white rounded-tr-lg shadow-sm':
            $store.form.step === 3,
        }"
      >
        <p class="text-xs text-gray-600 uppercase lg:text-sm">Step 3</p>
        <h3 class="text-sm font-black lg:text-xl">Purchase</h3>
      </div>
    </div>
  </div>
</template>
