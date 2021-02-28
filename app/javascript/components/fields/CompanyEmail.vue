<template>
  <div>
    <label for="company-email" class="label">Company email</label>
    <span class="required"></span>
    <input
      type="email"
      v-model.trim="companyEmail"
      id="company-email"
      placeholder="john@smith.com"
      class="input"
      @input="$actions.updateForm('email', $event.target.value)"
      required
    />
    <p class="mt-1 text-sm text-gray-500">
      Used for billing purposes only. No publically displayed.
    </p>

    <div
      v-if="$v.companyEmail.$error || !$v.companyEmail.email"
      class="text-sm text-red-500"
    >
      We need a valid email.
    </div>
  </div>
</template>

<script>
import { required, email } from "vuelidate/lib/validators"

export default {
  data() {
    return {
      companyEmail: this.$store.form.job.email
    }
  },
  validations: {
    companyEmail: {
      email,
      required
    }
  }
}
</script>
