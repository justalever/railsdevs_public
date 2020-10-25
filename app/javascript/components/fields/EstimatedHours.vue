<template>
  <div>
    <label for="estimated-hours" class="label">Estimated hours</label>
    <span class="required"></span>
    <div class="relative">
      <select id="estimated-hours" class="select">
        <option
          :value="item"
          v-for="item in $store.form.hourlyRanges"
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
