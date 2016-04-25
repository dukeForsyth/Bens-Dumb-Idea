$(document).ready(function(){
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
            var parts = JSON.parse(xhttp.responseText);
            update(parts);
        }
    };
    xhttp.open("GET", "update/?", true);
    xhttp.send();
});

function phpToJson(name){
    return JSON.parse(name);
}

function update(parts) {
    var partList = "CPU: ";
    partList = partList.concat(parts.cpu_id);
    partList = partList.concat("<br>Video Card: ");
    partList = partList.concat(parts.videocard_id);
    partList = partList.concat("<br>Mother Board: ");
    partList = partList.concat(parts.motherboard_id);
    partList = partList.concat("<br>Memory: ");
    partList = partList.concat(parts.memory_id);
    partList = partList.concat("<br>Storage: ");
    partList = partList.concat(parts.storage_id);
    partList = partList.concat("<br>Price: $");
    partList = partList.concat(parts.price);
    partList = partList.concat("<br>Build Id: ");
    partList = partList.concat(parts.unique_id);
    
    if (parts.cpu_id == "Nothing chosen") {
        //turn svg grey
        document.getElementById("cpu_image").style="fill: lightgrey;";
    }
    else {
        //turn pretty color
        document.getElementById("cpu_image").style="fill: pink;";       
    }
    
    if (parts.videocard_id == "Nothing chosen") {
        //turn svg grey
        document.getElementById("gpu_image").style="fill: lightgrey;";
    }
    else {
        //turn pretty color
        document.getElementById("gpu_image").style="fill: yellow;";
    }
    
    if (parts.motherboard_id == "Nothing chosen") {
        //turn svg grey
        document.getElementById("motherboard_image").style="fill: lightgrey;";
    }
    else {
        //turn pretty color
        document.getElementById("motherboard_image").style="fill: orange;";
    }
    
    
    if (parts.memory_id == "Nothing chosen") {
        //turn svg grey
        document.getElementById("ram_image").style="fill: lightgrey;";
    }
    else {
        document.getElementById("ram_image").style="fill: green;";
        //turn pretty color        
    }
    
    if (parts.storage_id == "Nothing chosen") {
        document.getElementById("memory_image").style="fill: lightgrey;";
        //turn svg grey
    }
    else {
        //turn pretty color
        document.getElementById("memory_image").style="fill: purple;";
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



// *** Attempts at left click menu for motherboard image works but buttons are not clickable.... ***
// Another annoying bit is I have to make one per each element....


// Below is code for the motherboard image
//--------------------------------------------------------------------------------------------------------
$( function ( windowLoadE ) {
    $( "#motherb_image" ).on( "click", function( clickE ) {
        $( this ).contextMenu( { x: clickE.offsetX, y: clickE.offsetY } );
    } );


$.contextMenu( {
        selector: "#motherb_image", 
        callback: function( key, options ) {
            var m = "clicked: " + key;
            window.console && console.log( m ) || alert( m ); 
        },
        items: {
            "Add random part": { name: "Add random part", icon: "Add random part" },
            "Remove Part": { name: "Remove Part", icon: "Remove Part" },
            
        }
    } );
} );


//Below is code for the cpu_image2
//--------------------------------------------------------------------------------------------------------
$( function ( windowLoadE ) {
    $( "#cpu_image2" ).on( "click", function( clickE ) {
        $( this ).contextMenu( { x: clickE.offsetX, y: clickE.offsetY } );
    } );


$.contextMenu( {
        selector: "#cpu_image2", 
        callback: function( key, options ) {
            var m = "clicked: " + key;
            window.console && console.log( m ) || alert( m ); 
        },
        items: {
            "Add random part": { name: "Add random part", icon: "Add random part" },
            "Remove Part": { name: "Remove Part", icon: "Remove Part" },
            
        }
    } );
} );


//Below is code for the mem_image2
//--------------------------------------------------------------------------------------------------------
$( function ( windowLoadE ) {
    $( "#mem_image2" ).on( "click", function( clickE ) {
        $( this ).contextMenu( { x: clickE.offsetX, y: clickE.offsetY } );
    } );


$.contextMenu( {
        selector: "#mem_image2", 
        callback: function( key, options ) {
            var m = "clicked: " + key;
            window.console && console.log( m ) || alert( m ); 
        },
        items: {
            "Add random part": { name: "Add random part", icon: "Add random part" },
            "Remove Part": { name: "Remove Part", icon: "Remove Part" },
            
        }
    } );
} );

//Below is code for the ram_image2
//--------------------------------------------------------------------------------------------------------
$( function ( windowLoadE ) {
    $( "#ram_image2" ).on( "click", function( clickE ) {
        $( this ).contextMenu( { x: clickE.offsetX, y: clickE.offsetY } );
    } );


$.contextMenu( {
        selector: "#ram_image2", 
        callback: function( key, options ) {
            var m = "clicked: " + key;
            window.console && console.log( m ) || alert( m ); 
        },
        items: {
            "Add random part": { name: "Add random part", icon: "Add random part" },
            "Remove Part": { name: "Remove Part", icon: "Remove Part" },
            
        }
    } );
} );

//Below is code for the gpu_image2
//--------------------------------------------------------------------------------------------------------
$( function ( windowLoadE ) {
    $( "#gpu_image2" ).on( "click", function( clickE ) {
        $( this ).contextMenu( { x: clickE.offsetX, y: clickE.offsetY } );
    } );


$.contextMenu( {
        selector: "#gpu_image2", 
        callback: function( key, options ) {
            var m = "clicked: " + key;
            window.console && console.log( m ) || alert( m ); 
        },
        items: {
            "Add random part": { name: "Add random part", icon: "Add random part" },
            "Remove Part": { name: "Remove Part", icon: "Remove Part" },
            
        }
    } );
} );