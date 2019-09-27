var email=document.getElementsByClassName("email-data")[0];
var password=document.getElementsByClassName("password-data")[0];
var first=document.getElementsByClassName("first-data")[0];
var last=document.getElementsByClassName("last-data")[0];
var address=document.getElementsByClassName("address-data")[0];
var place=document.getElementById('location-data');
var submit=document.getElementById('button');
var click_sumbit=true;
submit.addEventListener("click",sendData);

function data(email,password,first,last,address,location){
    this.email=email;
    this.password=password;
    this.first=first;
    this.last=last;
    this.address=address;
    this.location=location;
}

function checkdata(){
    if(email.value===""){
        console.log("please enter EMAIL");
        return false;
    }else if(password.value===""){
        console.log("please enter EMAIL");
        return false;
    }else if(first.value===""){
        console.log("please enter EMAIL");
        return false;
    }else if(address.value===""){
        console.log("please enter EMAIL");
        return false;
    }
    return true;
}

function sendData(){
    if(click_sumbit===true && checkdata()){
        var obj1=new data(email.value,password.value,first.value,last.value,address.value,place.options[place.selectedIndex].text);
        var xhttp=new XMLHttpRequest();
        xhttp.onreadystatechange=function () {
            var rt=this.responseText;
            console.log(rt);
        }
        var jsonData=JSON.stringify(obj1);
        console.log(jsonData);
        xhttp.open("POST","enroll",true);
        xhttp.send(jsonData);
        click_sumbit=false;
    }
}