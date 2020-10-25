import Vue from "vue/dist/vue.esm";

export const store = Vue.observable({
  form: {
    step: 1,
    job: {
      company_name: null,
      company_website: null,
      company_logo: null,
      company_description: null,
      compensation_range: null,
      compensation_type: null,
      description: null,
      estimated_hours: null,
      headquarters: null,
      link_to_apply: null,
      price: 199,
      base_price: 199,
      remote: "Yes",
      title: null,
      years_of_experience: null,
      upsell_type: "No, thanks"
    },
    hourlyRanges: [
      "less than 10",
      "10-30",
      "30-60",
      "60-90",
      "more than 100",
    ],
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
  }
})

export const actions = {
  test() {

  }
};
