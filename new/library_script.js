document.addEventListener("DOMContentLoaded", function() {
    fetch("library.xml")
    .then(response => response.text())
    .then(xmlString => {
        let parser = new DOMParser();
        let xmlDoc = parser.parseFromString(xmlString, "text/xml");
        let books = xmlDoc.getElementsByTagName("book");
        let table = document.getElementById("bookTable");
        
        Array.from(books).forEach(book => {
            let row = table.insertRow();
            let title = book.getElementsByTagName("title")[0].textContent;
            let author = book.getElementsByTagName("author")[0].textContent;
            let editor = book.getElementsByTagName("editor")[0].textContent;
            let total = book.getElementsByTagName("copies")[0].getAttribute("total");
            let issued = book.getElementsByTagName("copies")[0].getAttribute("issued");
            let genre = book.getElementsByTagName("shelf")[0].getAttribute("genre");

            issued = convertNumberToWords(parseInt(issued));
            total = convertNumberToWords(parseInt(total));

            row.innerHTML = `<td>${title}</td><td>${author}</td><td>${editor}</td><td>${genre}</td><td>${total}</td><td>${issued}</td>`;
        });
    });
});

function convertNumberToWords(num) {
    const words = ["Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten"];
    return words[num] || num;
}