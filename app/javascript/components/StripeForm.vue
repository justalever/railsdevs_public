<template>
  <div>
    <div class="mb-6">
      <label for="cardName" class="label">Name on card</label>
      <input
        type="text"
        id="cardName"
        @input="handleCardInput($event.target.value)"
        :value="$store.form.cardName"
        class="input"
        placeholder="Full name"
      />
    </div>

    <label for="card-element" class="label">Credit card details</label>
    <div id="card-element" class="input"></div>
    <div class="text-sm text-red-400" v-if="errors">Card errors</div>
    <button
      class="mt-6 btn btn-red btn-lg"
      @click.prevent="handleSubmit($event)"
      :disabled="disable"
    >
      Pay with credit card
    </button>
  </div>
</template>

<script>
const style = {
  base: {
    color: "#2d3748",
    fontFamily: "'Inter', Helvetica, sans-serif",
    fontSmoothing: "antialiased",
    fontSize: "16px",
    "::placeholder": {
      color: "#718096",
    },
  },
  invalid: {
    color: "#fa755a",
    iconColor: "#fa755a",
  },
}

export default {
  data() {
    return {
      stripe: null,
      card: null,
      disable: false,
      errors: null,
      stripeKey: window.paymentConfig.stripeKey,
      showPaymentForm: true,
      cardComplete: false,
    }
  },
  methods: {
    handleCardInput(value) {
      this.$actions.updateForm("cardName", value)
    },
    handleSubmit() {
      if (!this.card || !this.stripe) {
        return
      }
      this.handleCardPayment()
    },
    handleCardPayment() {
      let self = this
      this.disable = true

      this.stripe.confirmCardPayment(this.$store.form.paymentIntentClientSecret, {
        payment_method: {
          card: this.card,
          billing_details: {
            name: this.$store.form.cardName
          },
        },
      }).then(result => {
        if (result.error) {
          console.log('error', result)

        } else {
          if (result.paymentIntent.status === 'succeeded') {
            this.$actions.handlePurchase(result)
            this.disable = false
          }
        }
      })
    }
  },
  mounted() {
    this.stripe = Stripe(this.stripeKey)
    this.card = this.stripe.elements().create("card", { style })
    this.card.mount("#card-element")
  },
  beforeDestroy() {
    if (this.card) {
      this.card.unmount()
      this.card = null
    }
  },
};
</script>

<style lang="scss" scoped>
</style>
