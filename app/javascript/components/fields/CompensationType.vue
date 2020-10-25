<template>
  <div>
    <label for="compensation-type" class="label">Compensation type</label>
    <span class="required"></span>
    <div class="relative">
      <select
        id="compensation-type"
        class="select"
        @change="$actions.updateForm('compensationType', $event.target.value)"
      >
        <option
          value="Full-time"
          :selected="$store.form.job.compensationType === 'Full-time'"
        >
          Full-time
        </option>
        <option
          value="Contract"
          :selected="$store.form.job.compensationType === 'Contract'"
        >
          Contract
        </option>
      </select>
      <select-arrow></select-arrow>
    </div>
  </div>
</template>

<script>
import SelectArrow from "../icons/SelectArrow";

export default {
  components: {
    SelectArrow,
  },
};
</script>
