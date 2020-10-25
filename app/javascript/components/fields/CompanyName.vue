<template>
  <div>
    <label for="company-name" class="label">Company name</label>
    <span class="required"></span>
    <input
      type="text"
      id="company-name"
      :value="$store.form.job.companyName"
      @input="$actions.updateForm('companyName', $event.target.value)"
      placeholder="Apple, Inc."
      class="input"
      required
    />
  </div>
</template>
