function searchBooks() {
    let query = document.getElementById("searchBox").value;
    let xhttp = new XMLHttpRequest();

    xhttp.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            document.getElementById("results").innerHTML = this.responseText;
        }
    };

    xhttp.open("GET", "ajax/liveSearch.jsp?q=" + encodeURIComponent(query), true);
    xhttp.send();
}
