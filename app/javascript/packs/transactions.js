document.addEventListener('turbolinks:load', () => {
    var table =  document.querySelector('table.scroll');
    var bodyCells = document.querySelector('tbody tr:first-child').children;
    var colWidth;

    function resize(){
        // Get the tbody columns width array
        colWidth = Array.from(bodyCells).map(function(element) {
            return element.width;            
        }).get();
        
        // Set the width of thead columns
        table.querySelector('thead tr').children().each(function(i, v) {
            v.width(colWidth[i]);
        });    
    }

    // Adjust the width of thead cells when window resizes
    window.addEventListener('resize', resize, true);
    resize();
})