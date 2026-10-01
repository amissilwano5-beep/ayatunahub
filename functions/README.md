# Cloud Functions (Stripe) - example

Place your Stripe secret in `functions/.env` (do NOT commit):

```
STRIPE_SECRET_KEY=sk_test_...
```

Deploy with Firebase CLI:

```
cd functions
npm install
firebase deploy --only functions:api
```
