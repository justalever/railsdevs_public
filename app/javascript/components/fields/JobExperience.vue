<template>
  <div>
    <label for="job-experience" class="label">Years of experience</label>
    <span class="required"></span>
    <div class="relative">
      <select id="job-experience" class="select">
        <option
          :value="item"
          v-for="item in $store.form.experienceLevels"
          :key="item"
        >
          {{ item }}
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
