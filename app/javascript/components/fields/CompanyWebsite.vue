<template>
  <div>
    <label for="company-website" class="label">Website</label>
    <span class="required"></span>
    <input
      type="text"
      id="company-website"
      class="input"
      required
      :value="$store.form.job.companyWebsite"
      @input="$actions.updateForm('companyWebsite', $event.target.value)"
    />
  </div>
</template>
