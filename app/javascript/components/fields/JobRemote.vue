<template>
  <div>
    <div class="flex">
      <p class="label">Is this role remote?</p>
      <span class="mt-3 ml-1 required"></span>
    </div>

    <div class="flex items-center justify-start pt-2">
      <div class="mr-5">
        <input type="radio" value="Yes" v-model="job.remote" id="isRemote" />
        <label for="isRemote" class="font-normal label">Yes</label>
      </div>
      <div>
        <input type="radio" value="No" v-model="job.remote" id="isNotRemote" />
        <label for="isNotRemote" class="font-normal label">No</label>
      </div>
    </div>
  </div>
</template>
