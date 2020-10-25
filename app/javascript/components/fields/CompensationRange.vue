<template>
  <div>
    <label for="compensation-range" class="label"
      >Estimated compensation range</label
    >
    <span class="required"></span>
    <div class="relative">
      <select id="compensation-range" class="select">
        <option
          :value="item"
          v-for="item in $store.form.compensationRanges"
          :key="item"
        >
          $ {{ item }}
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
