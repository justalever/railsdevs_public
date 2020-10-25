<template>
  <div>
    <label for="company-email" class="label">Company email</label>
    <span class="required"></span>
    <input
      type="email"
      :value="$store.form.job.email"
      id="company-email"
      placeholder="john@smith.com"
      class="input"
      @input="$actions.updateForm('email', $event.target.value)"
      required
    />
    <p class="my-1 text-sm text-gray-500">
      Used for billing purposes only. No publically displayed.
    </p>
  </div>
</template>
