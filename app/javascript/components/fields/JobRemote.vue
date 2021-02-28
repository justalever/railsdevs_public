<template>
  <div>
    <div class="flex">
      <p class="label">Is this role remote?</p>
      <span class="mt-3 ml-1 required"></span>
    </div>

    <div class="flex items-center justify-start pt-2">
      <div class="mr-5">
        <input
          type="radio"
          name="remote"
          value="true"
          v-model="$store.form.job.remote"
          @change="$actions.updateForm('remote', true)"
          id="isRemote"
        />
        <label for="isRemote" class="font-normal label">Yes</label>
      </div>
      <div>
        <input
          type="radio"
          name="remote"
          value="false"
          @change="$actions.updateForm('remote', false)"
          v-model="$store.form.job.remote"
          id="isNotRemote"
        />
        <label for="isNotRemote" class="font-normal label">No</label>
      </div>
    </div>
  </div>
</template>
