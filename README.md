# Smart Contract: contract.sol

This Solidity smart contract demonstrates the use of `require()`, `assert()`, and `revert()` statements.

## Contract Overview

The uses the three:
- `require()`: used in ensuring that a valid passenger number is input | used to verify if booking exists
- `assert()`: used to ensure that the arrived field of the Booking structure is set to true
- `revert()`: used to revert the transaction if payment is less than 1 ether

## Functions

### placeBooking
- **Description**: creates a booking with a valid payment and passenger count, returning the booking number

### arrived
- **Description**: marks a booking as "arrived" and verifies the update

## Testing

### placeBooking
- **Input**: `3` with `msg.value = 1 ether`
  - **Expected Result**: `Booking is successfully created, returns a booking number`.
- **Input**: `0` with `msg.value = 1 ether`
  - **Expected Result**: `Reverts with error "Invalid passenger number"`.
- **Input**: `4` with `msg.value = 200000 wei`
  - **Expected Result**: `Reverts with error "Payment insufficient"`.

### arrived
- **Precondition**: `Booking with booking number 1 exists (created by placeBooking)`.
  - **Input**: `1`
  - **Expected Result**: `Booking status is updated to arrived = true`
- **Precondition**: `No booking with booking number 2`.
  - **Input**: `2`
  - **Expected Result**: `Reverts with error "Booking does not exist"` 

## License

This project is licensed under the MIT License.
