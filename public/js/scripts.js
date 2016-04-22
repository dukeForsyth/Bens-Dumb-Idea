function update(parts) {
    var partList = "CPU: ";
    window.alert(JSON.stringify(parts));
    partList = partList.concat(parts.cpu_id);
    partList = partList.concat("<br>Video Card: ");
    partList = partList.concat(parts.videocard_id);
    partList = partList.concat("<br>Mother Board: ");
    partList = partList.concat(parts.motherboard_id);
    partList = partList.concat("<br>Memory: ");
    partList = partList.concat(parts.memory_id);
    partList = partList.concat("<br>Storage: ");
    partList = partList.concat(parts.storage_id);
    partList = partList.concat("<br>Price: ");
    partList = partList.concat(parts.price);
    partList = partList.concat("<br>Build Id: ");
    partList = partList.concat(parts.unique_id);
    if (parts.cpu_id == "Nothing chosen") {
        //turn svg grey
    }
    else {
        //turn pretty color        
    }
    
    if (parts.videocard_id == "Nothing chosen") {
        //turn svg grey
    }
    else {
        //turn pretty color
    }
    
    if (parts.motherboard_id == "Nothing chosen") {
        //turn svg grey
    }
    else {
        //turn pretty color
    }
    
    
    if (parts.memory_id == "Nothing chosen") {
        //turn svg grey
    }
    else {
        //turn pretty color        
    }
    
    if (parts.storage_id == "Nothing chosen") {
        //turn svg grey
    }
    else {
        //turn pretty color
    }
    document.getElementById("headingBuilds").innerHTML = partList;
}

function remove(partType) {
    var xhttp = new XMLHttpRequest();
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
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var parts = JSON.parse(xhttp.responseText);
            update(parts);
        }
    };
    xhttp.open("GET", "addRandom/" + partType, true);
    xhttp.send();
}

function test(){
    remove("cpu");
}