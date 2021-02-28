<template>
  <div>
    <label for="job-description" class="label">Job description</label>
    <span class="required"></span>
    <VueTrix
      v-model="$store.form.job.description"
      placeholder="Enter more details about the role"
      @input="setDescription($store.form.job.description)"
      localStorage
    />

    <div v-if="$v.validatedDescription.$error" class="text-sm text-red-500">
      A job description is required
    </div>
    <div v-if="!$v.validatedDescription.minLength" class="text-sm text-red-500">
      The description must have at least
      {{ $v.validatedDescription.$params.minLength.min }} characters.
    </div>
  </div>
</template>

<script>
import { required, minLength } from "vuelidate/lib/validators"

import VueTrix from "vue-trix"
export default {
  data() {
    return {
      validatedDescription: null
    }
  },
  validations: {
    validatedDescription: {
      required,
      minLength: minLength(150)
    }
  },
  methods: {
    setDescription(value) {
      this.validatedDescription = value
      this.$v.validatedDescription.$touch()
    }
  },
  components: {
    VueTrix,
  },
};
</script>
