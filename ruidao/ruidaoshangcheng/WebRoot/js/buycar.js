function SelectAll() {
    var checkboxs=document.getElementsByName("select");
    if(document.getElementById("allselect").checked==true)
    for (var i=0;i<checkboxs.length;i++) {
        var e=checkboxs[i];
        e.checked=true;
    }
}