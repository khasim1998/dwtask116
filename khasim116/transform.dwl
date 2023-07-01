%dw 2.0
//Here I map the data based on the expected output from the given input.
output application/json
---
payload.flights map (item,index) -> {
   (item mapObject (value, key) -> {
        (emptySeats: value) if(key as String == 'availableSeats'),
        (airline: value) if(key as String == 'airlineName'),
        ((key):value) if(key as String !='availableSeats' and key as String != 'airlineName')
    })
}
