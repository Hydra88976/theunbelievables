

















<script type="module">
  
  import { initializeApp} from "https://www.gstatic.com/firebasejs/9.4.1/firebase-app.js";
  import { getDatabase, set, ref, child, push, onValue, get} from "https://www.gstatic.com/firebasejs/9.4.1/firebase-database.js";
  
  const firebaseConfig = {
    apiKey: "AIzaSyA1Fu6ZFMPtrhdE5FNrS-21_iOcfcE6dwA",
    authDomain: "andweb-d2bf0.firebaseapp.com",
    databaseURL: "https://andweb-d2bf0-default-rtdb.firebaseio.com",
    projectId: "andweb-d2bf0",
    storageBucket: "andweb-d2bf0.appspot.com",
    messagingSenderId: "1061979682278",
    appId: "1:1061979682278:web:aa51ec0c2a86e888175227"
  };

  //Initialize firebase
  const firebase = initializeApp(firebaseConfig);
  const db = getDatabase(firebase);
  const dbRef = ref(db);
  

document.getElementById("pst").addEventListener("click", function writeUserData(post, uname) {

post = document.getElementById("write").value;
uname = document.getElementById("name").value;

  push(ref(db, 'users/'+uname), {
    Wrote: post,
    Written_By: uname
   
  });
  
})


<!--get(child(dbRef, `users/`)).then((snapshot) => {
  if (snapshot.exists()) {
    console.log(snapshot.val());
    alert(snapshot.val());
  } else {
    console.log("No data available");
  }
}).catch((error) => {
  console.error(error);
});


let template = "";
</script>-->
