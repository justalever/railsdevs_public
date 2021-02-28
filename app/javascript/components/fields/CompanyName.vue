<template>
  <div>
    <label for="company-name" class="label">Company name</label>
    <span class="required"></span>
    <input
      type="text"
      id="company-name"
      v-model.trim="companyName"
      @input="$actions.updateForm('companyName', $event.target.value)"
      placeholder="Apple, Inc."
      class="input"
      required
    />
    <div v-if="$v.companyName.$error" class="text-sm text-red-500">
      We need the name of your company to share with potential hires.
    </div>
  </div>
</template>

<script>
import { required } from "vuelidate/lib/validators"

export default {
  data() {
    return {
      companyName: this.$store.form.job.companyName
    }
  },
  validations: {
    companyName: {
      required
    }
  }
}
</script>
