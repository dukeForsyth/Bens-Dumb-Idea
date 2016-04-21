function update(parts) {
    var partList = "CPU: ";
    if (parts.cpu == "") {
        //turn svg grey
        //display "No part selected" in list
        partList = partList.concat("No part found");
    }
    else {
        //turn pretty color
        //display part title in list
        partList = partList.concat(parts.cpu);
    }
    
    partList = partList.concat("<br>Videocard: ");
    if (parts.videocard == "") {
        //turn svg grey
        //display "No part selected" in list
        partList = partList.concat("No part found");
    }
    else {
        //turn pretty color
        //display part title in list
        partList = partList.concat(parts.videocard);
    }
    
    partList = partList.concat("<br>Motherboard: ");
    if (parts.motherboard == "") {
        //turn svg grey
        //display "No part selected" in list
        partList = partList.concat("No part found");
    }
    else {
        //turn pretty color
        //display part title in list
        partList = partList.concat(parts.motherboard);
    }
    
    partList = partList.concat("<br>Memory: ");
    if (parts.memory == "") {
        //turn svg grey
        //display "No part selected" in list
        partList = partList.concat("No part found");
    }
    else {
        //turn pretty color
        //display part title in list
        partList = partList.concat(parts.memory);
    }
    
    partList = partList.concat("<br>Storage: ");
    if (parts.storage == "") {
        //turn svg grey
        //display "No part selected" in list
        partList = partList.concat("No part found");
    }
    else {
        //turn pretty color
        //display part title in list
        partList = partList.concat(parts.storage);
    }
    document.getElementById("headingBuilds").innerHTML = partList;
}

function remove(partType) {
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var parts = JSON.parse(xhttp.responseText);
            update(parts);
        }
    };
    xhttp.open("GET", "remove/" + partType, true);
    xhttp.send();
}

function addRandom(partType) {
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var parts = JSON.parse(xhttp.responseText);\
            update(parts);
        }
    };
    xhttp.open("GET", "addRandom/" + partType, true);
    xhttp.send();
}