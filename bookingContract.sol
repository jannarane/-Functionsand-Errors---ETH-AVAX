pragma solidity ^0.8.28;

contract janaBooking {

    struct Booking { //info of each individual booking
        address client; 
        uint carPassenger;
        bool arrived;
    }

    mapping(uint => Booking) public bookings;
    uint public bookingCount;

    function placeBooking (uint carPassenger) public payable returns (uint){ 
        require(carPassenger >= 1 && carPassenger <= 6, "Invalid passenger number");        
        if(msg.value >= 1 ether) { //payment must be greater than or equal to 1 ether
            Booking memory newBooking = Booking(msg.sender, carPassenger, false); 
            bookingCount++;
            bookings [bookingCount] = newBooking;
        }   
        else{
            revert ("Payment insufficient");
        }
        return bookingCount;
    }

    function arrived (uint bookingNumber) public { 
        require(bookings[bookingNumber].client != address(0), "Booking does not exist");
        bookings[bookingNumber].arrived = true;
        assert(bookings[bookingNumber].arrived == true);
    }
}
