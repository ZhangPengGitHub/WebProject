var object = 0;

function clickInsert() {

    object.set('abbreviation',document.getElementById('paper1').value);
    object.set('wholeName',document.getElementById('paper2').value);
	object.save();
	alert('success');
	window.location.reload();
}
var textPaper = new Array(0,0);
textPaper[0] = "<input id='paper1' type='text' value='' />";
textPaper[1] = "<input id='paper2' type='text' value='' />";

function handleJournalInsert() {
	object = 0;
	AV.initialize("x3x1u303wwaflo331wssrr35fhsfzg4xjcirtf8yv7fxq38y",
	"ibo46nu2zi37f0irbb85gftol2zk09dtlx5sejsm1j7k5tpi");
    var Journal = AV.Object.extend("Journal");
    object = new Journal();
    
	document.write ("<table border='1' style='margin:auto'>");

	document.write ("<th>");
    document.write ('abbreviation');
    document.write ("</th>");
    document.write ("<th>");
    document.write ('wholeName');
    document.write ("</th>");
    document.write ("<th>");
    document.write ('添加');
    document.write ("</th>");
    
	document.write ("<tr>");
	for(var j = 0; j < 2; j++){
	    document.write ("<td>");
	    document.write (textPaper[j]);
	    document.write ("</td>");
    }
    document.write ("<td>");
    document.write ("<input type='button' onClick='clickInsert()' value='添加' />");
    document.write ("</td>");
	document.write ("</tr>");
}