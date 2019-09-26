let bikesTab = document.getElementById("bikesTab");
let bookingsTab = document.getElementById("bookingsTab");
let bikes = document.getElementById("bikes");
let bookings = document.getElementById("bookings");

const selectTab = () => {
  bikesTab.addEventListener("click", (event) => {
    bikes.classList.add('active')
    bookings.classList.remove('active')
    bikesTab.classList.add('active-tab')
    bookingsTab.classList.remove('active-tab')
  });

   bookingsTab.addEventListener("click", (event) => {
    bikes.classList.remove('active')
    bookings.classList.add('active')
    bikesTab.classList.remove('active-tab')
    bookingsTab.classList.add('active-tab')
  });
};

export { selectTab };
