<template>
  <div>
    <label for="job-experience" class="label">Years of experience</label>
    <span class="required"></span>
    <div class="relative">
      <select id="job-experience" class="select">
        <option :value="item" v-for="item in experienceLevels" :key="item">
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
  data() {
    return {
      experienceLevels: [
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "8",
        "9",
        "10",
        "more than 10",
      ],
    };
  },
};
</script>
