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
          value="Yes"
          v-model="$store.form.job.remote"
          @change="$actions.updateForm('remote', $event.target.value)"
          id="isRemote"
          checked
        />
        <label for="isRemote" class="font-normal label">Yes</label>
      </div>
      <div>
        <input
          type="radio"
          value="No"
          @change="$actions.updateForm('remote', $event.target.value)"
          v-model="$store.form.job.remote"
          id="isNotRemote"
        />
        <label for="isNotRemote" class="font-normal label">No</label>
      </div>
    </div>
  </div>
</template>
