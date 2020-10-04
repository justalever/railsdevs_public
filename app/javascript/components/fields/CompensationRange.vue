<template>
  <div>
    <label for="compensation-range" class="label"
      >Estimated compensation range</label
    >
    <span class="required"></span>
    <div class="relative">
      <select id="compensation-range" class="select">
        <option :value="item" v-for="item in compensationRanges" :key="item">
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

  data() {
    return {
      compensationRanges: [
        "50,000 - 60,000",
        "60,000 - 70,000",
        "70,000 - 80,000",
        "80,000 - 90,000",
        "90,000 - 100,000",
        "110,000 - 120,000",
        "120,000 - 130,000",
        "130,000 - 140,000",
        "140,000 - 150,000",
        "160,000 - 170,000",
        "170,000 - 180,000",
        "180,000 - 190,000",
        "190,000 - 200,000",
        "200,000 - 210,000",
        "210,000 - 220,000",
        "220,000 - 230,000",
        "230,000 - 240,000",
        "240,000 - 250,000",
        "greater than 250,000",
      ],
    };
  },
};
</script>
