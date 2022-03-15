const functions = require("firebase-functions");

const stripe = require('stripe')(functions.config().stripe.testkey);

exports.stripePayment = functions.https.onRequest(async (req, res) => {
    const paymentIntent = await stripe.paymentIntents.create({
        amount: 1700,
        currency: 'inr'
    },
    function(err, paymentIntent) {
        if (err != null) {
            console.log(err);
        } else {
            res.json({
                paymentIntent: paymentIntent.client_secret
            })
        }
    })
})